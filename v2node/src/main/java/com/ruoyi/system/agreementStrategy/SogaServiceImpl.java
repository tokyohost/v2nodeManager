package com.ruoyi.system.agreementStrategy;

import com.jcraft.jsch.JSchException;
import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.common.utils.ShellUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.constant.NodeTypeEnum;
import com.ruoyi.system.domain.NodeVo;
import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.domain.V2Server;
import com.ruoyi.system.mapper.V2DnsMapper;
import com.ruoyi.system.mapper.V2NodeVmessMapper;
import com.ruoyi.system.service.ConfigService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.IV2ServerService;
import com.ruoyi.system.utils.V2NodeThreadFactory;
import lombok.extern.slf4j.Slf4j;
import org.apache.sshd.client.SshClient;
import org.apache.sshd.client.channel.ChannelExec;
import org.apache.sshd.client.channel.ClientChannelEvent;
import org.apache.sshd.client.session.ClientSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;

/**
 * @author xh
 * @Version 1.0
 * @date 2024/11/19 9:50
 * @Content
 */
@Slf4j
@Service
public class SogaServiceImpl implements V2NodeService {

    @Autowired
    V2NodeVmessMapper v2NodeVmessMapper;
    @Autowired
    private ShellUtil shellUtil;
    @Autowired
    private ISysConfigService sysConfigService;

    @Autowired
    private ConfigService configService;

    @Autowired
    private IV2ServerService v2ServerService;

    @Autowired
    private V2DnsMapper v2DnsMapper;

    @Value("${soga.request-time-out:15}")
    private Long sogaRequestTimeOut;

    private final ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor(V2NodeThreadFactory.forName("shell-command-wait-close"));
    ExecutorService executorService = Executors.newFixedThreadPool(1);

    public SogaServiceImpl() {


    }

    @Override
    @DataSource(value = DataSourceType.v2board)
    public List<NodeVo> queryList(NodeVo nodeVo) {
        return v2NodeVmessMapper.queryList(nodeVo);
    }

    @Override
    public AjaxResult checkInstallStatus(V2Server v2Server) {

        final ShellUtil shellone = shellUtil.getOne();
        String sogaCheckVersion = sysConfigService.selectConfigByKey("SogaCheckVersion");
        try {

            shellone.init(v2Server.getIp(), Integer.valueOf(v2Server.getPort()), v2Server.getUser(), v2Server.getPasswd());
            String execCmd = shellone.execCmd("systemctl status soga");
            if (execCmd.contains("Loaded: loaded")) {
                if (!StringUtils.isEmpty(sogaCheckVersion)) {
                    String s = shellone.execCmdAndClose(sogaCheckVersion);
                    return AjaxResult.success("服务已安装[" + s + "]");
                } else {
                    return AjaxResult.success("服务已安装");
                }
            } else {
                return AjaxResult.error("服务未安装");
            }
        } catch (JSchException e) {
            return AjaxResult.error(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {

            shellone.close();
        }
    }

    @Override
    public AjaxResult install(V2Server v2Server) {
        AtomicReference<AjaxResult> result = new AtomicReference<>();
        CountDownLatch countDownLatch = new CountDownLatch(1);
        executorService.submit(new Runnable() {
            @Override
            public void run() {
                String sogaScript = sysConfigService.selectConfigByKey("SogaScript");
                try (SshClient client = SshClient.setUpDefaultClient()) {
                    client.start();  // 启动 SSH 客户端

                    try (ClientSession session = client.connect(v2Server.getUser(), v2Server.getIp(), Integer.valueOf(v2Server.getPort())).verify().getSession()) {
                        session.addPasswordIdentity(v2Server.getPasswd()); // 使用密码认证
                        session.auth().verify(); // 进行身份验证

                        // 执行远程命令
                        String command = "" + sogaScript + " && echo $(date '+%Y-%m-%d %H:%M:%S') >> run.log ";
                        log.info("command: {}", command);
                        try (ChannelExec channel = session.createExecChannel(command)) {
                            ByteArrayOutputStream responseStream = new ByteArrayOutputStream();
                            channel.setOut(responseStream);
                            channel.setErr(responseStream);
                            channel.open().verify();
                            channel.waitFor(Collections.singleton(ClientChannelEvent.CLOSED), 0);

                            // 输出命令执行结果
                            String response = responseStream.toString(StandardCharsets.UTF_8.name());
                            log.info("命令执行结果:\n" + response);
                            if (StringUtils.isNotEmpty(response)) {
                                if (response.contains("安装完成")) {
                                    result.set(AjaxResult.success("安装完成！"));
                                    countDownLatch.countDown();
                                } else if (response.contains("soga已安装，请不要重复安装")) {
                                    result.set(AjaxResult.success("soga已安装，请不要重复安装"));
                                    countDownLatch.countDown();
                                } else {
                                    result.set(AjaxResult.success("安装异常！"));
                                    countDownLatch.countDown();
                                }

                            } else {
                                result.set(AjaxResult.success("安装异常！"));
                                countDownLatch.countDown();
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        try {

            //30秒还没完成返回稍后检查
            scheduler.schedule(() -> {
                result.set(AjaxResult.success("下发安装命令完成,请稍后检查安装状态"));
                countDownLatch.countDown();
            }, sogaRequestTimeOut, TimeUnit.SECONDS);
            countDownLatch.await();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }


        return result.get();
    }

    @Override
    public AjaxResult update(V2Server v2Server, String version) {
        AtomicReference<AjaxResult> result = new AtomicReference<>();
        CountDownLatch countDownLatch = new CountDownLatch(1);
        executorService.submit(new Runnable() {
            @Override
            public void run() {
                String sogaScript = sysConfigService.selectConfigByKey("SogaUpdateVersion");
                sogaScript = sogaScript.replace("{version}", version);
                try (SshClient client = SshClient.setUpDefaultClient()) {
                    client.start();  // 启动 SSH 客户端

                    try (ClientSession session = client.connect(v2Server.getUser(), v2Server.getIp(), Integer.valueOf(v2Server.getPort())).verify().getSession()) {
                        session.addPasswordIdentity(v2Server.getPasswd()); // 使用密码认证
                        session.auth().verify(); // 进行身份验证

                        // 执行远程命令
                        String command = "" + sogaScript + " && echo $(date '+%Y-%m-%d %H:%M:%S') >> run.log ";
                        log.info("command: {}", command);
                        try (ChannelExec channel = session.createExecChannel(command)) {
                            ByteArrayOutputStream responseStream = new ByteArrayOutputStream();
                            channel.setOut(responseStream);
                            channel.setErr(responseStream);
                            channel.open().verify();
                            channel.waitFor(Collections.singleton(ClientChannelEvent.CLOSED), 0);

                            // 输出命令执行结果
                            String response = responseStream.toString(StandardCharsets.UTF_8.name());
                            log.info("命令执行结果:\n" + response);
                            if (StringUtils.isNotEmpty(response)) {
                                if (response.contains("更新完成")) {
                                    result.set(AjaxResult.success("更新完成！"));
                                    countDownLatch.countDown();
                                } else if (response.contains("请确保此版本存在")) {
                                    result.set(AjaxResult.success("soga 下载版本" + version + " 失败，请确保此版本存在"));
                                    countDownLatch.countDown();
                                } else {
                                    result.set(AjaxResult.success("安装异常！"));
                                    countDownLatch.countDown();
                                }

                            } else {
                                result.set(AjaxResult.success("安装异常！"));
                                countDownLatch.countDown();
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        try {

            //30秒还没完成返回稍后检查
            scheduler.schedule(() -> {
                result.set(AjaxResult.success("下发安装命令完成,请稍后检查安装状态"));
                countDownLatch.countDown();
            }, sogaRequestTimeOut, TimeUnit.SECONDS);
            countDownLatch.await();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }


        return result.get();
    }

    @Override
    public AjaxResult replaceConfig(String id, Long templateId) {
        String newConfig = configService.generateConfigFile(id, templateId);

        V2Dns v2Dns = v2DnsMapper.selectV2DnsById(id);
        V2Server v2Server = v2ServerService.selectV2ServerByIp(v2Dns.getContent());
        ShellUtil one = shellUtil.getOne();
        try {
            one.init(v2Server.getIp(), Integer.valueOf(v2Server.getPort()), v2Server.getUser(), v2Server.getPasswd());

            ArrayList<String> commands = new ArrayList<>();
            commands.add("echo '" + newConfig + "' > " + v2Server.getFilePath());
            commands.add("soga restart");
            commands.add("exit");
            String cmd = one.execCmdByShell(commands);
            v2ServerService.updateV2Node(v2Server.getNodeId(), v2Dns.getName());
            one.close();
            return AjaxResult.success(cmd);
        } catch (JSchException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String getType() {
        return NodeTypeEnum.SOGA.getType();
    }
}

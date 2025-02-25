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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/11/19 9:50
 * @Content
 */
@Service
public class VmessServiceImpl implements V2NodeService {

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

    @Override
    @DataSource(value = DataSourceType.v2board)
    public List<NodeVo> queryList(NodeVo nodeVo) {
        return v2NodeVmessMapper.queryList(nodeVo);
    }

    @Override
    public AjaxResult checkInstallStatus(V2Server v2Server) {
        ShellUtil shellone = shellUtil.getOne();
        String xrayRCheckVersion = sysConfigService.selectConfigByKey("XrayRCheckVersion");
        try {

            shellone.init(v2Server.getIp(), Integer.valueOf(v2Server.getPort()), v2Server.getUser(), v2Server.getPasswd());
            String execCmd = shellone.execCmd("systemctl status XrayR");
            if (execCmd.contains("Loaded: loaded")) {
                if (!StringUtils.isEmpty(xrayRCheckVersion)) {
                    String s = shellone.execCmdAndClose(xrayRCheckVersion);
                    return AjaxResult.success("服务已安装["+s+"]");
                }else{
                    return AjaxResult.success("服务已安装");
                }
            } else {
                return AjaxResult.error("服务未安装");
            }
        } catch (JSchException e) {
            return AjaxResult.error(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            shellone.close();
        }
    }

    @Override
    public AjaxResult install(V2Server v2Server) {
        ShellUtil shellone = shellUtil.getOne();
        String xrayRScript = sysConfigService.selectConfigByKey("XrayRScript");

        try {
            shellone.init(v2Server.getIp(), Integer.valueOf(v2Server.getPort()), v2Server.getUser(), v2Server.getPasswd());

            shellone.execCmdAndClose("nohup " + xrayRScript + " & ");
            return AjaxResult.success("下发安装命令完成,请稍后检查安装状态");
        } catch (JSchException e) {
            return AjaxResult.error(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            shellone.close();
        }
    }

    @Override
    public AjaxResult update(V2Server v2Server, String version) {
        ShellUtil shellone = shellUtil.getOne();
        String xrayRVersion = sysConfigService.selectConfigByKey("XrayRUpdateVersion");
        try {
            shellone.init(v2Server.getIp(), Integer.valueOf(v2Server.getPort()), v2Server.getUser(), v2Server.getPasswd());
            String execCmd = shellone.execCmdAndClose(xrayRVersion.replace("{version}",version));
            return AjaxResult.success("下发命令完成,请稍后检查安装状态");
        } catch (JSchException e) {
            return AjaxResult.error(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            shellone.close();
        }
    }

    @Override
    public AjaxResult replaceConfig(String id, Long templateId) {
        String newConfig = configService.generateConfigFile(id, templateId);

        V2Dns v2Dns = v2DnsMapper.selectV2DnsById(id);
        V2Server v2Server = v2ServerService.selectV2ServerByIp(v2Dns.getContent());
        ShellUtil one = shellUtil.getOne();
        try {
            one.init(v2Server.getIp(),Integer.valueOf(v2Server.getPort()),v2Server.getUser(),v2Server.getPasswd());

            ArrayList<String> commands = new ArrayList<>();
            commands.add("echo '" + newConfig + "' > " + v2Server.getFilePath());
            commands.add("XrayR restart");
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
        return NodeTypeEnum.VMESS.getType();
    }


}

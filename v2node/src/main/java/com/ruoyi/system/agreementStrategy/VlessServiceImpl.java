package com.ruoyi.system.agreementStrategy;

import com.jcraft.jsch.JSchException;
import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.common.utils.ShellUtil;
import com.ruoyi.system.constant.NodeTypeEnum;
import com.ruoyi.system.domain.NodeVo;
import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.domain.V2Server;
import com.ruoyi.system.mapper.V2DnsMapper;
import com.ruoyi.system.mapper.V2NodeVlessMapper;
import com.ruoyi.system.service.ConfigService;
import com.ruoyi.system.service.IV2ServerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * vless 节点服务
 *
 * @author xuehui_li
 */
@Service
public class VlessServiceImpl extends VmessServiceImpl {

    @Autowired
    private V2NodeVlessMapper v2NodeVlessMapper;

    @Autowired
    private ConfigService configService;

    @Autowired
    private V2DnsMapper v2DnsMapper;

    @Autowired
    private IV2ServerService v2ServerService;

    @Autowired
    private ShellUtil shellUtil;

    @Override
    @DataSource(value = DataSourceType.v2board)
    public List<NodeVo> queryList(NodeVo nodeVo) {
        return v2NodeVlessMapper.queryList(nodeVo);
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
            commands.add("XrayR restart");
            commands.add("exit");
            String cmd = one.execCmdByShell(commands);
            v2ServerService.updateV2VlessNode(v2Server.getNodeId(), v2Dns.getName());
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
        return NodeTypeEnum.VLESS.getType();
    }
}

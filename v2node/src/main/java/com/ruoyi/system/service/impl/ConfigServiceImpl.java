package com.ruoyi.system.service.impl;

import com.jcraft.jsch.JSchException;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.Placeholder;
import com.ruoyi.common.utils.ShellUtil;
import com.ruoyi.system.constant.CommonConstant;
import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.domain.V2FileTemplate;
import com.ruoyi.system.domain.V2Node;
import com.ruoyi.system.domain.V2Server;
import com.ruoyi.system.mapper.V2DnsMapper;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/5/14 16:59
 * @Content
 */

@Service
public class ConfigServiceImpl implements ConfigService {

    @Autowired
    private V2DnsMapper v2DnsMapper;

    @Autowired
    private IV2ServerService v2ServerService;

    @Autowired
    private IV2FileTemplateService fileTemplateService;

    @Autowired
    private CfApiService cfApiService;

    @Autowired
    private ISysConfigService sysConfigService;
    @Autowired
    private IV2DomainService iv2DomainService;

    @Autowired
    private ShellUtil shellUtil;
    @Override
    public String generateConfigFile(String dnsId, Long templateId) {
        V2Dns v2Dns = v2DnsMapper.selectV2DnsById(dnsId);
        String cfToken = sysConfigService.selectConfigByKey(CommonConstant.CFG_KEY.getCode());
        String cfEmail = sysConfigService.selectConfigByKey(CommonConstant.CF_EMAIL.getCode());
        String v2BoardApiHost = sysConfigService.selectConfigByKey(CommonConstant.V2BOARD_API_HOST.getCode());
        String v2BoardApikey = sysConfigService.selectConfigByKey(CommonConstant.V2BOARD_API_KEY.getCode());
        String ip = v2Dns.getContent();
        V2Server v2Server = v2ServerService.selectV2ServerByIp(ip);
        Long nodeId = v2Server.getNodeId();
        String certDomain = v2Dns.getName();


        V2FileTemplate v2FileTemplate = fileTemplateService.selectV2FileTemplateById(templateId);
//替换字符串中的占位符
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("cfToken", cfToken);
        params.put("cfEmail", cfEmail);
        params.put("apiHost", v2BoardApiHost);
        params.put("apiKey", v2BoardApikey);
        params.put("nodeId", nodeId);
        params.put("certDomain", certDomain);
        String configFile = Placeholder.replace(v2FileTemplate.getContent(), params, "${", "}", true);
        return configFile;
    }

    @Override
    public String getServerConfig(V2Server v2Server) {
        ShellUtil one = shellUtil.getOne();
        try {
            one.init(v2Server.getIp(),Integer.valueOf(v2Server.getPort()),v2Server.getUser(),v2Server.getPasswd());

            String s = one.execCmdAndClose("cat " + v2Server.getFilePath());
            return s;
        } catch (JSchException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public V2Node getv2BoardConfig(V2Server v2Server) {
        V2Node v2Node = v2ServerService.selectV2NodeInfoByNodeId(v2Server.getNodeId());

        return v2Node;
    }

    @Override
    public AjaxResult replaceConfig(String id, Long templateId) {
        String newConfig = this.generateConfigFile(id, templateId);

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
}

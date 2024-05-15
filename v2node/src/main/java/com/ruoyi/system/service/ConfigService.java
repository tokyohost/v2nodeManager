package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.V2Node;
import com.ruoyi.system.domain.V2Server;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/5/14 16:58
 * @Content
 */
public interface ConfigService {

    String generateConfigFile(String dnsId, Long templateId);

    String getServerConfig(V2Server v2Server);

    V2Node getv2BoardConfig(V2Server v2Server);

    AjaxResult replaceConfig(String id, Long templateId);
}

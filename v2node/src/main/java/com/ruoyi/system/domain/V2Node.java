package com.ruoyi.system.domain;

import lombok.Data;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/5/14 17:29
 * @Content
 */
@Data
public class V2Node {

    Long id;

    String groupId;

    String name;

    Long parentId;

    String host;

    Integer port;

    Integer serverPort;

    Integer tls;

    String network;

    Integer alertId;

    String networkSettings;

    String ruleSettings;

    String dnsSettings;
}

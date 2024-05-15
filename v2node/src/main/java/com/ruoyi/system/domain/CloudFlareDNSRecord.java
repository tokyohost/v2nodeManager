package com.ruoyi.system.domain;

import lombok.Data;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/5/10 17:55
 * @Content
 */
@Data
public class CloudFlareDNSRecord {

    private String content;

    private String name;

    private boolean proxied;

    private String type;

    private String coment;

    private Long ttl;
}

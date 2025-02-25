package com.ruoyi.system.constant;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/11/19 9:45
 * @Content
 */

public enum NodeTypeEnum {
    VMESS("vmess"),
    SOGA("soga");

    String type;

    NodeTypeEnum(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}


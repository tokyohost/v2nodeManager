package com.ruoyi.system.constant;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/5/11 9:52
 * @Content
 */

public enum CommonConstant {

    CFG_KEY("cfkey", "cf api key"),
    V2BOARD_API_HOST("v2BoardApiHost", "V2BOARD_API_HOST"),
    V2BOARD_API_KEY("V2BoardApiKey", "V2BOARD_API_KEY"),
    CF_EMAIL("cfEmail", "cf email");

    private String code;
    private String name;

    CommonConstant(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

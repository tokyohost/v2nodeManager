package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.domain.V2Domain;

import java.util.List;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/5/11 9:53
 * @Content
 */
public interface CfApiService {

    public List<V2Domain> getV2DomainListFromCF(String cfKey);
    public List<V2Dns> getV2DnsListFromCF(String cfKey,String zoneId);

    AjaxResult createCfDns(String cfKey, V2Dns v2Dns);

    AjaxResult updateCfDns(String cfKey, V2Dns v2Dns);

    AjaxResult deleteCfDns(String cfKey,String id,String zoneId);
}

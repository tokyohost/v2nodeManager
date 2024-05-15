package com.ruoyi.system.service.impl;

import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.Placeholder;
import com.ruoyi.system.constant.CommonConstant;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.V2DnsMapper;
import org.springframework.transaction.annotation.Transactional;

/**
 * DNS信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-05-11
 */
@Service
public class V2DnsServiceImpl implements IV2DnsService 
{
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
    private ConfigService configService;

    /**
     * 查询DNS信息
     * 
     * @param id DNS信息主键
     * @return DNS信息
     */
    @Override
    public V2Dns selectV2DnsById(String id)
    {
        return v2DnsMapper.selectV2DnsById(id);
    }

    /**
     * 查询DNS信息列表
     * 
     * @param v2Dns DNS信息
     * @return DNS信息
     */
    @Override
    public List<V2Dns> selectV2DnsList(V2Dns v2Dns)
    {
        return v2DnsMapper.selectV2DnsList(v2Dns);
    }

    /**
     * 新增DNS信息
     * 
     * @param v2Dns DNS信息
     * @return 结果
     */
    @Override
    public int insertV2Dns(V2Dns v2Dns)
    {
        return v2DnsMapper.insertV2Dns(v2Dns);
    }

    /**
     * 修改DNS信息
     *
     * @param v2Dns DNS信息
     * @return 结果
     */
    @Override
    public AjaxResult updateV2Dns(V2Dns v2Dns)
    {
        AjaxResult ajaxResult = cfApiService.updateCfDns(sysConfigService.selectConfigByKey(CommonConstant.CFG_KEY.getCode()), v2Dns);
        V2Domain v2Domain = new V2Domain();
        v2Domain.setDomainId(v2Dns.getZoneId());
        v2Domain.setName(v2Dns.getZoneName());
        this.syncV2Dns(v2Domain);
        return ajaxResult;
    }

    /**
     * 批量删除DNS信息
     *
     * @param ids 需要删除的DNS信息主键
     * @return 结果
     */
    @Override
    public AjaxResult deleteV2DnsByIds(String[] ids)
    {
//        AjaxResult ajaxResult = cfApiService.deleteCfDns(sysConfigService.selectConfigByKey(CommonConstant.CFG_KEY.getCode()), ids);
//        V2Domain v2Domain = new V2Domain();
//        this.syncV2Dns(null);
        return null;
    }

    /**
     * 删除DNS信息信息
     * 
     * @param id DNS信息主键
     * @return 结果
     */
    @Override
    public AjaxResult deleteV2DnsById(String id)
    {
        String cfApiKey = sysConfigService.selectConfigByKey(CommonConstant.CFG_KEY.getCode());
        V2Dns v2Dns = v2DnsMapper.selectV2DnsById(id);
        AjaxResult ajaxResult = cfApiService.deleteCfDns(cfApiKey, v2Dns.getId(), v2Dns.getZoneId());
        V2Domain v2Domain = new V2Domain();
        v2Domain.setDomainId(v2Dns.getZoneId());
        v2Domain.setName(v2Dns.getZoneName());
        this.syncV2Dns(v2Domain);
        return ajaxResult;
    }

    @Override
    @Transactional
    public AjaxResult syncV2Dns(V2Domain domain) {
        String cfApiKey = sysConfigService.selectConfigByKey(CommonConstant.CFG_KEY.getCode());
        List<V2Domain> v2Domains = new ArrayList<>();
        if (Objects.isNull(domain)) {
            v2Domains = iv2DomainService.selectV2DomainList(new V2Domain());
        }else{
            v2Domains.add(domain);
        }
        for (V2Domain v2Domain : v2Domains) {
            List<V2Dns> v2DnsListFromCF = cfApiService.getV2DnsListFromCF(cfApiKey, v2Domain.getDomainId());
            V2Dns query = new V2Dns();
            query.setZoneName(v2Domain.getName());
            List<V2Dns> v2DnsDb = v2DnsMapper.selectV2DnsList(query);
            for (V2Dns v2Dns : v2DnsDb) {
                v2DnsMapper.deleteV2DnsById(v2Dns.getId());
            }
            for (V2Dns v2Dns : v2DnsListFromCF) {
                v2DnsMapper.insertV2Dns(v2Dns);
            }
        }


        return AjaxResult.success();
    }

    @Override
    public AjaxResult createV2Dns(V2Dns v2Dns) {
        String cfApiKey = sysConfigService.selectConfigByKey(CommonConstant.CFG_KEY.getCode());
        AjaxResult cfDns = cfApiService.createCfDns(cfApiKey, v2Dns);
        V2Domain v2Domain = new V2Domain();
        v2Domain.setDomainId(v2Dns.getZoneId());
        v2Domain.setName(v2Dns.getZoneName());
        this.syncV2Dns(v2Domain);
        return cfDns;
    }

    @Override
    public AjaxResult generateConfig(String id, Long templateId) {
        String s = configService.generateConfigFile(id, templateId);

        return AjaxResult.success("ok",s);
    }

    @Override
    public String getServerConfig(String dnsId) {
        V2Dns v2Dns = v2DnsMapper.selectV2DnsById(dnsId);
        V2Server v2Server = v2ServerService.selectV2ServerByIp(v2Dns.getContent());
        String serverConfig = configService.getServerConfig(v2Server);

        return serverConfig;
    }

    @Override
    public V2Node getv2BoardConfig(String id) {
        V2Dns v2Dns = v2DnsMapper.selectV2DnsById(id);
        V2Server v2Server = v2ServerService.selectV2ServerByIp(v2Dns.getContent());
        V2Node v2Node = configService.getv2BoardConfig(v2Server);
        return v2Node;
    }

    @Override
    public AjaxResult replaceConfig(String id, Long templateId) {
        AjaxResult result = configService.replaceConfig(id, templateId);

        return result;
    }

    @Override
    public V2Dns selectV2DnsByName(String name) {
        return v2DnsMapper.selectV2DnsByName(name);
    }
}

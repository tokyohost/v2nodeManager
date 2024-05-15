package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.domain.V2Domain;
import com.ruoyi.system.domain.V2Node;

/**
 * DNS信息Service接口
 * 
 * @author ruoyi
 * @date 2024-05-11
 */
public interface IV2DnsService 
{
    /**
     * 查询DNS信息
     * 
     * @param id DNS信息主键
     * @return DNS信息
     */
    public V2Dns selectV2DnsById(String id);

    /**
     * 查询DNS信息列表
     * 
     * @param v2Dns DNS信息
     * @return DNS信息集合
     */
    public List<V2Dns> selectV2DnsList(V2Dns v2Dns);

    /**
     * 新增DNS信息
     * 
     * @param v2Dns DNS信息
     * @return 结果
     */
    public int insertV2Dns(V2Dns v2Dns);

    /**
     * 修改DNS信息
     *
     * @param v2Dns DNS信息
     * @return 结果
     */
    public AjaxResult updateV2Dns(V2Dns v2Dns);

    /**
     * 批量删除DNS信息
     *
     * @param ids 需要删除的DNS信息主键集合
     * @return 结果
     */
    public AjaxResult deleteV2DnsByIds(String[] ids);

    /**
     * 删除DNS信息信息
     * 
     * @param id DNS信息主键
     * @return 结果
     */
    public AjaxResult deleteV2DnsById(String id);

    AjaxResult syncV2Dns(V2Domain domain);

    AjaxResult createV2Dns(V2Dns v2Dns);

    AjaxResult generateConfig(String id, Long templateId);

    String getServerConfig(String dnsId);

    V2Node getv2BoardConfig(String id);

    AjaxResult replaceConfig(String id, Long templateId);

    V2Dns selectV2DnsByName(String name);
}

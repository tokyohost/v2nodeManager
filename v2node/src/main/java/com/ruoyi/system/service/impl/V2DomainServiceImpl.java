package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.constant.CommonConstant;
import com.ruoyi.system.service.CfApiService;
import com.ruoyi.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.V2DomainMapper;
import com.ruoyi.system.domain.V2Domain;
import com.ruoyi.system.service.IV2DomainService;

/**
 * 域名列表Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-05-11
 */
@Service
public class V2DomainServiceImpl implements IV2DomainService 
{
    @Autowired
    private V2DomainMapper v2DomainMapper;

    @Autowired
    private ISysConfigService sysConfigService;

    @Autowired
    private CfApiService cfApiService;

    /**
     * 查询域名列表
     * 
     * @param id 域名列表主键
     * @return 域名列表
     */
    @Override
    public V2Domain selectV2DomainById(Long id)
    {
        return v2DomainMapper.selectV2DomainById(id);
    }

    /**
     * 查询域名列表列表
     * 
     * @param v2Domain 域名列表
     * @return 域名列表
     */
    @Override
    public List<V2Domain> selectV2DomainList(V2Domain v2Domain)
    {
        return v2DomainMapper.selectV2DomainList(v2Domain);
    }

    /**
     * 新增域名列表
     * 
     * @param v2Domain 域名列表
     * @return 结果
     */
    @Override
    public int insertV2Domain(V2Domain v2Domain)
    {
        return v2DomainMapper.insertV2Domain(v2Domain);
    }

    /**
     * 修改域名列表
     * 
     * @param v2Domain 域名列表
     * @return 结果
     */
    @Override
    public int updateV2Domain(V2Domain v2Domain)
    {
        return v2DomainMapper.updateV2Domain(v2Domain);
    }

    /**
     * 批量删除域名列表
     * 
     * @param ids 需要删除的域名列表主键
     * @return 结果
     */
    @Override
    public int deleteV2DomainByIds(Long[] ids)
    {
        return v2DomainMapper.deleteV2DomainByIds(ids);
    }

    /**
     * 删除域名列表信息
     * 
     * @param id 域名列表主键
     * @return 结果
     */
    @Override
    public int deleteV2DomainById(Long id)
    {
        return v2DomainMapper.deleteV2DomainById(id);
    }

    @Override
    public AjaxResult syncDomain() {
        String cfApiKey = sysConfigService.selectConfigByKey(CommonConstant.CFG_KEY.getCode());
        List<V2Domain> v2DomainListFromCF = cfApiService.getV2DomainListFromCF(cfApiKey);
        List<V2Domain> v2Domains = v2DomainMapper.selectV2DomainList(new V2Domain());
        Map<String, V2Domain> v2DomainMap = v2Domains.stream().collect(Collectors.toMap(V2Domain::getDomainId, v2Domain -> v2Domain));
        for (V2Domain v2Domain : v2DomainListFromCF) {
            if (v2DomainMap.containsKey(v2Domain.getDomainId())) {
                V2Domain v2DomainDb= v2DomainMap.get(v2Domain.getDomainId());
                v2Domain.setId(v2DomainDb.getId());
                v2DomainMapper.updateV2Domain(v2Domain);
            } else {
                v2DomainMapper.insertV2Domain(v2Domain);
            }
        }


        return AjaxResult.success();
    }
}

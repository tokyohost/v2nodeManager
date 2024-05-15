package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.V2Domain;

/**
 * 域名列表Mapper接口
 * 
 * @author ruoyi
 * @date 2024-05-11
 */
public interface V2DomainMapper 
{
    /**
     * 查询域名列表
     * 
     * @param id 域名列表主键
     * @return 域名列表
     */
    public V2Domain selectV2DomainById(Long id);

    /**
     * 查询域名列表列表
     * 
     * @param v2Domain 域名列表
     * @return 域名列表集合
     */
    public List<V2Domain> selectV2DomainList(V2Domain v2Domain);

    /**
     * 新增域名列表
     * 
     * @param v2Domain 域名列表
     * @return 结果
     */
    public int insertV2Domain(V2Domain v2Domain);

    /**
     * 修改域名列表
     * 
     * @param v2Domain 域名列表
     * @return 结果
     */
    public int updateV2Domain(V2Domain v2Domain);

    /**
     * 删除域名列表
     * 
     * @param id 域名列表主键
     * @return 结果
     */
    public int deleteV2DomainById(Long id);

    /**
     * 批量删除域名列表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteV2DomainByIds(Long[] ids);
}

package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.V2Dns;

/**
 * DNS信息Mapper接口
 * 
 * @author ruoyi
 * @date 2024-05-11
 */
public interface V2DnsMapper 
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
    public int updateV2Dns(V2Dns v2Dns);

    /**
     * 删除DNS信息
     * 
     * @param id DNS信息主键
     * @return 结果
     */
    public int deleteV2DnsById(String id);

    /**
     * 批量删除DNS信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteV2DnsByIds(String[] ids);

    V2Dns selectV2DnsByName(String name);
}

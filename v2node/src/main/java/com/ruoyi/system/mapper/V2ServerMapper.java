package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.V2Node;
import com.ruoyi.system.domain.V2Server;
import org.apache.ibatis.annotations.Param;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2024-05-10
 */
public interface V2ServerMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public V2Server selectV2ServerById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param v2Server 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<V2Server> selectV2ServerList(V2Server v2Server);

    /**
     * 新增【请填写功能名称】
     * 
     * @param v2Server 【请填写功能名称】
     * @return 结果
     */
    public int insertV2Server(V2Server v2Server);

    /**
     * 修改【请填写功能名称】
     * 
     * @param v2Server 【请填写功能名称】
     * @return 结果
     */
    public int updateV2Server(V2Server v2Server);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteV2ServerById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteV2ServerByIds(Long[] ids);

    V2Server selectV2ServerByIp(String ip);

    V2Node selectV2NodeInfoByNodeId(Long nodeId);

    void updateV2Node(@Param("nodeId") Long nodeId, @Param("content") String content);

    List<V2Node> selectV2NodeInfoByNodeIds(@Param("nodeids") List<Long> nodeids);

}

package com.ruoyi.system.service;

import java.util.List;
import java.util.stream.Stream;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.domain.V2Node;
import com.ruoyi.system.domain.V2Server;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2024-05-10
 */
public interface IV2ServerService 
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
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteV2ServerByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteV2ServerById(Long id);

    AjaxResult checkInstallStatus(Long id);

    AjaxResult installStatus(Long id);

    AjaxResult execFileReplace(Long id, Long templateId);

    V2Server selectV2ServerByIp(String ip);

    V2Node selectV2NodeInfoByNodeId(Long nodeId);

    void updateV2Node(Long nodeId, String content);

    List<V2Node> selectV2NodeInfoByNodeIds(List<Long> nodeids);

    AjaxResult quickHostReplace(V2Dns data);

    AjaxResult updateVersion(Long id, String version);
}

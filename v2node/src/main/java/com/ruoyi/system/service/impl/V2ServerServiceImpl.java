package com.ruoyi.system.service.impl;

import com.jcraft.jsch.JSchException;
import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.common.utils.ShellUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.agreementStrategy.V2NodeService;
import com.ruoyi.system.domain.NodeVo;
import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.domain.V2Node;
import com.ruoyi.system.domain.V2Server;
import com.ruoyi.system.mapper.V2ServerMapper;
import com.ruoyi.system.service.*;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2024-05-10
 */
@Service
public class V2ServerServiceImpl implements IV2ServerService {
    @Autowired
    private V2ServerMapper v2ServerMapper;

    @Autowired
    private V2Manager v2Manager;
    @Autowired
    private V2Manager manager;

    @Autowired
    private ShellUtil shellUtil;

    @Autowired
    private ISysConfigService sysConfigService;

    @Autowired
    private IV2DnsService iv2DnsService;

    @Autowired
    private ConfigService configService;

//    ConcurrentHashMap<String,ShellUtil> shellMap = new ConcurrentHashMap<>();

    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public V2Server selectV2ServerById(Long id) {
        return v2ServerMapper.selectV2ServerById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param v2Server 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<V2Server> selectV2ServerList(V2Server v2Server) {
        return v2ServerMapper.selectV2ServerList(v2Server);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param v2Server 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertV2Server(V2Server v2Server) {
        return v2ServerMapper.insertV2Server(v2Server);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param v2Server 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateV2Server(V2Server v2Server) {
        return v2ServerMapper.updateV2Server(v2Server);
    }

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteV2ServerByIds(Long[] ids) {
        return v2ServerMapper.deleteV2ServerByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteV2ServerById(Long id) {
        return v2ServerMapper.deleteV2ServerById(id);
    }

    @Override
    public AjaxResult checkInstallStatus(Long id) {
        V2Server v2Server = v2ServerMapper.selectV2ServerById(id);
        String nodeType = v2Server.getNodeType();
        V2NodeService v2NodeService = v2Manager.getV2NodeService(nodeType);
        if (Objects.isNull(v2NodeService)) {
            return AjaxResult.error("不支持的类型 "+nodeType);
        }

        return v2NodeService.checkInstallStatus(v2Server);
    }

    @Override
    public AjaxResult installStatus(Long id) {

        V2Server v2Server = v2ServerMapper.selectV2ServerById(id);
        String nodeType = v2Server.getNodeType();
        V2NodeService v2NodeService = v2Manager.getV2NodeService(nodeType);
        if (Objects.isNull(v2NodeService)) {
            return AjaxResult.error("不支持的类型 "+nodeType);
        }

        return v2NodeService.install(v2Server);

    }

    @Override
    public AjaxResult execFileReplace(Long id, Long templateId) {

        return null;
    }

    @Override
    public V2Server selectV2ServerByIp(String ip) {
        return v2ServerMapper.selectV2ServerByIp(ip);
    }

    @Override
    @DataSource(value = DataSourceType.v2board)
    public V2Node selectV2NodeInfoByNodeId(Long nodeId) {
        return v2ServerMapper.selectV2NodeInfoByNodeId(nodeId);
    }

    @Override
    @DataSource(value = DataSourceType.v2board)
    public void updateV2Node(Long nodeId, String content) {
        v2ServerMapper.updateV2Node(nodeId, content);
    }

    @Override
    @DataSource(value = DataSourceType.v2board)
    public List<V2Node> selectV2NodeInfoByNodeIds(List<Long> nodeids) {
        if (CollectionUtils.isEmpty(nodeids)) {
            return new ArrayList<>();
        }
        return v2ServerMapper.selectV2NodeInfoByNodeIds(nodeids);
    }

    @Override
    public AjaxResult quickHostReplace(V2Dns data) {
        Long serverId = data.getServerId();
        data.setType("A");
        data.setName(data.getName() + "." + data.getZoneName());
        V2Server v2Server = v2ServerMapper.selectV2ServerById(serverId);
        data.setContent(v2Server.getIp());
        data.setTtl(3600L);
        AjaxResult v2Dns = iv2DnsService.createV2Dns(data);
        if (v2Dns.isSuccess()) {
            V2Dns dnsByName = iv2DnsService.selectV2DnsByName(data.getName());
            String nodeType = v2Server.getNodeType();
            V2NodeService v2NodeService = v2Manager.getV2NodeService(nodeType);
            if (Objects.isNull(v2NodeService)) {
                return AjaxResult.error("不支持的类型 "+nodeType);
            }
            return v2NodeService.replaceConfig(dnsByName.getId(), data.getTemplateId());
        } else {
            return v2Dns;
        }
    }

    @Override
    public AjaxResult updateVersion(Long id, String version) {
        if (StringUtils.isEmpty(version)) {
            return AjaxResult.error("版本参数异常");
        }

        V2Server v2Server = v2ServerMapper.selectV2ServerById(id);
        String nodeType = v2Server.getNodeType();
        V2NodeService v2NodeService = v2Manager.getV2NodeService(nodeType);
        if (Objects.isNull(v2NodeService)) {
            return AjaxResult.error("不支持的类型 "+nodeType);
        }

        return v2NodeService.update(v2Server,version);
    }

    @Override
    public AjaxResult queryNodeList(V2Server v2Server) {
        if (StringUtils.isEmpty(v2Server.getNodeType())) {
            return AjaxResult.success(new ArrayList<>());
        }
        V2NodeService v2NodeService = manager.getV2NodeService(v2Server.getNodeType());
        if (Objects.isNull(v2NodeService)) {
            return AjaxResult.error("不支持的节点类型");
        }
        List<NodeVo> nodeVos = v2NodeService.queryList(new NodeVo());

        return AjaxResult.success(nodeVos);
    }
}

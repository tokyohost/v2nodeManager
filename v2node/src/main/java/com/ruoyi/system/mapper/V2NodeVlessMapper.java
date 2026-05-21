package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.NodeVo;

import java.util.List;

/**
 * vless 节点 mapper
 *
 * @author xuehui_li
 */
public interface V2NodeVlessMapper {
    List<NodeVo> queryList(NodeVo nodeVo);
}

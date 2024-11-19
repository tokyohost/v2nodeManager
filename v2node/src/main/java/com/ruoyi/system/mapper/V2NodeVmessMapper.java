package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.NodeVo;

import java.util.List;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/11/19 9:53
 * @Content
 */

public interface V2NodeVmessMapper {
    List<NodeVo> queryList(NodeVo nodeVo);
}

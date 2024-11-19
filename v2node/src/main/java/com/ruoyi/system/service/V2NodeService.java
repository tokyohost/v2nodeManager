package com.ruoyi.system.service;

import com.ruoyi.system.domain.NodeVo;

import java.util.List;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/11/19 9:38
 * @Content
 */
public interface V2NodeService {

    List<NodeVo> queryList(NodeVo nodeVo);

    String getType();
}

package com.ruoyi.system.agreementStrategy;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.NodeVo;
import com.ruoyi.system.domain.V2Server;

import java.util.List;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/11/19 9:38
 * @Content
 */
public interface V2NodeService {

    List<NodeVo> queryList(NodeVo nodeVo);

    AjaxResult checkInstallStatus(V2Server v2Server);
    AjaxResult install(V2Server v2Server);

    AjaxResult update(V2Server v2Server,String version);

    AjaxResult replaceConfig(String id, Long templateId);

    String getType();
}

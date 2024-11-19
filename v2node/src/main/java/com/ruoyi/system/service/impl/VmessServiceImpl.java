package com.ruoyi.system.service.impl;

import com.ruoyi.common.annotation.DataSource;
import com.ruoyi.common.enums.DataSourceType;
import com.ruoyi.system.constant.NodeTypeEnum;
import com.ruoyi.system.domain.NodeVo;
import com.ruoyi.system.mapper.V2NodeVmessMapper;
import com.ruoyi.system.service.V2NodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/11/19 9:50
 * @Content
 */
@Service
public class VmessServiceImpl  implements V2NodeService {

    @Autowired
    V2NodeVmessMapper v2NodeVmessMapper;

    @Override
    @DataSource(value = DataSourceType.v2board)
    public List<NodeVo> queryList(NodeVo nodeVo) {
        return v2NodeVmessMapper.queryList(nodeVo);
    }

    @Override
    public String getType() {
        return NodeTypeEnum.VMESS.getType();
    }
}

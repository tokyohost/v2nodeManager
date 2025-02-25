package com.ruoyi.system.service;

import com.ruoyi.system.agreementStrategy.V2NodeService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author xuehui_li
 * @Version 1.0
 * @date 2024/11/19 10:01
 * @Content
 */
@Service
public class V2Manager {
    HashMap<String, V2NodeService> nodeServiceMap = new HashMap<>();

    public V2Manager(List<V2NodeService> serviceList) {
        for (V2NodeService v2NodeService : serviceList) {
            nodeServiceMap.put(v2NodeService.getType(), v2NodeService);
        }
    }

    public V2NodeService getV2NodeService(String type) {
        return nodeServiceMap.get(type);
    }
}

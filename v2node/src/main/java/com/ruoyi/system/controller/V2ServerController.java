package com.ruoyi.system.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.domain.V2Node;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.V2Server;
import com.ruoyi.system.service.IV2ServerService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 服务器Controller
 * 
 * @author ruoyi
 * @date 2024-05-10
 */
@RestController
@RequestMapping("/system/server")
public class V2ServerController extends BaseController
{
    @Autowired
    private IV2ServerService v2ServerService;

    /**
     * 查询服务器列表
     */
    @PreAuthorize("@ss.hasPermi('system:server:list')")
    @GetMapping("/list")
    public TableDataInfo list(V2Server v2Server)
    {
        startPage();
        List<V2Server> list = v2ServerService.selectV2ServerList(v2Server);
        List<V2Node> v2Nodes = v2ServerService.selectV2NodeInfoByNodeIds(list.stream().map(V2Server::getNodeId).collect(Collectors.toList()));
        Map<Long, V2Node> nodeMap = v2Nodes.stream().collect(Collectors.toMap(V2Node::getId, item->item));
        for (V2Server server : list) {
            if (nodeMap.containsKey(server.getNodeId())) {
                V2Node v2Node = nodeMap.get(server.getNodeId());
                server.setNodeHost(v2Node.getHost());
                server.setNodeName(v2Node.getName());
            }
        }
        return getDataTable(list);
    }    /**
     * 查询服务器列表
     */
    @PreAuthorize("@ss.hasPermi('system:server:list')")
    @GetMapping("/listAll")
    public AjaxResult listAll(V2Server v2Server)
    {
//        startPage();
        List<V2Server> list = v2ServerService.selectV2ServerList(v2Server);
        return AjaxResult.success(list);
    }

    /**
     * 导出服务器列表
     */
    @PreAuthorize("@ss.hasPermi('system:server:export')")
    @Log(title = "服务器", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, V2Server v2Server)
    {
        List<V2Server> list = v2ServerService.selectV2ServerList(v2Server);
        ExcelUtil<V2Server> util = new ExcelUtil<V2Server>(V2Server.class);
        util.exportExcel(response, list, "服务器数据");
    }

    /**
     * 获取服务器详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:server:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(v2ServerService.selectV2ServerById(id));
    }

     /**
     * 获取服务器详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:server:query')")
    @GetMapping(value = "/checkInstallStatus/{id}")
    public AjaxResult checkInstallStatus(@PathVariable("id") Long id)
    {
        return v2ServerService.checkInstallStatus(id);
    }
     /**
     * 获取服务器详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:server:query')")
    @GetMapping(value = "/installStatus/{id}")
    public AjaxResult installStatus(@PathVariable("id") Long id)
    {
        return v2ServerService.installStatus(id);
    }

    @PreAuthorize("@ss.hasPermi('system:server:query')")
    @GetMapping(value = "/updateVersion/{id}")
    public AjaxResult updateVersion(@PathVariable("id") Long id,String version)
    {
        return v2ServerService.updateVersion(id,version);
    }


    @PreAuthorize("@ss.hasPermi('system:server:execFileReplace')")
    @GetMapping(value = "/execFileReplace")
    public AjaxResult execFileReplace(Long id,Long templateId)
    {
        return v2ServerService.execFileReplace(id,templateId);
    }
    @PreAuthorize("@ss.hasPermi('system:server:quickHostReplace')")
    @PostMapping(value = "/quickHostReplace")
    public AjaxResult quickHostReplace(@RequestBody V2Dns data)
    {
        return v2ServerService.quickHostReplace(data);
    }

    /**
     * 新增服务器
     */
    @PreAuthorize("@ss.hasPermi('system:server:add')")
    @Log(title = "服务器", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody V2Server v2Server)
    {
        return toAjax(v2ServerService.insertV2Server(v2Server));
    }    /**
     * 新增服务器
     */
    @PreAuthorize("@ss.hasPermi('system:server:queryV2NodeList')")
    @GetMapping(value = "/queryV2NodeList")
    public AjaxResult queryV2NodeList( V2Server v2Server)
    {

        return v2ServerService.queryNodeList(v2Server);
    }

    /**
     * 修改服务器
     */
    @PreAuthorize("@ss.hasPermi('system:server:edit')")
    @Log(title = "服务器", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody V2Server v2Server)
    {
        return toAjax(v2ServerService.updateV2Server(v2Server));
    }

    /**
     * 删除服务器
     */
    @PreAuthorize("@ss.hasPermi('system:server:remove')")
    @Log(title = "服务器", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(v2ServerService.deleteV2ServerByIds(ids));
    }


}

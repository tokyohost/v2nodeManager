package com.ruoyi.system.controller;

import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.uuid.IdUtils;
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
import com.ruoyi.system.domain.V2Dns;
import com.ruoyi.system.service.IV2DnsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * DNS信息Controller
 * 
 * @author ruoyi
 * @date 2024-05-11
 */
@RestController
@RequestMapping("/system/dns")
public class V2DnsController extends BaseController
{
    @Autowired
    private IV2DnsService v2DnsService;

    /**
     * 查询DNS信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:dns:list')")
    @GetMapping("/list")
    public TableDataInfo list(V2Dns v2Dns)
    {
        startPage();
        List<V2Dns> list = v2DnsService.selectV2DnsList(v2Dns);
        return getDataTable(list);
    }

    /**
     * 导出DNS信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:dns:export')")
    @Log(title = "DNS信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, V2Dns v2Dns)
    {
        List<V2Dns> list = v2DnsService.selectV2DnsList(v2Dns);
        ExcelUtil<V2Dns> util = new ExcelUtil<V2Dns>(V2Dns.class);
        util.exportExcel(response, list, "DNS信息数据");
    }

    /**
     * 获取DNS信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:dns:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(v2DnsService.selectV2DnsById(id));
    }

    /**
     * 新增DNS信息
     */
    @PreAuthorize("@ss.hasPermi('system:dns:add')")
    @Log(title = "DNS信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody V2Dns v2Dns)
    {
        return v2DnsService.createV2Dns(v2Dns);
    }

    @PreAuthorize("@ss.hasPermi('system:dns:sync')")
    @GetMapping(value = "/sync")
    public AjaxResult sync()
    {
        return v2DnsService.syncV2Dns(null);
    }
    @PreAuthorize("@ss.hasPermi('system:dns:generateConfig')")
    @GetMapping(value = "/generateConfig")
    public AjaxResult generateConfig(String id,Long templateId)
    {
        AjaxResult ajaxResult = v2DnsService.generateConfig(id, templateId);
        ajaxResult.put("serverContent", v2DnsService.getServerConfig(id));
        ajaxResult.put("v2BoardConfig", v2DnsService.getv2BoardConfig(id));
        return ajaxResult;
    }
    @PreAuthorize("@ss.hasPermi('system:dns:replaceConfig')")
    @GetMapping(value = "/replaceConfig")
    public AjaxResult replaceConfig(String id,Long templateId)
    {
        AjaxResult ajaxResult = v2DnsService.replaceConfig(id, templateId);
        return ajaxResult;
    }
    @PreAuthorize("@ss.hasPermi('system:dns:add')")
    @GetMapping(value = "/getADnsName")
    public AjaxResult getADnsName(String domain)
    {
        V2Dns v2Dns = new V2Dns();
        v2Dns.setZoneName(domain);
        List<V2Dns> v2DnsList = v2DnsService.selectV2DnsList(v2Dns);
        List<String> names = v2DnsList.stream().map(V2Dns::getName).collect(Collectors.toList());
        while (true) {
            String nId = IdUtils.fastSimpleUUID();
            boolean flag = false;
            for (String name : names) {
                if(name.split("\\.")[0].contains(nId)){
                    flag = true;
                    break;
                }
            }
            if (flag) {
                continue;
            }
            return AjaxResult.success(nId);
        }
    }

    /**
     * 修改DNS信息
     */
    @PreAuthorize("@ss.hasPermi('system:dns:edit')")
    @Log(title = "DNS信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody V2Dns v2Dns)
    {
        return v2DnsService.updateV2Dns(v2Dns);
    }

    /**
     * 删除DNS信息
     */
    @PreAuthorize("@ss.hasPermi('system:dns:remove')")
    @Log(title = "DNS信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable String id)
    {
        return v2DnsService.deleteV2DnsById(id);
    }
}

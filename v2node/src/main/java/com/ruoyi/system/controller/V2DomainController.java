package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.V2Domain;
import com.ruoyi.system.service.IV2DomainService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 域名列表Controller
 * 
 * @author ruoyi
 * @date 2024-05-11
 */
@RestController
@RequestMapping("/system/domain")
public class V2DomainController extends BaseController
{
    @Autowired
    private IV2DomainService v2DomainService;

    /**
     * 查询域名列表列表
     */
    @PreAuthorize("@ss.hasPermi('system:domain:list')")
    @GetMapping("/list")
    public TableDataInfo list(V2Domain v2Domain)
    {
        startPage();
        List<V2Domain> list = v2DomainService.selectV2DomainList(v2Domain);
        return getDataTable(list);
    }    /**
     * 查询域名列表列表
     */
    @PreAuthorize("@ss.hasPermi('system:domain:list')")
    @GetMapping("/listAll")
    public AjaxResult listAll()
    {
//        startPage();
        List<V2Domain> list = v2DomainService.selectV2DomainList(new V2Domain());
        return success(list);
    }

    /**
     * 导出域名列表列表
     */
    @PreAuthorize("@ss.hasPermi('system:domain:export')")
    @Log(title = "域名列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, V2Domain v2Domain)
    {
        List<V2Domain> list = v2DomainService.selectV2DomainList(v2Domain);
        ExcelUtil<V2Domain> util = new ExcelUtil<V2Domain>(V2Domain.class);
        util.exportExcel(response, list, "域名列表数据");
    }

    /**
     * 获取域名列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:domain:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(v2DomainService.selectV2DomainById(id));
    }

    /**
     * 新增域名列表
     */
    @PreAuthorize("@ss.hasPermi('system:domain:add')")
    @Log(title = "域名列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody V2Domain v2Domain)
    {
        return toAjax(v2DomainService.insertV2Domain(v2Domain));
    }
    @PreAuthorize("@ss.hasPermi('system:domain:sync')")
    @GetMapping(value = "/sync")
    public AjaxResult sync()
    {
        return v2DomainService.syncDomain();
    }

    /**
     * 修改域名列表
     */
    @PreAuthorize("@ss.hasPermi('system:domain:edit')")
    @Log(title = "域名列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody V2Domain v2Domain)
    {
        return toAjax(v2DomainService.updateV2Domain(v2Domain));
    }

    /**
     * 删除域名列表
     */
    @PreAuthorize("@ss.hasPermi('system:domain:remove')")
    @Log(title = "域名列表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(v2DomainService.deleteV2DomainByIds(ids));
    }
}

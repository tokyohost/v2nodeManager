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
import com.ruoyi.system.domain.V2FileTemplate;
import com.ruoyi.system.service.IV2FileTemplateService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 文件模板Controller
 * 
 * @author ruoyi
 * @date 2024-05-13
 */
@RestController
@RequestMapping("/system/template")
public class V2FileTemplateController extends BaseController
{
    @Autowired
    private IV2FileTemplateService v2FileTemplateService;

    /**
     * 查询文件模板列表
     */
    @PreAuthorize("@ss.hasPermi('system:template:list')")
    @GetMapping("/list")
    public TableDataInfo list(V2FileTemplate v2FileTemplate)
    {
        startPage();
        List<V2FileTemplate> list = v2FileTemplateService.selectV2FileTemplateList(v2FileTemplate);
        return getDataTable(list);
    }    /**
     * 查询文件模板列表
     */
    @PreAuthorize("@ss.hasPermi('system:template:list')")
    @GetMapping("/listAll")
    public AjaxResult listAll(V2FileTemplate v2FileTemplate)
    {
//        startPage();
        List<V2FileTemplate> list = v2FileTemplateService.selectV2FileTemplateList(v2FileTemplate);
        return success(list);
    }

    /**
     * 导出文件模板列表
     */
    @PreAuthorize("@ss.hasPermi('system:template:export')")
    @Log(title = "文件模板", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, V2FileTemplate v2FileTemplate)
    {
        List<V2FileTemplate> list = v2FileTemplateService.selectV2FileTemplateList(v2FileTemplate);
        ExcelUtil<V2FileTemplate> util = new ExcelUtil<V2FileTemplate>(V2FileTemplate.class);
        util.exportExcel(response, list, "文件模板数据");
    }

    /**
     * 获取文件模板详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:template:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(v2FileTemplateService.selectV2FileTemplateById(id));
    }

    /**
     * 新增文件模板
     */
    @PreAuthorize("@ss.hasPermi('system:template:add')")
    @Log(title = "文件模板", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody V2FileTemplate v2FileTemplate)
    {
        return toAjax(v2FileTemplateService.insertV2FileTemplate(v2FileTemplate));
    }

    /**
     * 修改文件模板
     */
    @PreAuthorize("@ss.hasPermi('system:template:edit')")
    @Log(title = "文件模板", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody V2FileTemplate v2FileTemplate)
    {
        return toAjax(v2FileTemplateService.updateV2FileTemplate(v2FileTemplate));
    }

    /**
     * 删除文件模板
     */
    @PreAuthorize("@ss.hasPermi('system:template:remove')")
    @Log(title = "文件模板", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(v2FileTemplateService.deleteV2FileTemplateByIds(ids));
    }
}

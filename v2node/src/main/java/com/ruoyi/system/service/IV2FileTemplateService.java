package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.V2FileTemplate;

/**
 * 文件模板Service接口
 * 
 * @author ruoyi
 * @date 2024-05-13
 */
public interface IV2FileTemplateService 
{
    /**
     * 查询文件模板
     * 
     * @param id 文件模板主键
     * @return 文件模板
     */
    public V2FileTemplate selectV2FileTemplateById(Long id);

    /**
     * 查询文件模板列表
     * 
     * @param v2FileTemplate 文件模板
     * @return 文件模板集合
     */
    public List<V2FileTemplate> selectV2FileTemplateList(V2FileTemplate v2FileTemplate);

    /**
     * 新增文件模板
     * 
     * @param v2FileTemplate 文件模板
     * @return 结果
     */
    public int insertV2FileTemplate(V2FileTemplate v2FileTemplate);

    /**
     * 修改文件模板
     * 
     * @param v2FileTemplate 文件模板
     * @return 结果
     */
    public int updateV2FileTemplate(V2FileTemplate v2FileTemplate);

    /**
     * 批量删除文件模板
     * 
     * @param ids 需要删除的文件模板主键集合
     * @return 结果
     */
    public int deleteV2FileTemplateByIds(Long[] ids);

    /**
     * 删除文件模板信息
     * 
     * @param id 文件模板主键
     * @return 结果
     */
    public int deleteV2FileTemplateById(Long id);
}

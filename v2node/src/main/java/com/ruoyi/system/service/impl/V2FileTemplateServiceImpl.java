package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.V2FileTemplateMapper;
import com.ruoyi.system.domain.V2FileTemplate;
import com.ruoyi.system.service.IV2FileTemplateService;

/**
 * 文件模板Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-05-13
 */
@Service
public class V2FileTemplateServiceImpl implements IV2FileTemplateService 
{
    @Autowired
    private V2FileTemplateMapper v2FileTemplateMapper;

    /**
     * 查询文件模板
     * 
     * @param id 文件模板主键
     * @return 文件模板
     */
    @Override
    public V2FileTemplate selectV2FileTemplateById(Long id)
    {
        return v2FileTemplateMapper.selectV2FileTemplateById(id);
    }

    /**
     * 查询文件模板列表
     * 
     * @param v2FileTemplate 文件模板
     * @return 文件模板
     */
    @Override
    public List<V2FileTemplate> selectV2FileTemplateList(V2FileTemplate v2FileTemplate)
    {
        return v2FileTemplateMapper.selectV2FileTemplateList(v2FileTemplate);
    }

    /**
     * 新增文件模板
     * 
     * @param v2FileTemplate 文件模板
     * @return 结果
     */
    @Override
    public int insertV2FileTemplate(V2FileTemplate v2FileTemplate)
    {
        return v2FileTemplateMapper.insertV2FileTemplate(v2FileTemplate);
    }

    /**
     * 修改文件模板
     * 
     * @param v2FileTemplate 文件模板
     * @return 结果
     */
    @Override
    public int updateV2FileTemplate(V2FileTemplate v2FileTemplate)
    {
        return v2FileTemplateMapper.updateV2FileTemplate(v2FileTemplate);
    }

    /**
     * 批量删除文件模板
     * 
     * @param ids 需要删除的文件模板主键
     * @return 结果
     */
    @Override
    public int deleteV2FileTemplateByIds(Long[] ids)
    {
        return v2FileTemplateMapper.deleteV2FileTemplateByIds(ids);
    }

    /**
     * 删除文件模板信息
     * 
     * @param id 文件模板主键
     * @return 结果
     */
    @Override
    public int deleteV2FileTemplateById(Long id)
    {
        return v2FileTemplateMapper.deleteV2FileTemplateById(id);
    }
}

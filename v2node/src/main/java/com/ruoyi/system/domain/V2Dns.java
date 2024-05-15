package com.ruoyi.system.domain;

import com.alibaba.fastjson2.annotation.JSONField;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * DNS信息对象 v2_dns
 * 
 * @author ruoyi
 * @date 2024-05-11
 */
public class V2Dns extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String id;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @JSONField(name = "zone_id")
    private String zoneId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    @JSONField(name = "zone_name")
    private String zoneName;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String name;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String type;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String content;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String proxiable;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String proxied;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long ttl;


    private Long serverId;

    private Long templateId;

    public Long getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Long templateId) {
        this.templateId = templateId;
    }

    public Long getServerId() {
        return serverId;
    }

    public void setServerId(Long serverId) {
        this.serverId = serverId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setZoneId(String zoneId)
    {
        this.zoneId = zoneId;
    }

    public String getZoneId() 
    {
        return zoneId;
    }
    public void setZoneName(String zoneName) 
    {
        this.zoneName = zoneName;
    }

    public String getZoneName() 
    {
        return zoneName;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setProxiable(String proxiable) 
    {
        this.proxiable = proxiable;
    }

    public String getProxiable() 
    {
        return proxiable;
    }
    public void setProxied(String proxied) 
    {
        this.proxied = proxied;
    }

    public String getProxied() 
    {
        return proxied;
    }
    public void setTtl(Long ttl) 
    {
        this.ttl = ttl;
    }

    public Long getTtl() 
    {
        return ttl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("zoneId", getZoneId())
            .append("zoneName", getZoneName())
            .append("name", getName())
            .append("type", getType())
            .append("content", getContent())
            .append("proxiable", getProxiable())
            .append("proxied", getProxied())
            .append("ttl", getTtl())
            .toString();
    }
}

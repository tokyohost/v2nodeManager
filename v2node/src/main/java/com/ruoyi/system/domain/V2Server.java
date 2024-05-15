package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 v2_server
 * 
 * @author ruoyi
 * @date 2024-05-13
 */
public class V2Server extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** ip */
    @Excel(name = "ip")
    private String ip;

    /** port */
    @Excel(name = "port")
    private String port;

    /** user */
    @Excel(name = "user")
    private String user;

    /** passwd */
    @Excel(name = "passwd")
    private String passwd;

    /** nodeId */
    @Excel(name = "nodeId")
    private Long nodeId;

    /** 配置文件地址 */
    @Excel(name = "配置文件地址")
    private String filePath;

    private String nodeHost;

    private String nodeName;

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public String getNodeHost() {
        return nodeHost;
    }

    public void setNodeHost(String nodeHost) {
        this.nodeHost = nodeHost;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setIp(String ip) 
    {
        this.ip = ip;
    }

    public String getIp() 
    {
        return ip;
    }
    public void setPort(String port) 
    {
        this.port = port;
    }

    public String getPort() 
    {
        return port;
    }
    public void setUser(String user) 
    {
        this.user = user;
    }

    public String getUser() 
    {
        return user;
    }
    public void setPasswd(String passwd) 
    {
        this.passwd = passwd;
    }

    public String getPasswd() 
    {
        return passwd;
    }
    public void setNodeId(Long nodeId) 
    {
        this.nodeId = nodeId;
    }

    public Long getNodeId() 
    {
        return nodeId;
    }
    public void setFilePath(String filePath) 
    {
        this.filePath = filePath;
    }

    public String getFilePath() 
    {
        return filePath;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("ip", getIp())
            .append("port", getPort())
            .append("user", getUser())
            .append("passwd", getPasswd())
            .append("nodeId", getNodeId())
            .append("filePath", getFilePath())
            .toString();
    }
}

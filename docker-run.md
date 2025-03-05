## docker 部署

### docker 环境
请提前准备docker 和docker-compose 环境
### 修改配置文件
请 将docker-compose 文件中mysql 密码、redis 密码、v2board 数据库配置修改好后再运行 ！

### docker 运行

```shell
git clone https://github.com/tokyohost/v2nodeManager
cd v2nodeManager/
docker-compose up -d
```

### 访问管理端
```http request
http://localhost:8099
默认账号密码 admin/admin@2024
```


### 注意

防火墙只需开放8099端口 或由nginx 代理80 443即可

### https 配置

单独在nginx 代理配置https 即可，宝塔可一键https，再修改nginx配置增加代理
```nginx
location / {
      proxy_pass  http://127.0.0.1:8099/; # 转发规则
      proxy_set_header Host $proxy_host; 
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
```
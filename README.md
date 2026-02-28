
<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">v2NodeManage</h1>
<h4 align="center">V2Ray 机场节点管理面板</h4>

## 简介

自用开发的面板，仅支持CF + tls + ws 的v2节点管理，可以快速更换节点解析以及调整DNS，不用再同时登录CF、服务器、V2board 化繁为简。

## 免责声明
本项目只是本人个人学习开发并维护，本人不保证任何可用性，也不对使用本软件造成的任何后果负责，本项目基于若依开发，感谢[若依](http://ruoyi.vip/)项目的所有贡献者。
## 核心功能
使用此项目您可以快速配置v2ray vmess 节点，您只需要在v2board 后台新增或复制对应vmess 节点，进入此系统中新增一个服务器，填写好您购买的vps ip账号密码，选择绑定的v2board 节点，点击一键安装XrayR 或Soga，等待片刻即可完成node节点安装配置，一键更换DNS 3秒帮您快速完成节点域名切换，极简快速节约时间。

## 内置功能

1.  服务器管理：管理所有的v2节点服务器(需要提前安装好XrayR 后端)，提供一键更换节点解析，同步修改节点配置文件、V2board面板、CF解析。
2.  域名管理：管理用户CF 所有的已绑定域名，包括新增删除DNS 同步生成对应DNS 的XrayR 配置文件到对应服务器。

## docker部署
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
详见 [点击这里跳转到docker快速部署指南](docker-run.md)


## 支持的后端
<table>
    <tr>
        <td>XrayR</td>
        <td>✔</td>
    </tr>
    <tr>
        <td>Soga</td>
        <td>✔</td>
    </tr>
</table>

## 演示图
一键 更换/新增 节点绑定域名
![v2node1.png](doc%2Fv2node1.png)
节点服务器列表
![v2node1.png](doc%2Fv2node2.png)
XrayR 配置文件模板
![v2node1.png](doc%2Fv2node3.png)
域名列表
![v2node1.png](doc%2Fv2node7.png)
DNS 解析列表，可快速新增DNS解析、可快速生成对应的XrayR配置文件并将配置文件同步到解析对应的ip 服务器
![v2node1.png](doc%2Fv2node8.png)
![v2node1.png](doc%2Fv2node9.png)

![v2node1.png](doc%2Fv2node10.png)

## 配置文件模板可用参数

<table>
    <tr>
        <td>${apiHost}</td>
        <td>对应V2board 面板地址</td>
    </tr>
    <tr>
        <td>${apiKey}</td>
        <td>对应V2board 面板KEY</td>
    </tr>
    <tr>
        <td>${nodeId}</td>
        <td>选中的服务器nodeId，在服务器新增时填写</td>
    </tr>
    <tr>
        <td>${certDomain}</td>
        <td>被替换为新增的DNS域名</td>
    </tr>
    <tr>
        <td>${cfEmail}</td>
        <td>在系统管理-> 参数设置里面配置</td>
    </tr>
    <tr>
        <td>${cfToken}</td>
        <td>在系统管理-> 参数设置里面配置</td>
    </tr>

</table>

## 注意

1.  最低支持 v2Board 1.5.4版本
2.  节点服务器已测试Centos7+/ubuntu 2021+/ubuntu 2022
3.  XrayR 安装脚本使用  [XrayR](https://github.com/XrayR-project/XrayR) 最新版即可

## 环境准备
```yaml
mysql 5.7+
OpenJDK 1.8
nginx
redis 7.0
```


## 安装

1.  后端
 ```bash
   克隆本项目后自行通过maven打包 或者 下载release 版本
```
2.  前端
```bash
  cd ruoyi-ui
  npm install
  npm run build:prod
```
上传dist 文件夹至网站目录 或直接下载release 版本

3. 后端配置

```yaml
# application-druid.yml 配置文件中
# v2NodeManage数据库
  master:
    url: jdbc:mysql://localhost:3307/v2node?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: yourPassword


  v2board:
    # v2board 数据库
    enabled: true
    #v2board 的数据库
    url: jdbc:mysql://localhost:3306/v2vpn24?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    #数据库用户名
    username: root
    #数据库密码
    password: yourPassword
    

```

```yaml
# application.yml 配置文件
# redis 配置
  redis:
    # 地址
    host: localhost
    # 端口，默认为6379
    port: 6379
    # 数据库索引
    database: 0
    # 您的redis密码
    password: ""

```
4. 初始化数据库
```angular2html
  数据库脚本位于 项目目录/sql/v2nodeManage.sql
```
5. 运行
```yaml
#在同jar目录下创建config目录，将application.yml 和application-druid.yml 放入其中，并修改对应的配置项
 nohup java -jar -Dspring.config.additional-location=config/application.yml  v2NodeManage.jar >> z.log 2>&1 &

```

6. nginx 配置
```nginx
        location / {
            root  /www/wwwroot/yourdomain/dist;
		try_files $uri $uri/ /index.html;
            index  index.html index.htm;
        }
		
	location /prod-api/ {
		proxy_set_header Host $http_host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header REMOTE-HOST $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_pass http://localhost:8088/;
	}
```
```yaml
默认账号密码 admin/admin@2024
```
7.CF apiToken 获取

```yaml
登录CF 后 My Profile -> API Tokens -> Create API Token -> 选择 Edit zone DNS 项 ->Zone Resources 项下 选择 Include All zones -> createToken 完成

获取后在 系统管理-> 参数设置 ->  cfkey 配置；同时需要配置 cfEmail ，你的cf 登录邮箱

```



## 可能的功能规划

<table>
    <tr>
        <td>服务器管理</td>
        <td>✔</td>
    </tr>
    <tr>
        <td>域名管理</td>
        <td>✔</td>
    </tr>
    <tr>
        <td>DNS管理</td>
        <td>✔</td>
    </tr>
    <tr>
        <td>一键安装XrayR后端</td>
        <td>✔</td>
    </tr>
    <tr>
        <td>监控域名状态</td>
        <td>❌</td>
    </tr>
    <tr>
        <td>根据域名状态，自动切换节点的DNS解析</td>
        <td>❌</td>
    </tr>
    <tr>
        <td>定时切换节点的DNS解析</td>
        <td>❌</td>
    </tr>
    <tr>
        <td>全自动安装XrayR后端</td>
        <td>✔</td>
    </tr>
    <tr>
        <td>Docker 部署</td>
        <td>✔</td>
    </tr>


</table>

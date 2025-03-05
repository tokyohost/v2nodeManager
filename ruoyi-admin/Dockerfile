FROM bitnami/java:1.8
MAINTAINER authors="tokyohost<2508058633@qq.com>"
# copy jar包 命名为 aap.jar
WORKDIR /app
COPY ../target/*.jar /app/app.jar

# 暴露端口
EXPOSE 8088
# 启动 jar包 可通过 PARAM 配置启动参数
ENTRYPOINT ["sh", "-c", "java $PARAM -jar app.jar"]
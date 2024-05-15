/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1：3307
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40)
 Source Host           : localhost:3307
 Source Schema         : v2nodeTest

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40)
 File Encoding         : 65001

 Date: 15/05/2024 16:55:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
                              `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                              `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
                              `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
                              `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
                              `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
                              `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
                              `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                              `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
                              `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
                              `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
                              `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
                              `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
                              `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
                              `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                              `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                              `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
                              `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                              `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                              `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'v2_server', '', NULL, NULL, 'V2Server', 'crud', '', 'com.ruoyi.system', 'system', 'server', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2024-05-10 08:45:20', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'v2_domain', '域名列表', NULL, NULL, 'V2Domain', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'domain', '域名列表', 'ruoyi', '0', '/', '{}', 'admin', '2024-05-11 01:34:32', '', '2024-05-11 01:36:27', NULL);
INSERT INTO `gen_table` VALUES (3, 'v2_dns', 'DNS', NULL, NULL, 'V2Dns', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'dns', 'DNS信息', 'ruoyi', '0', '/', '{}', 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:28', NULL);
INSERT INTO `gen_table` VALUES (4, 'v2_file_template', '文件模板', NULL, NULL, 'V2FileTemplate', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'template', '文件模板', 'ruoyi', '0', '/', '{}', 'admin', '2024-05-13 08:01:26', '', '2024-05-13 08:02:01', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
                                     `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                     `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
                                     `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
                                     `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
                                     `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
                                     `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
                                     `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
                                     `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
                                     `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
                                     `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
                                     `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                     `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                     `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
                                     `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
                                     `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                     `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                     `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                     `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
                                     `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                     `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                     `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                     `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                     PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '', 'int(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-10 08:45:20', '', '2024-05-13 08:34:18');
INSERT INTO `gen_table_column` VALUES (2, 1, 'ip', 'ip', 'varchar(255)', 'String', 'ip', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-05-10 08:45:20', '', '2024-05-13 08:34:18');
INSERT INTO `gen_table_column` VALUES (3, 1, 'port', 'port', 'varchar(255)', 'String', 'port', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-05-10 08:45:20', '', '2024-05-13 08:34:18');
INSERT INTO `gen_table_column` VALUES (4, 1, 'user', 'user', 'varchar(255)', 'String', 'user', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-05-10 08:45:20', '', '2024-05-13 08:34:18');
INSERT INTO `gen_table_column` VALUES (5, 1, 'passwd', 'passwd', 'varchar(255)', 'String', 'passwd', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-05-10 08:45:20', '', '2024-05-13 08:34:18');
INSERT INTO `gen_table_column` VALUES (6, 1, 'node_id', 'nodeId', 'int(11)', 'Long', 'nodeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-05-10 08:45:20', '', '2024-05-13 08:34:18');
INSERT INTO `gen_table_column` VALUES (7, 2, 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-11 01:34:32', '', '2024-05-11 01:36:27');
INSERT INTO `gen_table_column` VALUES (8, 2, 'domain_id', 'cf id', 'varchar(255)', 'String', 'domainId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-05-11 01:34:32', '', '2024-05-11 01:36:27');
INSERT INTO `gen_table_column` VALUES (9, 2, 'name', 'name', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-05-11 01:34:32', '', '2024-05-11 01:36:27');
INSERT INTO `gen_table_column` VALUES (10, 2, 'status', '状态', 'varchar(255)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2024-05-11 01:34:32', '', '2024-05-11 01:36:27');
INSERT INTO `gen_table_column` VALUES (11, 2, 'type', NULL, 'varchar(255)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2024-05-11 01:34:32', '', '2024-05-11 01:36:27');
INSERT INTO `gen_table_column` VALUES (12, 3, 'id', NULL, 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:28');
INSERT INTO `gen_table_column` VALUES (13, 3, 'zone_id', NULL, 'varchar(255)', 'String', 'zoneId', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 2, 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:28');
INSERT INTO `gen_table_column` VALUES (14, 3, 'zone_name', '域名', 'varchar(255)', 'String', 'zoneName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:28');
INSERT INTO `gen_table_column` VALUES (15, 3, 'name', 'DNS名称', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:28');
INSERT INTO `gen_table_column` VALUES (16, 3, 'type', '类型', 'varchar(255)', 'String', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:28');
INSERT INTO `gen_table_column` VALUES (17, 3, 'content', '解析目标', 'varchar(255)', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 6, 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:28');
INSERT INTO `gen_table_column` VALUES (18, 3, 'proxiable', NULL, 'varchar(255)', 'String', 'proxiable', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 7, 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:29');
INSERT INTO `gen_table_column` VALUES (19, 3, 'proxied', '是否代理', 'varchar(255)', 'String', 'proxied', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:29');
INSERT INTO `gen_table_column` VALUES (20, 3, 'ttl', NULL, 'int(11)', 'Long', 'ttl', '0', '0', '0', '1', '0', '0', '0', 'EQ', 'input', '', 9, 'admin', '2024-05-11 02:31:44', '', '2024-05-11 02:34:29');
INSERT INTO `gen_table_column` VALUES (21, 4, 'id', NULL, 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-13 08:01:26', '', '2024-05-13 08:02:01');
INSERT INTO `gen_table_column` VALUES (22, 4, 'content', NULL, 'text', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 2, 'admin', '2024-05-13 08:01:26', '', '2024-05-13 08:02:01');
INSERT INTO `gen_table_column` VALUES (23, 4, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2024-05-13 08:01:26', '', '2024-05-13 08:02:01');
INSERT INTO `gen_table_column` VALUES (24, 1, 'file_path', '配置文件地址', 'varchar(255)', 'String', 'filePath', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2024-05-13 08:34:14', '', '2024-05-13 08:34:18');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
                               `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                               `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
                               `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
                               `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
                               `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                               `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-10 06:49:47', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-10 06:49:47', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-10 06:49:47', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-05-10 06:49:47', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-10 06:49:47', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-05-10 06:49:47', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (100, 'cloudflare api key', 'cfkey', '您的CFkey', 'Y', 'admin', '2024-05-11 01:50:18', '', NULL, NULL);
INSERT INTO `sys_config` VALUES (101, 'XrayRScript', 'XrayRScript', 'wget -N https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh && bash install.sh', 'Y', 'admin', '2024-05-13 03:35:33', '', NULL, NULL);
INSERT INTO `sys_config` VALUES (102, 'cf email', 'cfEmail', '您的CF邮箱', 'Y', 'admin', '2024-05-14 08:46:12', '', NULL, NULL);
INSERT INTO `sys_config` VALUES (103, 'V2BoardApiHost', 'v2BoardApiHost', '您v2board 面板地址', 'Y', 'admin', '2024-05-14 08:48:04', 'admin', '2024-05-14 08:49:26', NULL);
INSERT INTO `sys_config` VALUES (104, 'V2BoardApiKey', 'V2BoardApiKey', 'v2board面板key', 'Y', 'admin', '2024-05-14 08:49:06', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
                             `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
                             `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
                             `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
                             `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
                             `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
                             `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
                             `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
                             `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
                                  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
                                  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
                                  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
                                  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
                                  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
                                  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
                                  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`dict_id`) USING BTREE,
                                  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-10 06:49:47', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
                            `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                            `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
                            `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                            `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
                            `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
                            `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                            `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                            `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                            `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                            `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                            `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
                            PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-05-10 06:49:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-05-10 06:49:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-05-10 06:49:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
                                `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                                `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
                                `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
                                `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
                                `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
                                `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                                `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
                                   `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                   `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
                                   `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
                                   `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
                                   `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
                                   `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
                                   `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                   `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
                                   `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
                                   PRIMARY KEY (`info_id`) USING BTREE,
                                   INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
                                   INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-13 01:02:39');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-13 03:14:31');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-13 08:01:06');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-05-14 02:26:11');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-14 02:26:14');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-14 06:37:19');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-14 08:27:22');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-15 00:59:49');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-15 03:49:00');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-15 06:39:56');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
                             `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                             `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
                             `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
                             `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
                             `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
                             `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
                             `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
                             `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
                             `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
                             `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                             `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
                             `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
                             `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
                             PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2028 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-05-10 06:49:46', 'admin', '2024-05-15 07:23:46', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-05-10 06:49:46', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-05-10 06:49:46', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-05-10 06:49:46', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-05-10 06:49:46', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-05-10 06:49:46', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-05-10 06:49:46', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-05-10 06:49:46', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-05-10 06:49:46', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-05-10 06:49:46', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-05-10 06:49:46', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-05-10 06:49:46', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-05-10 06:49:46', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-05-10 06:49:46', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-05-10 06:49:46', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-05-10 06:49:46', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-05-10 06:49:46', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-05-10 06:49:46', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-05-10 06:49:46', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-05-10 06:49:46', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-05-10 06:49:46', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-05-10 06:49:46', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-05-10 06:49:46', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '服务器列表', 2006, 1, 'server', 'system/server/index', NULL, 1, 0, 'C', '0', '0', 'system:server:list', 'list', 'admin', '2024-05-10 08:48:24', 'admin', '2024-05-15 07:19:09', '【请填写功能名称】菜单');
INSERT INTO `sys_menu` VALUES (2001, '服务器查询', 2000, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:server:query', '#', 'admin', '2024-05-10 08:48:24', 'admin', '2024-05-15 07:18:30', '');
INSERT INTO `sys_menu` VALUES (2002, '服务器新增', 2000, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:server:add', '#', 'admin', '2024-05-10 08:48:24', 'admin', '2024-05-15 07:18:34', '');
INSERT INTO `sys_menu` VALUES (2003, '服务器修改', 2000, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:server:edit', '#', 'admin', '2024-05-10 08:48:24', 'admin', '2024-05-15 07:18:38', '');
INSERT INTO `sys_menu` VALUES (2004, '服务器删除', 2000, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:server:remove', '#', 'admin', '2024-05-10 08:48:24', 'admin', '2024-05-15 07:18:43', '');
INSERT INTO `sys_menu` VALUES (2005, '服务器导出', 2000, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:server:export', '#', 'admin', '2024-05-10 08:48:24', 'admin', '2024-05-15 07:18:47', '');
INSERT INTO `sys_menu` VALUES (2006, '服务器', 0, 1, 'server', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'dashboard', 'admin', '2024-05-11 01:22:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '域名', 0, 1, 'domain', NULL, NULL, 1, 0, 'M', '0', '0', '', 'international', 'admin', '2024-05-11 01:29:17', 'admin', '2024-05-15 07:19:40', '');
INSERT INTO `sys_menu` VALUES (2009, '域名列表', 2007, 1, 'domain', 'system/domain/index', NULL, 1, 0, 'C', '0', '0', 'system:domain:list', 'list', 'admin', '2024-05-11 01:36:52', 'admin', '2024-05-15 07:19:54', '域名列表菜单');
INSERT INTO `sys_menu` VALUES (2010, '域名列表查询', 2009, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:query', '#', 'admin', '2024-05-11 01:36:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '域名列表同步', 2009, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:sync', '#', 'admin', '2024-05-11 01:36:52', 'admin', '2024-05-11 01:49:33', '');
INSERT INTO `sys_menu` VALUES (2012, '域名列表修改', 2009, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:edit', '#', 'admin', '2024-05-11 01:36:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '域名列表删除', 2009, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:remove', '#', 'admin', '2024-05-11 01:36:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '域名列表导出', 2009, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:domain:export', '#', 'admin', '2024-05-11 01:36:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, 'DNS信息', 2007, 1, 'dns', 'system/dns/index', NULL, 1, 0, 'C', '0', '0', 'system:dns:list', 'tree', 'admin', '2024-05-11 02:32:39', 'admin', '2024-05-15 07:20:01', 'DNS信息菜单');
INSERT INTO `sys_menu` VALUES (2016, 'DNS信息查询', 2015, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dns:query', '#', 'admin', '2024-05-11 02:32:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, 'DNS信息新增', 2015, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dns:add', '#', 'admin', '2024-05-11 02:32:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, 'DNS信息修改', 2015, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dns:edit', '#', 'admin', '2024-05-11 02:32:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, 'DNS信息删除', 2015, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dns:remove', '#', 'admin', '2024-05-11 02:32:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, 'DNS信息导出', 2015, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dns:export', '#', 'admin', '2024-05-11 02:32:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '同步DNS', 2015, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:dns:sync', '#', 'admin', '2024-05-11 02:37:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '文件模板', 2006, 1, 'template', 'system/template/index', NULL, 1, 0, 'C', '0', '0', 'system:template:list', 'documentation', 'admin', '2024-05-13 08:02:28', 'admin', '2024-05-15 07:19:16', '文件模板菜单');
INSERT INTO `sys_menu` VALUES (2023, '文件模板查询', 2022, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:query', '#', 'admin', '2024-05-13 08:02:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '文件模板新增', 2022, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:add', '#', 'admin', '2024-05-13 08:02:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '文件模板修改', 2022, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:edit', '#', 'admin', '2024-05-13 08:02:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '文件模板删除', 2022, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:remove', '#', 'admin', '2024-05-13 08:02:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '文件模板导出', 2022, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:template:export', '#', 'admin', '2024-05-13 08:02:28', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
                               `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                               `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
                               `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
                               `notice_content` longblob NULL COMMENT '公告内容',
                               `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                               `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-05-10 06:49:47', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-05-10 06:49:47', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
                                 `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                 `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
                                 `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                 `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
                                 `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
                                 `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                 `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
                                 `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
                                 `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
                                 `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
                                 `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
                                 `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
                                 `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
                                 `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
                                 `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
                                 `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
                                 `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
                                 PRIMARY KEY (`oper_id`) USING BTREE,
                                 INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
                                 INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
                                 INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '总部公司', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"v2_server\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 08:45:20', 96);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '总部公司', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"v2_server\"}', NULL, 0, NULL, '2024-05-10 08:45:22', 254);
INSERT INTO `sys_oper_log` VALUES (102, '【请填写功能名称】', 1, 'com.ruoyi.system.controller.V2ServerController.add()', 'POST', 1, 'admin', '总部公司', '/system/server', '127.0.0.1', '内网IP', '{\"id\":1,\"ip\":\"45.66.128.208\",\"params\":{},\"passwd\":\"CpN734X2fP8z1VdzjK\",\"port\":\"22\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 09:18:40', 78);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/server/index\",\"createTime\":\"2024-05-10 08:48:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"服务器列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"server\",\"perms\":\"system:server:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:21:59', 34);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"服务器\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"server\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:22:32', 14);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/server/index\",\"createTime\":\"2024-05-10 08:48:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"服务器列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"server\",\"perms\":\"system:server:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:22:43', 20);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"域名\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"domain\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:29:17', 11);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-11 01:29:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"域名\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"domain\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:29:23', 11);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"域名列表\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"domainList\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:30:01', 11);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/domainList/index\",\"createTime\":\"2024-05-11 01:30:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"域名列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"domainList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:30:22', 11);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '总部公司', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"v2_domain\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:34:32', 72);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '总部公司', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"v2_server\"}', NULL, 0, NULL, '2024-05-11 01:34:35', 216);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '总部公司', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"domain\",\"className\":\"V2Domain\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":7,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 01:34:32\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DomainId\",\"columnComment\":\"cf id\",\"columnId\":8,\"columnName\":\"domain_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 01:34:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"domainId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"name\",\"columnId\":9,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 01:34:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态\",\"columnId\":10,\"columnName\":\"status\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 01:34:32\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"String\",\"list', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:36:27', 38);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '总部公司', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"v2_domain\"}', NULL, 0, NULL, '2024-05-11 01:36:31', 90);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/domain/index\",\"createTime\":\"2024-05-11 01:30:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"域名列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"domainList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:46:25', 27);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '总部公司', '/system/menu/2008', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:49:11', 15);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/domain/index\",\"createTime\":\"2024-05-11 01:36:52\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"域名列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"domain\",\"perms\":\"system:domain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:49:20', 10);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-11 01:36:52\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"域名列表同步\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"path\":\"#\",\"perms\":\"system:domain:sync\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:49:33', 21);
INSERT INTO `sys_oper_log` VALUES (118, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '总部公司', '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"cfkey\",\"configName\":\"cloudflare api key\",\"configType\":\"Y\",\"configValue\":\"SWvBvT8jS-exFQhmAbCBjRGbjIIvt8dKbTHQEm27\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 01:50:18', 27);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '总部公司', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"v2_dns\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 02:31:44', 104);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '总部公司', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dns\",\"className\":\"V2Dns\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":12,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 02:31:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ZoneId\",\"columnId\":13,\"columnName\":\"zone_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 02:31:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zoneId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ZoneName\",\"columnId\":14,\"columnName\":\"zone_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 02:31:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zoneName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnId\":15,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 02:31:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 02:32:05', 63);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '总部公司', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"v2_dns\"}', NULL, 0, NULL, '2024-05-11 02:32:08', 217);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '总部公司', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dns\",\"className\":\"V2Dns\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":12,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 02:31:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-05-11 02:32:05\",\"usableColumn\":false},{\"capJavaField\":\"ZoneId\",\"columnId\":13,\"columnName\":\"zone_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 02:31:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"zoneId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-05-11 02:32:05\",\"usableColumn\":false},{\"capJavaField\":\"ZoneName\",\"columnComment\":\"域名\",\"columnId\":14,\"columnName\":\"zone_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 02:31:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"zoneName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-05-11 02:32:05\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"DNS名称\",\"columnId\":15,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-11 02:31:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isP', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 02:34:29', 60);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '总部公司', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"v2_dns\"}', NULL, 0, NULL, '2024-05-11 02:34:31', 79);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dns/index\",\"createTime\":\"2024-05-11 02:32:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"DNS信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"dns\",\"perms\":\"system:dns:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 02:36:38', 29);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '总部公司', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"同步DNS\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2015,\"perms\":\"system:dns:sync\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 02:37:01', 13);
INSERT INTO `sys_oper_log` VALUES (126, 'DNS信息', 1, 'com.ruoyi.system.controller.V2DnsController.add()', 'POST', 1, 'admin', '总部公司', '/system/dns', '127.0.0.1', '内网IP', '{\"content\":\"45.66.128.208\",\"name\":\"b6bd1e8dacc34716ba0b9a7999b045b8\",\"params\":{},\"proxied\":\"true\",\"ttl\":3600,\"type\":\"A\",\"zone_name\":\"videoproz.icu\"}', NULL, 0, NULL, '2024-05-11 07:52:52', 659);
INSERT INTO `sys_oper_log` VALUES (127, 'DNS信息', 1, 'com.ruoyi.system.controller.V2DnsController.add()', 'POST', 1, 'admin', '总部公司', '/system/dns', '127.0.0.1', '内网IP', '{\"content\":\"45.66.128.208\",\"name\":\"1135880201ae4735a2895a3cd00e0169\",\"params\":{},\"proxied\":\"true\",\"ttl\":3600,\"type\":\"A\",\"zone_name\":\"hostacg.com\"}', NULL, 0, NULL, '2024-05-11 07:53:32', 204);
INSERT INTO `sys_oper_log` VALUES (128, 'DNS信息', 1, 'com.ruoyi.system.controller.V2DnsController.add()', 'POST', 1, 'admin', '总部公司', '/system/dns', '127.0.0.1', '内网IP', '{\"content\":\"45.66.128.208\",\"name\":\"d5a20583dab544d196af72134f4bd051\",\"params\":{},\"proxied\":\"true\",\"ttl\":3600,\"type\":\"A\",\"zone_id\":\"524ee5074daeaf70e0787c25dbdb1194\",\"zone_name\":\"hostacg.com\"}', NULL, 0, NULL, '2024-05-11 07:56:49', 386);
INSERT INTO `sys_oper_log` VALUES (129, 'DNS信息', 1, 'com.ruoyi.system.controller.V2DnsController.add()', 'POST', 1, 'admin', '总部公司', '/system/dns', '127.0.0.1', '内网IP', '{\"content\":\"45.66.128.208\",\"name\":\"c330f7328f2b454b8f7ae5ef9f9e1199\",\"params\":{},\"proxied\":\"true\",\"ttl\":3600,\"type\":\"A\",\"zone_id\":\"1c84979fd9e8451d8df5fd061a851d81\",\"zone_name\":\"videoproz.icu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:02:34', 3010);
INSERT INTO `sys_oper_log` VALUES (130, 'DNS信息', 2, 'com.ruoyi.system.controller.V2DnsController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/dns', '127.0.0.1', '内网IP', '{\"content\":\"45.66.128.208\",\"id\":\"9830d734d77fbe041df22e4df489beb9\",\"name\":\"c330f7328f2b454b8f7ae5ef9f9e1199.videoproz.icu\",\"params\":{},\"proxiable\":\"true\",\"proxied\":\"false\",\"ttl\":1,\"type\":\"A\",\"zone_id\":\"1c84979fd9e8451d8df5fd061a851d81\",\"zone_name\":\"videoproz.icu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:41:04', 1508);
INSERT INTO `sys_oper_log` VALUES (131, 'DNS信息', 2, 'com.ruoyi.system.controller.V2DnsController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/dns', '127.0.0.1', '内网IP', '{\"content\":\"45.66.128.208\",\"id\":\"9830d734d77fbe041df22e4df489beb9\",\"name\":\"c330f7328f2b454b8f7ae5ef9f9e1199.videoproz.icu\",\"params\":{},\"proxiable\":\"true\",\"proxied\":\"true\",\"ttl\":1,\"type\":\"A\",\"zone_id\":\"1c84979fd9e8451d8df5fd061a851d81\",\"zone_name\":\"videoproz.icu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:41:14', 999);
INSERT INTO `sys_oper_log` VALUES (132, 'DNS信息', 2, 'com.ruoyi.system.controller.V2DnsController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/dns', '127.0.0.1', '内网IP', '{\"content\":\"45.66.128.208\",\"id\":\"9830d734d77fbe041df22e4df489beb9\",\"name\":\"a03af7fbfb044692bfdec0988cbeb450\",\"params\":{},\"proxiable\":\"true\",\"proxied\":\"true\",\"ttl\":1,\"type\":\"A\",\"zone_id\":\"1c84979fd9e8451d8df5fd061a851d81\",\"zone_name\":\"videoproz.icu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:46:07', 779);
INSERT INTO `sys_oper_log` VALUES (133, 'DNS信息', 2, 'com.ruoyi.system.controller.V2DnsController.edit()', 'PUT', 1, 'admin', '总部公司', '/system/dns', '127.0.0.1', '内网IP', '{\"content\":\"45.66.128.208\",\"id\":\"9830d734d77fbe041df22e4df489beb9\",\"name\":\"b2dc8b13acb846e797510d0e96c345f5\",\"params\":{},\"proxiable\":\"true\",\"proxied\":\"true\",\"ttl\":1,\"type\":\"A\",\"zone_id\":\"1c84979fd9e8451d8df5fd061a851d81\",\"zone_name\":\"videoproz.icu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:46:18', 1082);
INSERT INTO `sys_oper_log` VALUES (134, 'DNS信息', 3, 'com.ruoyi.system.controller.V2DnsController.remove()', 'DELETE', 1, 'admin', '总部公司', '/system/dns/9830d734d77fbe041df22e4df489beb9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:01:06', 1686);
INSERT INTO `sys_oper_log` VALUES (135, 'DNS信息', 3, 'com.ruoyi.system.controller.V2DnsController.remove()', 'DELETE', 1, 'admin', '总部公司', '/system/dns/9830d734d77fbe041df22e4df489beb9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"{\\\"result\\\":null,\\\"success\\\":false,\\\"errors\\\":[{\\\"code\\\":81044,\\\"message\\\":\\\"Record does not exist.\\\"}],\\\"messages\\\":[]}\",\"code\":500}', 0, NULL, '2024-05-11 09:02:02', 903);
INSERT INTO `sys_oper_log` VALUES (136, 'DNS信息', 3, 'com.ruoyi.system.controller.V2DnsController.remove()', 'DELETE', 1, 'admin', '总部公司', '/system/dns/9830d734d77fbe041df22e4df489beb9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"{\\\"result\\\":null,\\\"success\\\":false,\\\"errors\\\":[{\\\"code\\\":81044,\\\"message\\\":\\\"Record does not exist.\\\"}],\\\"messages\\\":[]}\",\"code\":500}', 0, NULL, '2024-05-11 09:15:27', 1326);
INSERT INTO `sys_oper_log` VALUES (137, '【请填写功能名称】', 2, 'com.ruoyi.system.controller.V2ServerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/server', '127.0.0.1', '内网IP', '{\"id\":1,\"ip\":\"45.66.128.208\",\"params\":{},\"passwd\":\"BeFU9C2A55a6bnRjp2\",\"port\":\"22\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 03:25:47', 16);
INSERT INTO `sys_oper_log` VALUES (138, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"XrayRScript\",\"configName\":\"XrayRScript\",\"configType\":\"Y\",\"configValue\":\"wget -N https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh && bash install.sh\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 03:35:33', 33);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"v2_file_template\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:01:26', 106);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"template\",\"className\":\"V2FileTemplate\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-13 08:01:26\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnId\":22,\"columnName\":\"content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-05-13 08:01:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Remark\",\"columnComment\":\"备注\",\"columnId\":23,\"columnName\":\"remark\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-05-13 08:01:26\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"remark\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":true}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"文件模板\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"文件模板\",\"tableId\":4,\"tableName\":\"v2_file_template\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:02:01', 86);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"v2_file_template\"}', NULL, 0, NULL, '2024-05-13 08:02:04', 257);
INSERT INTO `sys_oper_log` VALUES (142, '文件模板', 1, 'com.ruoyi.system.controller.V2FileTemplateController.add()', 'POST', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"{}\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:26:27', 66);
INSERT INTO `sys_oper_log` VALUES (143, '文件模板', 2, 'com.ruoyi.system.controller.V2FileTemplateController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"Log:  Level: none # Log level: none, error, warning, info, debug   AccessPath: # /etc/XrayR/access.Log  ErrorPath: # /etc/XrayR/error.logDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for helpRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for helpOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for helpConnetionConfig:  Handshake: 4 # Handshake time limit, Second  ConnIdle: 30 # Connection idle time limit, Second  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second  BufferSize: 64 # The internal cache size of each connection, kB Nodes:  -    PanelType: \\\"V2board\\\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel    ApiConfig:      ApiHost: \\\"http://hostacg.com\\\"      ApiKey: \\\"hskdhgxkcjgdsdfsfzx\\\"      NodeID: 7      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin      Timeout: 30 # Timeout for the api request      EnableVless: false # Enable Vless for V2ray Type      EnableXTLS: false # Enable XTLS for V2ray and Trojan      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable      RuleListPath: # ./rulelist Path to local rulelist file    ControllerConfig:      ListenIP: 0.0.0.0 # IP address you want to listen      SendIP: 0.0.0.0 # IP address you want to send pacakage      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy      EnableProxyProtocol: false # Only works for WebSocket and TCP      EnableFallback: fa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:30:46', 19);
INSERT INTO `sys_oper_log` VALUES (144, '文件模板', 2, 'com.ruoyi.system.controller.V2FileTemplateController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"Log:\\n  Level: none # Log level: none, error, warning, info, debug \\n  AccessPath: # /etc/XrayR/access.Log\\n  ErrorPath: # /etc/XrayR/error.log\\nDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for help\\nRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for help\\nOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for help\\nConnetionConfig:\\n  Handshake: 4 # Handshake time limit, Second\\n  ConnIdle: 30 # Connection idle time limit, Second\\n  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second\\n  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second\\n  BufferSize: 64 # The internal cache size of each connection, kB \\nNodes:\\n  -\\n    PanelType: \\\"V2board\\\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel\\n    ApiConfig:\\n      ApiHost: \\\"http://hostacg.com\\\"\\n      ApiKey: \\\"hskdhgxkcjgdsdfsfzx\\\"\\n      NodeID: 7\\n      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin\\n      Timeout: 30 # Timeout for the api request\\n      EnableVless: false # Enable Vless for V2ray Type\\n      EnableXTLS: false # Enable XTLS for V2ray and Trojan\\n      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable\\n      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable\\n      RuleListPath: # ./rulelist Path to local rulelist file\\n    ControllerConfig:\\n      ListenIP: 0.0.0.0 # IP address you want to listen\\n      SendIP: 0.0.0.0 # IP address you want to send pacakage\\n      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.\\n      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well\\n      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy\\n      EnableProxyProtocol', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:32:00', 8);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/v2_server', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:34:14', 72);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/v2_server', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:34:18', 39);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"v2_server\"}', NULL, 0, NULL, '2024-05-13 08:34:21', 91);
INSERT INTO `sys_oper_log` VALUES (148, '【请填写功能名称】', 2, 'com.ruoyi.system.controller.V2ServerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/server', '127.0.0.1', '内网IP', '{\"filePath\":\"/etc/XrayR/\",\"id\":1,\"ip\":\"45.66.128.208\",\"params\":{},\"passwd\":\"BeFU9C2A55a6bnRjp2\",\"port\":\"22\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:39:34', 24);
INSERT INTO `sys_oper_log` VALUES (149, '文件模板', 2, 'com.ruoyi.system.controller.V2FileTemplateController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"Log:  Level: none # Log level: none, error, warning, info, debug   AccessPath: # /etc/XrayR/access.Log  ErrorPath: # /etc/XrayR/error.logDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for helpRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for helpOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for helpConnetionConfig:  Handshake: 4 # Handshake time limit, Second  ConnIdle: 30 # Connection idle time limit, Second  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second  BufferSize: 64 # The internal cache size of each connection, kB Nodes:  -    PanelType: \\\"V2board\\\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel    ApiConfig:      ApiHost: \\\"http://hostacg.com\\\"      ApiKey: \\\"hskdhgxkcjgdsdfsfzx\\\"      NodeID: 7      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin      Timeout: 30 # Timeout for the api request      EnableVless: false # Enable Vless for V2ray Type      EnableXTLS: false # Enable XTLS for V2ray and Trojan      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable      RuleListPath: # ./rulelist Path to local rulelist file    ControllerConfig:      ListenIP: 0.0.0.0 # IP address you want to listen      SendIP: 0.0.0.0 # IP address you want to send pacakage      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy      EnableProxyProtocol: false # Only works for WebSocket and TCP      EnableFallback: fa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:43:23', 9);
INSERT INTO `sys_oper_log` VALUES (150, '文件模板', 2, 'com.ruoyi.system.controller.V2FileTemplateController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"Log:\\n  Level: none # Log level: none, error, warning, info, debug \\n  AccessPath: # /etc/XrayR/access.Log\\n  ErrorPath: # /etc/XrayR/error.log\\nDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for help\\nRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for help\\nOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for help\\nConnetionConfig:\\n  Handshake: 4 # Handshake time limit, Second\\n  ConnIdle: 30 # Connection idle time limit, Second\\n  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second\\n  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second\\n  BufferSize: 64 # The internal cache size of each connection, kB \\nNodes:\\n  -\\n    PanelType: \\\"V2board\\\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel\\n    ApiConfig:\\n      ApiHost: \\\"http://hostacg.com\\\"\\n      ApiKey: \\\"hskdhgxkcjgdsdfsfzx\\\"\\n      NodeID: 7\\n      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin\\n      Timeout: 30 # Timeout for the api request\\n      EnableVless: false # Enable Vless for V2ray Type\\n      EnableXTLS: false # Enable XTLS for V2ray and Trojan\\n      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable\\n      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable\\n      RuleListPath: # ./rulelist Path to local rulelist file\\n    ControllerConfig:\\n      ListenIP: 0.0.0.0 # IP address you want to listen\\n      SendIP: 0.0.0.0 # IP address you want to send pacakage\\n      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.\\n      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well\\n      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy\\n      EnableProxyProtocol', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:43:39', 8);
INSERT INTO `sys_oper_log` VALUES (151, '文件模板', 2, 'com.ruoyi.system.controller.V2FileTemplateController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"Log:  Level: none # Log level: none, error, warning, info, debug   AccessPath: # /etc/XrayR/access.Log  ErrorPath: # /etc/XrayR/error.logDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for helpRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for helpOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for helpConnetionConfig:  Handshake: 4 # Handshake time limit, Second  ConnIdle: 30 # Connection idle time limit, Second  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second  BufferSize: 64 # The internal cache size of each connection, kB Nodes:  -    PanelType: \\\"V2board\\\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel    ApiConfig:      ApiHost: \\\"http://hostacg.com\\\"      ApiKey: \\\"hskdhgxkcjgdsdfsfzx\\\"      NodeID: 7      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin      Timeout: 30 # Timeout for the api request      EnableVless: false # Enable Vless for V2ray Type      EnableXTLS: false # Enable XTLS for V2ray and Trojan      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable      RuleListPath: # ./rulelist Path to local rulelist file    ControllerConfig:      ListenIP: 0.0.0.0 # IP address you want to listen      SendIP: 0.0.0.0 # IP address you want to send pacakage      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy      EnableProxyProtocol: false # Only works for WebSocket and TCP      EnableFallback: fa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-13 08:43:43', 8);
INSERT INTO `sys_oper_log` VALUES (152, '文件模板', 2, 'com.ruoyi.system.controller.V2FileTemplateController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"Log:\\n  Level: none # Log level: none, error, warning, info, debug \\n  AccessPath: # /etc/XrayR/access.Log\\n  ErrorPath: # /etc/XrayR/error.log\\nDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for help\\nRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for help\\nOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for help\\nConnetionConfig:\\n  Handshake: 4 # Handshake time limit, Second\\n  ConnIdle: 30 # Connection idle time limit, Second\\n  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second\\n  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second\\n  BufferSize: 64 # The internal cache size of each connection, kB \\nNodes:\\n  -\\n    PanelType: \\\"V2board\\\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel\\n    ApiConfig:\\n      ApiHost: \\\"http://hostacg.com\\\"\\n      ApiKey: \\\"hskdhgxkcjgdsdfsfzx\\\"\\n      NodeID: 7\\n      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin\\n      Timeout: 30 # Timeout for the api request\\n      EnableVless: false # Enable Vless for V2ray Type\\n      EnableXTLS: false # Enable XTLS for V2ray and Trojan\\n      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable\\n      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable\\n      RuleListPath: # ./rulelist Path to local rulelist file\\n    ControllerConfig:\\n      ListenIP: 0.0.0.0 # IP address you want to listen\\n      SendIP: 0.0.0.0 # IP address you want to send pacakage\\n      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.\\n      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well\\n      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy\\n      EnableProxyProtocol', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 03:34:16', 9);
INSERT INTO `sys_oper_log` VALUES (153, '文件模板', 2, 'com.ruoyi.system.controller.V2FileTemplateController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"Log:\\n  Level: none # Log level: none, error, warning, info, debug \\n  AccessPath: # /etc/XrayR/access.Log\\n  ErrorPath: # /etc/XrayR/error.log\\nDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for help\\nRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for help\\nOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for help\\nConnetionConfig:\\n  Handshake: 4 # Handshake time limit, Second\\n  ConnIdle: 30 # Connection idle time limit, Second\\n  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second\\n  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second\\n  BufferSize: 64 # The internal cache size of each connection, kB \\nNodes:\\n  -\\n    PanelType: \\\"V2board\\\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel\\n    ApiConfig:\\n      ApiHost: \\\"http://hostacg.com\\\"\\n      ApiKey: \\\"hskdhgxkcjgdsdfsfzx\\\"\\n      NodeID: 7\\n      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin\\n      Timeout: 30 # Timeout for the api request\\n      EnableVless: false # Enable Vless for V2ray Type\\n      EnableXTLS: false # Enable XTLS for V2ray and Trojan\\n      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable\\n      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable\\n      RuleListPath: # ./rulelist Path to local rulelist file\\n    ControllerConfig:\\n      ListenIP: 0.0.0.0 # IP address you want to listen\\n      SendIP: 0.0.0.0 # IP address you want to send pacakage\\n      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.\\n      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well\\n      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy\\n      EnableProxyProtocol', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 06:37:27', 6);
INSERT INTO `sys_oper_log` VALUES (154, '文件模板', 2, 'com.ruoyi.system.controller.V2FileTemplateController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"Log:\\n  Level: none # Log level: none, error, warning, info, debug \\n  AccessPath: # /etc/XrayR/access.Log\\n  ErrorPath: # /etc/XrayR/error.log\\nDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for help\\nRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for help\\nOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for help\\nConnetionConfig:\\n  Handshake: 4 # Handshake time limit, Second\\n  ConnIdle: 30 # Connection idle time limit, Second\\n  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second\\n  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second\\n  BufferSize: 64 # The internal cache size of each connection, kB \\nNodes:\\n  -\\n    PanelType: \\\"V2board\\\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel\\n    ApiConfig:\\n      ApiHost: \\\"${apiHost}\\\"\\n      ApiKey: \\\"${apiKey}\\\"\\n      NodeID: ${nodeId}\\n      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin\\n      Timeout: 30 # Timeout for the api request\\n      EnableVless: false # Enable Vless for V2ray Type\\n      EnableXTLS: false # Enable XTLS for V2ray and Trojan\\n      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable\\n      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable\\n      RuleListPath: # ./rulelist Path to local rulelist file\\n    ControllerConfig:\\n      ListenIP: 0.0.0.0 # IP address you want to listen\\n      SendIP: 0.0.0.0 # IP address you want to send pacakage\\n      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.\\n      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well\\n      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy\\n      EnableProxyProtocol: false # ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 06:49:53', 15);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/template/index\",\"createTime\":\"2024-05-13 08:02:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"文件模板\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"template\",\"perms\":\"system:template:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 06:50:22', 17);
INSERT INTO `sys_oper_log` VALUES (156, '【请填写功能名称】', 2, 'com.ruoyi.system.controller.V2ServerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/server', '127.0.0.1', '内网IP', '{\"filePath\":\"/etc/XrayR/config.yml\",\"id\":1,\"ip\":\"45.66.128.208\",\"params\":{},\"passwd\":\"BeFU9C2A55a6bnRjp2\",\"port\":\"22\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 06:54:33', 24);
INSERT INTO `sys_oper_log` VALUES (157, '【请填写功能名称】', 2, 'com.ruoyi.system.controller.V2ServerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/server', '127.0.0.1', '内网IP', '{\"filePath\":\"/etc/XrayR/config.yml\",\"id\":1,\"ip\":\"119.255.98.129\",\"params\":{},\"passwd\":\"Iloveyou520..\",\"port\":\"22\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 06:55:50', 5);
INSERT INTO `sys_oper_log` VALUES (158, '【请填写功能名称】', 2, 'com.ruoyi.system.controller.V2ServerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/server', '127.0.0.1', '内网IP', '{\"filePath\":\"/etc/XrayR/config.yml\",\"id\":1,\"ip\":\"199.255.98.129\",\"params\":{},\"passwd\":\"Iloveyou520..\",\"port\":\"22\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 06:56:28', 6);
INSERT INTO `sys_oper_log` VALUES (159, '【请填写功能名称】', 2, 'com.ruoyi.system.controller.V2ServerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/server', '127.0.0.1', '内网IP', '{\"filePath\":\"/etc/XrayR/config.yml\",\"id\":1,\"ip\":\"142.171.114.18\",\"params\":{},\"passwd\":\"wkOB51Wjy2\",\"port\":\"22\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 07:02:43', 7);
INSERT INTO `sys_oper_log` VALUES (160, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"cfEmail\",\"configName\":\"cf email\",\"configType\":\"Y\",\"configValue\":\"75903649@qq.com\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 08:46:12', 28);
INSERT INTO `sys_oper_log` VALUES (161, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"v2BoardHost\",\"configName\":\"V2Board host\",\"configType\":\"Y\",\"configValue\":\"www.hostacg.com\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 08:48:04', 26);
INSERT INTO `sys_oper_log` VALUES (162, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"V2BoardApiKey\",\"configName\":\"V2BoardApiKey\",\"configType\":\"Y\",\"configValue\":\"hskdhgxkcjgdsdfsfzx\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 08:49:06', 11);
INSERT INTO `sys_oper_log` VALUES (163, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":103,\"configKey\":\"v2BoardApiHost\",\"configName\":\"V2BoardApiHost\",\"configType\":\"Y\",\"configValue\":\"http://hostacg.com\",\"createBy\":\"admin\",\"createTime\":\"2024-05-14 08:48:04\",\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 08:49:26', 19);
INSERT INTO `sys_oper_log` VALUES (164, '【请填写功能名称】', 2, 'com.ruoyi.system.controller.V2ServerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/server', '127.0.0.1', '内网IP', '{\"filePath\":\"/etc/XrayR/config.yml\",\"id\":1,\"ip\":\"142.171.114.18\",\"nodeId\":7,\"params\":{},\"passwd\":\"wkOB51Wjy2\",\"port\":\"22\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 09:01:42', 18);
INSERT INTO `sys_oper_log` VALUES (165, 'DNS信息', 1, 'com.ruoyi.system.controller.V2DnsController.add()', 'POST', 1, 'admin', '研发部门', '/system/dns', '127.0.0.1', '内网IP', '{\"content\":\"142.171.114.18\",\"name\":\"d236f079c83f45aea4d1559f8cf51249\",\"params\":{},\"proxied\":\"true\",\"ttl\":3600,\"type\":\"A\",\"zone_id\":\"1c84979fd9e8451d8df5fd061a851d81\",\"zone_name\":\"videoproz.icu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 09:02:13', 1205);
INSERT INTO `sys_oper_log` VALUES (166, '【请填写功能名称】', 2, 'com.ruoyi.system.controller.V2ServerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/server', '127.0.0.1', '内网IP', '{\"filePath\":\"/etc/XrayR/config.yml\",\"id\":1,\"ip\":\"142.171.114.18\",\"nodeId\":21,\"params\":{},\"passwd\":\"wkOB51Wjy2\",\"port\":\"22\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 09:41:53', 15);
INSERT INTO `sys_oper_log` VALUES (167, '【请填写功能名称】', 2, 'com.ruoyi.system.controller.V2ServerController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/server', '127.0.0.1', '内网IP', '{\"filePath\":\"/etc/XrayR/config.yml\",\"id\":1,\"ip\":\"142.171.114.18\",\"nodeId\":21,\"params\":{},\"passwd\":\"wkOB51Wjy2\",\"port\":\"22\",\"remark\":\"测试\",\"user\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 02:15:09', 16);
INSERT INTO `sys_oper_log` VALUES (168, 'DNS信息', 3, 'com.ruoyi.system.controller.V2DnsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dns/296581e8d77dc11a36fcd7282ab70169', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"{\\\"result\\\":{\\\"id\\\":\\\"296581e8d77dc11a36fcd7282ab70169\\\"},\\\"success\\\":true,\\\"errors\\\":[],\\\"messages\\\":[]}\",\"code\":200}', 0, NULL, '2024-05-15 07:07:32', 728);
INSERT INTO `sys_oper_log` VALUES (169, 'DNS信息', 3, 'com.ruoyi.system.controller.V2DnsController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dns/2602ce2a5cf4181907ff6d41f3095126', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"{\\\"result\\\":{\\\"id\\\":\\\"2602ce2a5cf4181907ff6d41f3095126\\\"},\\\"success\\\":true,\\\"errors\\\":[],\\\"messages\\\":[]}\",\"code\":200}', 0, NULL, '2024-05-15 07:07:36', 591);
INSERT INTO `sys_oper_log` VALUES (170, '文件模板', 2, 'com.ruoyi.system.controller.V2FileTemplateController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/template', '127.0.0.1', '内网IP', '{\"content\":\"Log:\\n  Level: none # Log level: none, error, warning, info, debug \\n  AccessPath: # /etc/XrayR/access.Log\\n  ErrorPath: # /etc/XrayR/error.log\\nDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for help\\nRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for help\\nOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for help\\nConnetionConfig:\\n  Handshake: 4 # Handshake time limit, Second\\n  ConnIdle: 30 # Connection idle time limit, Second\\n  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second\\n  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second\\n  BufferSize: 64 # The internal cache size of each connection, kB \\nNodes:\\n  -\\n    PanelType: \\\"V2board\\\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel\\n    ApiConfig:\\n      ApiHost: \\\"${apiHost}\\\"\\n      ApiKey: \\\"${apiKey}\\\"\\n      NodeID: ${nodeId}\\n      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin\\n      Timeout: 30 # Timeout for the api request\\n      EnableVless: false # Enable Vless for V2ray Type\\n      EnableXTLS: false # Enable XTLS for V2ray and Trojan\\n      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable\\n      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable\\n      RuleListPath: # ./rulelist Path to local rulelist file\\n    ControllerConfig:\\n      ListenIP: 0.0.0.0 # IP address you want to listen\\n      SendIP: 0.0.0.0 # IP address you want to send pacakage\\n      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.\\n      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well\\n      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy\\n      EnableProxyProtocol: false # ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:16:19', 19);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-10 08:48:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"服务器查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"system:server:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:18:30', 18);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-10 08:48:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"服务器新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"system:server:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:18:34', 11);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-10 08:48:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"服务器修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"system:server:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:18:38', 10);
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-10 08:48:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"服务器删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"system:server:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:18:43', 9);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-05-10 08:48:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"服务器导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"#\",\"perms\":\"system:server:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:18:47', 10);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/server/index\",\"createTime\":\"2024-05-10 08:48:24\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"服务器列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"server\",\"perms\":\"system:server:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:19:09', 8);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/template/index\",\"createTime\":\"2024-05-13 08:02:28\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"文件模板\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"template\",\"perms\":\"system:template:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:19:16', 9);
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-11 01:29:17\",\"icon\":\"international\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"域名\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"domain\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:19:40', 15);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/domain/index\",\"createTime\":\"2024-05-11 01:36:52\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"域名列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"domain\",\"perms\":\"system:domain:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:19:54', 14);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dns/index\",\"createTime\":\"2024-05-11 02:32:39\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"DNS信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"dns\",\"perms\":\"system:dns:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:20:01', 10);
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:20:47', 34);
INSERT INTO `sys_oper_log` VALUES (182, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:21:04', 220);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-05-10 06:49:46\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-15 07:23:46', 9);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
                             `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                             `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
                             `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
                             `post_sort` int(4) NOT NULL COMMENT '显示顺序',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-10 06:49:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-10 06:49:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
                             `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                             `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
                             `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
                             `role_sort` int(4) NOT NULL COMMENT '显示顺序',
                             `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                             `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
                             `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-05-10 06:49:46', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
                                  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
                                  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
                             `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                             `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
                             `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
                             `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
                             `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
                             `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
                             `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
                             `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                             `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
                             `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
                             `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$Meydo61qP08AwMmouS3HI.NYYeQYF5IPVDXbM/6VGIb4Yk3kXAx06', '0', '0', '127.0.0.1', '2024-05-15 14:39:57', 'admin', '2024-05-10 06:49:46', '', '2024-05-15 06:39:56', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2024-05-10 06:49:46', 'admin', '2024-05-10 06:49:46', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
                                  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
                                  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
                                  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for v2_dns
-- ----------------------------
DROP TABLE IF EXISTS `v2_dns`;
CREATE TABLE `v2_dns`  (
                           `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                           `zone_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `zone_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `proxiable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `proxied` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                           `ttl` int(11) NULL DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'DNS' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of v2_dns
-- ----------------------------

-- ----------------------------
-- Table structure for v2_domain
-- ----------------------------
DROP TABLE IF EXISTS `v2_domain`;
CREATE TABLE `v2_domain`  (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `domain_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cf id',
                              `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'name',
                              `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
                              `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of v2_domain
-- ----------------------------

-- ----------------------------
-- Table structure for v2_file_template
-- ----------------------------
DROP TABLE IF EXISTS `v2_file_template`;
CREATE TABLE `v2_file_template`  (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
                                     `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                     `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of v2_file_template
-- ----------------------------
INSERT INTO `v2_file_template` VALUES (1, 'Log:\n  Level: none # Log level: none, error, warning, info, debug \n  AccessPath: # /etc/XrayR/access.Log\n  ErrorPath: # /etc/XrayR/error.log\nDnsConfigPath: # /etc/XrayR/http.json # Path to http config, check https://xtls.github.io/config/base/http/ for help\nRouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/base/route/ for help\nOutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/base/outbound/ for help\nConnetionConfig:\n  Handshake: 4 # Handshake time limit, Second\n  ConnIdle: 30 # Connection idle time limit, Second\n  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second\n  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second\n  BufferSize: 64 # The internal cache size of each connection, kB \nNodes:\n  -\n    PanelType: \"V2board\" # Panel type: SSpanel, V2board, PMpanel, , Proxypanel\n    ApiConfig:\n      ApiHost: \"${apiHost}\"\n      ApiKey: \"${apiKey}\"\n      NodeID: ${nodeId}\n      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan, Shadowsocks-Plugin\n      Timeout: 30 # Timeout for the api request\n      EnableVless: false # Enable Vless for V2ray Type\n      EnableXTLS: false # Enable XTLS for V2ray and Trojan\n      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable\n      DeviceLimit: 0 # Local settings will replace remote settings, 0 means disable\n      RuleListPath: # ./rulelist Path to local rulelist file\n    ControllerConfig:\n      ListenIP: 0.0.0.0 # IP address you want to listen\n      SendIP: 0.0.0.0 # IP address you want to send pacakage\n      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.\n      EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well\n      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy\n      EnableProxyProtocol: false # Only works for WebSocket and TCP\n      EnableFallback: false # Only support for Trojan and Vless\n      FallBackConfigs:  # Support multiple fallbacks\n        -\n          SNI: # TLS SNI(Server Name Indication), Empty for any\n          Path: # HTTP PATH, Empty for any\n          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/fallback/ for details.\n          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable\n      CertConfig:\n        CertMode: http # Option about how to get certificate: none, file, http, http. Choose \"none\" will forcedly disable the tls config.\n        CertDomain: \"${certDomain}\" # Domain to cert\n        CertFile: ./cert/hd.shopvn.cyou.cert # Provided if the CertMode is file\n        KeyFile: ./cert/hd.shopvn.cyou.key\n        Provider: cloudflare # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/http/\n        Email: ${cfEmail}\n        DNSEnv: # DNS ENV option used by DNS provider\n          ALICLOUD_ACCESS_KEY: aaa\n          ALICLOUD_SECRET_KEY: bbb\n          CF_DNS_API_TOKEN: ${cfToken}\n  # -\n  #   PanelType: \"V2board\" # Panel type: SSpanel, V2board\n  #   ApiConfig:\n  #     ApiHost: \"http://127.0.0.1:668\"\n  #     ApiKey: \"123\"\n  #     NodeID: 4\n  #     NodeType: Shadowsocks # Node type: V2ray, Shadowsocks, Trojan\n  #     Timeout: 30 # Timeout for the api request\n  #     EnableVless: false # Enable Vless for V2ray Type\n  #     EnableXTLS: false # Enable XTLS for V2ray and Trojan\n  #     SpeedLimit: 0 # Mbps, Local settings will replace remote settings\n  #     DeviceLimit: 0 # Local settings will replace remote settings\n  #   ControllerConfig:\n  #     ListenIP: 0.0.0.0 # IP address you want to listen\n  #     UpdatePeriodic: 10 # Time to update the nodeinfo, how many sec.\n  #     EnableDNS: false # Use custom DNS config, Please ensure that you set the http.json well\n  #     CertConfig:\n  #       CertMode: http # Option about how to get certificate: none, file, http, http\n  #       CertDomain: \"node1.test.com\" # Domain to cert\n  #       CertFile: ./cert/node1.test.com.cert # Provided if the CertMode is file\n  #       KeyFile: ./cert/node1.test.com.pem\n  #       Provider: alihttp # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/http/\n  #       Email: test@me.com\n  #       DNSEnv: # DNS ENV option used by DNS provider\n  #         ALICLOUD_ACCESS_KEY: aaa\n  #         ALICLOUD_SECRET_KEY: bbb\n\n', 'config.yml', 'config.yml');

-- ----------------------------
-- Table structure for v2_server
-- ----------------------------
DROP TABLE IF EXISTS `v2_server`;
CREATE TABLE `v2_server`  (
                              `id` int(20) NOT NULL AUTO_INCREMENT,
                              `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
                              `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'port',
                              `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'user',
                              `passwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'passwd',
                              `node_id` int(11) NULL DEFAULT NULL COMMENT 'nodeId',
                              `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置文件地址',
                              `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务器' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of v2_server
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE `v2_server`
    ADD COLUMN `node_type` varchar(255) NULL COMMENT '节点类型' AFTER `remark`;

update v2_server set node_type = 'vmess' where 1=1
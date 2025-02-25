ALTER table v2_file_template
    ADD COLUMN `file_type` varchar(32) DEFAULT NULL COMMENT '配置文件类型' AFTER `file_name`;
update v2_file_template set file_type = 'vmess' where 1=1;
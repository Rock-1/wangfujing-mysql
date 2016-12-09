/*
Navicat MySQL Data Transfer

Source Server         : wfj-prd-osp读-10.6.2.97
Source Server Version : 50626
Source Host           : 10.6.2.97:3306
Source Database       : osp

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-12-09 14:21:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for captcha
-- ----------------------------
DROP TABLE IF EXISTS `captcha`;
CREATE TABLE `captcha` (
  `sid` int(20) NOT NULL AUTO_INCREMENT,
  `random` int(20) NOT NULL COMMENT '随机数',
  `big_img` varchar(20) DEFAULT NULL,
  `lit_img` varchar(20) DEFAULT NULL,
  `start_x` int(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for limit_resources
-- ----------------------------
DROP TABLE IF EXISTS `limit_resources`;
CREATE TABLE `limit_resources` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '生成序列号',
  `rsName` varchar(50) NOT NULL COMMENT '资源名称，在delFlag为0时检查唯一性',
  `rsCode` varchar(100) NOT NULL COMMENT '资源编码，在delFlag为0时检查唯一性',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `delFlag` tinyint(4) DEFAULT '0' COMMENT '删除标识位，0未删除1删除',
  `parentSid` bigint(20) DEFAULT NULL COMMENT '父类sid',
  `isLeaf` tinyint(1) DEFAULT '0' COMMENT '是否是叶子结点。1是0否',
  `rsUrl` varchar(100) DEFAULT '' COMMENT '资源路径',
  `orderno` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Table structure for limit_role
-- ----------------------------
DROP TABLE IF EXISTS `limit_role`;
CREATE TABLE `limit_role` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '生成序列号',
  `roleName` varchar(50) NOT NULL COMMENT '角色名称,在delFlag为0时检查唯一性',
  `roleCode` varchar(50) NOT NULL COMMENT '角色编码,在delFlag为0时检查唯一性',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `delFlag` tinyint(4) DEFAULT '0' COMMENT '删除标识位，0未删除1删除',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for limit_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `limit_role_resources`;
CREATE TABLE `limit_role_resources` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '生成序列号',
  `role_sid` bigint(20) NOT NULL COMMENT '角色sid',
  `rs_sid` bigint(20) NOT NULL COMMENT '资源sid',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=9652 DEFAULT CHARSET=utf8 COMMENT='角色资源关系表';

-- ----------------------------
-- Table structure for price_rule
-- ----------------------------
DROP TABLE IF EXISTS `price_rule`;
CREATE TABLE `price_rule` (
  `sid` int(22) NOT NULL AUTO_INCREMENT,
  `tsid` int(22) NOT NULL,
  `page_layout_sid` int(22) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `flag` int(10) NOT NULL,
  `supplySids` varchar(50) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6092 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_sid` bigint(20) DEFAULT NULL COMMENT '角色SID',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限内容',
  `permission_type` int(11) DEFAULT NULL COMMENT '权限类型：0门店，1渠道，2管理分类',
  `opttime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `status` int(11) DEFAULT NULL COMMENT '状态:0无效，1有效',
  `col1` varchar(255) DEFAULT NULL,
  `col2` varchar(255) DEFAULT NULL,
  `col3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4760 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_channels
-- ----------------------------
DROP TABLE IF EXISTS `shop_channels`;
CREATE TABLE `shop_channels` (
  `sid` int(22) NOT NULL AUTO_INCREMENT,
  `page_layout_sid` int(22) DEFAULT NULL,
  `page_template_sid` int(22) DEFAULT NULL,
  `display_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `channel_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `seq` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `flag` int(1) DEFAULT NULL,
  `channel_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_show` int(1) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_parameter_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter_type`;
CREATE TABLE `sys_parameter_type` (
  `sid` int(22) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sys_parameter_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter_value`;
CREATE TABLE `sys_parameter_value` (
  `sid` int(22) NOT NULL AUTO_INCREMENT,
  `sys_parameter_type_sid` int(22) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1063 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for task_excute_detail
-- ----------------------------
DROP TABLE IF EXISTS `task_excute_detail`;
CREATE TABLE `task_excute_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) DEFAULT NULL COMMENT '1.已执行 2.已接受 3.执行失败 4.执行成功',
  `desc_code` varchar(30) DEFAULT NULL,
  `desc_msg` varchar(200) DEFAULT NULL,
  `receipt_paras` varchar(200) DEFAULT NULL,
  `receipt_ip` varchar(200) DEFAULT NULL,
  `job_id` varchar(200) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222654 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for task_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `task_schedule_job`;
CREATE TABLE `task_schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务组',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `cron_expression` varchar(255) NOT NULL COMMENT '触发时间',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_concurrent` varchar(255) DEFAULT '1' COMMENT '是否并发0是，1否',
  `url` varchar(2000) DEFAULT NULL COMMENT '路径',
  `paras` varchar(2000) DEFAULT NULL,
  `paraType` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `name_group` (`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `sid` int(22) NOT NULL AUTO_INCREMENT,
  `users_sid` bigint(22) DEFAULT NULL,
  `users_name` varchar(50) NOT NULL,
  `role_sid` bigint(22) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_user_role_role` (`role_sid`) USING BTREE,
  KEY `fk_user_role_user` (`users_sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `sid` bigint(22) NOT NULL AUTO_INCREMENT,
  `organ_depart_sid` bigint(22) DEFAULT NULL,
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_pwd` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(22) DEFAULT NULL,
  `type` int(4) DEFAULT '0' COMMENT '用户状态，0表示电果网用户，1表示门店用户',
  PRIMARY KEY (`sid`),
  KEY `fk_users_organ_depart` (`organ_depart_sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*
Navicat MySQL Data Transfer

Source Server         : wfj-sit-pcm写-10.6.2.50
Source Server Version : 50626
Source Host           : 10.6.2.50:3306
Source Database       : pcm

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-12-09 14:09:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pcm_barcode
-- ----------------------------
DROP TABLE IF EXISTS `pcm_barcode`;
CREATE TABLE `pcm_barcode` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(100) DEFAULT NULL COMMENT '条码',
  `barcode_name` varchar(50) DEFAULT NULL COMMENT '条码名称',
  `barcode_unit` varchar(20) DEFAULT NULL COMMENT '销售单位（文字信息，如，瓶）',
  `barcode_rate` decimal(20,6) DEFAULT NULL COMMENT '倍率(如果是基本单位倍率为1)',
  `code_type` int(4) DEFAULT '0' COMMENT '条码类型（0自编条码, 1供应商条码, \r\n)',
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品编码',
  `store_code` varchar(50) DEFAULT NULL COMMENT '门店编码',
  `product_code` varchar(100) DEFAULT NULL COMMENT '商品的ERP编码',
  `supply_code` varchar(10) DEFAULT NULL COMMENT '供应商编码',
  `shoppe_code` varchar(50) DEFAULT NULL COMMENT '专柜编码（中台的专柜编码）',
  `sale_mount` decimal(10,6) DEFAULT NULL COMMENT '多包装的含量(不是多包装就是1)',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '售价',
  `origin_land` varchar(50) DEFAULT NULL COMMENT '原产地',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=11990 DEFAULT CHARSET=utf8 COMMENT='条码表';

-- ----------------------------
-- Table structure for pcm_barcode_his
-- ----------------------------
DROP TABLE IF EXISTS `pcm_barcode_his`;
CREATE TABLE `pcm_barcode_his` (
  `sid` bigint(20) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL COMMENT '条码',
  `barcode_name` varchar(50) DEFAULT NULL COMMENT '条码名称',
  `barcode_unit` varchar(20) DEFAULT NULL COMMENT '销售单位（文字信息，如，瓶）',
  `barcode_rate` decimal(20,6) DEFAULT NULL COMMENT '倍率(如果是基本单位倍率为1)',
  `code_type` int(4) DEFAULT '0' COMMENT '条码类型（0标准条码, 1其他, \r\n)',
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品编码',
  `store_code` varchar(50) DEFAULT NULL COMMENT '门店编码',
  `product_code` varchar(100) DEFAULT NULL COMMENT '商品的ERP编码',
  `supply_code` varchar(10) DEFAULT NULL COMMENT '供应商编码',
  `shoppe_code` varchar(50) DEFAULT NULL COMMENT '专柜编码（中台的专柜编码）',
  `sale_mount` decimal(10,6) DEFAULT NULL COMMENT '多包装的含量(不是多包装就是1)',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '售价',
  `origin_land` varchar(50) DEFAULT NULL COMMENT '原产地',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='条码表';

-- ----------------------------
-- Table structure for pcm_brand
-- ----------------------------
DROP TABLE IF EXISTS `pcm_brand`;
CREATE TABLE `pcm_brand` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_sid` varchar(20) DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `brand_type` int(4) DEFAULT NULL COMMENT '品牌类型 0 集团品牌 1 门店品牌 （默认为0）',
  `shop_type` int(4) DEFAULT NULL COMMENT '门店类型(0 北京，1 外埠 ，2 电商)默认为0',
  `parent_sid` bigint(20) DEFAULT NULL COMMENT '集团品牌sid',
  `shop_sid` bigint(20) DEFAULT NULL COMMENT '门店sid',
  `brand_name_second` varchar(100) DEFAULT NULL COMMENT '品牌第二个名字',
  `spell` varchar(100) DEFAULT NULL COMMENT '拼音',
  `brand_name_en` varchar(100) DEFAULT NULL COMMENT '英文名称',
  `status` int(4) DEFAULT NULL COMMENT '有效标记：0有效，1无效（默认为0）',
  `is_display` int(4) DEFAULT NULL COMMENT '是否展示（0：是，1：否，默认0）',
  `picture_url` varchar(100) DEFAULT NULL COMMENT '图片路径',
  `brandpic1` varchar(100) DEFAULT NULL COMMENT '图片1',
  `brandpic2` varchar(100) DEFAULT NULL COMMENT '图片2',
  `brandcorp` varchar(100) DEFAULT NULL COMMENT '品牌公司',
  `photo_blacklist_bit` bigint(20) DEFAULT NULL COMMENT '照片黑名单标志',
  `brand_desc` varchar(500) DEFAULT NULL COMMENT '品牌描述',
  `brand_specialty` varchar(200) DEFAULT NULL COMMENT '品牌特点',
  `brand_suitability` varchar(200) DEFAULT NULL COMMENT '适合人群',
  `opt_user_sid` bigint(100) DEFAULT NULL COMMENT '操作人sid',
  `opt_real_name` varchar(100) DEFAULT NULL COMMENT '操作人',
  `opt_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `brand_active_bit` bigint(20) DEFAULT NULL COMMENT '活动标记',
  `end_bit` bigint(20) DEFAULT NULL,
  `brandno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `index_ssd_brand_brand_sid` (`brand_sid`) USING BTREE,
  KEY `IDX_BRAND_SID` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=27169 DEFAULT CHARSET=utf8 COMMENT='门店品牌表';

-- ----------------------------
-- Table structure for pcm_brand_alias
-- ----------------------------
DROP TABLE IF EXISTS `pcm_brand_alias`;
CREATE TABLE `pcm_brand_alias` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_sid` bigint(20) DEFAULT NULL COMMENT '集团品牌SID',
  `brand_alias` varchar(100) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌别名关联表';

-- ----------------------------
-- Table structure for pcm_brand_category
-- ----------------------------
DROP TABLE IF EXISTS `pcm_brand_category`;
CREATE TABLE `pcm_brand_category` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_sid` bigint(20) DEFAULT NULL,
  `category_sid` bigint(20) DEFAULT NULL,
  `size_picture_url` varchar(255) DEFAULT NULL,
  `opt_user` varchar(100) DEFAULT NULL,
  `opt_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `field1` varchar(20) DEFAULT NULL,
  `field2` varchar(20) DEFAULT NULL,
  `field3` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='网站分类品牌关联表';

-- ----------------------------
-- Table structure for pcm_brand_group
-- ----------------------------
DROP TABLE IF EXISTS `pcm_brand_group`;
CREATE TABLE `pcm_brand_group` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_sid` varchar(20) DEFAULT NULL COMMENT '集团品牌编码',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '中文名称',
  `brand_name_spell` varchar(100) DEFAULT NULL COMMENT '中文拼音',
  `brand_name_alias` varchar(100) DEFAULT NULL COMMENT '别名',
  `brand_name_en` varchar(200) DEFAULT NULL COMMENT '英文名称',
  `brand_desc` varchar(2000) DEFAULT NULL COMMENT '品牌描述',
  `brand_pict` varchar(100) DEFAULT NULL COMMENT '品牌图片',
  `brand_create_time` date DEFAULT NULL COMMENT '创建时间',
  `brand_create_country` varchar(100) DEFAULT NULL COMMENT '创建国家',
  `brand_specialty` varchar(300) DEFAULT NULL COMMENT '品牌特点',
  `brand_suitability` varchar(300) DEFAULT NULL COMMENT '适合人群',
  `is_factory_store` bigint(20) DEFAULT '0' COMMENT '是否是工厂店',
  `factory_big_pic` varchar(1024) DEFAULT NULL COMMENT '工厂店大图片',
  `factory_small_pic` varchar(1024) DEFAULT '' COMMENT '工厂店缩略图',
  `activity_big_pic` varchar(1024) DEFAULT NULL COMMENT '活动大图',
  `activity_small_pic` varchar(1024) DEFAULT NULL COMMENT '活动缩略图',
  `factory_store_order` bigint(20) unsigned DEFAULT '0' COMMENT '工厂店顺序',
  `parent_factory_store_id` bigint(20) DEFAULT '0' COMMENT '主工厂店Id',
  `logo_pic` varchar(1024) DEFAULT NULL COMMENT '工厂店logo图片，在工厂店查看页面显示的图片',
  `awesome` bigint(20) DEFAULT NULL COMMENT '点赞数量',
  `is_display` bigint(20) DEFAULT NULL COMMENT '是否展示',
  `status` int(4) DEFAULT NULL COMMENT '有效标记：0有效，1无效（默认为0）',
  `opt_real_name` varchar(100) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`sid`),
  KEY `index_brand_display_sid` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团品牌表';

-- ----------------------------
-- Table structure for pcm_brand_relation
-- ----------------------------
DROP TABLE IF EXISTS `pcm_brand_relation`;
CREATE TABLE `pcm_brand_relation` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_sid` varchar(20) DEFAULT NULL COMMENT '门店品牌sid',
  `brand_root_sid` varchar(20) DEFAULT NULL COMMENT '集团品牌sid',
  `opt_user` varchar(50) DEFAULT NULL,
  `status` int(4) DEFAULT NULL COMMENT '有效标记：0有效，1无效（默认为0）',
  `opt_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店品牌与集团品牌关联关系表';

-- ----------------------------
-- Table structure for pcm_business_type_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_business_type_dict`;
CREATE TABLE `pcm_business_type_dict` (
  `sid` int(4) NOT NULL AUTO_INCREMENT COMMENT '0可用 1删除',
  `business_code` varchar(20) DEFAULT NULL COMMENT 'Z001，Z002，Z003，Z004，Z005',
  `business_name` varchar(5) DEFAULT NULL COMMENT 'Z001经销，Z002代销，Z003联营，Z004平台服务，Z005租赁',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `opt_user_sid` bigint(20) DEFAULT NULL COMMENT '创建人',
  `status` int(4) DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='经营方式字典表';

-- ----------------------------
-- Table structure for pcm_category
-- ----------------------------
DROP TABLE IF EXISTS `pcm_category`;
CREATE TABLE `pcm_category` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_sid` varchar(15) DEFAULT NULL COMMENT '分类编码',
  `parent_sid` varchar(15) DEFAULT NULL COMMENT '父类节点',
  `name` varchar(60) DEFAULT NULL COMMENT '分类名称',
  `is_parent` int(4) DEFAULT NULL COMMENT '是否父节点（0：否 1：是）',
  `is_self_built` int(4) DEFAULT '1' COMMENT '当当自建品类表示 0非自建 1自建 ',
  `is_leaf` varchar(4) DEFAULT NULL COMMENT '是否末级（Y：是 N 否）',
  `is_display` int(4) DEFAULT NULL COMMENT '是否展示（1:是  0  不是）',
  `status` varchar(4) DEFAULT NULL COMMENT '状态0有效、1无效',
  `root_sid` bigint(20) DEFAULT NULL COMMENT '根节点',
  `level` int(4) DEFAULT NULL COMMENT '等级',
  `sort_order` int(4) DEFAULT '1' COMMENT '顺序',
  `channel_sid` bigint(20) DEFAULT NULL COMMENT '渠道sid（0：全渠道，1：淘宝 2：天猫  3：京东 ）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `search_path` varchar(300) DEFAULT NULL COMMENT '搜素目录',
  `category_type` int(4) DEFAULT NULL COMMENT '品类类型标识:0 工业分类，1 管理分类，2 统计分类，3 展示分类（默认为0）',
  `shop_sid` varchar(20) DEFAULT NULL COMMENT '门店sid',
  `description` varchar(100) DEFAULT NULL COMMENT '分类描述',
  `erp_type` int(4) DEFAULT '0' COMMENT 'erp类型，0 门店ERP，1 电商ERP，2 SAP ERP 默认为0',
  `is_market` varchar(4) DEFAULT '0' COMMENT '是否是超市，0百货，1超市，默认为0（只限管理分类）,2电商',
  `success_time` datetime DEFAULT NULL COMMENT '生效时间',
  `group_sid` bigint(20) DEFAULT NULL COMMENT '集团SID',
  `category_code` varchar(30) DEFAULT NULL COMMENT '手工录入编码',
  PRIMARY KEY (`sid`),
  KEY `index_parent_sid` (`parent_sid`) USING BTREE,
  KEY `index_root_sid` (`root_sid`) USING BTREE,
  KEY `index_category_sid` (`category_sid`) USING BTREE,
  KEY `IDX_category_code` (`category_code`),
  KEY `IDX_SID` (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33134 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Table structure for pcm_category_mq
-- ----------------------------
DROP TABLE IF EXISTS `pcm_category_mq`;
CREATE TABLE `pcm_category_mq` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_context` varchar(255) DEFAULT NULL,
  `msg_total_num` varchar(255) DEFAULT NULL,
  `msg_sequence` varchar(255) DEFAULT NULL,
  `item` mediumtext,
  `flag` int(4) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类消息同步记录表';

-- ----------------------------
-- Table structure for pcm_category_prop_values
-- ----------------------------
DROP TABLE IF EXISTS `pcm_category_prop_values`;
CREATE TABLE `pcm_category_prop_values` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_sid` varchar(15) DEFAULT NULL COMMENT '分类SID',
  `category_name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `props_sid` bigint(20) DEFAULT NULL COMMENT '属性sid',
  `props_name` varchar(100) DEFAULT NULL COMMENT '属性名',
  `values_sid` bigint(20) DEFAULT NULL COMMENT '属性值SID',
  `values_name` varchar(100) DEFAULT NULL COMMENT '属性值',
  `channel_sid` bigint(20) DEFAULT NULL COMMENT '渠道SID',
  `opt_user` varchar(100) DEFAULT NULL COMMENT '操作人',
  `opt_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作日期',
  `not_null` int(4) DEFAULT '0' COMMENT '是否必填 0 否，1是 默认为0',
  `is_erp_syn` int(4) DEFAULT NULL COMMENT '是否erp同步：0，否  1 是',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`sid`),
  KEY `IDX_CATEGORYPROPVALUES_CATEGORYSID` (`category_sid`),
  KEY `IDX_CATEGORYPROPVALUES_PROPSSID` (`props_sid`),
  KEY `IDX_CATEGORYPROPVALUES_VALUESSID` (`values_sid`),
  KEY `IDX_CATEGORYPROPVALUES_CHANNELSID` (`channel_sid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='分类属性关联表';

-- ----------------------------
-- Table structure for pcm_category_props_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_category_props_dict`;
CREATE TABLE `pcm_category_props_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `props_sid` bigint(20) DEFAULT NULL COMMENT '属性编码',
  `props_name` varchar(100) DEFAULT NULL COMMENT '属性名',
  `is_key_prop` int(4) DEFAULT NULL COMMENT '是否是关键属性  1是 0不是（默认为0）',
  `is_enum_prop` int(4) DEFAULT NULL COMMENT '属性类型：1 文本型；2 布尔型；0枚举型 （默认为0）',
  `props_desc` varchar(500) DEFAULT NULL COMMENT '属性描述',
  `props_code` varchar(100) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL COMMENT '状态：1 可用，0禁用 默认为1',
  `sort_order` bigint(20) DEFAULT NULL COMMENT '排序',
  `channel_sid` bigint(20) DEFAULT NULL COMMENT '渠道SID',
  `is_erp_prop` int(4) DEFAULT NULL COMMENT '是否ERP属性：0 否，1是 （默认为0）',
  `erp_type` int(11) DEFAULT NULL COMMENT 'ERP类型:0 门店ERP（富基），1 sap ERP',
  `erp_prop_code` varchar(100) DEFAULT NULL COMMENT 'erp属性编码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `opt_user_sid` bigint(20) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分类属性字典表';

-- ----------------------------
-- Table structure for pcm_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `pcm_category_relation`;
CREATE TABLE `pcm_category_relation` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `gy_category_sid` bigint(20) DEFAULT NULL COMMENT '工业分类',
  `gl_category_sid` bigint(20) DEFAULT NULL COMMENT '管理分类',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工业分类与管理分类关联关系表';

-- ----------------------------
-- Table structure for pcm_category_values_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_category_values_dict`;
CREATE TABLE `pcm_category_values_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `values_sid` bigint(20) DEFAULT NULL COMMENT '属性值编码',
  `values_name` varchar(100) DEFAULT NULL COMMENT '属性值',
  `is_key_value` bigint(20) DEFAULT NULL COMMENT '是否关键属性值 0是1不是(默认为0）',
  `values_desc` varchar(500) DEFAULT NULL COMMENT '属性值描述',
  `values_code` varchar(100) DEFAULT NULL,
  `status` bigint(20) DEFAULT '1' COMMENT '状态：1可用，0禁用（默认为1）',
  `props_sid` bigint(20) DEFAULT NULL COMMENT '属性sid',
  `sort_order` bigint(20) DEFAULT NULL COMMENT '顺序',
  `channel_sid` bigint(20) DEFAULT NULL COMMENT '渠道sid',
  `is_erp_value` bigint(20) DEFAULT NULL COMMENT '是否erp属性值',
  PRIMARY KEY (`sid`),
  KEY `IDX_CATEGORYVALUESDICT_PROPSSID` (`props_sid`),
  KEY `IDX_CATEGORYVALUESDICT_CHANNELSID` (`channel_sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分类属性值字典表';

-- ----------------------------
-- Table structure for pcm_change_price_interval
-- ----------------------------
DROP TABLE IF EXISTS `pcm_change_price_interval`;
CREATE TABLE `pcm_change_price_interval` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `change_price_unit` varchar(50) DEFAULT NULL COMMENT '变价单位',
  `valence_type` int(4) DEFAULT NULL COMMENT '变价类型:0 临时变价 ，1 长期变价',
  `priority` int(4) DEFAULT NULL COMMENT '变价优先级',
  `lowerLimit` double DEFAULT NULL COMMENT '变价区间下限',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='变价区间表';

-- ----------------------------
-- Table structure for pcm_change_price_limit
-- ----------------------------
DROP TABLE IF EXISTS `pcm_change_price_limit`;
CREATE TABLE `pcm_change_price_limit` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '阀值类型：0上限，1下限',
  `shop_sid` varchar(10) DEFAULT NULL COMMENT '门店编码',
  `level_type` int(11) DEFAULT NULL COMMENT '门店类型，0上限；1下限',
  `level_value` decimal(10,3) DEFAULT NULL COMMENT '阀值，如果0表示无限制',
  `status` int(11) DEFAULT NULL COMMENT '状态:0启用，1禁用',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(50) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_name` varchar(50) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='价格阀值管理';

-- ----------------------------
-- Table structure for pcm_change_price_log
-- ----------------------------
DROP TABLE IF EXISTS `pcm_change_price_log`;
CREATE TABLE `pcm_change_price_log` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '单据号',
  `shoppe_pro_sid` bigint(20) DEFAULT NULL COMMENT '专柜商品SID',
  `change_before_price` decimal(10,2) DEFAULT NULL COMMENT '变价前价格',
  `change_after_price` decimal(10,2) DEFAULT NULL COMMENT '变价后价格',
  `valence_type` int(4) DEFAULT NULL COMMENT '变价类型:0 临时变价 ，1 长期变价',
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '变动时间',
  `opt_user_sid` bigint(20) DEFAULT NULL,
  `device_no` varchar(100) DEFAULT NULL COMMENT '设备号',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP',
  `price_channel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='变价日志表';

-- ----------------------------
-- Table structure for pcm_change_price_power_card
-- ----------------------------
DROP TABLE IF EXISTS `pcm_change_price_power_card`;
CREATE TABLE `pcm_change_price_power_card` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ka_num` varchar(18) DEFAULT NULL COMMENT '卡号',
  `ka_pwd` varchar(256) DEFAULT NULL COMMENT '卡密码',
  `ka_state` int(4) DEFAULT NULL COMMENT '卡状态:0有效，1 无效（默认为0）',
  `ka_user` varchar(100) DEFAULT NULL COMMENT '领卡人',
  `begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '生效日期',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效日期',
  `change_price_unit` varchar(50) DEFAULT NULL COMMENT '变价单位',
  `valence_type` int(4) DEFAULT NULL COMMENT '变价类型:0 临时变价，1 长期变价',
  `priority` int(4) DEFAULT NULL COMMENT '变价优先级',
  `upperLimit` double DEFAULT NULL COMMENT '变价区间上限',
  `lowerLimit` double DEFAULT NULL COMMENT '变价区间下限',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='变价权限卡';

-- ----------------------------
-- Table structure for pcm_change_price_record
-- ----------------------------
DROP TABLE IF EXISTS `pcm_change_price_record`;
CREATE TABLE `pcm_change_price_record` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '门店编码',
  `matnr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `supplier_prod_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '中台专柜商品编码',
  `zsprice` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '售价',
  `site_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '中台专柜编码',
  `waers` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '货币单位',
  `bdate` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '开始日期',
  `edate` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '结束日期',
  `change_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '变价号',
  `channelSid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `price_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '价格类型：1零售，2短期',
  `action_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '本条记录对应的操作 (A添加；U更新；D删除)',
  `action_date` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '操作时间',
  `action_persion` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `attribute1` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '记录标识：1单一变价，2批量变价',
  `attribute2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `attribute3` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `attribute4` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `attribute5` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='变价记录';

-- ----------------------------
-- Table structure for pcm_change_price_record_his
-- ----------------------------
DROP TABLE IF EXISTS `pcm_change_price_record_his`;
CREATE TABLE `pcm_change_price_record_his` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '门店编码',
  `matnr` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `supplier_prod_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '中台专柜商品编码',
  `zsprice` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '售价',
  `site_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '中台专柜编码',
  `waers` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '货币单位',
  `bdate` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '开始日期',
  `edate` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '结束日期',
  `change_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '变价号',
  `channelSid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道',
  `price_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '价格类型：1零售，2短期',
  `action_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '本条记录对应的操作 (A添加；U更新；D删除)',
  `action_date` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '操作时间',
  `action_persion` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `attribute1` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '记录标识：1单一变价，2批量变价',
  `attribute2` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `attribute3` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `attribute4` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `attribute5` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='变价记录';

-- ----------------------------
-- Table structure for pcm_change_type_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_change_type_dict`;
CREATE TABLE `pcm_change_type_dict` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `change_name` varchar(100) DEFAULT NULL COMMENT '变动类型名称',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8 COMMENT='变动类型字典表';

-- ----------------------------
-- Table structure for pcm_channel
-- ----------------------------
DROP TABLE IF EXISTS `pcm_channel`;
CREATE TABLE `pcm_channel` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `channel_code` varchar(100) DEFAULT NULL COMMENT '渠道编码',
  `channel_name` varchar(100) DEFAULT NULL COMMENT '渠道名称',
  `status` int(4) unsigned DEFAULT NULL COMMENT '状态：0 有效，1 禁用 （默认为0）',
  `opt_user` varchar(50) DEFAULT NULL COMMENT '操作人',
  `opt_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作日期',
  PRIMARY KEY (`sid`),
  KEY `IDX_channel` (`channel_code`) USING BTREE,
  KEY `IDX_SID` (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='渠道表';

-- ----------------------------
-- Table structure for pcm_channel_sale_config
-- ----------------------------
DROP TABLE IF EXISTS `pcm_channel_sale_config`;
CREATE TABLE `pcm_channel_sale_config` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_pro_sid` bigint(20) DEFAULT NULL COMMENT '专柜SID',
  `channel_sid` varchar(20) DEFAULT NULL COMMENT '渠道编码',
  `sale_stauts` int(4) DEFAULT NULL COMMENT '可售状态:0 可售，1不可售（默认为0）',
  PRIMARY KEY (`sid`),
  KEY `idx_shoppe_pro` (`shoppe_pro_sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1795 DEFAULT CHARSET=utf8 COMMENT='渠道可售表';

-- ----------------------------
-- Table structure for pcm_color_code_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_color_code_dict`;
CREATE TABLE `pcm_color_code_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `color_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '色码',
  `brand_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `color_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '色码名称',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='色码字典表';

-- ----------------------------
-- Table structure for pcm_color_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_color_dict`;
CREATE TABLE `pcm_color_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '0 可用 1删除',
  `color_alias` varchar(50) DEFAULT NULL COMMENT '别名',
  `color_name` varchar(50) DEFAULT NULL COMMENT '27种标准颜色',
  `status` int(4) DEFAULT '0',
  `rgb` varchar(10) DEFAULT NULL COMMENT 'rgb',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='色系字典表';

-- ----------------------------
-- Table structure for pcm_contract_log
-- ----------------------------
DROP TABLE IF EXISTS `pcm_contract_log`;
CREATE TABLE `pcm_contract_log` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `contract_code` varchar(50) DEFAULT NULL COMMENT '要约编号',
  `store_code` varchar(20) DEFAULT NULL COMMENT '门店编码',
  `supply_code` varchar(10) DEFAULT NULL COMMENT '供应商编号',
  `manage_type` int(4) DEFAULT '0' COMMENT '商品经营方式: \r\n0-(Z001 经销);  \r\n1-(Z002 代销);  \r\n2-(Z003 联营);  \r\n3-(Z004 平台服务);  \r\n4-(Z005 租赁);  ',
  `buy_type` int(4) DEFAULT NULL COMMENT '采购类别（总部集采“1”、城市集采“2”、门店经营“3”）',
  `oper_mode` int(4) DEFAULT NULL COMMENT '管理方式（单品“1”金饰“5”服务费“6”租赁“7”）\r\n',
  `business_type` int(4) DEFAULT '0' COMMENT '0百货 1超市',
  `input_tax` decimal(10,2) DEFAULT NULL COMMENT '进项税率',
  `output_tax` decimal(10,2) DEFAULT NULL COMMENT '销项税率',
  `commission_rate` decimal(20,2) DEFAULT NULL COMMENT '要约扣率',
  `opt_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `col1` varchar(255) DEFAULT NULL COMMENT '预留字段',
  `col2` varchar(255) DEFAULT NULL COMMENT '预留字段',
  `col3` varchar(255) DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='合同表';

-- ----------------------------
-- Table structure for pcm_current_price
-- ----------------------------
DROP TABLE IF EXISTS `pcm_current_price`;
CREATE TABLE `pcm_current_price` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_pro_sid` bigint(20) DEFAULT NULL COMMENT '专柜商品sid',
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `flag` int(11) DEFAULT NULL COMMENT '标记',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `opt_user` varchar(50) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品现价表';

-- ----------------------------
-- Table structure for pcm_current_price_log
-- ----------------------------
DROP TABLE IF EXISTS `pcm_current_price_log`;
CREATE TABLE `pcm_current_price_log` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_pro_sid` bigint(20) DEFAULT NULL COMMENT '专柜商品SID',
  `old_current_price` decimal(10,2) DEFAULT NULL COMMENT 'old现价',
  `new_current_price` decimal(10,2) DEFAULT NULL COMMENT 'new现价',
  `begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `opt_user` varchar(255) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品现价日志表';

-- ----------------------------
-- Table structure for pcm_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_dict`;
CREATE TABLE `pcm_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sid',
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `pid` bigint(20) DEFAULT NULL COMMENT '父类sid',
  `sort` int(255) DEFAULT NULL COMMENT '顺序',
  `status` int(255) DEFAULT NULL COMMENT '状态0有效，1无效',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Table structure for pcm_dict_version
-- ----------------------------
DROP TABLE IF EXISTS `pcm_dict_version`;
CREATE TABLE `pcm_dict_version` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `type` int(4) DEFAULT NULL COMMENT '0工业分类  1统计分类',
  `col1` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段',
  `col2` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段',
  `col3` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据版本类型表（导入终端专用）';

-- ----------------------------
-- Table structure for pcm_erp_product
-- ----------------------------
DROP TABLE IF EXISTS `pcm_erp_product`;
CREATE TABLE `pcm_erp_product` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(200) DEFAULT NULL COMMENT '门店编码',
  `shop_name` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `shoppe_code` varchar(50) DEFAULT NULL COMMENT '专柜编码（和中台一致的专柜编码）',
  `shoppe_name` varchar(100) DEFAULT NULL COMMENT '专柜名称',
  `product_code` varchar(100) DEFAULT NULL COMMENT '商品编码（大码）',
  `code_type` int(4) DEFAULT NULL COMMENT '大码类型:0  价格码,1 长期统码,2 促销统码,3 特卖统码,4 扣率码,5 促销扣率码,6 单品码 ',
  `big_code_price` decimal(10,2) DEFAULT NULL COMMENT '大码价格',
  `supply_code` varchar(10) DEFAULT NULL COMMENT '商品对应的供应商编码',
  `offer_no` varchar(100) DEFAULT NULL COMMENT '要约号',
  `brand_code` varchar(100) DEFAULT NULL COMMENT '门店品牌编码',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `opt_user_sid` varchar(20) DEFAULT NULL,
  `product_abbr` varchar(50) DEFAULT NULL COMMENT '商品简称',
  `product_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `product_type` int(4) DEFAULT NULL COMMENT '商品经营方式: \r\n0-(Z001 经销);  \r\n1-(Z002 代销);  \r\n2-(Z003 联营);  \r\n3-(Z004 平台服务);  \r\n4-(Z005 租赁);  \r\n',
  `product_category` int(4) DEFAULT NULL COMMENT '商品类别:01 自营单品,3:金额码,4:销售条码,05 金银首饰,06 服务费商品,07 租赁商品,,08 联营单品,09 组包码',
  `stan_name` varchar(255) DEFAULT NULL COMMENT '规格名称（例如250ml）',
  `article_num` varchar(100) DEFAULT NULL COMMENT '货号',
  `sales_unit` varchar(50) DEFAULT NULL COMMENT '销售计量单位（上传的是单位的文本信息，例如瓶）',
  `supplier_barcode` varchar(100) DEFAULT NULL COMMENT '供应商条码',
  `sales_price` decimal(10,2) DEFAULT NULL COMMENT '售价',
  `input_tax` decimal(10,6) DEFAULT NULL COMMENT '进项税',
  `output_tax` decimal(10,6) DEFAULT NULL COMMENT '销项税',
  `sales_tax` decimal(10,6) DEFAULT NULL COMMENT '消费税',
  `pro_status` int(4) DEFAULT '0' COMMENT '商品状态(0正常；1停售；2停货；3暂停使用；4已删除；5淘汰)',
  `is_promotion` int(4) DEFAULT '1' COMMENT '是否允许促销(0 允许 , 1 不允许)',
  `is_adjust_price` int(4) DEFAULT '1' COMMENT '是否允许调价(0 允许 ,1 不允许)',
  `manage_category` varchar(15) DEFAULT NULL COMMENT '所属末级管理分类的编码',
  `discount_limit` decimal(10,6) DEFAULT NULL COMMENT '折扣底限(0到1.00之间的小数)',
  `origin_land` varchar(255) DEFAULT NULL COMMENT '产地（文本信息）',
  `service_fee_type` varchar(50) DEFAULT NULL COMMENT '服务费类型',
  `format_type` int(4) DEFAULT NULL COMMENT '业态类型（1百货、2超市、3电商）',
  `stat_category` varchar(15) DEFAULT NULL COMMENT '所属末级统计分类的编码',
  `notes` varchar(50) DEFAULT NULL COMMENT '备注',
  `commission_rate` decimal(10,6) DEFAULT NULL COMMENT '标准扣率（0到100之间的百分数，最多六位小数，只传数值不传%号，比如20.123%只传20.123。）',
  PRIMARY KEY (`sid`),
  KEY `IDX_ERPPRO_PRODUCTCODE` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8 COMMENT='ERP商品编码表(大码表)';

-- ----------------------------
-- Table structure for pcm_erp_product_change
-- ----------------------------
DROP TABLE IF EXISTS `pcm_erp_product_change`;
CREATE TABLE `pcm_erp_product_change` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(20) DEFAULT NULL COMMENT '门店编码',
  `bill_no` varchar(20) DEFAULT NULL COMMENT '单据号',
  `rowno` varchar(20) DEFAULT NULL COMMENT '行号',
  `bill_type` int(4) DEFAULT NULL COMMENT '单据类别(修改的属性)\r\n1．商品(大码)改品牌；\r\n3．商品(大码)换专柜；\r\n5．商品(大码)改供应商',
  `product_code` varchar(20) DEFAULT NULL COMMENT '所变更商品编码',
  `new_value` varchar(20) DEFAULT NULL COMMENT '新值',
  `old_value` varchar(20) DEFAULT NULL COMMENT '旧值',
  `json_text` text COMMENT '请求json',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `active_time` timestamp NULL DEFAULT NULL COMMENT '生效日期',
  `create_name` varchar(20) DEFAULT NULL COMMENT '创建人',
  `is_scan` int(4) DEFAULT '0' COMMENT '已操作标记 0未操作 1已操作 2操作失败',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品属性变更单据表';

-- ----------------------------
-- Table structure for pcm_erp_product_supply
-- ----------------------------
DROP TABLE IF EXISTS `pcm_erp_product_supply`;
CREATE TABLE `pcm_erp_product_supply` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `supply_sid` varchar(20) DEFAULT NULL COMMENT '供应商编码',
  `erp_product_sid` varchar(100) DEFAULT NULL COMMENT '大码商品编码',
  `shop_sid` varchar(20) DEFAULT NULL COMMENT '门店编码',
  `status` int(4) DEFAULT '0' COMMENT '有效状态（0有效，1无效，默认0）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1090001 DEFAULT CHARSET=utf8 COMMENT='大码一品多商关联关系表';

-- ----------------------------
-- Table structure for pcm_erp_type_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_erp_type_dict`;
CREATE TABLE `pcm_erp_type_dict` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `erp_type` varchar(20) DEFAULT NULL COMMENT 'erp类型',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ERP类型字典表';

-- ----------------------------
-- Table structure for pcm_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `pcm_exception_log`;
CREATE TABLE `pcm_exception_log` (
  `SID` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Interface_Name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '接口名称',
  `Exception_Type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '异常类型',
  `Error_Message` longtext COLLATE utf8_bin COMMENT '错误信息',
  `Data_Content` longtext COLLATE utf8_bin COMMENT '数据内容',
  `Create_Time` datetime DEFAULT CURRENT_TIMESTAMP,
  `ResolveBy` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '处理人',
  `Process_Status` int(1) DEFAULT '0' COMMENT '处理状态：0未处理，1处理中，2已处理',
  `Update_Time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=1977 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='异常日志';

-- ----------------------------
-- Table structure for pcm_floor
-- ----------------------------
DROP TABLE IF EXISTS `pcm_floor`;
CREATE TABLE `pcm_floor` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_sid` bigint(20) DEFAULT NULL COMMENT '所属门店SID',
  `floor_name` varchar(100) DEFAULT NULL COMMENT '楼层名称',
  `floor_code` varchar(20) DEFAULT NULL COMMENT '楼层编码',
  `opt_user_sid` bigint(20) DEFAULT NULL COMMENT '最后一次修改人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_name` varchar(200) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `floor_status` int(4) unsigned zerofill DEFAULT '0000' COMMENT '楼层状态 : 0 有效，1禁用（默认为0）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='楼层表';

-- ----------------------------
-- Table structure for pcm_hour_promotion_rule
-- ----------------------------
DROP TABLE IF EXISTS `pcm_hour_promotion_rule`;
CREATE TABLE `pcm_hour_promotion_rule` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `promotion_title` varchar(200) DEFAULT NULL COMMENT '活动标题',
  `brand_sid` bigint(20) DEFAULT NULL COMMENT '品牌SID',
  `category_sid` bigint(20) DEFAULT NULL COMMENT '分类SID',
  `shoppe_pro_sid` bigint(20) DEFAULT NULL COMMENT '专柜商品sid',
  `mode` varchar(10) DEFAULT NULL COMMENT '模式',
  `refer_price` varchar(10) DEFAULT NULL COMMENT '涉及价格',
  `opt` varchar(10) DEFAULT NULL COMMENT '操作(+ -)',
  `off_value` bigint(20) DEFAULT NULL COMMENT '折扣',
  `money` bigint(20) DEFAULT NULL COMMENT '金额',
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `opt_user` varchar(50) DEFAULT NULL COMMENT '操作者',
  `opt_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `restore_sql` varchar(1000) DEFAULT NULL COMMENT '恢复sql',
  `change_sql` varchar(1000) DEFAULT NULL COMMENT '变化sql',
  `promotion_number` bigint(20) DEFAULT NULL COMMENT '活动号',
  `priority` bigint(20) DEFAULT NULL COMMENT '优先级',
  `flag` bigint(20) DEFAULT NULL COMMENT '标记',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小时促销活动规则';

-- ----------------------------
-- Table structure for pcm_industry_condition_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_industry_condition_dict`;
CREATE TABLE `pcm_industry_condition_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(20) DEFAULT NULL COMMENT '业态名称',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `opt_user_sid` bigint(20) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='业态字典表';

-- ----------------------------
-- Table structure for pcm_instance
-- ----------------------------
DROP TABLE IF EXISTS `pcm_instance`;
CREATE TABLE `pcm_instance` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL COMMENT '编码',
  `url` varchar(100) DEFAULT NULL COMMENT '地址',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='服务器实例';

-- ----------------------------
-- Table structure for pcm_jco_log
-- ----------------------------
DROP TABLE IF EXISTS `pcm_jco_log`;
CREATE TABLE `pcm_jco_log` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(100) DEFAULT NULL COMMENT 'function 名',
  `input_table` varchar(100) DEFAULT NULL COMMENT '输入表名',
  `output_table` varchar(100) DEFAULT NULL COMMENT '输出表名',
  `data_content` longtext COMMENT '发送内容',
  `result_content` longtext COMMENT '返回结果',
  `status` varchar(10) DEFAULT NULL COMMENT '成功失败:1成功 0失败',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pcm_lock_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pcm_lock_attribute`;
CREATE TABLE `pcm_lock_attribute` (
  `sid` int(4) NOT NULL DEFAULT '0',
  `distributed_lock` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分布式锁',
  `button` int(4) DEFAULT '0' COMMENT '开关（0开，1关）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分布式锁';

-- ----------------------------
-- Table structure for pcm_lock_type_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_lock_type_dict`;
CREATE TABLE `pcm_lock_type_dict` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `lock_type_name` varchar(100) DEFAULT NULL COMMENT '变动类型名称',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8 COMMENT='锁定类型字典表';

-- ----------------------------
-- Table structure for pcm_measure_unit_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_measure_unit_dict`;
CREATE TABLE `pcm_measure_unit_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(100) DEFAULT NULL COMMENT '计量单位名称',
  `unit_desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `status` int(4) DEFAULT '0' COMMENT '0可用 1删除',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计量单位字典表';

-- ----------------------------
-- Table structure for pcm_mq
-- ----------------------------
DROP TABLE IF EXISTS `pcm_mq`;
CREATE TABLE `pcm_mq` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `messageID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '消息编号',
  `url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '消息系统路径',
  `destUrl` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '消息目的地URL',
  `callbackUrl` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '回调路径',
  `serviceID` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务对象服务编码（接口编码）',
  `data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '消息内容',
  `count` int(10) DEFAULT NULL COMMENT '消息记录数',
  `sourceSysID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `bizDesc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '返回结果描述',
  `bizCode` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '返回编码编码',
  `status` int(4) DEFAULT '0' COMMENT '消息状态：0未确认，1确认，默认为0',
  `c1` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '请求状态（RespStatus）1正常',
  `c2` int(20) DEFAULT NULL COMMENT '预留字段2',
  `c3` int(20) DEFAULT NULL COMMENT '预留字段3',
  `c4` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段4',
  `c5` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段5',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3710 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='mq消息记录表';

-- ----------------------------
-- Table structure for pcm_organization
-- ----------------------------
DROP TABLE IF EXISTS `pcm_organization`;
CREATE TABLE `pcm_organization` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_sid` varchar(50) DEFAULT NULL COMMENT '所属上级的编码',
  `group_sid` bigint(20) DEFAULT NULL COMMENT '组织机构所对应的集团sid',
  `organization_code` varchar(50) DEFAULT NULL COMMENT '机构编码',
  `organization_name` varchar(200) DEFAULT NULL COMMENT '机构名称',
  `organization_type` int(4) DEFAULT NULL COMMENT '机构类别：0，集团；1，大区；2，城市；3，门店（默认3）',
  `organization_status` int(4) DEFAULT NULL COMMENT '0.可用；1禁用（默认0）',
  `store_type` int(4) DEFAULT NULL COMMENT '门店类型(0 北京，1 外埠 ，2 电商，4 集货仓 5 门店物流室 6 拍照室)默认为0 ',
  `shipping_point` varchar(50) DEFAULT NULL COMMENT '集货地点编码(对于门店非空，表明对应的集货仓地点编码，例如电商对应电商百子湾集货仓的组织机构编码。如果门店没有集货仓，则传自己的组织机构编码)',
  `area_code` varchar(50) DEFAULT NULL COMMENT '门店所属城市在省市区字典中的编码（业务要求配置到城市一级，但是并不需要系统限制和校验）',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_name` varchar(50) DEFAULT NULL COMMENT '最后一次修改人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`sid`),
  KEY `IDX_SID` (`sid`) USING BTREE,
  KEY `IDX_TYPE` (`organization_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Table structure for pcm_original_price
-- ----------------------------
DROP TABLE IF EXISTS `pcm_original_price`;
CREATE TABLE `pcm_original_price` (
  `product_detail_sid` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品表SID',
  `original_price` decimal(10,0) DEFAULT NULL COMMENT '原价',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `opt_user` varchar(255) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`product_detail_sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品原价表';

-- ----------------------------
-- Table structure for pcm_original_price_log
-- ----------------------------
DROP TABLE IF EXISTS `pcm_original_price_log`;
CREATE TABLE `pcm_original_price_log` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_detail_sid` bigint(20) DEFAULT NULL COMMENT '商品表sid',
  `old_original_price` decimal(10,0) DEFAULT NULL COMMENT 'old原价',
  `new_original_price` decimal(10,0) DEFAULT NULL COMMENT 'new原价',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `opt_user` varchar(255) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品原价日志表';

-- ----------------------------
-- Table structure for pcm_pack_unit_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_pack_unit_dict`;
CREATE TABLE `pcm_pack_unit_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(100) DEFAULT NULL COMMENT '包装单位',
  `unit_desc` varchar(100) DEFAULT NULL COMMENT '包装描述',
  `status` int(4) DEFAULT '0' COMMENT '0可用 1删除',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包装单位字典表';

-- ----------------------------
-- Table structure for pcm_pay_channel
-- ----------------------------
DROP TABLE IF EXISTS `pcm_pay_channel`;
CREATE TABLE `pcm_pay_channel` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `pay_channel_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '支付渠道编码',
  `pay_channel_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '支付渠道名称',
  `pay_channel_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '支付渠道类型(0:父渠道，1:子渠道)',
  `parent_sid` bigint(20) DEFAULT NULL COMMENT '所属上级SID',
  `pay_channel_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `opt_user` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `opt_user_sid` bigint(20) DEFAULT NULL COMMENT '操作人SID',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `if_delete` int(20) DEFAULT NULL COMMENT '是否删除(0:为删除,1:已删除)',
  `c1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c3` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c4` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c5` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pcm_payment_organ
-- ----------------------------
DROP TABLE IF EXISTS `pcm_payment_organ`;
CREATE TABLE `pcm_payment_organ` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_sid` varchar(200) DEFAULT NULL COMMENT '门店SID',
  `code` varchar(20) DEFAULT NULL COMMENT '付款方式编码',
  `bank_bin` varchar(50) DEFAULT NULL COMMENT '银行标识',
  `status` int(1) DEFAULT '0' COMMENT '状态：0有效，1无效',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店和支付方式关联表';

-- ----------------------------
-- Table structure for pcm_payment_type
-- ----------------------------
DROP TABLE IF EXISTS `pcm_payment_type`;
CREATE TABLE `pcm_payment_type` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `code` varchar(20) DEFAULT NULL COMMENT '付款方式编码',
  `name` varchar(40) DEFAULT NULL COMMENT '付款方式名称',
  `parent_code` varchar(20) DEFAULT '0' COMMENT '上一级编码',
  `bank_bin` varchar(6) DEFAULT NULL COMMENT '银行识别码',
  `deal_time` varchar(20) DEFAULT NULL COMMENT '处理时间',
  `last_upd_by` varchar(32) DEFAULT NULL COMMENT '最后修改人',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `isallowinvoice` varchar(4) DEFAULT NULL,
  `ifdel` int(11) DEFAULT '0' COMMENT '是否有效：0有效，1无效',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付介质表';

-- ----------------------------
-- Table structure for pcm_photo_detail
-- ----------------------------
DROP TABLE IF EXISTS `pcm_photo_detail`;
CREATE TABLE `pcm_photo_detail` (
  `sid` bigint(255) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `brand_sid` bigint(20) NOT NULL DEFAULT '0',
  `brand_name` varchar(100) DEFAULT NULL,
  `pro_sku` varchar(255) DEFAULT NULL,
  `pro_color` varchar(255) DEFAULT NULL,
  `color_sid` bigint(20) DEFAULT NULL COMMENT '商品颜色SID',
  `company_name` varchar(255) DEFAULT NULL,
  `stock_num` decimal(41,0) DEFAULT NULL,
  `shop_sid` bigint(20) NOT NULL,
  `shop_name` varchar(100) DEFAULT NULL,
  `supply_sid` bigint(20) NOT NULL DEFAULT '0',
  `category_sid` varchar(200) DEFAULT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  `current_price` decimal(10,2) DEFAULT NULL,
  `current_off_value` decimal(13,2) DEFAULT NULL,
  `pro_supply_price_sid` bigint(20) DEFAULT '0',
  `pro_class_desc` varchar(255) DEFAULT NULL,
  `pro_class_sid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='照片明细表';

-- ----------------------------
-- Table structure for pcm_picture
-- ----------------------------
DROP TABLE IF EXISTS `pcm_picture`;
CREATE TABLE `pcm_picture` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'sid',
  `sku_sid` varchar(20) DEFAULT NULL COMMENT '商品sid',
  `picture_name` varchar(200) DEFAULT NULL COMMENT '图片名称',
  `picture_code` varchar(200) DEFAULT NULL COMMENT '图片编码',
  `is_primary` int(11) DEFAULT NULL COMMENT '是否主图 0:不是;1是,默认是(0)',
  `is_enable` int(11) DEFAULT NULL COMMENT '是否启用',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `c1` varchar(200) DEFAULT NULL,
  `c2` varchar(200) DEFAULT NULL,
  `c3` varchar(200) DEFAULT NULL,
  `c4` varchar(200) DEFAULT NULL,
  `c5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- ----------------------------
-- Table structure for pcm_picture_stan
-- ----------------------------
DROP TABLE IF EXISTS `pcm_picture_stan`;
CREATE TABLE `pcm_picture_stan` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `picture_width` varchar(200) DEFAULT NULL COMMENT '宽度',
  `picture_height` varchar(200) DEFAULT NULL COMMENT '高度',
  `is_original_image` int(11) DEFAULT NULL COMMENT '是否原图:0是，1不是，默认是(0)',
  `is_default_stan` int(11) DEFAULT NULL COMMENT '是否默认规格',
  `c1` varchar(200) DEFAULT NULL,
  `c2` varchar(200) DEFAULT NULL,
  `c3` varchar(200) DEFAULT NULL,
  `c4` varchar(200) DEFAULT NULL,
  `c5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='图片规格';

-- ----------------------------
-- Table structure for pcm_picture_url
-- ----------------------------
DROP TABLE IF EXISTS `pcm_picture_url`;
CREATE TABLE `pcm_picture_url` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_sid` varchar(200) DEFAULT NULL COMMENT '产品sid',
  `color_code` varchar(200) DEFAULT NULL COMMENT '色系',
  `picture_sid` varchar(200) DEFAULT NULL COMMENT '图片sid',
  `picture_name` varchar(200) DEFAULT NULL COMMENT '图片名称',
  `stan_sid` varchar(200) DEFAULT NULL COMMENT '规格sid',
  `picture_url` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `is_primary` int(11) DEFAULT '1' COMMENT '是否主图：0是，1否（默认1）',
  `is_model` int(11) DEFAULT '0' COMMENT '是否原图：0是，1否（默认0）',
  `is_thumbnail` int(11) DEFAULT '1' COMMENT '是否缩略图：0是，1否（默认1）',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `if_delete` int(11) DEFAULT '0' COMMENT '是否删除：0 否，1是（默认0）',
  `opt_name` varchar(200) DEFAULT NULL COMMENT '操作人',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `c1` varchar(200) DEFAULT NULL COMMENT '色系',
  `c2` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `IDX_PROPIC_SID` (`sku_sid`),
  KEY `IDX_COLOR_CODE` (`color_code`) USING BTREE,
  KEY `IDX_IS_PRIMARY` (`is_primary`) USING BTREE,
  KEY `IDX_IS_THUMBNAIL` (`is_thumbnail`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5137 DEFAULT CHARSET=utf8 COMMENT='图片url';

-- ----------------------------
-- Table structure for pcm_price
-- ----------------------------
DROP TABLE IF EXISTS `pcm_price`;
CREATE TABLE `pcm_price` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '价格表SID',
  `shoppe_pro_sid` varchar(50) DEFAULT NULL COMMENT '专柜商品sid',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `off_value` decimal(10,2) DEFAULT NULL COMMENT '折扣值，后台程序计算 promotion_price/original_price',
  `promotion_begin_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `price_type` int(11) DEFAULT NULL COMMENT '价格类型：1零售价 2 短期价',
  `attribute1` varchar(50) DEFAULT NULL COMMENT '变价编号',
  `ifdel` int(1) DEFAULT '0' COMMENT '是否删除：0：正常，1：删除',
  `product_sid` bigint(20) DEFAULT NULL COMMENT '商品SID',
  `promotion_backup` decimal(10,0) DEFAULT NULL,
  `channel_sid` varchar(10) DEFAULT '0' COMMENT '渠道sid',
  `unit` varchar(20) DEFAULT NULL COMMENT '货币单位',
  `price_channel` varchar(30) DEFAULT NULL,
  `promotion_no` int(4) DEFAULT NULL COMMENT '促销编号',
  `system_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系统时间',
  `attribute2` varchar(50) DEFAULT NULL,
  `attribute3` varchar(50) DEFAULT NULL,
  `attribute4` varchar(50) DEFAULT NULL,
  `attribute5` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `IDX_PCMPRICE_SHOPPEPROSID` (`shoppe_pro_sid`)
) ENGINE=InnoDB AUTO_INCREMENT=32595 DEFAULT CHARSET=utf8 COMMENT='商品价格表';

-- ----------------------------
-- Table structure for pcm_price_his
-- ----------------------------
DROP TABLE IF EXISTS `pcm_price_his`;
CREATE TABLE `pcm_price_his` (
  `sid` bigint(20) NOT NULL COMMENT '价格表SID',
  `shoppe_pro_sid` varchar(50) DEFAULT NULL COMMENT '专柜商品sid',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `off_value` decimal(10,2) DEFAULT NULL COMMENT '折扣值，后台程序计算 promotion_price/original_price',
  `promotion_begin_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `product_sid` bigint(20) DEFAULT NULL COMMENT '商品SID',
  `promotion_backup` decimal(10,2) DEFAULT NULL,
  `channel_sid` int(4) DEFAULT '0' COMMENT '渠道sid',
  `unit` varchar(20) DEFAULT NULL COMMENT '货币单位',
  `price_channel` varchar(30) DEFAULT NULL,
  `promotion_no` int(4) DEFAULT NULL COMMENT '促销编号',
  `price_type` int(11) DEFAULT NULL COMMENT '价格类型：1零售价 2 短期价',
  `system_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '系统时间',
  `ifdel` int(1) DEFAULT '0' COMMENT '是否删除：0：正常，1：删除',
  `attribute1` varchar(50) DEFAULT NULL,
  `attribute2` varchar(50) DEFAULT NULL,
  `attribute3` varchar(50) DEFAULT NULL,
  `attribute4` varchar(50) DEFAULT NULL,
  `attribute5` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品价格表';

-- ----------------------------
-- Table structure for pcm_pro_detail
-- ----------------------------
DROP TABLE IF EXISTS `pcm_pro_detail`;
CREATE TABLE `pcm_pro_detail` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品明细SID',
  `product_detail_sid` varchar(20) DEFAULT NULL COMMENT '商品明细表编码',
  `pro_detail_name` varchar(200) DEFAULT NULL COMMENT 'SKU标准品名',
  `product_sid` bigint(20) DEFAULT NULL COMMENT '产品表编码',
  `pro_stan_sid` varchar(20) DEFAULT NULL COMMENT '规格编码',
  `pro_color_sid` int(20) DEFAULT NULL COMMENT '色系SID',
  `pro_color_name` varchar(255) DEFAULT NULL COMMENT '商品色码',
  `pro_color_alias` varchar(255) DEFAULT NULL COMMENT '色码名称',
  `pro_stan_name` varchar(255) DEFAULT NULL COMMENT '规格名称',
  `features` varchar(20) DEFAULT NULL COMMENT '特性',
  `article_num` varchar(20) DEFAULT NULL COMMENT '货号',
  `memo` varchar(400) DEFAULT NULL COMMENT '商品颜色为图片颜色',
  `barcode` varchar(255) DEFAULT NULL COMMENT '条码',
  `pro_wri_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '录入时间',
  `photo_sale_code_sid` varchar(20) DEFAULT NULL COMMENT '送去拍照的销售编码SID',
  `photo_status` int(4) DEFAULT '0' COMMENT '照片状态：0未拍照 1拍照系统已获取 3已拍照已上传 4已编辑 默认 0',
  `opt_user_sid` bigint(20) DEFAULT NULL COMMENT '操作用户SID',
  `opt_real_name` varchar(40) DEFAULT NULL COMMENT '操作用户real_name',
  `opt_update_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `plan_maker` varchar(255) DEFAULT NULL COMMENT '拍照计划制定人',
  `plan_time` timestamp NULL DEFAULT NULL COMMENT 'SKU上架时间',
  `photo_plan_sid` varchar(20) DEFAULT '0' COMMENT '拍照上线计划(sku):0未加入上线计划;1已加入上线计划;2发布上线计划 默认 0',
  `pro_active_bit` int(4) DEFAULT '1' COMMENT '是否启用  1 启用 0 未启用',
  `pro_type` int(4) DEFAULT '1' COMMENT '商品类型 ： 1 普通商品（实物类），2 赠品 ，3 礼品，4 虚拟商品（充值卡，购物卡），5 服务类商品 （礼品包装，购物接送服务，停车服务）（注：礼品不可卖，赠品可卖）',
  `selling_status` int(4) DEFAULT '0' COMMENT '上架状态:0 未上架，1 已上架，2 已下架',
  `search_key` varchar(255) DEFAULT NULL COMMENT '关键字',
  `key_word` varchar(255) DEFAULT NULL COMMENT '活动关键字',
  `size_picture_url` varchar(255) DEFAULT '1' COMMENT '库存状态：0有货，1无货（旧：尺码图片路径）',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `baihuo` (`product_sid`,`pro_stan_sid`,`pro_color_sid`,`pro_color_name`) USING BTREE,
  UNIQUE KEY `chaoshi` (`product_sid`,`pro_stan_sid`,`features`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11236 DEFAULT CHARSET=utf8 COMMENT='商品明细表（SKU）';

-- ----------------------------
-- Table structure for pcm_pro_input
-- ----------------------------
DROP TABLE IF EXISTS `pcm_pro_input`;
CREATE TABLE `pcm_pro_input` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `contract_sid` bigint(20) DEFAULT NULL COMMENT '合同表sid',
  `contract_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '要约号',
  `order_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '单据号',
  `shoppe_pro_sid` bigint(20) DEFAULT NULL COMMENT '专柜商品sid',
  `procurement_user_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '采购人员编码',
  `input_user_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '录入人员编码',
  `col1` varchar(255) COLLATE utf8_bin DEFAULT '0' COMMENT '有效状态0有效，1无效',
  `col2` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段',
  `col3` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`sid`),
  KEY `PCM_PRO_INPUT_CONTRACT_CODE` (`contract_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11234 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='专柜商品与要约信息临时表';

-- ----------------------------
-- Table structure for pcm_product
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product`;
CREATE TABLE `pcm_product` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品sid',
  `product_sid` varchar(20) DEFAULT NULL COMMENT '产品表sid',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'SPU标准品名',
  `primary_attr` varchar(20) DEFAULT NULL COMMENT '主属性',
  `product_sku` varchar(100) DEFAULT NULL COMMENT '商品SKU(款号)',
  `brand_sid` varchar(20) DEFAULT NULL COMMENT '品牌编码',
  `brand_root_sid` varchar(20) DEFAULT NULL COMMENT '品牌sid',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `pro_active_bit` int(4) DEFAULT '1' COMMENT '是否启用:0未启用 1启用 默认 1',
  `pro_selling` int(4) DEFAULT '0' COMMENT '是否上架:0未上架 1上架 2已下架 默认 0',
  `activity_flg` int(4) DEFAULT NULL COMMENT '活动标志：1非活动；活动的值根据活动接口类型待定（活动系统舍弃，走促销系统）',
  `pro_picture` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `category_sid` bigint(20) DEFAULT NULL COMMENT '品类SID   (暂时不用)',
  `sex_sid` int(4) DEFAULT '0' COMMENT '适合性别',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `awesome` bigint(20) DEFAULT '0' COMMENT '赞',
  `pro_desc_sid` bigint(20) DEFAULT NULL COMMENT '商品页描述id',
  `product_name_alias` varchar(255) DEFAULT NULL COMMENT '商品别名',
  `pro_selling_time` timestamp NULL DEFAULT NULL COMMENT '上架时间',
  `article_num` varchar(100) DEFAULT NULL COMMENT '货号',
  `year_to_market` varchar(10) DEFAULT NULL COMMENT '上市年份',
  `short_des` varchar(500) DEFAULT NULL COMMENT '短描述',
  `edit_flag` int(4) DEFAULT '0' COMMENT '二次编辑标识: 0 一次  1二次 默认为0',
  `special_des` varchar(500) DEFAULT NULL COMMENT '特别说明',
  `season_code` varchar(10) DEFAULT NULL COMMENT '季节表sid',
  `industry_condition` int(4) DEFAULT NULL COMMENT '业态(0百货,1超市,2电商)',
  `long_desc` varchar(500) DEFAULT NULL COMMENT '文本描述',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `baihuo` (`brand_root_sid`,`product_sku`) USING BTREE,
  UNIQUE KEY `chaoshi` (`primary_attr`,`product_sku`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8511 DEFAULT CHARSET=utf8 COMMENT='产品表（SPU）';

-- ----------------------------
-- Table structure for pcm_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product_category`;
CREATE TABLE `pcm_product_category` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_sid` bigint(20) NOT NULL,
  `channel_sid` bigint(20) DEFAULT NULL,
  `category_sid` bigint(20) NOT NULL,
  `opt_user` varchar(50) DEFAULT NULL,
  `opt_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`),
  KEY `IDX_PRODUCTCATEGORY_PRODUCTSID` (`product_sid`) USING BTREE,
  KEY `IDX_PRODUCTCATEGORY_CHANNELSID` (`channel_sid`) USING BTREE,
  KEY `IDX_PRODUCTCATEGORY_CATEGORYSID` (`category_sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20109 DEFAULT CHARSET=utf8 COMMENT='商品品类关联表';

-- ----------------------------
-- Table structure for pcm_product_class
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product_class`;
CREATE TABLE `pcm_product_class` (
  `sid` int(22) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(20) DEFAULT NULL COMMENT '序号',
  `node_name` varchar(50) DEFAULT NULL COMMENT '节点名称',
  `father_node_sid` decimal(22,0) DEFAULT NULL COMMENT '父节点',
  `root_node_sid` int(22) DEFAULT NULL COMMENT '根节点',
  `is_display` int(1) DEFAULT NULL COMMENT '是否展示',
  `memo` varchar(100) DEFAULT NULL COMMENT '备注',
  `node_level` int(1) NOT NULL COMMENT '节点等级',
  `is_leaf` int(1) DEFAULT '0' COMMENT '是否叶子节点',
  `node_seq` int(2) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站分类导航信息表';

-- ----------------------------
-- Table structure for pcm_product_desc
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product_desc`;
CREATE TABLE `pcm_product_desc` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品描述id',
  `product_sid` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品编码',
  `color` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '色系',
  `content` blob COMMENT '商品描述',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COMMENT='商品描述表(精包装描述)';

-- ----------------------------
-- Table structure for pcm_product_memo
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product_memo`;
CREATE TABLE `pcm_product_memo` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sku_sid` varchar(20) DEFAULT NULL COMMENT '商品sid',
  `sku_info` varchar(500) DEFAULT NULL COMMENT '商品文描信息',
  `if_delete` int(11) DEFAULT NULL,
  `c1` varchar(255) DEFAULT NULL,
  `c2` varchar(255) DEFAULT NULL COMMENT '是否删除：0否，1是',
  `c3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品文描信息';

-- ----------------------------
-- Table structure for pcm_product_online_limit
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product_online_limit`;
CREATE TABLE `pcm_product_online_limit` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_sid` bigint(20) DEFAULT NULL COMMENT '品牌sid',
  `category_sid` bigint(20) DEFAULT NULL COMMENT '品类sid',
  `limit_value` int(11) DEFAULT NULL COMMENT '阀值',
  `status` int(11) DEFAULT NULL COMMENT '阀值状态:0启用，1禁用',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `opt_name` varchar(50) DEFAULT NULL COMMENT '操作人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `field1` varchar(20) DEFAULT NULL,
  `field2` varchar(20) DEFAULT NULL,
  `field3` varchar(20) DEFAULT NULL,
  `field4` varchar(20) DEFAULT NULL,
  `field5` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品上下架库存阀值管理';

-- ----------------------------
-- Table structure for pcm_product_parameters
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product_parameters`;
CREATE TABLE `pcm_product_parameters` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'SID',
  `product_sid` bigint(20) DEFAULT NULL COMMENT '商品SID',
  `channel_sid` bigint(20) DEFAULT NULL COMMENT '渠道SID:1	实体店;2 网站;3 当当;4 天猫',
  `category_sid` bigint(20) DEFAULT NULL COMMENT '品类SID',
  `category_name` varchar(200) DEFAULT NULL COMMENT '品类名称',
  `prop_sid` bigint(20) DEFAULT NULL COMMENT '属性SID',
  `prop_name` varchar(200) DEFAULT NULL COMMENT '属性名',
  `category_type` int(11) DEFAULT '0' COMMENT '分类类型，3展示分类',
  `value_sid` bigint(20) DEFAULT NULL COMMENT '属性值SID',
  `value_name` varchar(200) DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`sid`),
  KEY `IDX_PRODUCTPARAMETERS_PRODUCTSID` (`product_sid`),
  KEY `IDX_PRODUCTPARAMETERS_CHANNERLSID` (`channel_sid`),
  KEY `IDX_PRODUCTPARAMETERS_PROPSID` (`prop_sid`),
  KEY `IDX_PRODUCTPARAMETERS_VALUESID` (`value_sid`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Table structure for pcm_product_picture
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product_picture`;
CREATE TABLE `pcm_product_picture` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'SID',
  `product_sid` bigint(20) DEFAULT NULL COMMENT '商品SID',
  `pro_pict_name` varchar(100) DEFAULT NULL COMMENT '图片文件名称',
  `pro_pict_dir` varchar(200) DEFAULT NULL COMMENT '图片存放目录',
  `pro_pict_order` int(4) DEFAULT NULL COMMENT '图片顺序号',
  `picture_model_bit` int(4) DEFAULT NULL COMMENT '是否是模特 1 是 0不是  默认0',
  `picture_master_bit` int(4) DEFAULT NULL COMMENT '是否产品主图  1 是 0不是 默认0 ',
  `pro_color_sid` bigint(20) DEFAULT NULL COMMENT '色码表SID',
  `pro_color_name` varchar(255) DEFAULT NULL COMMENT '商品颜色名称',
  `pro_color_alias` varchar(255) DEFAULT NULL COMMENT '商品颜色别名',
  `pro_picture_size_sid` bigint(20) DEFAULT NULL COMMENT '图片尺寸类型表（pro_pricture_size）SID',
  `pro_picture_sid` bigint(20) DEFAULT NULL COMMENT '商品图片表SID',
  `color_master_pic_bit` int(4) DEFAULT NULL COMMENT '颜色主图标志位',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品图片表';

-- ----------------------------
-- Table structure for pcm_product_tag
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product_tag`;
CREATE TABLE `pcm_product_tag` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_sid` varchar(20) DEFAULT NULL COMMENT '产品sid',
  `tag_sid` bigint(20) DEFAULT NULL COMMENT '标签sid',
  `flag` int(4) DEFAULT NULL COMMENT '有效标记：0 可用，1 禁用 （默认为0)',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `opt_user_sid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='产品标签关联表';

-- ----------------------------
-- Table structure for pcm_product_type_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_product_type_dict`;
CREATE TABLE `pcm_product_type_dict` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL COMMENT '商品类型名称',
  `type_desc` varchar(50) DEFAULT NULL COMMENT '类型描述',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商品类型字典表';

-- ----------------------------
-- Table structure for pcm_promotion_rate_product
-- ----------------------------
DROP TABLE IF EXISTS `pcm_promotion_rate_product`;
CREATE TABLE `pcm_promotion_rate_product` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_pro_sid` bigint(20) DEFAULT NULL COMMENT '专柜商品SID',
  `promotion_rate_code_sid` bigint(20) DEFAULT NULL COMMENT '促销扣率码',
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `opt_user_sid` bigint(20) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='促销扣率码商品';

-- ----------------------------
-- Table structure for pcm_promotion_rule
-- ----------------------------
DROP TABLE IF EXISTS `pcm_promotion_rule`;
CREATE TABLE `pcm_promotion_rule` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `promotion_title` varchar(200) DEFAULT NULL COMMENT '活动标题',
  `brand_sid` bigint(20) DEFAULT NULL COMMENT '品牌sid',
  `category_sid` bigint(20) DEFAULT NULL COMMENT '分类SID',
  `shoppe_pro_sid` bigint(20) DEFAULT NULL COMMENT '专柜商品SID',
  `mode` varchar(10) DEFAULT NULL COMMENT '模式',
  `refer_price` varchar(10) DEFAULT NULL COMMENT '涉及价格',
  `opt` varchar(10) DEFAULT NULL COMMENT '操作（+ —）',
  `off_value` bigint(20) DEFAULT NULL COMMENT '折扣值',
  `money` bigint(20) DEFAULT NULL COMMENT '金额',
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `opt_user` varchar(50) DEFAULT NULL COMMENT '操作者',
  `opt_time` timestamp NULL DEFAULT NULL,
  `restore_sql` varchar(1000) DEFAULT NULL COMMENT '恢复sql',
  `change_sql` varchar(1000) DEFAULT NULL COMMENT '变化sql',
  `promotion_number` bigint(20) DEFAULT NULL COMMENT '活动号',
  `priority` bigint(20) DEFAULT NULL COMMENT '优先级',
  `flag` bigint(20) DEFAULT NULL COMMENT '标记',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='促销活动规则';

-- ----------------------------
-- Table structure for pcm_propackimg_url
-- ----------------------------
DROP TABLE IF EXISTS `pcm_propackimg_url`;
CREATE TABLE `pcm_propackimg_url` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_sid` varchar(200) DEFAULT NULL COMMENT '产品sid',
  `color_code` varchar(200) DEFAULT NULL COMMENT '色系',
  `picture_url` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `c1` varchar(20) DEFAULT NULL COMMENT '色系',
  `c2` varchar(20) DEFAULT NULL,
  `c3` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `IDX_PROPIC_SID` (`sku_sid`),
  KEY `IDX_COLOR_CODE` (`color_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='精包装图片';

-- ----------------------------
-- Table structure for pcm_property_change
-- ----------------------------
DROP TABLE IF EXISTS `pcm_property_change`;
CREATE TABLE `pcm_property_change` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(20) DEFAULT NULL COMMENT '单据号',
  `bill_type` int(4) DEFAULT NULL COMMENT '单据类别(修改的属性)\r\n1-spu换统计分类;\r\n2-专柜商品换品牌;\r\n3-专柜商品换专柜;',
  `product_code` varchar(20) DEFAULT NULL COMMENT '所变更商品编码(或sid)',
  `new_value` varchar(20) DEFAULT NULL COMMENT '新值',
  `old_value` varchar(20) DEFAULT NULL COMMENT '旧值',
  `json_text` text COMMENT '请求json',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `active_time` timestamp NULL DEFAULT NULL COMMENT '生效日期',
  `create_name` varchar(20) DEFAULT NULL COMMENT '创建人',
  `is_scan` int(4) DEFAULT '0' COMMENT '已操作标记 0未操作 1已操作 2操作失败',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品属性变更单据表';

-- ----------------------------
-- Table structure for pcm_redis
-- ----------------------------
DROP TABLE IF EXISTS `pcm_redis`;
CREATE TABLE `pcm_redis` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `redisfField` varchar(100) DEFAULT NULL COMMENT '域',
  `keyname` varchar(100) DEFAULT NULL,
  `value` text,
  `status` int(11) DEFAULT NULL COMMENT '处理状态 0:未处理，1:已处理',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '系统时间',
  `filed1` varchar(20) DEFAULT NULL,
  `filed2` varchar(20) DEFAULT NULL,
  `filed3` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4452 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pcm_region
-- ----------------------------
DROP TABLE IF EXISTS `pcm_region`;
CREATE TABLE `pcm_region` (
  `sid` bigint(22) NOT NULL AUTO_INCREMENT,
  `region_code` varchar(20) DEFAULT NULL COMMENT '区域邮编',
  `region_inner_code` varchar(20) DEFAULT NULL,
  `region_name` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `parent_id` bigint(22) DEFAULT NULL COMMENT '所属上级',
  `region_level` int(4) DEFAULT NULL COMMENT '等级（0 省，1 市，3 区，3 县，4 镇 ）',
  `region_order` int(4) DEFAULT NULL COMMENT '顺序',
  `region_name_en` varchar(100) DEFAULT NULL COMMENT '区域名称拼音',
  `region_shortname_en` varchar(20) DEFAULT NULL COMMENT '区域名称拼音简称',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4588 DEFAULT CHARSET=utf8 COMMENT='行政区域表';

-- ----------------------------
-- Table structure for pcm_sale_code
-- ----------------------------
DROP TABLE IF EXISTS `pcm_sale_code`;
CREATE TABLE `pcm_sale_code` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `supply_sid` bigint(20) DEFAULT NULL COMMENT '供应商信息表SID',
  `shoppe_sid` bigint(20) DEFAULT NULL COMMENT '专柜SID',
  `sale_code` varchar(100) NOT NULL COMMENT '从erp中取的商品编码（销售编码）类似专柜码',
  `opt_user_sid` bigint(20) DEFAULT NULL COMMENT '操作用户sid',
  `opt_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `memo` varchar(400) DEFAULT NULL COMMENT '操作时间',
  `supply_saling_time` timestamp NULL DEFAULT NULL,
  `supply_shop_code` varchar(100) DEFAULT NULL COMMENT '供应商专柜码=供应商编码+店号+供应商在店内的流水',
  `contract_code` varchar(255) DEFAULT NULL COMMENT '合同编码',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售码表（扣率码表）';

-- ----------------------------
-- Table structure for pcm_sale_unit_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_sale_unit_dict`;
CREATE TABLE `pcm_sale_unit_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '销售单位',
  `unit_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '销售单位名称',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COMMENT='销售单位字典表';

-- ----------------------------
-- Table structure for pcm_season_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_season_dict`;
CREATE TABLE `pcm_season_dict` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `season` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '季节(春、夏、秋、冬、春秋、春夏、秋冬、四季)',
  `season_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '季节编码',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='季节字典表';

-- ----------------------------
-- Table structure for pcm_sequence
-- ----------------------------
DROP TABLE IF EXISTS `pcm_sequence`;
CREATE TABLE `pcm_sequence` (
  `seq` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `current_value` int(11) DEFAULT NULL,
  `increment` int(11) DEFAULT '1',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=1456 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pcm_shop_brand_relation
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shop_brand_relation`;
CREATE TABLE `pcm_shop_brand_relation` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_sid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门店SID',
  `brand_sid` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '门店品牌sid',
  `brand_group_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '集团品牌编码',
  `brand_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `status` int(4) DEFAULT NULL COMMENT '有效标记（0：有效，1：无效，默认0）',
  PRIMARY KEY (`sid`),
  KEY `IDX_SHOPSID` (`shop_sid`) USING BTREE,
  KEY `IDX_BRANDSID` (`brand_sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10742 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for pcm_shoppe
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe`;
CREATE TABLE `pcm_shoppe` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_sid` bigint(20) DEFAULT NULL COMMENT '所属集团sid',
  `shop_sid` bigint(20) DEFAULT NULL COMMENT '所属门店SID',
  `floor_sid` bigint(20) DEFAULT NULL COMMENT '专柜所属楼层SID',
  `industry_condition_sid` int(4) DEFAULT NULL COMMENT '专柜所属业态(0百货, 1超市,2电商)',
  `shoppe_code` varchar(50) DEFAULT NULL COMMENT '专柜编码',
  `shoppe_name` varchar(200) DEFAULT NULL COMMENT '专柜名称',
  `shoppe_type` varchar(20) DEFAULT NULL COMMENT '专柜类型(01 单品管理专柜 02 非单品管理专柜)',
  `shoppe_status` int(4) DEFAULT NULL COMMENT '1，正常；2，停用；3，撤柜（默认1）',
  `goods_manage_type` int(4) DEFAULT NULL COMMENT '专柜库存管理类型(1单品 2 非单品)',
  `business_type_sid` int(4) DEFAULT NULL COMMENT '经营方式SID：      \r\n0-(Z001 经销);  \r\n1-(Z002 代销);  \r\n2-(Z003 联营);  \r\n3-(Z004 平台服务);  \r\n4-(Z005 租赁);  ',
  `opt_user` varchar(200) DEFAULT NULL COMMENT '最后一次修改人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_name` varchar(200) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `shoppe_group` varchar(20) DEFAULT NULL COMMENT '柜组',
  `shoppe_shipping_point` varchar(50) DEFAULT NULL COMMENT '专柜集货地点(对应同一大区下面的门店编码)',
  `ref_counter` varchar(15) DEFAULT NULL COMMENT '参考奥莱专柜',
  `negative_stock` int(4) DEFAULT NULL COMMENT '是否负库存销售 ：0 允许，1不允许（默认为0）',
  `is_shipping_point` int(4) unsigned DEFAULT NULL COMMENT '是否集货(0是，1否）',
  PRIMARY KEY (`sid`),
  KEY `IDX_SID` (`sid`),
  KEY `IDX_STUTAS` (`shoppe_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5663 DEFAULT CHARSET=utf8 COMMENT='专柜表';

-- ----------------------------
-- Table structure for pcm_shoppe_brand_relation
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe_brand_relation`;
CREATE TABLE `pcm_shoppe_brand_relation` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_sid` bigint(20) DEFAULT NULL COMMENT '专柜sid',
  `brand_sid` bigint(20) DEFAULT NULL COMMENT '品牌sid',
  `status` int(4) DEFAULT NULL COMMENT '有效标记：0有效，1无效（默认为0）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专柜品牌关联关系表';

-- ----------------------------
-- Table structure for pcm_shoppe_pro_relation
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe_pro_relation`;
CREATE TABLE `pcm_shoppe_pro_relation` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` bigint(20) NOT NULL COMMENT '子商品编码',
  `parent_code` bigint(20) NOT NULL COMMENT '母商品编码',
  `amount` int(4) NOT NULL DEFAULT '1' COMMENT '倍率',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='子母商品关系表';

-- ----------------------------
-- Table structure for pcm_shoppe_product
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe_product`;
CREATE TABLE `pcm_shoppe_product` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品编码',
  `product_detail_sid` bigint(20) DEFAULT NULL COMMENT '商品(SKU)表 SID',
  `shoppe_sid` bigint(50) DEFAULT NULL COMMENT '专柜表 SID',
  `supply_sid` bigint(100) DEFAULT NULL COMMENT '供应商表 SID',
  `brand_sid` bigint(20) DEFAULT NULL COMMENT '门店品牌 SID',
  `category_sid` varchar(20) DEFAULT NULL COMMENT '管理分类 编码',
  `rate_code` varchar(100) DEFAULT NULL COMMENT '扣率码',
  `shoppe_pro_name` varchar(200) DEFAULT NULL COMMENT '专柜商品名称',
  `shoppe_pro_alias` varchar(200) DEFAULT NULL COMMENT '专柜商品简称',
  `sale_status` int(4) DEFAULT NULL COMMENT '专柜商品可售状态:0 可售，1 不可售(默认为0）',
  `shoppe_pro_type` int(4) DEFAULT '1' COMMENT '专柜商品类型:1 普通商品，2 大码商品（默认为1）',
  `negative_stock` int(4) DEFAULT '0' COMMENT '是否负库存销售 ：0 允许，1不允许（默认为0）---不用了',
  `is_stock` int(4) DEFAULT '0' COMMENT '是否管库存 0 管库存，1 不管库存（默认为0）',
  `measure_unit_dict_sid` bigint(20) DEFAULT NULL COMMENT '计量单位表SID(暂时不用)',
  `pack_unit_dict_sid` bigint(20) DEFAULT NULL COMMENT '包装单位表SID（暂时不用）',
  `sale_unit_code` varchar(20) DEFAULT NULL COMMENT '销售单位',
  `erpProductCode` varchar(50) DEFAULT NULL COMMENT 'ERP商品编码',
  `supply_product_code` varchar(50) DEFAULT NULL COMMENT '供应商商品编码',
  `is_cod` int(4) DEFAULT '1' COMMENT '是否支持货到付款(0支持；1不支持)',
  `is_gift` int(4) DEFAULT '0' COMMENT '赠品范围（缺省值为0。\r\n0表示正常商品，\r\n1表示可以单独销售也可以作为本专柜内的赠品，\r\n2表示可以单独销售也可以作为本门店内的赠品，\r\n3表示可以单独销售也可以作为全渠道的赠品，\r\n4表示不可单独销售但是可以作为本专柜内的赠品，\r\n5表示不可单独销售但可以作为本门店内的赠品，\r\n6表示不可单独销售但可以作为全渠道的赠品。）暂时不用',
  `is_discountable` int(4) DEFAULT NULL COMMENT '是否可打折( 0 是,1 否, 默认0)',
  `tms_param` int(4) DEFAULT NULL COMMENT '物流属性   1.Z001液体  2.Z002易碎  3.Z003液体与易碎  4.Z004粉末',
  `discountLimit` varchar(20) DEFAULT NULL COMMENT '折扣底限(0到1.00之间的小数)',
  `is_packing` int(4) DEFAULT '0' COMMENT '可否包装(0可 1否 默认0）  (暂时不用)',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `stock_mode` int(4) DEFAULT NULL COMMENT '库存方式  1.ZK 自库  2.XK 虚库  3.BG 不管库存',
  `input_tax` decimal(10,2) DEFAULT NULL COMMENT '进项税',
  `output_tax` decimal(10,2) DEFAULT NULL COMMENT '销项税',
  `sales_tax` decimal(10,2) DEFAULT NULL COMMENT '消费税',
  `purchase_price` decimal(10,2) DEFAULT NULL COMMENT '扣率/进价',
  `buying_price` decimal(10,2) DEFAULT NULL COMMENT '扣率/含税进价',
  `process_type` int(4) DEFAULT NULL COMMENT '加工类型 1.单品   2.分割原材料  3.原材料  4.成品',
  `origin_land` varchar(20) DEFAULT NULL COMMENT '产地',
  `origin_land2` varchar(20) DEFAULT NULL COMMENT '原产地',
  `order_type` int(4) DEFAULT NULL COMMENT '订货类别  1.集采统配  2.集采直入  3.集采补货  4.不管库存  5.门店订货',
  `is_promotion` int(4) DEFAULT NULL COMMENT '是否允许ERP促销 (0 是 1 不是)',
  `is_adjust_price` int(4) DEFAULT NULL COMMENT '是否允许EPR调价 (0 是 1 不是)',
  `field1` varchar(20) DEFAULT NULL COMMENT '备注',
  `field2` varchar(20) DEFAULT NULL COMMENT '自营WFJ',
  `field3` varchar(20) DEFAULT NULL COMMENT '货号',
  `field4` varchar(20) DEFAULT NULL COMMENT '原系统商品编码',
  `field5` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `baihuo` (`product_detail_sid`,`shoppe_sid`,`supply_sid`) USING BTREE,
  UNIQUE KEY `chaoshi` (`product_detail_sid`,`shoppe_sid`,`supply_sid`,`sale_unit_code`),
  KEY `IDX_shoppe_pro_sid` (`shoppe_pro_sid`),
  KEY `IDX_F4` (`field4`)
) ENGINE=InnoDB AUTO_INCREMENT=11247 DEFAULT CHARSET=utf8 COMMENT='专柜商品表';

-- ----------------------------
-- Table structure for pcm_shoppe_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe_product_category`;
CREATE TABLE `pcm_shoppe_product_category` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品SID',
  `category_sid` varchar(20) DEFAULT NULL COMMENT '管理分类SID',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='专柜商品管理分类关联表';

-- ----------------------------
-- Table structure for pcm_shoppe_product_edi_relation
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe_product_edi_relation`;
CREATE TABLE `pcm_shoppe_product_edi_relation` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品编码',
  `channel_pro_sid` varchar(50) DEFAULT NULL COMMENT '渠道商品编码',
  `channel_code` varchar(20) DEFAULT NULL COMMENT '渠道编码',
  `is_presell` int(11) DEFAULT '0' COMMENT '是否预售(0,否；1,是;默认0)',
  `is_pay_reducestock` int(11) DEFAULT '1' COMMENT '是否支付减库存(1,否；2,是;默认1)',
  `ifdel` int(11) DEFAULT '1' COMMENT '有效标识(0,否；1,是;默认1)',
  `field1` varchar(20) DEFAULT NULL,
  `field2` varchar(20) DEFAULT NULL,
  `field3` varchar(20) DEFAULT NULL,
  `field4` varchar(20) DEFAULT NULL,
  `field5` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `IDX_shoppe_pro_sid` (`shoppe_pro_sid`),
  KEY `IDX_field1` (`field1`)
) ENGINE=InnoDB AUTO_INCREMENT=38505 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pcm_shoppe_product_extend
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe_product_extend`;
CREATE TABLE `pcm_shoppe_product_extend` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_pro_sid` bigint(20) DEFAULT NULL COMMENT '专柜商品表SID',
  `is_card` varchar(20) DEFAULT '1' COMMENT '可贺卡:0是，1否,默认(1)',
  `base_unit_code` varchar(20) DEFAULT NULL COMMENT '基本计量单位',
  `origin_country` varchar(20) DEFAULT NULL COMMENT '原产国',
  `is_origin_package` varchar(20) DEFAULT '1' COMMENT '是否有原厂包装：0是，1否,默认(1)',
  `xxhc_flag` varchar(20) DEFAULT '1' COMMENT '先销后采:0是，1否,默认(1)',
  `zcolor` varchar(20) DEFAULT NULL COMMENT '特性-颜色',
  `zsize` varchar(20) DEFAULT NULL COMMENT '特性-尺码/规格',
  `field1` varchar(20) DEFAULT NULL COMMENT '商品类别:1 自营单品,3:金额码,4:销售条码,05 金银首饰,06 服务费商品,07 租赁商品,,8 联营单品,09 组包码',
  `field2` varchar(20) DEFAULT NULL COMMENT '原价',
  `field3` varchar(20) DEFAULT NULL COMMENT '扣率',
  `field4` varchar(20) DEFAULT NULL COMMENT '电商商品类型',
  `field5` varchar(20) DEFAULT NULL COMMENT '总货架寿命',
  `field6` varchar(20) DEFAULT NULL COMMENT '剩余货架寿命',
  `field7` varchar(20) DEFAULT NULL,
  `field8` varchar(20) DEFAULT NULL,
  `field9` varchar(20) DEFAULT NULL,
  `field10` varchar(20) DEFAULT NULL,
  `field11` varchar(20) DEFAULT NULL,
  `field12` varchar(20) DEFAULT NULL,
  `field13` varchar(20) DEFAULT NULL,
  `field14` varchar(20) DEFAULT NULL,
  `field15` varchar(20) DEFAULT NULL,
  `field16` varchar(20) DEFAULT NULL,
  `field17` varchar(20) DEFAULT NULL,
  `field18` varchar(20) DEFAULT NULL,
  `field19` varchar(20) DEFAULT NULL,
  `field20` varchar(20) DEFAULT NULL,
  `field21` varchar(20) DEFAULT NULL,
  `store_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `IDX_PRO_shoppeprosid` (`shoppe_pro_sid`)
) ENGINE=InnoDB AUTO_INCREMENT=11224 DEFAULT CHARSET=utf8 COMMENT='专柜商品扩展表';

-- ----------------------------
-- Table structure for pcm_shoppe_product_parameters
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe_product_parameters`;
CREATE TABLE `pcm_shoppe_product_parameters` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品SID',
  `category_sid` varchar(20) DEFAULT NULL COMMENT '管理分类SID',
  `props_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性名',
  `props_value` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='专柜商品属性表';

-- ----------------------------
-- Table structure for pcm_shoppe_product_supply
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe_product_supply`;
CREATE TABLE `pcm_shoppe_product_supply` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `supply_sid` bigint(20) DEFAULT NULL COMMENT '供应商sid',
  `shoppe_product_sid` bigint(20) DEFAULT NULL COMMENT '专柜商品sid',
  `shop_sid` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '门店sid',
  `product_sid` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '门店或者电商ERP的商品编码对应的sid',
  `status` int(4) DEFAULT '0' COMMENT '有效标记(0有效,1无效)',
  PRIMARY KEY (`sid`),
  KEY `IDX_shoppe_pro_sid` (`shoppe_product_sid`),
  KEY `IDX_supply_sid` (`supply_sid`)
) ENGINE=InnoDB AUTO_INCREMENT=11328 DEFAULT CHARSET=latin1 COMMENT='专柜商品供应商关联表';

-- ----------------------------
-- Table structure for pcm_shoppe_shipping_point_relation
-- ----------------------------
DROP TABLE IF EXISTS `pcm_shoppe_shipping_point_relation`;
CREATE TABLE `pcm_shoppe_shipping_point_relation` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_sid` bigint(20) DEFAULT NULL COMMENT '专柜SID',
  `shipping_point_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '集货仓编码',
  `status` int(4) DEFAULT NULL COMMENT '状态：0有效，1无效（默认为0）',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='专柜与集货仓对应关系表';

-- ----------------------------
-- Table structure for pcm_stan_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_stan_dict`;
CREATE TABLE `pcm_stan_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_stan_name` varchar(200) DEFAULT NULL COMMENT '规格名称',
  `pro_stan_sid` varchar(255) DEFAULT NULL COMMENT '规格编码',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `brand_root_sid` varchar(255) DEFAULT NULL COMMENT '集团品牌sid',
  `brand_sid` varchar(20) DEFAULT NULL COMMENT '门店品牌sid (暂时不用)',
  `atinn` varchar(255) DEFAULT NULL,
  `category_sid` bigint(20) DEFAULT NULL COMMENT '工业分类sid',
  `clint` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_sid` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8 COMMENT='规格字典表';

-- ----------------------------
-- Table structure for pcm_stock
-- ----------------------------
DROP TABLE IF EXISTS `pcm_stock`;
CREATE TABLE `pcm_stock` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '库存表SID',
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品SID',
  `stock_type_sid` int(4) DEFAULT NULL COMMENT '库存类型SID：1001销售库;1002残次品库;1003退货商品库;1004锁定库',
  `pro_sum` bigint(20) DEFAULT NULL COMMENT '商品数量(库存数)',
  `channel_sid` varchar(10) DEFAULT NULL COMMENT '渠道sid',
  `store_code` varchar(20) DEFAULT NULL,
  `field1` varchar(20) DEFAULT NULL,
  `field2` varchar(20) DEFAULT NULL,
  `field3` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `shoppe_pro_sid` (`shoppe_pro_sid`,`stock_type_sid`,`channel_sid`),
  KEY `IDX_PCMSTOCK_SHOPPEPROSID` (`shoppe_pro_sid`)
) ENGINE=InnoDB AUTO_INCREMENT=11680 DEFAULT CHARSET=utf8 COMMENT='商品库存表';

-- ----------------------------
-- Table structure for pcm_stock_change_record
-- ----------------------------
DROP TABLE IF EXISTS `pcm_stock_change_record`;
CREATE TABLE `pcm_stock_change_record` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `bills_no` varchar(50) DEFAULT NULL COMMENT '单据号',
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品SID',
  `stock_sid` bigint(20) DEFAULT NULL COMMENT '库存表SID',
  `change_sum` bigint(20) DEFAULT NULL COMMENT '变动数量',
  `change_type_sid` int(4) DEFAULT NULL COMMENT '变动类型SID',
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '变动时间',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `pro_sum` bigint(20) DEFAULT '0' COMMENT '原库存数',
  `field1` varchar(20) DEFAULT NULL,
  `field2` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=30417 DEFAULT CHARSET=utf8 COMMENT='库存变动记录表';

-- ----------------------------
-- Table structure for pcm_stock_lock_record
-- ----------------------------
DROP TABLE IF EXISTS `pcm_stock_lock_record`;
CREATE TABLE `pcm_stock_lock_record` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `sale_no` varchar(50) DEFAULT NULL COMMENT '销售单号',
  `bills_no` varchar(50) DEFAULT NULL COMMENT '单据号',
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品SID',
  `lock_sum` bigint(20) DEFAULT NULL COMMENT '锁定数量',
  `lock_type_sid` int(4) DEFAULT NULL COMMENT '锁定类型SID',
  `lock_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '锁定时间',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `channel_sid` varchar(10) DEFAULT NULL COMMENT '渠道',
  `store_code` varchar(20) DEFAULT NULL,
  `field1` varchar(20) DEFAULT NULL,
  `field2` varchar(20) DEFAULT NULL,
  `field3` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=5269 DEFAULT CHARSET=utf8 COMMENT='库存锁定记录表';

-- ----------------------------
-- Table structure for pcm_stock_lock_record_his
-- ----------------------------
DROP TABLE IF EXISTS `pcm_stock_lock_record_his`;
CREATE TABLE `pcm_stock_lock_record_his` (
  `sid` bigint(20) NOT NULL,
  `sale_no` varchar(50) DEFAULT NULL COMMENT '销售单号',
  `bills_no` varchar(50) DEFAULT NULL COMMENT '单据号',
  `shoppe_pro_sid` varchar(20) DEFAULT NULL COMMENT '专柜商品SID',
  `lock_sum` bigint(20) DEFAULT NULL COMMENT '锁定数量',
  `lock_type_sid` int(4) DEFAULT NULL COMMENT '锁定类型SID',
  `lock_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '锁定时间',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `channel_sid` varchar(10) DEFAULT NULL COMMENT '渠道',
  `store_code` varchar(20) DEFAULT NULL,
  `field1` varchar(20) DEFAULT NULL,
  `field2` varchar(20) DEFAULT NULL,
  `field3` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存锁定记录表';

-- ----------------------------
-- Table structure for pcm_stock_type_dict
-- ----------------------------
DROP TABLE IF EXISTS `pcm_stock_type_dict`;
CREATE TABLE `pcm_stock_type_dict` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='库存类型字典表';

-- ----------------------------
-- Table structure for pcm_store_info
-- ----------------------------
DROP TABLE IF EXISTS `pcm_store_info`;
CREATE TABLE `pcm_store_info` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_sid` bigint(20) DEFAULT NULL COMMENT '所属集团的sid',
  `store_code` varchar(50) DEFAULT NULL COMMENT '门店编码',
  `registered_address` varchar(50) DEFAULT NULL COMMENT '注册地址',
  `post_code` varchar(20) DEFAULT NULL COMMENT '邮编',
  `legal_representative` varchar(20) DEFAULT NULL COMMENT '法定代表人',
  `agent` varchar(20) DEFAULT NULL COMMENT '委托代理人',
  `tax_registration_number` varchar(30) DEFAULT NULL COMMENT '税务登记号',
  `bank` varchar(60) DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(30) DEFAULT NULL COMMENT '开户行账号',
  `telephone_number` varchar(20) DEFAULT NULL COMMENT '电话(区号+座机)',
  `fax_number` varchar(20) DEFAULT NULL COMMENT '传真(区号+座机)',
  `field1` varchar(50) DEFAULT NULL COMMENT '预留字段',
  `field2` varchar(50) DEFAULT NULL COMMENT '预留字段',
  `field3` varchar(50) DEFAULT NULL COMMENT '预留字段',
  `field4` varchar(50) DEFAULT NULL COMMENT '预留字段',
  `field5` varchar(50) DEFAULT NULL COMMENT '是否下发',
  PRIMARY KEY (`sid`),
  KEY `group_sid` (`group_sid`),
  KEY `store_code` (`store_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='门店信息表';

-- ----------------------------
-- Table structure for pcm_supply_brand_category
-- ----------------------------
DROP TABLE IF EXISTS `pcm_supply_brand_category`;
CREATE TABLE `pcm_supply_brand_category` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_erp` varchar(255) DEFAULT NULL,
  `brand_erp` varchar(255) DEFAULT NULL,
  `supply_sid` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类品牌供应商关联表（临时不用）';

-- ----------------------------
-- Table structure for pcm_supply_group
-- ----------------------------
DROP TABLE IF EXISTS `pcm_supply_group`;
CREATE TABLE `pcm_supply_group` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_sid` varchar(20) DEFAULT NULL COMMENT '门店sid(组织结构编码)',
  `supply_name` varchar(60) DEFAULT NULL COMMENT '供应商名称',
  `supply_code` varchar(10) DEFAULT NULL COMMENT '供应商编码',
  `business_pattern` int(4) DEFAULT '0' COMMENT '商品经营方式: \r\n0-(Z001 经销);  \r\n1-(Z002 代销);  \r\n2-(Z003 联营);  \r\n3-(Z004 平台服务);  \r\n4-(Z005 租赁);  \r\n',
  `status` varchar(4) DEFAULT 'Y' COMMENT '供应商状态：Y正常；T未批准；N终止；L待审批；3淘汰；4停货；5停款；6冻结。',
  `apart_order` int(4) DEFAULT NULL COMMENT '拆单标识0: 不是 1：是',
  `postcode` varchar(20) DEFAULT NULL COMMENT '邮编',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `country` varchar(20) DEFAULT NULL COMMENT '国家',
  `zone` varchar(20) DEFAULT NULL COMMENT '地区代码',
  `shop_region` varchar(20) DEFAULT NULL COMMENT '门店地区（转成文字信息上传，即企业所在地区信息，例如”北京市”）',
  `address` varchar(50) DEFAULT NULL COMMENT '企业地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `email` varchar(20) DEFAULT NULL COMMENT '邮件',
  `last_opt_user` varchar(20) DEFAULT NULL COMMENT '操作人',
  `last_opt_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `supply_type` int(4) DEFAULT NULL COMMENT '供应商类型:0，门店供应商；1，集团供应商;（默认0）',
  `short_name` varchar(50) DEFAULT NULL COMMENT '供应商简称（别名）',
  `street` varchar(50) DEFAULT NULL COMMENT '通讯地址',
  `org_code` varchar(20) DEFAULT NULL COMMENT '企业代码',
  `industry` varchar(20) DEFAULT NULL COMMENT '所属行业（转成文字信息上传，即企业所在行业信息，例如”制造业”）',
  `biz_certificate_no` varchar(20) DEFAULT NULL COMMENT '营业执照号',
  `tax_type` varchar(20) DEFAULT NULL COMMENT '纳税类别（门店ERP用的是：1增值税一般纳税人；2：小规模纳税人；3：交纳营业税；4：零税率；5自然人。需要转成文字上传给主数据ERP）',
  `tax_numbe` varchar(30) DEFAULT NULL COMMENT '税号',
  `bank` varchar(60) DEFAULT NULL COMMENT '银行（开户行名称）',
  `bank_no` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `registered_capital` varchar(20) DEFAULT NULL COMMENT '注册资本',
  `enterprise_property` varchar(20) DEFAULT NULL COMMENT '企业性质（转成文字信息上传）',
  `business_category` varchar(20) DEFAULT NULL COMMENT '企业类别（转成文字信息上传）',
  `legal_person` varchar(20) DEFAULT NULL COMMENT '法人代表',
  `legal_person_ic_code` varchar(20) DEFAULT NULL COMMENT '法人身份证号',
  `legal_person_contact` varchar(20) DEFAULT NULL COMMENT '法人联系方式',
  `agent` varchar(20) DEFAULT NULL COMMENT '代理人',
  `agent_ic_code` varchar(20) DEFAULT NULL COMMENT '代理人身份证号',
  `agent_contact` varchar(20) DEFAULT NULL COMMENT '代理人联系方式',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_title` varchar(20) DEFAULT NULL COMMENT '联系人职务',
  `contact_ic_code` varchar(20) DEFAULT NULL COMMENT '联系人身份证号',
  `contact_way` varchar(20) DEFAULT NULL COMMENT '联系人联系方式',
  `business_scope` varchar(100) DEFAULT NULL COMMENT '经营范围',
  `key_supplier` int(4) DEFAULT NULL COMMENT '重点供应商 1：是   0：不是',
  `tax_rate` decimal(20,6) DEFAULT NULL COMMENT '税率（如果对于17%的税率，传过来的值就是17）',
  `in_out_city` varchar(10) DEFAULT NULL COMMENT '市内外（1市内；2省内市外；3国内省外；4国外）转成文字信息上传',
  `admission_date` varchar(20) DEFAULT NULL COMMENT '准入日期，只到日期（yyyymmdd）',
  `return_supply` int(4) DEFAULT NULL COMMENT '退货至供应商 0:不是  1：是',
  `join_site` varchar(400) DEFAULT NULL COMMENT '联营商品客退地点',
  `dropship` int(4) DEFAULT NULL COMMENT '区分奥莱和其它虚库标识（0:不是 1：是）',
  `erp_supplier_code` varchar(10) DEFAULT NULL COMMENT '供应商的门店ERP或者电商ERP编码',
  `zly_flag` varchar(10) DEFAULT NULL COMMENT '虚库标志（Y/N）',
  `zzxxhc_flag` varchar(10) DEFAULT NULL COMMENT '先销后采(Y/N)',
  `taxpayer_certificate` varchar(30) DEFAULT NULL COMMENT '纳税人资格证',
  `account_number` varchar(30) DEFAULT NULL COMMENT '开户许可号',
  `field1` varchar(10) DEFAULT NULL COMMENT '组织结构代码',
  `field2` varchar(10) DEFAULT NULL COMMENT '扩展字段',
  `field3` varchar(10) DEFAULT NULL COMMENT '扩展字段',
  `field4` varchar(60) DEFAULT NULL COMMENT '扩展字段',
  `field5` varchar(60) DEFAULT NULL COMMENT '扩展字段',
  `field6` varchar(60) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`sid`),
  KEY `IDX_CODE` (`supply_code`) USING BTREE,
  KEY `IDX_STATUS` (`status`) USING BTREE,
  KEY `IDX_biz_certificate_no` (`biz_certificate_no`),
  KEY `IDX_tax_numbe` (`tax_numbe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团供应商表';

-- ----------------------------
-- Table structure for pcm_supply_info
-- ----------------------------
DROP TABLE IF EXISTS `pcm_supply_info`;
CREATE TABLE `pcm_supply_info` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_sid` varchar(20) DEFAULT NULL COMMENT '门店sid(组织结构编码)',
  `supply_name` varchar(60) DEFAULT NULL COMMENT '供应商名称',
  `supply_code` varchar(10) DEFAULT NULL COMMENT '供应商编码',
  `business_pattern` int(4) DEFAULT '0' COMMENT '商品经营方式: \r\n0-(Z001 经销);  \r\n1-(Z002 代销);  \r\n2-(Z003 联营);  \r\n3-(Z004 平台服务);  \r\n4-(Z005 租赁);  \r\n',
  `status` varchar(4) DEFAULT 'Y' COMMENT '供应商状态：Y正常；T未批准；N终止；L待审批；3淘汰；4停货；5停款；6冻结。',
  `apart_order` int(4) DEFAULT NULL COMMENT '拆单标识0: 不是 1：是',
  `postcode` varchar(20) DEFAULT NULL COMMENT '邮编',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `country` varchar(20) DEFAULT NULL COMMENT '国家',
  `zone` varchar(20) DEFAULT NULL COMMENT '地区代码',
  `shop_region` varchar(20) DEFAULT NULL COMMENT '门店地区（转成文字信息上传，即企业所在地区信息，例如”北京市”）',
  `address` varchar(50) DEFAULT NULL COMMENT '企业地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `email` varchar(20) DEFAULT NULL COMMENT '邮件',
  `last_opt_user` varchar(20) DEFAULT NULL COMMENT '操作人',
  `last_opt_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `supply_type` int(4) DEFAULT NULL COMMENT '供应商类型:0，门店供应商；1，集团供应商;（默认0）',
  `short_name` varchar(50) DEFAULT NULL COMMENT '供应商简称（别名）',
  `street` varchar(50) DEFAULT NULL COMMENT '通讯地址',
  `org_code` varchar(20) DEFAULT NULL COMMENT '企业代码',
  `industry` varchar(20) DEFAULT NULL COMMENT '所属行业（转成文字信息上传，即企业所在行业信息，例如”制造业”）',
  `biz_certificate_no` varchar(20) DEFAULT NULL COMMENT '营业执照号',
  `tax_type` varchar(20) DEFAULT NULL COMMENT '纳税类别（门店ERP用的是：1增值税一般纳税人；2：小规模纳税人；3：交纳营业税；4：零税率；5自然人。需要转成文字上传给主数据ERP）',
  `tax_numbe` varchar(30) DEFAULT NULL COMMENT '税号',
  `bank` varchar(60) DEFAULT NULL COMMENT '银行（开户行名称）',
  `bank_no` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `registered_capital` varchar(20) DEFAULT NULL COMMENT '注册资本',
  `enterprise_property` varchar(20) DEFAULT NULL COMMENT '企业性质（转成文字信息上传）',
  `business_category` varchar(20) DEFAULT NULL COMMENT '企业类别（转成文字信息上传）',
  `legal_person` varchar(20) DEFAULT NULL COMMENT '法人代表',
  `legal_person_ic_code` varchar(20) DEFAULT NULL COMMENT '法人身份证号',
  `legal_person_contact` varchar(20) DEFAULT NULL COMMENT '法人联系方式',
  `agent` varchar(20) DEFAULT NULL COMMENT '代理人',
  `agent_ic_code` varchar(20) DEFAULT NULL COMMENT '代理人身份证号',
  `agent_contact` varchar(20) DEFAULT NULL COMMENT '代理人联系方式',
  `contact` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_title` varchar(20) DEFAULT NULL COMMENT '联系人职务',
  `contact_ic_code` varchar(20) DEFAULT NULL COMMENT '联系人身份证号',
  `contact_way` varchar(20) DEFAULT NULL COMMENT '联系人联系方式',
  `business_scope` varchar(100) DEFAULT NULL COMMENT '经营范围',
  `key_supplier` int(4) DEFAULT NULL COMMENT '重点供应商 1：是   0：不是',
  `tax_rate` decimal(20,6) DEFAULT NULL COMMENT '税率（如果对于17%的税率，传过来的值就是17）',
  `in_out_city` varchar(10) DEFAULT NULL COMMENT '市内外（1市内；2省内市外；3国内省外；4国外）转成文字信息上传',
  `admission_date` varchar(20) DEFAULT NULL COMMENT '准入日期，只到日期（yyyymmdd）',
  `return_supply` int(4) DEFAULT NULL COMMENT '退货至供应商 0:不是  1：是',
  `join_site` varchar(400) DEFAULT NULL COMMENT '联营商品客退地点',
  `dropship` int(4) DEFAULT NULL COMMENT '区分奥莱和其它虚库标识（0:不是 1：是）',
  `erp_supplier_code` varchar(10) DEFAULT NULL COMMENT '供应商的门店ERP或者电商ERP编码',
  `zly_flag` varchar(10) DEFAULT NULL COMMENT '虚库标志（Y/N）',
  `zzxxhc_flag` varchar(10) DEFAULT NULL COMMENT '先销后采(Y/N)',
  `field1` varchar(20) DEFAULT NULL,
  `field2` varchar(10) DEFAULT NULL COMMENT '扩展字段',
  `field3` varchar(10) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`sid`),
  KEY `IDX_CODE` (`supply_code`) USING BTREE,
  KEY `IDX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8 COMMENT='供应商表';

-- ----------------------------
-- Table structure for pcm_supply_shop_code
-- ----------------------------
DROP TABLE IF EXISTS `pcm_supply_shop_code`;
CREATE TABLE `pcm_supply_shop_code` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_sid` bigint(20) DEFAULT NULL COMMENT '专柜sid',
  `supply_sid` bigint(20) DEFAULT NULL COMMENT '供应商sid',
  `promo_sale_code` varchar(50) DEFAULT NULL COMMENT '促销扣率码',
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商促销扣率码表';

-- ----------------------------
-- Table structure for pcm_supply_shoppe_relation
-- ----------------------------
DROP TABLE IF EXISTS `pcm_supply_shoppe_relation`;
CREATE TABLE `pcm_supply_shoppe_relation` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `shoppe_sid` varchar(20) DEFAULT NULL COMMENT '专柜sid',
  `supply_sid` varchar(20) DEFAULT NULL COMMENT '供应商sid',
  `status` int(4) DEFAULT NULL COMMENT '有效标记：0有效，1无效（默认为0）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=685 DEFAULT CHARSET=utf8 COMMENT='专柜供应商关联关系表';

-- ----------------------------
-- Table structure for pcm_tag
-- ----------------------------
DROP TABLE IF EXISTS `pcm_tag`;
CREATE TABLE `pcm_tag` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL COMMENT '标签',
  `status` int(4) DEFAULT '0' COMMENT '状态：0 有效 ，1 禁用 （默认为0）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `opt_user_sid` bigint(20) DEFAULT NULL COMMENT '操作人',
  `tag_code` varchar(20) DEFAULT NULL COMMENT '标签编码',
  `tag_type` int(4) DEFAULT NULL COMMENT '标签类型(1 促销标签 2 关键字 3活动关键字)',
  `begin_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `operater_name` varchar(20) DEFAULT NULL COMMENT '最后一次修改操作人名称',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='标签表';

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
) ENGINE=InnoDB AUTO_INCREMENT=134002 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

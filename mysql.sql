/*
Navicat MySQL Data Transfer

Source Server         : food
Source Server Version : 50726
Source Host           : 203.195.132.137:3306
Source Database       : fooddata

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-08-07 22:04:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for system_admin
-- ----------------------------
DROP TABLE IF EXISTS `system_admin`;
CREATE TABLE `system_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `login_time` int(11) DEFAULT NULL COMMENT '最近登录时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台_系统用户表';

-- ----------------------------
-- Records of system_admin
-- ----------------------------
INSERT INTO `system_admin` VALUES ('1', '', 'super', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', 'super', '129', '0', '1', '1596805931', '1593616131', '1596805931', null);

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台_系统权限表';

-- ----------------------------
-- Records of system_auth
-- ----------------------------
INSERT INTO `system_auth` VALUES ('1', '超级管理员', '0', '1', '拥有全部权限', '1593777631', '1593777884', '1593777884');
INSERT INTO `system_auth` VALUES ('2', '普通管理员', '1', '1', '拥有超级管理员super指定的权限', '1588921753', '1593849098', null);

-- ----------------------------
-- Table structure for system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint(20) DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`),
  KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
  KEY `index_system_auth_node` (`node_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台_角色与节点关系表';

-- ----------------------------
-- Records of system_auth_node
-- ----------------------------

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `value` text COMMENT '变量值',
  `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
  `sort` int(10) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台_系统配置表';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('41', 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', '0', null, null);
INSERT INTO `system_config` VALUES ('42', 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', '0', null, null);
INSERT INTO `system_config` VALUES ('55', 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', '0', null, null);
INSERT INTO `system_config` VALUES ('56', 'upload_allow_ext', 'upload', 'ico,icon,png,jpg,jpeg,gif', '允许上传的文件类型', '0', null, null);
INSERT INTO `system_config` VALUES ('57', 'upload_allow_size', 'upload', '10240000', '允许上传的大小', '0', null, null);
INSERT INTO `system_config` VALUES ('58', 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', '0', null, null);
INSERT INTO `system_config` VALUES ('59', 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', '0', null, null);
INSERT INTO `system_config` VALUES ('60', 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', '0', null, null);
INSERT INTO `system_config` VALUES ('61', 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', '0', null, null);
INSERT INTO `system_config` VALUES ('62', 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', '0', null, null);
INSERT INTO `system_config` VALUES ('63', 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', '0', null, null);
INSERT INTO `system_config` VALUES ('64', 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', '0', null, null);
INSERT INTO `system_config` VALUES ('65', 'logo_title', 'site', '后台管理', 'LOGO标题', '0', null, null);
INSERT INTO `system_config` VALUES ('66', 'logo_image', 'site', 'https://food.sqgdfc.com/upload/20200807/9f3ac34a959469e20ce78b0fb251cf23.ico', 'logo图片', '0', null, null);
INSERT INTO `system_config` VALUES ('68', 'site_name', 'site', '后台管理', '站点名称', '0', null, null);
INSERT INTO `system_config` VALUES ('69', 'site_ico', 'site', 'https://food.sqgdfc.com/upload/20200807/9f3ac34a959469e20ce78b0fb251cf23.ico', '浏览器图标', '0', null, null);
INSERT INTO `system_config` VALUES ('70', 'site_copyright', 'site', '©版权所有 2014-2020 XX公司', '版权信息', '0', null, null);
INSERT INTO `system_config` VALUES ('71', 'site_beian', 'site', '桂A88888号', '备案信息', '0', null, null);
INSERT INTO `system_config` VALUES ('72', 'site_version', 'site', '3.1', '版本信息', '0', null, null);
INSERT INTO `system_config` VALUES ('75', 'sms_type', 'sms', 'alisms', '短信类型', '0', null, null);
INSERT INTO `system_config` VALUES ('76', 'miniapp_appid', 'wechat', '填你的', '小程序公钥', '0', null, null);
INSERT INTO `system_config` VALUES ('77', 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', '0', null, null);
INSERT INTO `system_config` VALUES ('78', 'web_appid', 'wechat', '填你的', '公众号公钥', '0', null, null);
INSERT INTO `system_config` VALUES ('79', 'web_appsecret', 'wechat', '填你的', '公众号私钥', '0', null, null);
INSERT INTO `system_config` VALUES ('80', 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', '0', null, null);
INSERT INTO `system_config` VALUES ('81', 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', '0', null, null);
INSERT INTO `system_config` VALUES ('82', 'txcos_region', 'upload', '填你的', '存储桶地域', '0', null, null);
INSERT INTO `system_config` VALUES ('83', 'tecos_bucket', 'upload', '填你的', '存储桶名称', '0', null, null);
INSERT INTO `system_config` VALUES ('84', 'qnoss_access_key', 'upload', '填你的', '访问密钥', '0', null, null);
INSERT INTO `system_config` VALUES ('85', 'qnoss_secret_key', 'upload', '填你的', '安全密钥', '0', null, null);
INSERT INTO `system_config` VALUES ('86', 'qnoss_bucket', 'upload', '填你的', '存储空间', '0', null, null);
INSERT INTO `system_config` VALUES ('87', 'qnoss_domain', 'upload', '填你的', '访问域名', '0', null, null);

-- ----------------------------
-- Table structure for system_log_202008
-- ----------------------------
DROP TABLE IF EXISTS `system_log_202008`;
CREATE TABLE `system_log_202008` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202008';

-- ----------------------------
-- Records of system_log_202008
-- ----------------------------

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台_系统菜单表';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('227', '99999999', '后台首页', 'fa fa-home', 'index/welcome', '', '_self', '0', '1', null, null, '1573120497', null);
INSERT INTO `system_menu` VALUES ('228', '0', '后台管理', 'fa fa-cog', '', '', '_self', '0', '1', '', null, '1593620873', null);
INSERT INTO `system_menu` VALUES ('234', '228', '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', '10', '1', '', null, '1593620605', '1593620605');
INSERT INTO `system_menu` VALUES ('244', '228', '账号管理', 'fa fa-user', 'system.admin/index', '', '_self', '12', '1', '', '1573185011', '1593621255', '1593621255');
INSERT INTO `system_menu` VALUES ('245', '228', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', '11', '1', '', '1573435877', '1593620424', '1593620424');
INSERT INTO `system_menu` VALUES ('246', '228', '节点管理', 'fa fa-list', 'system.node/index', '', '_self', '9', '1', '', '1573435919', '1593620434', '1593620434');
INSERT INTO `system_menu` VALUES ('247', '228', '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', '8', '1', '', '1573457448', '1593620659', '1593620659');
INSERT INTO `system_menu` VALUES ('248', '228', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', '0', '1', '', '1573542953', '1593620720', '1593620720');
INSERT INTO `system_menu` VALUES ('249', '0', '商城管理', 'fa fa-list', '', '', '_self', '0', '1', '', '1589439884', '1593620840', '1593620840');
INSERT INTO `system_menu` VALUES ('250', '249', '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '', '_self', '0', '1', '', '1589439910', '1589439966', null);
INSERT INTO `system_menu` VALUES ('251', '249', '商品管理', 'fa fa-list', 'mall.goods/index', '', '_self', '0', '1', '', '1589439931', '1589439942', null);
INSERT INTO `system_menu` VALUES ('252', '228', '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', '0', '1', '', '1589623683', '1593620780', '1593620780');
INSERT INTO `system_menu` VALUES ('253', '228', '权限管理', 'fa fa-balance-scale', '', '', '_self', '100', '1', '', '1593620306', '1596284489', null);
INSERT INTO `system_menu` VALUES ('254', '253', '角色管理', 'fa fa-bitbucket', 'system.auth/index', '', '_self', '3', '1', '', '1593620383', '1593621313', null);
INSERT INTO `system_menu` VALUES ('255', '253', '节点管理', 'fa fa-list', 'system.node/index', '', '_self', '1', '1', '', '1593620407', '1593621318', null);
INSERT INTO `system_menu` VALUES ('256', '228', '系统管理', 'fa fa-cogs', '', '', '_self', '99', '1', '', '1593620497', '1596284497', null);
INSERT INTO `system_menu` VALUES ('257', '256', '菜单管理', 'fa fa-bars', 'system.menu/index', '', '_self', '0', '1', '', '1593620592', '1594018930', '1594018930');
INSERT INTO `system_menu` VALUES ('258', '256', '系统配置', 'fa fa-cog', 'system.config/index', '', '_self', '0', '1', '', '1593620652', '1593620652', null);
INSERT INTO `system_menu` VALUES ('259', '256', '上传管理', 'fa fa-arrow-circle-up', 'system.uploadfile/index', '', '_self', '0', '1', '', '1593620713', '1593620713', null);
INSERT INTO `system_menu` VALUES ('260', '256', '快捷入口', 'fa fa-automobile', 'system.quick/index', '', '_self', '0', '1', '', '1593620774', '1595648293', '1595648293');
INSERT INTO `system_menu` VALUES ('261', '253', '账号管理', 'fa fa-users', 'system.admin/index', '', '_self', '2', '1', '', '1593621244', '1593621291', null);
INSERT INTO `system_menu` VALUES ('262', '228', '用户管理', 'fa fa-group', '', '', '_self', '0', '1', '', '1593673543', '1594017832', '1594017832');
INSERT INTO `system_menu` VALUES ('263', '262', '用户列表', 'fa fa-align-center', 'user.baseinfo/index', '', '_self', '0', '1', '', '1593678490', '1593783393', null);
INSERT INTO `system_menu` VALUES ('264', '262', '用户授权', 'fa fa-chain-broken', 'user.authorize/index', '', '_self', '0', '1', '', '1593783935', '1593783935', null);
INSERT INTO `system_menu` VALUES ('265', '262', '用户额外信息', 'fa fa-chain', 'user.extrainfo/index', '', '_self', '0', '1', '', '1593789272', '1593789272', null);
INSERT INTO `system_menu` VALUES ('266', '262', '用户定位', 'fa fa-location-arrow', 'user.locationinfo/index', '', '_self', '0', '1', '', '1593858296', '1593858296', null);
INSERT INTO `system_menu` VALUES ('267', '262', '用户认证信息', 'fa fa-address-book-o', 'user.renewalvip/index', '', '_self', '0', '1', '', '1593872430', '1593872430', null);
INSERT INTO `system_menu` VALUES ('268', '262', '用户注册日志', 'fa fa-calendar-o', 'user.register_log/index', '', '_self', '0', '1', '', '1593873456', '1593873456', null);
INSERT INTO `system_menu` VALUES ('269', '262', '用户登录日志', 'fa fa-edge', 'user.login_log/index', '', '_self', '0', '1', '', '1593874236', '1593874236', null);
INSERT INTO `system_menu` VALUES ('270', '228', '简历管理', 'fa fa-object-ungroup', '', '', '_self', '0', '1', '', '1593912156', '1594017841', '1594017841');
INSERT INTO `system_menu` VALUES ('271', '270', '教育经历', 'fa fa-adjust', 'rs.educationalexp/index', '', '_self', '0', '1', '', '1593913311', '1593913311', null);
INSERT INTO `system_menu` VALUES ('272', '270', '项目经历', 'fa fa-dropbox', 'rs.projectexp/index', '', '_self', '0', '1', '', '1593915939', '1593915939', null);
INSERT INTO `system_menu` VALUES ('273', '270', '资格证书', 'fa fa-lightbulb-o', 'rs.qualification/index', '', '_self', '0', '1', '', '1593918051', '1593918051', null);
INSERT INTO `system_menu` VALUES ('274', '228', '其他管理', 'fa fa-folder-open', '', '', '_self', '0', '1', '', '1593922557', '1594017849', '1594017849');
INSERT INTO `system_menu` VALUES ('275', '274', '资格证书库', 'fa fa-copy', 'e.qualificationcer/index', '', '_self', '0', '1', '', '1593922681', '1593924118', null);
INSERT INTO `system_menu` VALUES ('276', '274', '行业信息库', 'fa fa-modx', 'e.industry/index', '', '_self', '0', '1', '', '1593946717', '1593946717', null);
INSERT INTO `system_menu` VALUES ('277', '274', '职位类型库', 'fa fa-star-half-empty', 'e.jobtype/index', '', '_self', '0', '1', '', '1593947408', '1593947408', null);
INSERT INTO `system_menu` VALUES ('278', '274', '职位关键词标签库', 'fa fa-tags', 'e.jobtypetag/index', '', '_self', '0', '1', '', '1593949031', '1593949031', null);
INSERT INTO `system_menu` VALUES ('279', '274', '招聘地理位置配置', 'fa fa-location-arrow', 'e.regioninfo/index', '', '_self', '0', '1', '', '1593950185', '1593950185', null);
INSERT INTO `system_menu` VALUES ('280', '274', '学校信息库', 'fa fa-home', 'e.schoolthesaurus/index', '', '_self', '0', '1', '', '1593950921', '1593950921', null);
INSERT INTO `system_menu` VALUES ('281', '256', '操作日志', 'fa fa-calendar-check-o', 'system.log/index', '', '_self', '0', '1', '', '1593958219', '1595077424', null);
INSERT INTO `system_menu` VALUES ('282', '253', '菜单管理', 'fa fa-cubes', 'system.menu/index', '', '_self', '0', '1', '', '1594018923', '1594019655', null);
INSERT INTO `system_menu` VALUES ('283', '228', '银行卡管理', 'fa fa-credit-card', '', '', '_self', '0', '1', '', '1594020098', '1595076906', '1595076906');
INSERT INTO `system_menu` VALUES ('284', '228', '员工管理', 'fa fa-users', '', '', '_self', '98', '1', '', '1595076423', '1596806095', '1596806095');
INSERT INTO `system_menu` VALUES ('285', '284', '员工列表', 'fa fa-address-book-o', 'users/index', '', '_self', '0', '1', '', '1595076853', '1595077386', null);
INSERT INTO `system_menu` VALUES ('286', '228', '业绩管理', 'fa fa-area-chart', '', '', '_self', '96', '1', '', '1595080448', '1596806108', '1596806108');
INSERT INTO `system_menu` VALUES ('287', '286', '进行中', 'fa fa-clone', 'orders/index', '', '_self', '3', '1', '', '1595081681', '1595137245', null);
INSERT INTO `system_menu` VALUES ('288', '228', '工资管理', 'fa fa-credit-card', '', '', '_self', '95', '1', '', '1595087678', '1596806114', '1596806114');
INSERT INTO `system_menu` VALUES ('289', '286', '待审核', 'fa fa-chain-broken', 'records/index', '', '_self', '5', '1', '', '1595124327', '1595137783', null);
INSERT INTO `system_menu` VALUES ('290', '286', '已完成', 'fa fa-check-square-o', 'orders/index1', '', '_self', '2', '1', '', '1595126967', '1595137237', null);
INSERT INTO `system_menu` VALUES ('291', '286', '已结算', 'fa fa-money', 'orders/index2', '', '_self', '1', '1', '', '1595129260', '1595137228', null);
INSERT INTO `system_menu` VALUES ('292', '286', '已审核', 'fa fa-check', 'records/index2', '', '_self', '4', '1', '', '1595137771', '1595137791', null);
INSERT INTO `system_menu` VALUES ('293', '288', '工资结算', 'fa fa-hourglass-1', 'wages/index', '', '_self', '0', '1', '', '1595224753', '1596194118', null);
INSERT INTO `system_menu` VALUES ('294', '228', '销售记录', 'fa fa-commenting', '', '', '_self', '97', '1', '', '1595345549', '1596806104', '1596806104');
INSERT INTO `system_menu` VALUES ('295', '294', '对接中', 'fa fa-clock-o', 'sales/index', '', '_self', '0', '1', '', '1595408854', '1595408854', null);
INSERT INTO `system_menu` VALUES ('296', '294', '已失败', 'fa fa-ban', 'sales/index2', '', '_self', '0', '1', '', '1595408885', '1595408885', null);
INSERT INTO `system_menu` VALUES ('297', '288', '已发工资', 'fa fa-save', 'wages/index2', '', '_self', '0', '1', '', '1595640955', '1595641077', null);
INSERT INTO `system_menu` VALUES ('298', '284', '已删员工', 'fa fa-trash-o', 'users/index2', '', '_self', '0', '1', '', '1595730459', '1596185612', '1596185612');
INSERT INTO `system_menu` VALUES ('299', '0', '统计管理', 'fa fa-area-chart', '', '', '_self', '0', '1', '', '1595946950', '1595946996', '1595946996');
INSERT INTO `system_menu` VALUES ('300', '228', '数据统计', 'fa fa-area-chart', '', '', '_self', '92', '1', '', '1595947010', '1596551621', '1596551621');
INSERT INTO `system_menu` VALUES ('301', '228', '数据统计', 'fa fa-bar-chart', 'statistics/index', '', '_self', '91', '1', '', '1595947066', '1596806140', '1596806140');
INSERT INTO `system_menu` VALUES ('302', '228', '支出管理', 'fa fa-arrow-down', '', '', '_self', '94', '1', '', '1596284442', '1596806121', '1596806121');
INSERT INTO `system_menu` VALUES ('303', '302', '待审核', 'fa fa-hourglass-1', 'reimbuse/index', '', '_self', '0', '1', '', '1596284628', '1596331782', null);
INSERT INTO `system_menu` VALUES ('304', '302', '已审核', 'fa fa-check', 'reimbuse/index2', '', '_self', '0', '1', '', '1596288825', '1596331793', null);
INSERT INTO `system_menu` VALUES ('305', '302', '支出记录', 'fa fa-edit', 'reimbuse/index', '', '_self', '0', '1', '', '1596288889', '1596331769', '1596331769');
INSERT INTO `system_menu` VALUES ('306', '228', '其他收入', 'fa fa-arrow-up', 'other.income/index', '', '_self', '0', '1', '', '1596541476', '1596541502', '1596541502');
INSERT INTO `system_menu` VALUES ('307', '228', '其他收入', 'fa fa-arrow-up', 'other.income/index', '', '_self', '93', '1', '', '1596541535', '1596806127', '1596806127');
INSERT INTO `system_menu` VALUES ('308', '228', '资源管理', 'fa fa-microchip', 'resources/index', '', '_self', '92', '1', '', '1596610388', '1596806134', '1596806134');

-- ----------------------------
-- Table structure for system_node
-- ----------------------------
DROP TABLE IF EXISTS `system_node`;
CREATE TABLE `system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台_系统节点表';

-- ----------------------------
-- Records of system_node
-- ----------------------------
INSERT INTO `system_node` VALUES ('1', 'system.admin', '管理员管理', '1', '1', '1589580432', '1593859543');
INSERT INTO `system_node` VALUES ('2', 'system.admin/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('3', 'system.admin/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('4', 'system.admin/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('5', 'system.admin/password', '编辑', '2', '1', '1589580432', '1593859788');
INSERT INTO `system_node` VALUES ('6', 'system.admin/delete', '删除', '2', '1', '1589580432', '1593859789');
INSERT INTO `system_node` VALUES ('7', 'system.admin/modify', '属性修改', '2', '1', '1589580432', '1593859791');
INSERT INTO `system_node` VALUES ('8', 'system.admin/export', '导出', '2', '1', '1589580432', '1593859792');
INSERT INTO `system_node` VALUES ('9', 'system.auth', '角色权限管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('10', 'system.auth/authorize', '授权', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('11', 'system.auth/saveAuthorize', '授权保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('12', 'system.auth/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('13', 'system.auth/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('14', 'system.auth/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('15', 'system.auth/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('16', 'system.auth/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('17', 'system.auth/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('18', 'system.config', '系统配置管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('19', 'system.config/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('20', 'system.config/save', '保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('21', 'system.menu', '菜单管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('22', 'system.menu/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('23', 'system.menu/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('24', 'system.menu/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('25', 'system.menu/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('26', 'system.menu/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('27', 'system.menu/getMenuTips', '添加菜单提示', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('28', 'system.menu/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('29', 'system.node', '系统节点管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('30', 'system.node/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('31', 'system.node/refreshNode', '系统节点更新', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('32', 'system.node/clearNode', '清除失效节点', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('33', 'system.node/add', '添加', '2', '1', '1589580432', '1594019101');
INSERT INTO `system_node` VALUES ('34', 'system.node/edit', '编辑', '2', '1', '1589580432', '1594019096');
INSERT INTO `system_node` VALUES ('35', 'system.node/delete', '删除', '2', '1', '1589580432', '1594019091');
INSERT INTO `system_node` VALUES ('36', 'system.node/export', '导出', '2', '1', '1589580432', '1594019106');
INSERT INTO `system_node` VALUES ('37', 'system.node/modify', '属性修改', '2', '1', '1589580432', '1593860547');
INSERT INTO `system_node` VALUES ('38', 'system.uploadfile', '上传文件管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('39', 'system.uploadfile/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('40', 'system.uploadfile/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('41', 'system.uploadfile/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('42', 'system.uploadfile/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('43', 'system.uploadfile/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('44', 'system.uploadfile/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `system_node` VALUES ('185', 'system.log', '系统日志', '1', '1', '1593958146', '1593958146');
INSERT INTO `system_node` VALUES ('186', 'system.log/index', '列表', '2', '1', '1593958146', '1593958146');
INSERT INTO `system_node` VALUES ('187', 'system.log/add', '添加', '2', '1', '1593958146', '1593958256');
INSERT INTO `system_node` VALUES ('188', 'system.log/edit', '编辑', '2', '1', '1593958146', '1593958252');
INSERT INTO `system_node` VALUES ('189', 'system.log/delete', '删除', '2', '1', '1593958146', '1593958237');
INSERT INTO `system_node` VALUES ('190', 'system.log/export', '导出', '2', '1', '1593958146', '1593958146');
INSERT INTO `system_node` VALUES ('191', 'system.log/modify', '属性修改', '2', '1', '1593958146', '1593958233');

-- ----------------------------
-- Table structure for system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `system_uploadfile`;
CREATE TABLE `system_uploadfile` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) DEFAULT NULL,
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(10) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `upload_time` int(10) DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `upload_type` (`upload_type`),
  KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台_上传文件表';

-- ----------------------------
-- Records of system_uploadfile
-- ----------------------------
INSERT INTO `system_uploadfile` VALUES ('1', 'local', 'db544a34ae8ad7ebf8ac3f2a1cc2342b.ico', 'https://food.sqgdfc.com/upload/20200807/9f3ac34a959469e20ce78b0fb251cf23.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', '1596806524', null, null);

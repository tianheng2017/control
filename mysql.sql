/*
Navicat MySQL Data Transfer

Source Server         : 172.105.117.27
Source Server Version : 50734
Source Host           : 172.105.117.27:3306
Source Database       : 172_105_117_27

Target Server Type    : MYSQL
Target Server Version : 50734
File Encoding         : 65001

Date: 2021-08-07 22:14:19
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台_系统用户表';

-- ----------------------------
-- Records of system_admin
-- ----------------------------
INSERT INTO `system_admin` VALUES ('1', '', 'super', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', 'super', '130', '0', '1', '1628328079', '1593616131', '1628328079', null);
INSERT INTO `system_admin` VALUES ('6', '', '123123', '', '123123', '0', '0', '1', null, '1628343621', '1628343634', '1628343634');

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
INSERT INTO `system_config` VALUES ('56', 'upload_allow_ext', 'upload', 'ico,icon,png,jpg,jpeg,gif,bmp', '允许上传的文件类型', '0', null, null);
INSERT INTO `system_config` VALUES ('57', 'upload_allow_size', 'upload', '10240000', '允许上传的大小', '0', null, null);
INSERT INTO `system_config` VALUES ('58', 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', '0', null, null);
INSERT INTO `system_config` VALUES ('59', 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', '0', null, null);
INSERT INTO `system_config` VALUES ('60', 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', '0', null, null);
INSERT INTO `system_config` VALUES ('61', 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', '0', null, null);
INSERT INTO `system_config` VALUES ('62', 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', '0', null, null);
INSERT INTO `system_config` VALUES ('63', 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', '0', null, null);
INSERT INTO `system_config` VALUES ('64', 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', '0', null, null);
INSERT INTO `system_config` VALUES ('65', 'logo_title', 'site', '后台管理', 'LOGO标题', '0', null, null);
INSERT INTO `system_config` VALUES ('66', 'logo_image', 'site', '/upload/20210807/febafa41c780ddeabc9d3e4e06ed9fcd.png', 'logo图片', '0', null, null);
INSERT INTO `system_config` VALUES ('68', 'site_name', 'site', '后台管理', '站点名称', '0', null, null);
INSERT INTO `system_config` VALUES ('69', 'site_ico', 'site', '/upload/20210807/b4d4dcb7f28d0c262445111f86bfb54a.ico', '浏览器图标', '0', null, null);
INSERT INTO `system_config` VALUES ('70', 'site_copyright', 'site', '无', '版权信息', '0', null, null);
INSERT INTO `system_config` VALUES ('71', 'site_beian', 'site', '无', '备案信息', '0', null, null);
INSERT INTO `system_config` VALUES ('72', 'site_version', 'site', '3.6', '版本信息', '0', null, null);
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
INSERT INTO `system_menu` VALUES ('250', '249', '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '', '_self', '0', '1', '', '1589439910', '1589439966', null);
INSERT INTO `system_menu` VALUES ('251', '249', '商品管理', 'fa fa-list', 'mall.goods/index', '', '_self', '0', '1', '', '1589439931', '1589439942', null);
INSERT INTO `system_menu` VALUES ('253', '228', '权限管理', 'fa fa-balance-scale', '', '', '_self', '100', '1', '', '1593620306', '1596284489', null);
INSERT INTO `system_menu` VALUES ('254', '253', '角色管理', 'fa fa-bitbucket', 'system.auth/index', '', '_self', '3', '1', '', '1593620383', '1593621313', null);
INSERT INTO `system_menu` VALUES ('255', '253', '节点管理', 'fa fa-list', 'system.node/index', '', '_self', '1', '1', '', '1593620407', '1593621318', null);
INSERT INTO `system_menu` VALUES ('256', '228', '系统管理', 'fa fa-cogs', '', '', '_self', '99', '1', '', '1593620497', '1596284497', null);
INSERT INTO `system_menu` VALUES ('258', '256', '系统配置', 'fa fa-cog', 'system.config/index', '', '_self', '0', '1', '', '1593620652', '1593620652', null);
INSERT INTO `system_menu` VALUES ('259', '256', '上传管理', 'fa fa-arrow-circle-up', 'system.uploadfile/index', '', '_self', '0', '1', '', '1593620713', '1593620713', null);
INSERT INTO `system_menu` VALUES ('261', '253', '账号管理', 'fa fa-users', 'system.admin/index', '', '_self', '2', '1', '', '1593621244', '1593621291', null);
INSERT INTO `system_menu` VALUES ('282', '253', '菜单管理', 'fa fa-cubes', 'system.menu/index', '', '_self', '0', '1', '', '1594018923', '1594019655', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台_上传文件表';

-- ----------------------------
-- Records of system_uploadfile
-- ----------------------------
INSERT INTO `system_uploadfile` VALUES ('2', 'local', '116f2b18201ca1346c57aad209e6ae23.ico', 'http://172.105.117.27/upload/20210807/b4d4dcb7f28d0c262445111f86bfb54a.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', '1628328415', null, null);
INSERT INTO `system_uploadfile` VALUES ('3', 'local', '348c9904ec0f23a40b0784327aedfecc.png', 'http://172.105.117.27/upload/20210807/febafa41c780ddeabc9d3e4e06ed9fcd.png', '', '', '', '0', 'image/png', '0', 'png', '', '1628328432', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID {text}',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名 {text}',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号 {text}',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 {select} (0:正常, 1:冻结)',
  `token` text COMMENT 'token',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台_用户表';

-- ----------------------------
-- Records of user
-- ----------------------------

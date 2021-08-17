-- MySQL dump 10.13  Distrib 8.0.24, for Linux (x86_64)
--
-- Host: localhost    Database: crowtoken_com
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `system_admin`
--

DROP TABLE IF EXISTS `system_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint unsigned DEFAULT '0' COMMENT '登录次数',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `login_time` int DEFAULT NULL COMMENT '最近登录时间',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='后台_系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_admin`
--

LOCK TABLES `system_admin` WRITE;
/*!40000 ALTER TABLE `system_admin` DISABLE KEYS */;
INSERT INTO `system_admin` VALUES (1,'','super','ed696eb5bba1f7460585cc6975e6cf9bf24903dd','super',136,0,1,1629172334,1593616131,1629172334,NULL),(6,'','123123','','123123',0,0,1,NULL,1628343621,1628343634,1628343634);
/*!40000 ALTER TABLE `system_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_auth`
--

DROP TABLE IF EXISTS `system_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_auth` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='后台_系统权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_auth`
--

LOCK TABLES `system_auth` WRITE;
/*!40000 ALTER TABLE `system_auth` DISABLE KEYS */;
INSERT INTO `system_auth` VALUES (1,'超级管理员',0,1,'拥有全部权限',1593777631,1593777884,1593777884);
/*!40000 ALTER TABLE `system_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_auth_node`
--

DROP TABLE IF EXISTS `system_auth_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_auth_node` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` bigint unsigned DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`),
  KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
  KEY `index_system_auth_node` (`node_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='后台_角色与节点关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_auth_node`
--

LOCK TABLES `system_auth_node` WRITE;
/*!40000 ALTER TABLE `system_auth_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_auth_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `value` text COMMENT '变量值',
  `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
  `sort` int DEFAULT '0',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='后台_系统配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (41,'alisms_access_key_id','sms','填你的','阿里大于公钥',0,NULL,NULL),(42,'alisms_access_key_secret','sms','填你的','阿里大鱼私钥',0,NULL,NULL),(55,'upload_type','upload','local','当前上传方式 （local,alioss,qnoss,txoss）',0,NULL,NULL),(56,'upload_allow_ext','upload','ico,icon,png,jpg,jpeg,gif,bmp','允许上传的文件类型',0,NULL,NULL),(57,'upload_allow_size','upload','10240000','允许上传的大小',0,NULL,NULL),(58,'upload_allow_mime','upload','image/gif,image/jpeg,video/x-msvideo,text/plain,image/png','允许上传的文件mime',0,NULL,NULL),(59,'upload_allow_type','upload','local,alioss,qnoss,txcos','可用的上传文件方式',0,NULL,NULL),(60,'alioss_access_key_id','upload','填你的','阿里云oss公钥',0,NULL,NULL),(61,'alioss_access_key_secret','upload','填你的','阿里云oss私钥',0,NULL,NULL),(62,'alioss_endpoint','upload','填你的','阿里云oss数据中心',0,NULL,NULL),(63,'alioss_bucket','upload','填你的','阿里云oss空间名称',0,NULL,NULL),(64,'alioss_domain','upload','填你的','阿里云oss访问域名',0,NULL,NULL),(65,'logo_title','site','后台管理','LOGO标题',0,NULL,NULL),(66,'logo_image','site','/upload/20210807/febafa41c780ddeabc9d3e4e06ed9fcd.png','logo图片',0,NULL,NULL),(68,'site_name','site','后台管理','站点名称',0,NULL,NULL),(69,'site_ico','site','/upload/20210807/b4d4dcb7f28d0c262445111f86bfb54a.ico','浏览器图标',0,NULL,NULL),(70,'site_copyright','site','无','版权信息',0,NULL,NULL),(71,'site_beian','site','无','备案信息',0,NULL,NULL),(72,'site_version','site','3.6','版本信息',0,NULL,NULL),(75,'sms_type','sms','alisms','短信类型',0,NULL,NULL),(76,'miniapp_appid','wechat','填你的','小程序公钥',0,NULL,NULL),(77,'miniapp_appsecret','wechat','填你的','小程序私钥',0,NULL,NULL),(78,'web_appid','wechat','填你的','公众号公钥',0,NULL,NULL),(79,'web_appsecret','wechat','填你的','公众号私钥',0,NULL,NULL),(80,'txcos_secret_id','upload','填你的','腾讯云cos密钥',0,NULL,NULL),(81,'txcos_secret_key','upload','填你的','腾讯云cos私钥',0,NULL,NULL),(82,'txcos_region','upload','填你的','存储桶地域',0,NULL,NULL),(83,'tecos_bucket','upload','填你的','存储桶名称',0,NULL,NULL),(84,'qnoss_access_key','upload','填你的','访问密钥',0,NULL,NULL),(85,'qnoss_secret_key','upload','填你的','安全密钥',0,NULL,NULL),(86,'qnoss_bucket','upload','填你的','存储空间',0,NULL,NULL),(87,'qnoss_domain','upload','填你的','访问域名',0,NULL,NULL);
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_menu`
--

DROP TABLE IF EXISTS `system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='后台_系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_menu`
--

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;
INSERT INTO `system_menu` VALUES (227,99999999,'后台首页','fa fa-home','index/welcome','','_self',0,1,NULL,NULL,1573120497,NULL),(228,0,'后台管理','fa fa-cog','','','_self',0,1,'',NULL,1593620873,NULL),(250,249,'商品分类','fa fa-calendar-check-o','mall.cate/index','','_self',0,1,'',1589439910,1589439966,NULL),(251,249,'商品管理','fa fa-list','mall.goods/index','','_self',0,1,'',1589439931,1589439942,NULL),(253,228,'权限管理','fa fa-balance-scale','','','_self',100,1,'',1593620306,1596284489,NULL),(254,253,'角色管理','fa fa-bitbucket','system.auth/index','','_self',3,1,'',1593620383,1593621313,NULL),(255,253,'节点管理','fa fa-list','system.node/index','','_self',1,1,'',1593620407,1593621318,NULL),(256,228,'系统管理','fa fa-cogs','','','_self',99,1,'',1593620497,1596284497,NULL),(258,256,'系统配置','fa fa-cog','system.config/index','','_self',0,1,'',1593620652,1593620652,NULL),(259,256,'上传管理','fa fa-arrow-circle-up','system.uploadfile/index','','_self',0,1,'',1593620713,1593620713,NULL),(261,253,'账号管理','fa fa-users','system.admin/index','','_self',2,1,'',1593621244,1593621291,NULL),(282,253,'菜单管理','fa fa-cubes','system.menu/index','','_self',0,1,'',1594018923,1594019655,NULL);
/*!40000 ALTER TABLE `system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_node`
--

DROP TABLE IF EXISTS `system_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_node` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='后台_系统节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_node`
--

LOCK TABLES `system_node` WRITE;
/*!40000 ALTER TABLE `system_node` DISABLE KEYS */;
INSERT INTO `system_node` VALUES (1,'system.admin','管理员管理',1,1,1589580432,1593859543),(2,'system.admin/index','列表',2,1,1589580432,1589580432),(3,'system.admin/add','添加',2,1,1589580432,1589580432),(4,'system.admin/edit','编辑',2,1,1589580432,1589580432),(5,'system.admin/password','编辑',2,1,1589580432,1593859788),(6,'system.admin/delete','删除',2,1,1589580432,1593859789),(7,'system.admin/modify','属性修改',2,1,1589580432,1593859791),(8,'system.admin/export','导出',2,1,1589580432,1593859792),(9,'system.auth','角色权限管理',1,1,1589580432,1589580432),(10,'system.auth/authorize','授权',2,1,1589580432,1589580432),(11,'system.auth/saveAuthorize','授权保存',2,1,1589580432,1589580432),(12,'system.auth/index','列表',2,1,1589580432,1589580432),(13,'system.auth/add','添加',2,1,1589580432,1589580432),(14,'system.auth/edit','编辑',2,1,1589580432,1589580432),(15,'system.auth/delete','删除',2,1,1589580432,1589580432),(16,'system.auth/export','导出',2,1,1589580432,1589580432),(17,'system.auth/modify','属性修改',2,1,1589580432,1589580432),(18,'system.config','系统配置管理',1,1,1589580432,1589580432),(19,'system.config/index','列表',2,1,1589580432,1589580432),(20,'system.config/save','保存',2,1,1589580432,1589580432),(21,'system.menu','菜单管理',1,1,1589580432,1589580432),(22,'system.menu/index','列表',2,1,1589580432,1589580432),(23,'system.menu/add','添加',2,1,1589580432,1589580432),(24,'system.menu/edit','编辑',2,1,1589580432,1589580432),(25,'system.menu/delete','删除',2,1,1589580432,1589580432),(26,'system.menu/modify','属性修改',2,1,1589580432,1589580432),(27,'system.menu/getMenuTips','添加菜单提示',2,1,1589580432,1589580432),(28,'system.menu/export','导出',2,1,1589580432,1589580432),(29,'system.node','系统节点管理',1,1,1589580432,1589580432),(30,'system.node/index','列表',2,1,1589580432,1589580432),(31,'system.node/refreshNode','系统节点更新',2,1,1589580432,1589580432),(32,'system.node/clearNode','清除失效节点',2,1,1589580432,1589580432),(33,'system.node/add','添加',2,1,1589580432,1594019101),(34,'system.node/edit','编辑',2,1,1589580432,1594019096),(35,'system.node/delete','删除',2,1,1589580432,1594019091),(36,'system.node/export','导出',2,1,1589580432,1594019106),(37,'system.node/modify','属性修改',2,1,1589580432,1593860547),(38,'system.uploadfile','上传文件管理',1,1,1589580432,1589580432),(39,'system.uploadfile/index','列表',2,1,1589580432,1589580432),(40,'system.uploadfile/add','添加',2,1,1589580432,1589580432),(41,'system.uploadfile/edit','编辑',2,1,1589580432,1589580432),(42,'system.uploadfile/delete','删除',2,1,1589580432,1589580432),(43,'system.uploadfile/export','导出',2,1,1589580432,1589580432),(44,'system.uploadfile/modify','属性修改',2,1,1589580432,1589580432);
/*!40000 ALTER TABLE `system_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_uploadfile`
--

DROP TABLE IF EXISTS `system_uploadfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_uploadfile` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) DEFAULT NULL,
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int DEFAULT NULL COMMENT '创建日期',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `upload_time` int DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `upload_type` (`upload_type`),
  KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='后台_上传文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_uploadfile`
--

LOCK TABLES `system_uploadfile` WRITE;
/*!40000 ALTER TABLE `system_uploadfile` DISABLE KEYS */;
INSERT INTO `system_uploadfile` VALUES (2,'local','116f2b18201ca1346c57aad209e6ae23.ico','http://172.105.117.27/upload/20210807/b4d4dcb7f28d0c262445111f86bfb54a.ico','','','',0,'image/x-icon',0,'ico','',1628328415,NULL,NULL),(3,'local','348c9904ec0f23a40b0784327aedfecc.png','http://172.105.117.27/upload/20210807/febafa41c780ddeabc9d3e4e06ed9fcd.png','','','',0,'image/png',0,'png','',1628328432,NULL,NULL);
/*!40000 ALTER TABLE `system_uploadfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID {text}',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名 {text}',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号 {text}',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 {select} (0:正常, 1:冻结)',
  `token` text COMMENT 'token',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='前台_用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'crowtoken_com'
--

--
-- Dumping routines for database 'crowtoken_com'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-17 12:58:10

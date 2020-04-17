/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : bigpeng

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2020-04-17 10:25:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 用户', '6', 'add_user');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 用户', '6', 'change_user');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 用户', '6', 'delete_user');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 用户', '6', 'view_user');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 空气数据', '7', 'add_airdata');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 空气数据', '7', 'change_airdata');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 空气数据', '7', 'delete_airdata');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 空气数据', '7', 'view_airdata');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 土壤数据', '8', 'add_grounddata');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 土壤数据', '8', 'change_grounddata');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 土壤数据', '8', 'delete_grounddata');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 土壤数据', '8', 'view_grounddata');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 控制表', '9', 'add_controleexel');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 控制表', '9', 'change_controleexel');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 控制表', '9', 'delete_controleexel');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 控制表', '9', 'view_controleexel');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 比例系数表', '10', 'add_xidata');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 比例系数表', '10', 'change_xidata');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 比例系数表', '10', 'delete_xidata');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 比例系数表', '10', 'view_xidata');
INSERT INTO `auth_permission` VALUES ('41', 'Can add fuzzy查询表', '11', 'add_fuzzysearch');
INSERT INTO `auth_permission` VALUES ('42', 'Can change fuzzy查询表', '11', 'change_fuzzysearch');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete fuzzy查询表', '11', 'delete_fuzzysearch');
INSERT INTO `auth_permission` VALUES ('44', 'Can view fuzzy查询表', '11', 'view_fuzzysearch');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 新闻', '12', 'add_news');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 新闻', '12', 'change_news');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 新闻', '12', 'delete_news');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 新闻', '12', 'view_news');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 滚动新闻', '13', 'add_newsswiper');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 滚动新闻', '13', 'change_newsswiper');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 滚动新闻', '13', 'delete_newsswiper');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 滚动新闻', '13', 'view_newsswiper');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 新闻简介', '14', 'add_newsinfo');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 新闻简介', '14', 'change_newsinfo');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 新闻简介', '14', 'delete_newsinfo');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 新闻简介', '14', 'view_newsinfo');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 评论', '15', 'add_comment');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 评论', '15', 'change_comment');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 评论', '15', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 评论', '15', 'view_comment');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 设备名称', '16', 'add_statusname');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 设备名称', '16', 'change_statusname');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 设备名称', '16', 'delete_statusname');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 设备名称', '16', 'view_statusname');
INSERT INTO `auth_permission` VALUES ('65', 'Can add 设备状态', '17', 'add_status');
INSERT INTO `auth_permission` VALUES ('66', 'Can change 设备状态', '17', 'change_status');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete 设备状态', '17', 'delete_status');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 设备状态', '17', 'view_status');

-- ----------------------------
-- Table structure for df_airdata
-- ----------------------------
DROP TABLE IF EXISTS `df_airdata`;
CREATE TABLE `df_airdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `Air_wendu` decimal(10,2) NOT NULL,
  `Air_shidu` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_airdata
-- ----------------------------

-- ----------------------------
-- Table structure for df_comment
-- ----------------------------
DROP TABLE IF EXISTS `df_comment`;
CREATE TABLE `df_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `comment_content` longtext NOT NULL,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_comment_news_id_b5ba9ea6_fk_df_news_id` (`news_id`),
  KEY `df_comment_user_id_fdcec353_fk_df_user_id` (`user_id`),
  CONSTRAINT `df_comment_news_id_b5ba9ea6_fk_df_news_id` FOREIGN KEY (`news_id`) REFERENCES `df_news` (`id`),
  CONSTRAINT `df_comment_user_id_fdcec353_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_comment
-- ----------------------------

-- ----------------------------
-- Table structure for df_controlexcel
-- ----------------------------
DROP TABLE IF EXISTS `df_controlexcel`;
CREATE TABLE `df_controlexcel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `auto_flag` smallint(6) NOT NULL,
  `place` varchar(20) NOT NULL,
  `tu_depth` int(11) NOT NULL,
  `grow_circle` varchar(20) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `stop_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_controlexcel
-- ----------------------------
INSERT INTO `df_controlexcel` VALUES ('3', '2019-10-09 07:36:38.993078', '2019-10-09 07:36:38.993078', '1', '1', '大棚一', '20', '展叶期', '2019-10-08 16:00:00.000000', '2019-10-10 16:00:00.000000');
INSERT INTO `df_controlexcel` VALUES ('4', '2019-10-09 07:36:58.167365', '2019-10-09 07:36:58.167365', '0', '1', '大棚二', '40', '展叶期', '2019-10-09 03:01:00.000000', '2019-10-27 03:00:00.000000');
INSERT INTO `df_controlexcel` VALUES ('5', '2019-10-15 10:49:19.371488', '2019-10-15 10:49:19.371488', '0', '1', '大棚一', '20', '萌芽期', '2019-10-15 10:20:00.000000', '2019-10-16 15:30:00.000000');

-- ----------------------------
-- Table structure for df_fuzzytable
-- ----------------------------
DROP TABLE IF EXISTS `df_fuzzytable`;
CREATE TABLE `df_fuzzytable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `cha_value` decimal(10,2) NOT NULL,
  `zhengteng_value` decimal(10,2) NOT NULL,
  `water_length` int(11) NOT NULL,
  `grow_circle_id` int(11) NOT NULL,
  `xi_data_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_fuzzytable_grow_circle_id_e8a6d297_fk_df_controlexcel_id` (`grow_circle_id`),
  KEY `df_fuzzytable_xi_data_id_4007078f_fk_df_xidata_id` (`xi_data_id`),
  CONSTRAINT `df_fuzzytable_grow_circle_id_e8a6d297_fk_df_controlexcel_id` FOREIGN KEY (`grow_circle_id`) REFERENCES `df_controlexcel` (`id`),
  CONSTRAINT `df_fuzzytable_xi_data_id_4007078f_fk_df_xidata_id` FOREIGN KEY (`xi_data_id`) REFERENCES `df_xidata` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_fuzzytable
-- ----------------------------
INSERT INTO `df_fuzzytable` VALUES ('6', '2019-10-10 17:11:00.000000', '2019-10-10 17:11:00.000000', '0', '-6.00', '-6.00', '6', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('7', '2019-10-10 17:11:00.000000', '2019-10-10 17:11:00.000000', '0', '-6.00', '-6.00', '6', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('8', '2019-10-10 17:11:00.000000', '2019-10-10 17:11:00.000000', '0', '-6.00', '-6.00', '6', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('9', '2019-10-10 17:11:00.000000', '2019-10-10 17:11:00.000000', '0', '-6.00', '-6.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('10', '2019-10-10 17:11:00.000000', '2019-10-10 17:11:00.000000', '0', '-6.00', '-6.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('11', '2019-10-10 17:11:00.000000', '2019-10-10 17:11:00.000000', '0', '-6.00', '-6.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('12', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-6.00', '-6.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('13', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-6.00', '-6.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('14', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-6.00', '-6.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('15', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-6.00', '-6.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('16', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-6.00', '-6.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('17', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-6.00', '-6.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('18', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-6.00', '-6.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('19', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '6', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('20', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('21', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('22', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('23', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('24', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('25', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('26', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('27', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('28', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('29', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('30', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('31', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-5.00', '-5.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('32', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '6', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('33', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('34', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('35', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('36', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('37', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('38', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('39', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('40', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('41', '2019-10-10 17:12:00.000000', '2019-10-10 17:12:00.000000', '0', '-4.00', '-4.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('42', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-4.00', '-4.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('43', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-4.00', '-4.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('44', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-4.00', '-4.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('45', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('46', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('47', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('48', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('49', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('50', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('51', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('52', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('53', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('54', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('55', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('56', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('57', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-3.00', '-3.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('58', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('59', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('60', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('61', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('62', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('63', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('64', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('65', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('66', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('67', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('68', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('69', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('70', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-2.00', '-2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('71', '2019-10-10 17:13:00.000000', '2019-10-10 17:13:00.000000', '0', '-1.00', '-1.00', '5', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('72', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('73', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('74', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('75', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('76', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('77', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('78', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('79', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('80', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('81', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('82', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('83', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '-1.00', '-1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('84', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('85', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '4', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('86', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('87', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('88', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('89', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('90', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('91', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('92', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('93', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('94', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('95', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('96', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '0.00', '0.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('97', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '1.00', '1.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('98', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '1.00', '1.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('99', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '1.00', '1.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('100', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '1.00', '1.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('101', '2019-10-10 17:14:00.000000', '2019-10-10 17:14:00.000000', '0', '1.00', '1.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('102', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '1.00', '1.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('103', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '1.00', '1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('104', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '1.00', '1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('105', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '1.00', '1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('106', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '1.00', '1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('107', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '1.00', '1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('108', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '1.00', '1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('109', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '1.00', '1.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('110', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '3', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('111', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('112', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('113', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('114', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('115', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('116', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('117', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('118', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('119', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('120', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('121', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('122', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '2.00', '2.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('123', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '3.00', '3.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('124', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '3.00', '3.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('125', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '3.00', '3.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('126', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '3.00', '3.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('127', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '3.00', '3.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('128', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '3.00', '3.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('129', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '3.00', '3.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('130', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '3.00', '3.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('131', '2019-10-10 17:15:00.000000', '2019-10-10 17:15:00.000000', '0', '3.00', '3.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('132', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '3.00', '3.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('133', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '3.00', '3.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('134', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '3.00', '3.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('135', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '3.00', '3.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('136', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('137', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '2', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('138', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('139', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('140', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('141', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('142', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('143', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('144', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('145', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('146', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('147', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('148', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '4.00', '4.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('149', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('150', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('151', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('152', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('153', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('154', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('155', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('156', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('157', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('158', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('159', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('160', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('161', '2019-10-10 17:16:00.000000', '2019-10-10 17:16:00.000000', '0', '5.00', '5.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('162', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('163', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('164', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('165', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('166', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('167', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '1', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('168', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('169', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('170', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('171', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('172', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('173', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '0', '3', '1');
INSERT INTO `df_fuzzytable` VALUES ('174', '2019-10-10 17:17:00.000000', '2019-10-10 17:17:00.000000', '0', '6.00', '6.00', '0', '3', '1');

-- ----------------------------
-- Table structure for df_grounddata
-- ----------------------------
DROP TABLE IF EXISTS `df_grounddata`;
CREATE TABLE `df_grounddata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `tu_place` varchar(20) NOT NULL,
  `tu_depth` int(11) NOT NULL,
  `tu_shidu` decimal(10,1) NOT NULL,
  `tu_wendu` decimal(10,1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_grounddata
-- ----------------------------
INSERT INTO `df_grounddata` VALUES ('1', '2019-10-12 02:10:49', '2019-10-12 02:10:49', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('2', '2019-10-12 02:23:03', '2019-10-12 02:23:03', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('3', '2019-10-12 02:23:04', '2019-10-12 02:23:04', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('4', '2019-10-12 02:23:05', '2019-10-12 02:23:05', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('5', '2019-10-12 02:23:05', '2019-10-12 02:23:05', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('6', '2019-10-12 02:23:05', '2019-10-12 02:23:05', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('7', '2019-10-12 02:23:19', '2019-10-12 02:23:19', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('8', '2019-10-12 02:23:27', '2019-10-12 02:23:27', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('9', '2019-10-12 02:25:49', '2019-10-12 02:25:49', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('10', '2019-10-12 02:25:50', '2019-10-12 02:25:50', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('11', '2019-10-12 02:25:50', '2019-10-12 02:25:50', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('12', '2019-10-12 02:25:50', '2019-10-12 02:25:50', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('13', '2019-10-12 02:25:50', '2019-10-12 02:25:50', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('14', '2019-10-12 02:25:50', '2019-10-12 02:25:50', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('15', '2019-10-12 02:26:12', '2019-10-12 02:26:12', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('16', '2019-10-12 02:26:13', '2019-10-12 02:26:13', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('17', '2019-10-12 02:26:31', '2019-10-12 02:26:31', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('18', '2019-10-12 02:32:57', '2019-10-12 02:32:57', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('19', '2019-10-12 02:33:20', '2019-10-12 02:33:20', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('20', '2019-10-12 02:33:45', '2019-10-12 02:33:45', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('21', '2019-10-12 02:33:46', '2019-10-12 02:33:46', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('22', '2019-10-12 02:33:46', '2019-10-12 02:33:46', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('23', '2019-10-12 02:33:47', '2019-10-12 02:33:47', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('24', '2019-10-12 02:33:47', '2019-10-12 02:33:47', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('25', '2019-10-12 02:33:47', '2019-10-12 02:33:47', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('26', '2019-10-12 02:33:47', '2019-10-12 02:33:47', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('27', '2019-10-12 02:33:47', '2019-10-12 02:33:47', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('28', '2019-10-12 02:33:47', '2019-10-12 02:33:47', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('29', '2019-10-12 02:33:48', '2019-10-12 02:33:48', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('30', '2019-10-12 02:34:43', '2019-10-12 02:34:43', '0', '大棚一', '20', '79.6', '21.6');
INSERT INTO `df_grounddata` VALUES ('31', '2019-10-12 11:28:56', '2019-10-12 11:29:08', '0', '大棚一', '20', '80.0', '20.0');
INSERT INTO `df_grounddata` VALUES ('32', '2019-10-12 04:27:35', '2019-10-12 04:27:35', '0', '大棚一', '20', '38.2', '25.5');
INSERT INTO `df_grounddata` VALUES ('33', '2019-10-12 04:27:40', '2019-10-12 04:27:40', '0', '大棚一', '20', '38.2', '25.5');
INSERT INTO `df_grounddata` VALUES ('34', '2019-10-12 04:27:46', '2019-10-12 04:27:46', '0', '大棚一', '20', '38.2', '25.5');
INSERT INTO `df_grounddata` VALUES ('35', '2019-10-12 04:27:52', '2019-10-12 04:27:52', '0', '大棚一', '20', '38.3', '25.4');
INSERT INTO `df_grounddata` VALUES ('36', '2019-10-12 04:27:58', '2019-10-12 04:27:58', '0', '大棚一', '20', '38.3', '25.4');
INSERT INTO `df_grounddata` VALUES ('37', '2019-10-12 04:28:04', '2019-10-12 04:28:04', '0', '大棚一', '20', '38.6', '25.4');
INSERT INTO `df_grounddata` VALUES ('38', '2019-10-12 04:28:16', '2019-10-12 04:28:16', '0', '大棚一', '20', '38.4', '25.4');
INSERT INTO `df_grounddata` VALUES ('39', '2019-10-12 04:28:22', '2019-10-12 04:28:22', '0', '大棚一', '20', '38.5', '25.4');
INSERT INTO `df_grounddata` VALUES ('40', '2019-10-12 04:28:28', '2019-10-12 04:28:28', '0', '大棚一', '20', '39.0', '25.4');
INSERT INTO `df_grounddata` VALUES ('41', '2019-10-12 04:28:34', '2019-10-12 04:28:34', '0', '大棚一', '20', '39.6', '25.4');
INSERT INTO `df_grounddata` VALUES ('42', '2019-10-12 04:28:40', '2019-10-12 04:28:40', '0', '大棚一', '20', '39.6', '25.4');
INSERT INTO `df_grounddata` VALUES ('43', '2019-10-12 04:28:46', '2019-10-12 04:28:46', '0', '大棚一', '20', '39.6', '25.4');
INSERT INTO `df_grounddata` VALUES ('44', '2019-10-12 04:28:52', '2019-10-12 04:28:52', '0', '大棚一', '20', '39.2', '25.4');
INSERT INTO `df_grounddata` VALUES ('45', '2019-10-12 04:28:58', '2019-10-12 04:28:58', '0', '大棚一', '20', '38.9', '25.4');
INSERT INTO `df_grounddata` VALUES ('46', '2019-10-12 04:29:10', '2019-10-12 04:29:10', '0', '大棚一', '20', '39.9', '25.5');
INSERT INTO `df_grounddata` VALUES ('47', '2019-10-12 04:29:16', '2019-10-12 04:29:16', '0', '大棚一', '20', '40.3', '25.5');
INSERT INTO `df_grounddata` VALUES ('48', '2019-10-12 04:29:22', '2019-10-12 04:29:22', '0', '大棚一', '20', '40.9', '25.5');
INSERT INTO `df_grounddata` VALUES ('49', '2019-10-12 04:29:28', '2019-10-12 04:29:28', '0', '大棚一', '20', '40.4', '25.6');
INSERT INTO `df_grounddata` VALUES ('50', '2019-10-12 04:29:40', '2019-10-12 04:29:40', '0', '大棚一', '20', '39.3', '25.7');
INSERT INTO `df_grounddata` VALUES ('51', '2019-10-12 04:29:46', '2019-10-12 04:29:46', '0', '大棚一', '20', '39.0', '25.7');
INSERT INTO `df_grounddata` VALUES ('52', '2019-10-12 04:29:52', '2019-10-12 04:29:52', '0', '大棚一', '20', '39.0', '25.8');
INSERT INTO `df_grounddata` VALUES ('53', '2019-10-12 04:29:58', '2019-10-12 04:29:58', '0', '大棚一', '20', '38.8', '25.8');
INSERT INTO `df_grounddata` VALUES ('54', '2019-10-12 04:30:04', '2019-10-12 04:30:04', '0', '大棚一', '20', '38.6', '25.9');
INSERT INTO `df_grounddata` VALUES ('55', '2019-10-12 04:30:10', '2019-10-12 04:30:10', '0', '大棚一', '20', '38.7', '25.9');
INSERT INTO `df_grounddata` VALUES ('56', '2019-10-12 04:30:16', '2019-10-12 04:30:16', '0', '大棚一', '20', '38.7', '25.9');
INSERT INTO `df_grounddata` VALUES ('57', '2019-10-12 04:30:22', '2019-10-12 04:30:22', '0', '大棚一', '20', '38.7', '26.0');
INSERT INTO `df_grounddata` VALUES ('58', '2019-10-12 04:30:28', '2019-10-12 04:30:28', '0', '大棚一', '20', '38.5', '26.0');
INSERT INTO `df_grounddata` VALUES ('59', '2019-10-12 04:30:34', '2019-10-12 04:30:34', '0', '大棚一', '20', '38.5', '26.1');
INSERT INTO `df_grounddata` VALUES ('60', '2019-10-12 04:31:36', '2019-10-12 04:31:36', '0', '大棚一', '20', '61.1', '28.9');
INSERT INTO `df_grounddata` VALUES ('61', '2019-10-12 04:33:36', '2019-10-12 04:33:36', '0', '大棚一', '20', '41.0', '28.6');
INSERT INTO `df_grounddata` VALUES ('62', '2019-10-12 04:34:36', '2019-10-12 04:34:36', '0', '大棚一', '20', '49.8', '28.4');
INSERT INTO `df_grounddata` VALUES ('63', '2019-10-12 04:35:36', '2019-10-12 04:35:36', '0', '大棚一', '20', '61.5', '30.9');
INSERT INTO `df_grounddata` VALUES ('64', '2019-10-12 04:38:14', '2019-10-12 04:38:14', '0', '大棚一', '20', '41.0', '30.1');
INSERT INTO `df_grounddata` VALUES ('65', '2019-10-12 04:39:14', '2019-10-12 04:39:14', '0', '大棚一', '20', '39.4', '29.2');
INSERT INTO `df_grounddata` VALUES ('66', '2019-10-12 04:40:14', '2019-10-12 04:40:14', '0', '大棚一', '20', '45.8', '29.1');
INSERT INTO `df_grounddata` VALUES ('67', '2019-10-12 04:41:55', '2019-10-12 04:41:55', '0', '大棚一', '20', '62.9', '32.0');
INSERT INTO `df_grounddata` VALUES ('68', '2019-10-12 04:42:55', '2019-10-12 04:42:55', '0', '大棚一', '20', '57.3', '31.7');
INSERT INTO `df_grounddata` VALUES ('69', '2019-10-12 04:44:55', '2019-10-12 04:44:55', '0', '大棚一', '20', '42.0', '28.2');
INSERT INTO `df_grounddata` VALUES ('70', '2019-10-12 04:46:55', '2019-10-12 04:46:55', '0', '大棚一', '20', '42.0', '26.7');
INSERT INTO `df_grounddata` VALUES ('71', '2019-10-12 04:47:55', '2019-10-12 04:47:55', '0', '大棚一', '20', '41.0', '26.4');
INSERT INTO `df_grounddata` VALUES ('72', '2019-10-12 04:48:55', '2019-10-12 04:48:55', '0', '大棚一', '20', '57.1', '29.0');
INSERT INTO `df_grounddata` VALUES ('73', '2019-10-14 19:47:09', '2019-10-14 19:47:14', '0', '大棚一', '20', '57.0', '20.0');
INSERT INTO `df_grounddata` VALUES ('77', '2020-03-13 14:45:47', '2020-03-13 14:45:47', '0', '大棚一', '20', '50.0', '25.0');
INSERT INTO `df_grounddata` VALUES ('78', '2020-03-17 12:57:28', '2020-03-17 12:57:28', '0', '大棚一', '20', '60.9', '15.7');
INSERT INTO `df_grounddata` VALUES ('79', '2020-03-17 13:02:28', '2020-03-17 13:02:28', '0', '大棚一', '20', '58.5', '15.6');
INSERT INTO `df_grounddata` VALUES ('80', '2020-03-17 13:07:28', '2020-03-17 13:07:28', '0', '大棚一', '20', '57.0', '15.6');
INSERT INTO `df_grounddata` VALUES ('81', '2020-03-17 13:12:28', '2020-03-17 13:12:28', '0', '大棚一', '20', '53.8', '15.7');
INSERT INTO `df_grounddata` VALUES ('82', '2020-03-17 13:17:28', '2020-03-17 13:17:28', '0', '大棚一', '20', '55.4', '15.7');
INSERT INTO `df_grounddata` VALUES ('83', '2020-03-17 13:22:28', '2020-03-17 13:22:28', '0', '大棚一', '20', '56.6', '15.7');
INSERT INTO `df_grounddata` VALUES ('84', '2020-03-17 13:27:28', '2020-03-17 13:27:28', '0', '大棚一', '20', '54.1', '15.8');
INSERT INTO `df_grounddata` VALUES ('85', '2020-03-17 13:32:28', '2020-03-17 13:32:28', '0', '大棚一', '20', '57.1', '15.7');
INSERT INTO `df_grounddata` VALUES ('86', '2020-03-17 13:48:19', '2020-03-17 13:48:19', '0', '大棚一', '20', '58.0', '15.7');
INSERT INTO `df_grounddata` VALUES ('87', '2020-03-17 13:53:19', '2020-03-17 13:53:19', '0', '大棚一', '20', '59.9', '15.5');
INSERT INTO `df_grounddata` VALUES ('88', '2020-03-17 13:58:19', '2020-03-17 13:58:19', '0', '大棚一', '20', '61.1', '15.4');
INSERT INTO `df_grounddata` VALUES ('89', '2020-03-17 14:03:19', '2020-03-17 14:03:19', '0', '大棚一', '20', '61.6', '15.4');
INSERT INTO `df_grounddata` VALUES ('90', '2020-03-17 14:08:19', '2020-03-17 14:08:19', '0', '大棚一', '20', '62.1', '15.4');
INSERT INTO `df_grounddata` VALUES ('91', '2020-03-17 14:13:19', '2020-03-17 14:13:19', '0', '大棚一', '20', '62.5', '15.4');
INSERT INTO `df_grounddata` VALUES ('92', '2020-03-17 14:44:35', '2020-03-17 14:44:35', '0', '大棚一', '20', '62.5', '15.4');
INSERT INTO `df_grounddata` VALUES ('93', '2020-03-17 15:35:04', '2020-03-17 15:35:04', '0', '大棚一', '20', '62.5', '15.4');
INSERT INTO `df_grounddata` VALUES ('94', '2020-03-17 15:40:00', '2020-03-17 15:40:00', '0', '大棚一', '20', '67.2', '15.8');
INSERT INTO `df_grounddata` VALUES ('95', '2020-03-17 15:45:25', '2020-03-17 15:45:25', '0', '大棚一', '20', '67.8', '15.9');
INSERT INTO `df_grounddata` VALUES ('96', '2020-03-17 15:50:25', '2020-03-17 15:50:25', '0', '大棚一', '20', '67.9', '15.8');
INSERT INTO `df_grounddata` VALUES ('97', '2020-03-17 15:55:25', '2020-03-17 15:55:25', '0', '大棚一', '20', '68.1', '15.9');
INSERT INTO `df_grounddata` VALUES ('98', '2020-03-17 16:00:25', '2020-03-17 16:00:25', '0', '大棚一', '20', '67.8', '16.0');
INSERT INTO `df_grounddata` VALUES ('99', '2020-03-17 16:05:25', '2020-03-17 16:05:25', '0', '大棚一', '20', '67.2', '16.1');
INSERT INTO `df_grounddata` VALUES ('100', '2020-03-17 16:10:25', '2020-03-17 16:10:25', '0', '大棚一', '20', '66.9', '16.0');
INSERT INTO `df_grounddata` VALUES ('101', '2020-03-17 16:15:25', '2020-03-17 16:15:25', '0', '大棚一', '20', '66.4', '16.0');
INSERT INTO `df_grounddata` VALUES ('102', '2020-03-17 16:20:25', '2020-03-17 16:20:25', '0', '大棚一', '20', '65.8', '16.1');
INSERT INTO `df_grounddata` VALUES ('103', '2020-03-17 16:25:25', '2020-03-17 16:25:25', '0', '大棚一', '20', '66.6', '16.0');
INSERT INTO `df_grounddata` VALUES ('104', '2020-03-17 16:30:25', '2020-03-17 16:30:25', '0', '大棚一', '20', '66.4', '16.1');
INSERT INTO `df_grounddata` VALUES ('105', '2020-03-17 16:35:25', '2020-03-17 16:35:25', '0', '大棚一', '20', '66.3', '16.1');
INSERT INTO `df_grounddata` VALUES ('106', '2020-03-17 16:40:25', '2020-03-17 16:40:25', '0', '大棚一', '20', '66.4', '16.2');
INSERT INTO `df_grounddata` VALUES ('107', '2020-03-17 16:45:25', '2020-03-17 16:45:25', '0', '大棚一', '20', '66.5', '16.2');
INSERT INTO `df_grounddata` VALUES ('108', '2020-03-17 16:50:25', '2020-03-17 16:50:25', '0', '大棚一', '20', '65.6', '16.3');
INSERT INTO `df_grounddata` VALUES ('109', '2020-03-17 16:55:25', '2020-03-17 16:55:25', '0', '大棚一', '20', '64.5', '16.2');
INSERT INTO `df_grounddata` VALUES ('110', '2020-03-17 17:00:25', '2020-03-17 17:00:25', '0', '大棚一', '20', '64.7', '16.3');
INSERT INTO `df_grounddata` VALUES ('111', '2020-03-17 17:05:25', '2020-03-17 17:05:25', '0', '大棚一', '20', '63.7', '16.3');
INSERT INTO `df_grounddata` VALUES ('112', '2020-03-17 17:15:25', '2020-03-17 17:15:25', '0', '大棚一', '20', '63.4', '16.2');
INSERT INTO `df_grounddata` VALUES ('113', '2020-03-17 17:20:25', '2020-03-17 17:20:25', '0', '大棚一', '20', '63.6', '16.3');
INSERT INTO `df_grounddata` VALUES ('114', '2020-03-17 17:25:25', '2020-03-17 17:25:25', '0', '大棚一', '20', '63.7', '16.3');
INSERT INTO `df_grounddata` VALUES ('115', '2020-03-17 17:30:25', '2020-03-17 17:30:25', '0', '大棚一', '20', '63.0', '16.3');
INSERT INTO `df_grounddata` VALUES ('116', '2020-03-17 17:35:59', '2020-03-17 17:35:59', '0', '大棚一', '20', '62.5', '16.3');
INSERT INTO `df_grounddata` VALUES ('117', '2020-03-17 17:40:59', '2020-03-17 17:40:59', '0', '大棚一', '20', '62.2', '16.3');
INSERT INTO `df_grounddata` VALUES ('118', '2020-03-17 17:45:59', '2020-03-17 17:45:59', '0', '大棚一', '20', '62.1', '16.4');
INSERT INTO `df_grounddata` VALUES ('119', '2020-03-17 17:50:59', '2020-03-17 17:50:59', '0', '大棚一', '20', '62.8', '16.3');
INSERT INTO `df_grounddata` VALUES ('120', '2020-03-17 17:55:59', '2020-03-17 17:55:59', '0', '大棚一', '20', '62.2', '16.4');
INSERT INTO `df_grounddata` VALUES ('121', '2020-03-17 18:00:59', '2020-03-17 18:00:59', '0', '大棚一', '20', '62.0', '16.3');
INSERT INTO `df_grounddata` VALUES ('122', '2020-03-24 11:21:45', '2020-03-24 11:21:45', '0', '大棚一', '20', '50.0', '25.0');
INSERT INTO `df_grounddata` VALUES ('123', '2020-03-24 12:19:42', '2020-03-24 12:19:42', '0', '大棚一', '20', '58.5', '20.1');
INSERT INTO `df_grounddata` VALUES ('124', '2020-03-24 12:36:09', '2020-03-24 12:36:09', '0', '大棚一', '20', '57.7', '20.2');
INSERT INTO `df_grounddata` VALUES ('125', '2020-03-24 12:41:09', '2020-03-24 12:41:09', '0', '大棚一', '20', '57.8', '20.2');
INSERT INTO `df_grounddata` VALUES ('126', '2020-03-24 12:46:09', '2020-03-24 12:46:09', '0', '大棚一', '20', '57.8', '20.2');
INSERT INTO `df_grounddata` VALUES ('127', '2020-03-24 12:51:09', '2020-03-24 12:51:09', '0', '大棚一', '20', '56.0', '20.2');
INSERT INTO `df_grounddata` VALUES ('128', '2020-03-24 12:56:09', '2020-03-24 12:56:09', '0', '大棚一', '20', '56.6', '20.1');
INSERT INTO `df_grounddata` VALUES ('129', '2020-03-24 13:01:09', '2020-03-24 13:01:09', '0', '大棚一', '20', '56.6', '20.1');
INSERT INTO `df_grounddata` VALUES ('130', '2020-03-24 13:06:09', '2020-03-24 13:06:09', '0', '大棚一', '20', '56.6', '20.1');
INSERT INTO `df_grounddata` VALUES ('131', '2020-03-24 13:11:09', '2020-03-24 13:11:09', '0', '大棚一', '20', '56.6', '20.0');
INSERT INTO `df_grounddata` VALUES ('132', '2020-03-24 13:16:09', '2020-03-24 13:16:09', '0', '大棚一', '20', '56.6', '20.0');
INSERT INTO `df_grounddata` VALUES ('133', '2020-03-24 13:21:09', '2020-03-24 13:21:09', '0', '大棚一', '20', '56.4', '20.0');
INSERT INTO `df_grounddata` VALUES ('134', '2020-03-24 13:26:09', '2020-03-24 13:26:09', '0', '大棚一', '20', '56.4', '20.0');
INSERT INTO `df_grounddata` VALUES ('135', '2020-03-24 13:31:09', '2020-03-24 13:31:09', '0', '大棚一', '20', '56.2', '20.0');
INSERT INTO `df_grounddata` VALUES ('136', '2020-03-24 13:36:09', '2020-03-24 13:36:09', '0', '大棚一', '20', '56.1', '19.9');

-- ----------------------------
-- Table structure for df_news
-- ----------------------------
DROP TABLE IF EXISTS `df_news`;
CREATE TABLE `df_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `title` varchar(256) NOT NULL,
  `news_content` longtext NOT NULL,
  `editor` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_news
-- ----------------------------
INSERT INTO `df_news` VALUES ('7', '2019-10-15 15:23:08', '2019-10-15 15:23:08', '0', '中国减贫加速了世界减贫进程 为世界减贫做出卓绝贡献', '<p data-spm-anchor-id=\"0.0.0.i1\"><strong data-spm-anchor-id=\"0.0.0.i2\">&nbsp; &nbsp; &nbsp;央视网消息：</strong>记者从国家统计局获悉，新中国成立70年来，我国通过加快建设，深化改革和大规模扶贫开发，贫困人口大幅减少，成为全球最早实现联合国千年发展目标中减贫目标的发展中国家，加速了世界减贫进程，为全球减贫事业作出了巨大贡献。</p>\r\n<p>　　<strong>我国减贫速度明显快于全球。</strong>世界银行发布数据显示，按照每人每天1.9美元的国际贫困标准，从1981年末到2015年末，我国贫困发生率累计下降了87.6个百分点，年均下降2.6个百分点，同期全球贫困发生率累计下降32.2个百分点，年均下降0.9个百分点，我国减贫速度明显快于全球，贫困发生率也大大低于全球。</p>\r\n<p>　　<strong>为全球减贫提供中国经验。</strong>新中国成立70年来，我国以政府为主导的有计划有组织的扶贫开发，尤其是党的十八大以来精准脱贫方略的实施，取得了举世瞩目的成就，也为全球减贫提供了中国方案和中国经验。世界银行2018年发布的《中国系统性国别诊断》报告称&ldquo;中国在快速经济增长和减少贫困方面取得了&lsquo;史无前例的成就&rsquo;&rdquo;。联合国秘书长古特雷斯在&ldquo;2017减贫与发展高层论坛&rdquo;时发贺信盛赞中国减贫方略，称&ldquo;精准减贫方略是帮助最贫困人口、实现2030年可持续发展议程宏伟目标的唯一途径。中国已实现数亿人脱贫，中国的经验可以为其他发展中国家提供有益借鉴&rdquo;。</p>\r\n<p>　　<strong>积极开展国际减贫合作，为世界减贫贡献中国力量。</strong>中国在实现自身减贫的同时也努力帮助其他发展中国家减贫。截至2015年10月，中国共向166个国家和国际组织提供了近4000亿元人民币援助，派遣60多万援助人员，积极向69个国家提供医疗援助，并先后为120多个发展中国家落实联合国千年发展目标提供帮助。积极推进&ldquo;一带一路&rdquo;建设，让国际减贫合作成果惠及更多国家和人民。</p>', 'admin');
INSERT INTO `df_news` VALUES ('8', '2019-10-15 15:24:21', '2019-10-15 15:24:21', '0', '贫困地区生活环境明显改善 生活质量全面提高', '<p><strong data-spm-anchor-id=\"0.0.0.i0\">&nbsp; &nbsp; &nbsp;央视网消息：</strong>记者从国家统计局获悉，新中国是在战争的废墟和极度贫苦的环境中建立的，70年来，党和政府始终致力于农村基础设施建设和农村公共服务改善。党的十八大以来，各级政府继续加大对农村尤其是贫困地区建设和投入力度，贫困地区农村居民生活条件和生活环境明显改善，享有的公共服务水平不断提高，生活质量得到全面提高。</p>\r\n<p>　　贫困地区农村居民生活条件不断改善。从居住条件看，2018年贫困地区居住在钢筋混凝土房或砖混材料房的农户比重为67.4%，比2012年提高28.2个百分点；居住在竹草土坯房的农户比重为1.9%，比2012年下降了5.9个百分点；使用卫生厕所的农户比重为46.1%，比2012年提高20.4个百分点；饮水无困难的农户比重为93.6%，比2013年提高12.6个百分点。从家庭耐用消费品情况看，贫困地区农村居民家庭耐用消费品从无到有，产品升级换代。2018年贫困地区农村每百户拥有电冰箱、洗衣机、彩色电视机等传统耐用消费品分别为87.1台、86.9台和106.6台，分别比2012年增加39.6台、34.6台和8.3台，拥有量持续增加，和全国农村平均水平的差距逐渐缩小；每百户拥有汽车、计算机等现代耐用消费品分别为19.9辆、17.1台，分别是2012年的7.4倍和3.2倍，实现快速增长。</p>\r\n<p>　　贫困地区基础设施条件不断改善。截至2018年末，贫困地区通电的自然村接近全覆盖；通电话、通有线电视信号、通宽带的自然村比重分别达到99.2%、88.1%、81.9%，比2012年分别提高5.9个、19.1个、43.6个百分点。2018年，贫困地区村内主干道路面经过硬化处理的自然村比重为82.6%，比2013年提高22.7个百分点；通客运班车的自然村比重为54.7%，比2013年提高15.9个百分点。</p>\r\n<p>　　贫困地区公共服务水平不断提高。2018年，贫困地区87.1%的农户所在自然村上幼儿园便利，89.8%的农户所在自然村上小学便利，分别比2013年提高15.7个和10.0个百分点；有文化活动室的行政村比重为90.7%，比2012年提高16.2个百分点；贫困地区农村拥有合法行医证医生或卫生员的行政村比重为92.4%，比2012年提高9.0个百分点；93.2%的农户所在自然村有卫生站，比2013年提高8.8个百分点；78.9%的农户所在自然村垃圾能集中处理，比2013年提高49.0个百分点。</p>', 'root1');
INSERT INTO `df_news` VALUES ('9', '2019-10-15 15:27:05', '2019-10-15 15:27:05', '0', '农村贫困人口大幅度减少 精准扶贫、脱贫取得举世瞩目成就', '<p><strong data-spm-anchor-id=\"0.0.0.i0\">&nbsp; &nbsp; &nbsp; 央视网消息：</strong>记者从国家统计局获悉，新中国成立时，国家一穷二白，人民生活处于极端贫困状态。社会主义基本制度的确立，以及农村基础设施的建设、农业技术的推广、农村合作医疗体系的建立等为减缓贫困奠定了基础。改革开放以后，农村率先进行了经济制度改革，实行了家庭联产承包经营责任制，生产力得到极大解放，农民收入大幅提高，农民温饱问题逐步得以解决。以当时的农村贫困标准衡量，我国农村贫困人口从1978年末的2.5亿人减少到1985年末的1.25亿人；农村贫困发生率从1978年末的30.7%下降到1985年末的14.8%。若以现行农村贫困标准衡量，农村贫困人口从1978年末的7.7亿人减少到1985年末的6.6亿人，农村贫困发生率从1978年末的97.5%下降到1985年末的78.3%。</p>\r\n<p>　　上世纪80年代中期开始，我国针对区域发展不均衡问题，确立以贫困地区为重点，实施有计划有针对性的扶贫开发政策，先后实施了&ldquo;八七扶贫攻坚计划&rdquo;和两个为期10年的&ldquo;中国农村扶贫开发纲要&rdquo;，农村贫困程度进一步减轻，贫困人口继续大幅减少。以现行农村贫困标准衡量，2012年末我国农村贫困人口9899万人，比1985年末减少5.6亿多人，下降了85.0%；农村贫困发生率下降到10.2%，比1985年末下降了68.1个百分点。</p>\r\n<p>　　党的十八大以来，我国实施精准扶贫精准脱贫，全面打响了脱贫攻坚战，扶贫工作取得了决定性进展。按现行农村贫困标准，2013-2018年我国农村减贫人数分别为1650万人、1232万人、1442万人、1240万人、1289万人、1386万人，每年减贫人数均保持在1000万以上。六年来，农村已累计减贫8239万人，年均减贫1373万人，六年累计减贫幅度达到83.2%，农村贫困发生率也从2012年末的10.2%下降到2018年末的1.7%，其中，10个省份的农村贫困发生率已降至1.0%以下，中华民族千百年来的绝对贫困问题有望得到历史性解决。</p>', 'root2');
INSERT INTO `df_news` VALUES ('10', '2019-10-15 15:37:35', '2019-10-15 15:37:35', '0', '新型农业经营体系不断完善', '<p><strong data-spm-anchor-id=\"0.0.0.i0\">&nbsp; &nbsp; &nbsp; 央视网消息：</strong>记者从国家统计局获悉，新中国成立70年来，我国农业生产方式发生了深刻的变革，包括农村土地流转的深入推进，新型经营主体的大量涌现，新型生产模式的快速发展，加速了我国现代农业的转型升级。</p>\r\n<p>　　<strong>农村土地流转深入推进，适度规模经营快速发展</strong></p>\r\n<p>　　随着农村土地制度改革不断深化和&ldquo;三权分置&rdquo;制度的确立，农村承包地更加有序流转。2004年农村承包地流转面积为0.58亿亩，到2018年，全国家庭承包耕地流转面积超过了5.3亿亩。农村土地流转有力地推动了农业规模化发展，充分发挥适度规模经营在规模、资金、技术、信息、人才和管理等方面的优势，引领和加快推进现代农业建设。根据第三次全国农业普查结果，2016年耕地规模化（南方省份50亩以上、北方省份100亩以上）耕种面积占全部实际耕地耕种面积的比重为28.6%。2016年末规模化（年出栏生猪200头以上）养殖生猪存栏占全国生猪存栏总数的比重为62.9%，家禽规模化(肉鸡、肉鸭年出栏10000只及以上，蛋鸡、蛋鸭存栏2000只及以上，鹅年出栏1000只及以上)存栏占比达到73.9%。</p>\r\n<p>　　<strong>新型经营主体大量涌现，现代农业活力增强</strong></p>\r\n<p>　　国家着力培育各类新型农业生产经营主体和服务主体，农民专业合作社、家庭农场、龙头企业等大量涌现。截至2018年底，全国农民专业合作社注册数量217万个，家庭农场60万个。新型职业农民队伍不断壮大，大量农民工、中高等学校毕业生、退役军人、科技人员等返乡下乡人员加入新型职业农民队伍，成为建设现代农业的主力军。截至2018年，各类返乡下乡创新创业人员累计达780万人，为农业生产引入现代科技、生产方式和经营理念，推动现代农业产业体系、生产体系、经营体系不断完善，为现代农业发展注入新要素，增添新活力和持久动力。</p>\r\n<p>　　<strong>新型生产模式快速发展，拓宽了农业生产时空分布</strong></p>\r\n<p>　　随着农业生产技术和科技水平的提升，设施农业、无土栽培、观光农业、精准农业等新型农业生产模式快速发展。我国的设施农业在蔬菜、瓜果、花卉苗木等园艺产品产业上取得明显突破，各类大棚、中小棚、温室等农业设施增长较快。2018年末全国农业设施数量3000多万个，设施农业占地面积近4000万亩。设施农业、无土栽培等新型农业生产模式突破了资源自然条件限制，改变了农业生产的季节性，拓宽了农业生产的时空分布，为城乡居民提供丰富的新鲜瓜果蔬菜。同时新型农业生产模式快速发展促进了农业机械化、规模化、产业化、精准化发展，加快推动了我国农业由传统农业向现代农业转变。</p>', 'root3');
INSERT INTO `df_news` VALUES ('21', '2019-10-16 09:58:08', '2019-10-16 09:58:08', '0', '旱情影响长江中下游晚稻和水果等作物生长', '<p data-spm-anchor-id=\"0.0.0.i1\"><strong data-spm-anchor-id=\"0.0.0.i2\">央视网消息：</strong>中央气象台监测数据显示，8月以来，湖南、江西、湖北、福建、安徽南部等地的气温偏高1-4摄氏度，降水量较常年同期是偏少5成至1倍。专家介绍，长江中下游地区出现干旱，主要是由于8月以来持续高温少雨。</p>\r\n<p class=\"photo_img_20190808\"><img src=\"https://p4.img.cctvpic.com/photoworkspace/contentimg/2019/10/15/2019101509234859940.jpg\" alt=\" \" width=\"500\" data-bd-imgshare-binded=\"1\" /></p>', 'root');
INSERT INTO `df_news` VALUES ('22', '2019-10-16 10:00:05', '2019-10-16 10:00:05', '0', '北京：猪肉价格高位运行 上市量降至5年最低', '<p><strong data-spm-anchor-id=\"0.0.0.i1\">央视网消息：</strong>猪肉价格是影响CPI的重要因素，根据农业农村部监测，今年3月份开始猪肉价格呈持续上涨的走势，那近期走势有哪些新的变化呢？</p>\r\n<p class=\"photo_img_20190808\" data-spm-anchor-id=\"0.0.0.i2\"><img src=\"https://p2.img.cctvpic.com/photoworkspace/contentimg/2019/10/15/2019101509585291659.jpg\" alt=\" \" width=\"500\" data-bd-imgshare-binded=\"1\" /></p>', 'root');

-- ----------------------------
-- Table structure for df_newsinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_newsinfo`;
CREATE TABLE `df_newsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `news_info` longtext NOT NULL,
  `news_image` varchar(100) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_newsinfo_news_id_87b966d1_fk_df_news_id` (`news_id`),
  CONSTRAINT `df_newsinfo_news_id_87b966d1_fk_df_news_id` FOREIGN KEY (`news_id`) REFERENCES `df_news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_newsinfo
-- ----------------------------
INSERT INTO `df_newsinfo` VALUES ('5', '2019-10-15 15:12:15.892701', '2019-10-15 15:12:15.892701', '0', '新中国成立70年来，我国通过加快建设，深化改革和大规模扶贫开发，贫困人口大幅减少，成为全球最早实现联合国千年发展目标中减贫目标的发展中国家，加速了世界减贫进程，为全球减贫事业作出了巨大贡献。', 'news/2345_image_file_copy_7.jpg', '7');
INSERT INTO `df_newsinfo` VALUES ('6', '2019-10-15 15:25:43.693759', '2019-10-15 15:25:43.693759', '0', '党的十八大以来，各级政府继续加大对农村尤其是贫困地区建设和投入力度，贫困地区农村居民生活条件和生活环境明显改善，享有的公共服务水平不断提高，生活质量得到全面提高。', 'news/2345_image_file_copy_8.jpg', '8');
INSERT INTO `df_newsinfo` VALUES ('7', '2019-10-15 15:27:25.419405', '2019-10-15 15:27:25.419405', '0', '新中国成立时，国家一穷二白，人民生活处于极端贫困状态。社会主义基本制度的确立，以及农村基础设施的建设、农业技术的推广、农村合作医疗体系的建立等为减缓贫困奠定了基础。', 'news/2345_image_file_copy_9.jpg', '9');
INSERT INTO `df_newsinfo` VALUES ('8', '2019-10-15 15:37:50.310814', '2019-10-15 15:37:50.310814', '0', '截至2018年，各类返乡下乡创新创业人员累计达780万人，为农业生产引入现代科技、生产方式和经营理念，推动现代农业产业体系、生产体系、经营体系不断完善，为现代农业发展注入新要素，增添新活力和持久动力。', 'news/2345_image_file_copy_10.jpg', '10');

-- ----------------------------
-- Table structure for df_newsswiper
-- ----------------------------
DROP TABLE IF EXISTS `df_newsswiper`;
CREATE TABLE `df_newsswiper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `news_info` longtext NOT NULL,
  `news_image` varchar(100) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_newsswiper_news_id_3d475821_fk_df_news_id` (`news_id`),
  CONSTRAINT `df_newsswiper_news_id_3d475821_fk_df_news_id` FOREIGN KEY (`news_id`) REFERENCES `df_news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_newsswiper
-- ----------------------------
INSERT INTO `df_newsswiper` VALUES ('1', '2019-10-16 09:58:54.180304', '2019-10-16 09:58:54.180304', '0', '8月以来，湖南、江西、湖北、福建、安徽南部等地的降水量较常年同期是偏少5成至1倍。', 'news/2345_image_file_copy_1.jpg', '21');
INSERT INTO `df_newsswiper` VALUES ('2', '2019-10-16 10:00:48.548896', '2019-10-16 10:00:48.548896', '0', '根据农业农村部监测，今年3月份开始猪肉价格呈持续上涨的走势，那近期走势有哪些新的变化呢？', 'news/2345截图20191016100029.png', '22');

-- ----------------------------
-- Table structure for df_status
-- ----------------------------
DROP TABLE IF EXISTS `df_status`;
CREATE TABLE `df_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `temprature` int(11) NOT NULL,
  `vol` decimal(10,2) NOT NULL,
  `power` int(11) NOT NULL,
  `place` varchar(20) NOT NULL,
  `status_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_status
-- ----------------------------
INSERT INTO `df_status` VALUES ('1', '2019-10-15 09:36:41.000000', '2019-10-15 09:36:43.000000', '0', '25', '4.10', '98', '大棚一', '温度传感器');
INSERT INTO `df_status` VALUES ('2', '2019-10-15 09:38:29.000000', '2019-10-15 09:38:33.000000', '0', '23', '4.00', '97', '大棚一', '湿度传感器');
INSERT INTO `df_status` VALUES ('3', '2019-10-15 09:39:04.000000', '2019-10-15 09:39:10.000000', '0', '26', '4.50', '99', '大棚一', 'zigbee');
INSERT INTO `df_status` VALUES ('4', '2019-10-15 09:49:43.000000', '2019-10-15 09:49:47.000000', '0', '21', '3.80', '94', '大棚二', '温度传感器');

-- ----------------------------
-- Table structure for df_user
-- ----------------------------
DROP TABLE IF EXISTS `df_user`;
CREATE TABLE `df_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_user
-- ----------------------------
INSERT INTO `df_user` VALUES ('1', 'pbkdf2_sha256$150000$aXva9rO6jYPe$tlzF/C3uQoo6ifpBTaNbTOU0ERq8nOAGDY/avzQ/PYc=', '2019-10-16 16:03:11.718386', '0', 'admin', '', '', '1447826735@qq', '0', '1', '2019-10-09 05:11:05.285554', '2019-10-09 05:11:05.554385', '2019-10-09 05:11:05.554385', '0', '', '');
INSERT INTO `df_user` VALUES ('2', 'pbkdf2_sha256$150000$76gMszzNbAn8$ZO2d7DHZm9AiTzG5UHCkUVXdSiA+WnvLKPptTfKCZDE=', '2020-03-08 12:00:38.420237', '1', 'root', '', '', '1447826735@qq.com', '1', '1', '2019-10-10 08:23:00.696236', '2019-10-10 08:23:01.001048', '2019-10-10 08:23:01.001048', '0', '', '');

-- ----------------------------
-- Table structure for df_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `df_user_groups`;
CREATE TABLE `df_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `df_user_groups_user_id_group_id_80e5ab91_uniq` (`user_id`,`group_id`),
  KEY `df_user_groups_group_id_36f24e94_fk_auth_group_id` (`group_id`),
  CONSTRAINT `df_user_groups_group_id_36f24e94_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `df_user_groups_user_id_a816b098_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for df_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `df_user_user_permissions`;
CREATE TABLE `df_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `df_user_user_permissions_user_id_permission_id_b22997de_uniq` (`user_id`,`permission_id`),
  KEY `df_user_user_permiss_permission_id_40a6cb2d_fk_auth_perm` (`permission_id`),
  CONSTRAINT `df_user_user_permiss_permission_id_40a6cb2d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `df_user_user_permissions_user_id_b5f6551b_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for df_xidata
-- ----------------------------
DROP TABLE IF EXISTS `df_xidata`;
CREATE TABLE `df_xidata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `Ke` decimal(10,2) NOT NULL,
  `Kec` decimal(10,2) NOT NULL,
  `Ku` decimal(10,2) NOT NULL,
  `grow_circle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_xidata_grow_circle_id_c63f0b00_fk_df_controlexcel_id` (`grow_circle_id`),
  CONSTRAINT `df_xidata_grow_circle_id_c63f0b00_fk_df_controlexcel_id` FOREIGN KEY (`grow_circle_id`) REFERENCES `df_controlexcel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_xidata
-- ----------------------------
INSERT INTO `df_xidata` VALUES ('1', '2019-10-10 09:06:56.228134', '2019-10-10 09:06:56.228134', '0', '0.60', '3.30', '10.00', '3');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_df_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-10-10 09:06:56.229133', '1', 'XiData object (1)', '1', '[{\"added\": {}}]', '10', '2');
INSERT INTO `django_admin_log` VALUES ('2', '2019-10-10 09:08:06.199023', '1', 'FuzzySearch object (1)', '1', '[{\"added\": {}}]', '11', '2');
INSERT INTO `django_admin_log` VALUES ('3', '2019-10-10 09:08:26.560235', '2', 'FuzzySearch object (2)', '1', '[{\"added\": {}}]', '11', '2');
INSERT INTO `django_admin_log` VALUES ('4', '2019-10-10 09:09:05.447436', '3', 'FuzzySearch object (3)', '1', '[{\"added\": {}}]', '11', '2');
INSERT INTO `django_admin_log` VALUES ('5', '2019-10-10 09:09:43.198876', '4', 'FuzzySearch object (4)', '1', '[{\"added\": {}}]', '11', '2');
INSERT INTO `django_admin_log` VALUES ('6', '2019-10-15 12:08:00.767744', '1', 'NewsInfo object (1)', '1', '[{\"added\": {}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('7', '2019-10-15 12:24:04.026122', '1', 'NewsInfo object (1)', '2', '[]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('8', '2019-10-15 12:24:31.609149', '1', 'NewsInfo object (1)', '2', '[{\"changed\": {\"fields\": [\"news_image\"]}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('9', '2019-10-15 14:41:21.687042', '1', 'NewsInfo object (1)', '2', '[{\"changed\": {\"fields\": [\"news_image\"]}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('10', '2019-10-15 14:42:06.345458', '1', 'NewsInfo object (1)', '2', '[{\"changed\": {\"fields\": [\"news_image\"]}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('11', '2019-10-15 14:43:14.339298', '1', 'NewsInfo object (1)', '2', '[{\"changed\": {\"fields\": [\"news_image\"]}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('12', '2019-10-15 15:02:02.902888', '1', 'NewsInfo object (1)', '2', '[{\"changed\": {\"fields\": [\"news_image\"]}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('13', '2019-10-15 15:03:17.918708', '1', 'NewsInfo object (1)', '2', '[{\"changed\": {\"fields\": [\"news_image\"]}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('14', '2019-10-15 15:04:10.827778', '1', 'NewsInfo object (1)', '2', '[{\"changed\": {\"fields\": [\"news_image\"]}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('15', '2019-10-15 15:06:15.273797', '2', 'NewsInfo object (2)', '1', '[{\"added\": {}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('16', '2019-10-15 15:07:02.586773', '3', 'NewsInfo object (3)', '1', '[{\"added\": {}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('17', '2019-10-15 15:09:12.985244', '4', 'NewsInfo object (4)', '1', '[{\"added\": {}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('18', '2019-10-15 15:12:15.895700', '5', 'NewsInfo object (5)', '1', '[{\"added\": {}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('19', '2019-10-15 15:23:07.669767', '7', 'News object (7)', '1', '[{\"added\": {}}]', '12', '2');
INSERT INTO `django_admin_log` VALUES ('20', '2019-10-15 15:24:00.577439', '5', 'NewsInfo object (5)', '2', '[{\"changed\": {\"fields\": [\"news\", \"news_info\", \"news_image\"]}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('21', '2019-10-15 15:24:20.914285', '8', 'News object (8)', '1', '[{\"added\": {}}]', '12', '2');
INSERT INTO `django_admin_log` VALUES ('22', '2019-10-15 15:25:12.935536', '8', 'News object (8)', '2', '[{\"changed\": {\"fields\": [\"news_content\"]}}]', '12', '2');
INSERT INTO `django_admin_log` VALUES ('23', '2019-10-15 15:25:43.695758', '6', 'NewsInfo object (6)', '1', '[{\"added\": {}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('24', '2019-10-15 15:27:04.996827', '9', 'News object (9)', '1', '[{\"added\": {}}]', '12', '2');
INSERT INTO `django_admin_log` VALUES ('25', '2019-10-15 15:27:25.422403', '7', 'NewsInfo object (7)', '1', '[{\"added\": {}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('26', '2019-10-15 15:27:28.145864', '7', 'NewsInfo object (7)', '2', '[]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('27', '2019-10-15 15:37:34.810110', '10', 'News object (10)', '1', '[{\"added\": {}}]', '12', '2');
INSERT INTO `django_admin_log` VALUES ('28', '2019-10-15 15:37:50.312812', '8', 'NewsInfo object (8)', '1', '[{\"added\": {}}]', '14', '2');
INSERT INTO `django_admin_log` VALUES ('29', '2019-10-16 09:58:08.469154', '21', 'News object (21)', '1', '[{\"added\": {}}]', '12', '2');
INSERT INTO `django_admin_log` VALUES ('30', '2019-10-16 09:58:54.226283', '1', 'NewsSwiper object (1)', '1', '[{\"added\": {}}]', '13', '2');
INSERT INTO `django_admin_log` VALUES ('31', '2019-10-16 10:00:04.778814', '22', 'News object (22)', '1', '[{\"added\": {}}]', '12', '2');
INSERT INTO `django_admin_log` VALUES ('32', '2019-10-16 10:00:48.578878', '2', 'NewsSwiper object (2)', '1', '[{\"added\": {}}]', '13', '2');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('9', 'control', 'controleexel');
INSERT INTO `django_content_type` VALUES ('11', 'control', 'fuzzysearch');
INSERT INTO `django_content_type` VALUES ('10', 'control', 'xidata');
INSERT INTO `django_content_type` VALUES ('7', 'datas', 'airdata');
INSERT INTO `django_content_type` VALUES ('8', 'datas', 'grounddata');
INSERT INTO `django_content_type` VALUES ('15', 'news', 'comment');
INSERT INTO `django_content_type` VALUES ('12', 'news', 'news');
INSERT INTO `django_content_type` VALUES ('14', 'news', 'newsinfo');
INSERT INTO `django_content_type` VALUES ('13', 'news', 'newsswiper');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('17', 'status', 'status');
INSERT INTO `django_content_type` VALUES ('16', 'status', 'statusname');
INSERT INTO `django_content_type` VALUES ('6', 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-10-09 05:07:25.737031');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-10-09 05:07:27.020821');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-10-09 05:07:28.101680');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-10-09 05:07:31.948799');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-10-09 05:07:32.013759');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-10-09 05:07:32.082719');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-10-09 05:07:32.144681');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-10-09 05:07:32.197648');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2019-10-09 05:07:32.272603');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2019-10-09 05:07:32.332888');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2019-10-09 05:07:32.394849');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2019-10-09 05:07:32.542760');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2019-10-09 05:07:32.613716');
INSERT INTO `django_migrations` VALUES ('14', 'user', '0001_initial', '2019-10-09 05:07:33.632629');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0001_initial', '2019-10-09 05:07:37.863009');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0002_logentry_remove_auto_add', '2019-10-09 05:07:39.725112');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0003_logentry_add_action_flag_choices', '2019-10-09 05:07:39.864029');
INSERT INTO `django_migrations` VALUES ('18', 'control', '0001_initial', '2019-10-09 05:07:40.946055');
INSERT INTO `django_migrations` VALUES ('19', 'datas', '0001_initial', '2019-10-09 05:07:44.100325');
INSERT INTO `django_migrations` VALUES ('20', 'news', '0001_initial', '2019-10-09 05:07:45.345871');
INSERT INTO `django_migrations` VALUES ('21', 'news', '0002_comment_user', '2019-10-09 05:07:48.040972');
INSERT INTO `django_migrations` VALUES ('22', 'sessions', '0001_initial', '2019-10-09 05:07:49.221968');
INSERT INTO `django_migrations` VALUES ('23', 'status', '0001_initial', '2019-10-09 05:07:50.142883');
INSERT INTO `django_migrations` VALUES ('24', 'datas', '0002_auto_20191012_1124', '2019-10-12 03:25:05.378446');
INSERT INTO `django_migrations` VALUES ('25', 'control', '0002_auto_20191015_0935', '2019-10-15 09:36:30.262271');
INSERT INTO `django_migrations` VALUES ('26', 'status', '0002_auto_20191015_0935', '2019-10-15 09:36:31.227675');
INSERT INTO `django_migrations` VALUES ('27', 'status', '0003_auto_20191015_0938', '2019-10-15 09:38:16.512902');
INSERT INTO `django_migrations` VALUES ('28', 'control', '0003_auto_20191015_1002', '2019-10-15 10:02:13.828837');
INSERT INTO `django_migrations` VALUES ('29', 'status', '0004_auto_20191015_1002', '2019-10-15 10:02:15.432853');
INSERT INTO `django_migrations` VALUES ('30', 'news', '0003_auto_20191015_1440', '2019-10-15 14:40:57.212089');
INSERT INTO `django_migrations` VALUES ('31', 'control', '0004_auto_20191015_1442', '2019-10-15 14:42:36.420476');
INSERT INTO `django_migrations` VALUES ('32', 'news', '0004_auto_20191015_1442', '2019-10-15 14:42:36.506423');
INSERT INTO `django_migrations` VALUES ('33', 'control', '0005_auto_20191015_1506', '2019-10-15 15:06:46.376673');
INSERT INTO `django_migrations` VALUES ('34', 'control', '0006_auto_20191015_1510', '2019-10-15 15:11:07.694605');
INSERT INTO `django_migrations` VALUES ('35', 'control', '0007_auto_20191015_2058', '2019-10-15 20:58:22.554175');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;

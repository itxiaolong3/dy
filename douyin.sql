/*
Navicat MySQL Data Transfer

Source Server         : mydemo
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : douyin

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-09-11 00:21:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dy_addmoney
-- ----------------------------
DROP TABLE IF EXISTS `dy_addmoney`;
CREATE TABLE `dy_addmoney` (
  `m_id` int(20) NOT NULL AUTO_INCREMENT,
  `m_sid` int(20) DEFAULT NULL,
  `m_total` varchar(50) DEFAULT '',
  `m_addmoneytype` varchar(50) DEFAULT NULL,
  `m_yue` varchar(50) DEFAULT NULL COMMENT '充值后的余额',
  `m_addtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_addmoney
-- ----------------------------

-- ----------------------------
-- Table structure for dy_admin
-- ----------------------------
DROP TABLE IF EXISTS `dy_admin`;
CREATE TABLE `dy_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT '' COMMENT '用户名',
  `password` char(32) DEFAULT '' COMMENT '密码',
  `md5psw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='总管理员';

-- ----------------------------
-- Records of dy_admin
-- ----------------------------
INSERT INTO `dy_admin` VALUES ('2', 'admin', 'xiaolong', '96a33bb88bf2758cc306d7f6602be0de');
INSERT INTO `dy_admin` VALUES ('4', 'zccm', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- ----------------------------
-- Table structure for dy_adprice
-- ----------------------------
DROP TABLE IF EXISTS `dy_adprice`;
CREATE TABLE `dy_adprice` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_price` varchar(20) DEFAULT NULL COMMENT '广告价格',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_adprice
-- ----------------------------
INSERT INTO `dy_adprice` VALUES ('1', '0.5');

-- ----------------------------
-- Table structure for dy_chuanyi
-- ----------------------------
DROP TABLE IF EXISTS `dy_chuanyi`;
CREATE TABLE `dy_chuanyi` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_danid` int(11) DEFAULT NULL COMMENT '单元id',
  `c_utilname` varchar(100) DEFAULT NULL COMMENT '推广单元名称',
  `c_videourl` text,
  `c_name` varchar(100) DEFAULT NULL COMMENT '创意名称',
  `c_title` varchar(100) DEFAULT NULL COMMENT '创意标题',
  `c_url` text COMMENT '创意链接',
  `c_button` varchar(100) DEFAULT NULL,
  `c_desc` varchar(150) DEFAULT NULL COMMENT '广告描述',
  `c_status` int(5) DEFAULT '0' COMMENT '0-待审核 1-通过 -1拒绝',
  `c_uid` int(5) DEFAULT NULL COMMENT '账号id',
  `dcomment` varchar(100) DEFAULT '' COMMENT '拒绝理由',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_chuanyi
-- ----------------------------
INSERT INTO `dy_chuanyi` VALUES ('1', '1', '测试单元', 'uploadvideo/2018-09-10/5b968f106acd0.mp4', '搞笑', '为阿', 'http://www.itxiaolong.cn', '立即点击', '没有描述', '1', '2', '');
INSERT INTO `dy_chuanyi` VALUES ('2', '1', '测试单元', 'uploadvideo/2018-09-10/5b968fb2ae99a.mp4', '单元二', '订单', 'http://www.itxiaolong.cn', '立即点击', '', '1', '2', '');

-- ----------------------------
-- Table structure for dy_everyday
-- ----------------------------
DROP TABLE IF EXISTS `dy_everyday`;
CREATE TABLE `dy_everyday` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_planname` varchar(100) DEFAULT NULL,
  `e_usenum` varchar(100) DEFAULT NULL,
  `e_shownum` varchar(100) DEFAULT NULL,
  `e_clicknum` varchar(100) DEFAULT NULL,
  `e_time` int(100) DEFAULT NULL,
  `e_usetime` datetime DEFAULT NULL,
  `e_status` int(2) DEFAULT '0' COMMENT '0-关闭状态  1-正常消耗',
  `e_sid` int(2) DEFAULT NULL COMMENT '账号id',
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_everyday
-- ----------------------------
INSERT INTO `dy_everyday` VALUES ('1', '棋牌', '1500', '76320', '1440', '1536595105', '2018-09-10 00:00:00', '0', '2');

-- ----------------------------
-- Table structure for dy_gailv
-- ----------------------------
DROP TABLE IF EXISTS `dy_gailv`;
CREATE TABLE `dy_gailv` (
  `gl_id` int(10) NOT NULL AUTO_INCREMENT,
  `g_sid` int(10) DEFAULT NULL,
  `g_showglsmall` varchar(50) DEFAULT NULL COMMENT '曝光的概率最低',
  `g_showgltall` varchar(50) DEFAULT NULL COMMENT '曝光的概率最高',
  `g_clicksmall` varchar(50) DEFAULT NULL COMMENT '点击最低概率',
  `g_clicktall` varchar(50) DEFAULT NULL COMMENT '点击最高概率',
  PRIMARY KEY (`gl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='账号的概率表';

-- ----------------------------
-- Records of dy_gailv
-- ----------------------------
INSERT INTO `dy_gailv` VALUES ('1', '1', '500', '1500', '500', '1500');
INSERT INTO `dy_gailv` VALUES ('2', '2', '500', '1500', '500', '1500');
INSERT INTO `dy_gailv` VALUES ('3', '1', '500', '1500', '500', '1500');
INSERT INTO `dy_gailv` VALUES ('4', '2', '500', '1500', '500', '1500');

-- ----------------------------
-- Table structure for dy_plan
-- ----------------------------
DROP TABLE IF EXISTS `dy_plan`;
CREATE TABLE `dy_plan` (
  `p_id` int(20) NOT NULL AUTO_INCREMENT,
  `p_sid` int(20) DEFAULT NULL COMMENT '账户id',
  `p_name` varchar(100) DEFAULT NULL COMMENT '计划名称',
  `p_repnum` varchar(100) DEFAULT NULL COMMENT '每日预耗',
  `p_price` varchar(100) DEFAULT NULL COMMENT '广告价格',
  `p_allshownum` int(50) DEFAULT NULL COMMENT '总曝光量',
  `p_allclicknum` int(50) DEFAULT NULL COMMENT '总点击量',
  `p_status` int(2) DEFAULT '0' COMMENT '0-待审核 1-通过 2-拒绝',
  `p_housuse` varchar(50) DEFAULT NULL COMMENT '时耗',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_plan
-- ----------------------------
INSERT INTO `dy_plan` VALUES ('1', '2', '棋牌', '1500', '1.2', '76320', '1440', '1', '850');

-- ----------------------------
-- Table structure for dy_recordlist
-- ----------------------------
DROP TABLE IF EXISTS `dy_recordlist`;
CREATE TABLE `dy_recordlist` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_planname` varchar(100) DEFAULT NULL COMMENT '计划名称',
  `r_usemoney` varchar(50) DEFAULT NULL COMMENT '每日消耗的金额',
  `r_shownum` varchar(50) DEFAULT NULL COMMENT '曝光量',
  `r_onclicknum` varchar(50) DEFAULT NULL COMMENT '点击数',
  `r_sid` int(20) DEFAULT NULL COMMENT '所属账号',
  `r_yue` varchar(50) DEFAULT NULL COMMENT '当前余额',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日统计';

-- ----------------------------
-- Records of dy_recordlist
-- ----------------------------

-- ----------------------------
-- Table structure for dy_shop
-- ----------------------------
DROP TABLE IF EXISTS `dy_shop`;
CREATE TABLE `dy_shop` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dcompanyname` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `dloginname` varchar(255) DEFAULT NULL COMMENT '登录用户名',
  `dpasswordmd5` varchar(255) DEFAULT NULL COMMENT '加密密码',
  `dpassword` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `dshstatus` int(2) DEFAULT '1' COMMENT '审核状态  1-通过审核 2- 拒绝',
  `dyue` varchar(255) DEFAULT NULL COMMENT '余额',
  `dhistorypay` varchar(255) DEFAULT NULL COMMENT '历史消耗',
  `durl` text COMMENT '开户链接',
  `dicpimg` varchar(100) DEFAULT 'images/nopic.png' COMMENT 'icp备案照片',
  `dyinyeimg` varchar(100) DEFAULT 'images/nopic.png' COMMENT '营业执照',
  `dotherimg` varchar(100) DEFAULT 'images/nopic.png' COMMENT '其他图片',
  `dcomment` varchar(100) DEFAULT NULL COMMENT '拒绝理由',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_shop
-- ----------------------------
INSERT INTO `dy_shop` VALUES ('1', '小龙科技信息有限公司', '小龙', '3d215d8fede736ee6ab52f54902ccdba', 'admin', '1', null, null, 'http://www.itxiaolong.cn', 'admin/uploads/2018-09-10/5b968e532d675.png', 'admin/uploads/2018-09-10/5b968e4e0e0b2.jpg', 'admin/uploads/2018-09-10/5b968e595accb.png', null);
INSERT INTO `dy_shop` VALUES ('2', '深圳阿龙技术有限公司', '测试一', '3d215d8fede736ee6ab52f54902ccdba', 'admin', '1', '0', '1699.2', 'http:www.baidu.com', 'admin/uploads/2018-09-10/5b968e9e200ee.png', 'admin/uploads/2018-09-10/5b968e98a2f75.png', 'images/nopic.png', null);

-- ----------------------------
-- Table structure for dy_tguitl
-- ----------------------------
DROP TABLE IF EXISTS `dy_tguitl`;
CREATE TABLE `dy_tguitl` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_did` int(10) DEFAULT NULL COMMENT '计划id',
  `u_name` varchar(100) DEFAULT NULL COMMENT '单元名称',
  `u_planname` varchar(100) DEFAULT NULL COMMENT '计划名字',
  `u_sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `u_area` varchar(100) DEFAULT NULL COMMENT '地区状态 0-不限 1-限制部分',
  `u_areaid` varchar(100) DEFAULT NULL COMMENT '地区id',
  `u_age` varchar(100) DEFAULT NULL COMMENT '年龄值',
  `u_ageid` varchar(100) DEFAULT NULL COMMENT '年龄id',
  `u_wifi` varchar(100) DEFAULT NULL COMMENT '网络',
  `u_tgtype` varchar(100) DEFAULT NULL COMMENT '推广方式',
  `u_keyword` text COMMENT '关键字',
  `u_price` varchar(10) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_tguitl
-- ----------------------------
INSERT INTO `dy_tguitl` VALUES ('1', '1', '测试单元', '棋牌', '0', '1', 'ck_35,ck_36', '19-24,25-29', 'wifi-2,wifi-3', '4G', 'cpc', '', '0.6');

-- ----------------------------
-- Table structure for dy_user
-- ----------------------------
DROP TABLE IF EXISTS `dy_user`;
CREATE TABLE `dy_user` (
  `uid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称',
  `headerimg` text,
  `phone` varchar(12) DEFAULT NULL,
  `shopid` int(20) DEFAULT NULL,
  `openid` text,
  `uaddtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_user
-- ----------------------------
INSERT INTO `dy_user` VALUES ('1', '垃圾', 'admin/uploads/2018-08-05/5b666983e92b9.jpg', '13413698547', '5', 'oo5_j09f_tmEN2SrZo7_jwFIhxl', '1533545970');
INSERT INTO `dy_user` VALUES ('2', '大龙', 'admin/uploads/2018-08-05/5b666ad9a3f7a.jpg', '13425874874', '5', 'oo5_j09f_tmEN2SrZo7_jwFIhxl', '1533545987');
INSERT INTO `dy_user` VALUES ('3', '吊仔', 'admin/uploads/2018-08-05/5b666983e92b9.jpg', '18325487440', '6', 'oo5_j09f_tmEN2SrZo7_jwFIhxl', '1533545980');
INSERT INTO `dy_user` VALUES ('7', '小龙', 'http://thirdwx.qlogo.cn/mmopen/vi_32/8t1ibxveiaNUcprg6wjFyCziastf9zEDjkTSQbDlZwIHkLyqtoMmuNF8YucgOTxdxbVH8ZNguFf2mkFpUDWKDickRg/132', '', '5', 'o9uGT0RhDgWsy3NNvuN7QYuHE2xk', '1533916365');
INSERT INTO `dy_user` VALUES ('8', '明月湖', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Bc4tu3eQic9By7KlXiaRnxEiaPzA6ibuDPWXiaiaCibniaIIC9jVazZPkSia3kksxNxdfQquZGOq603XyanUx4BFlJLIdaw/132', null, '5', 'o9uGT0ZwRuqdP1avOCCKPuWiTWYE', '1533916161');

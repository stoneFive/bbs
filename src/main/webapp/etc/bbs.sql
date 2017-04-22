/*
Navicat MySQL Data Transfer

Source Server         : 本地mysql
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-04-16 19:43:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES ('3', '2017-04-05 15:53:01', null, '111111', '111111@11.com', '111111', '111111');
INSERT INTO `t_account` VALUES ('4', '2017-04-05 17:26:11', null, '1111113', '111111@123.com', '111111', '111111');
INSERT INTO `t_account` VALUES ('5', '2017-04-08 17:23:02', null, '666666', 'see@163.com', 'see', '123456');
INSERT INTO `t_account` VALUES ('6', '2017-04-15 17:02:03', null, '777777', '777777@123', '777777', '777777');
INSERT INTO `t_account` VALUES ('7', '2017-04-15 17:02:32', null, '888888', '888888@123', '888888', '888888');
INSERT INTO `t_account` VALUES ('8', '2017-04-25 17:02:49', null, '999999', '999999@123', '999999', '111111');
INSERT INTO `t_account` VALUES ('9', '2017-04-27 17:03:24', null, '444444', '444444', '444444', '444444');
INSERT INTO `t_account` VALUES ('10', '2017-04-22 17:03:57', null, '789789', '789789', '789789', '789789');
INSERT INTO `t_account` VALUES ('11', '2017-04-20 17:04:20', null, '7897891', '789789', '789789', '789789');
INSERT INTO `t_account` VALUES ('13', '2017-04-24 17:11:09', null, '123456', '123456', '123456', '123456');

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `borrow_name` varchar(255) DEFAULT NULL,
  `borrow_time` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `replay` varchar(255) DEFAULT NULL,
  `replay_nam` varchar(255) DEFAULT NULL,
  `return_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `rephone` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `create` varchar(255) DEFAULT NULL,
  `creater` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES ('6', '2017-04-10 21:24:47', '2017-04-15 19:59:41', '教学楼23号', '测试', '2017-04-10 21:24:37', '教学楼23号', '13212121212', '测试', '张三', '2017-04-28 21:24:40', '1', '18612345678', '测是', null, 'see');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `contents` text,
  `sub_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `view_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('9', '2017-04-16 18:59:20', null, '<p class=\"vsbcontent_start\"><strong>&nbsp; &nbsp; &nbsp; &nbsp;本校讯</strong>（通讯员 张健维）4月13日下午，学校邀请天津财经大学侯欣一教授作《两会归来话两会》的宣讲报告。校党委书记周剑琴主持。校党委理论学习中心组成员，各基层党委、党总支、直属党支部负责同志，机关科级及以上党员干部，以及全校各民主党派成员、无党派人士和知联会成员参加。</p><p class=\"vsbcontent_end\">&nbsp; &nbsp; &nbsp; 侯教授是全国政协委员，现任天津财经大学近现代法研究中心主任，教授，博士生导师，长期从事中国法律史的教学与研究。侯教授从两会的特点，政府工作报告和两高报告，民法总则等方面，结合今年参会个人履职情况，从不同角度进行解读，报告生动形象，具有很强的实践指导意义。全校党员干部要认真学习和贯彻“两会”精神，学习贯彻习近平总书记系列重要讲话精神，把思想和行动统一到中央决策部署上来，与推进学校“十三五”规划发展、“双一流”建设工作紧密结合，以良好的精神状态和昂扬的斗志，确保圆满完成全年目标任务，落实好十三五阶段性目标，为实现高水平特色大学目标努力奋斗，以优异成绩迎接党的十九大胜利召开。</p>', '我校召开全国两会精神宣讲报告会', '我校召开全国两会精神宣讲报告会', '0');
INSERT INTO `t_news` VALUES ('10', '2017-04-16 19:02:31', null, '<p class=\"vsbcontent_start\"><strong>&nbsp; &nbsp; &nbsp; &nbsp;本校讯</strong>（通讯员 杨扬）4月11日下午，校党委组织部在现代教育中心第六会议室组织召开专职组织员工作会议，校党委聘任的专职组织员参加会议。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;与会人员首先学习了校党委《关于加强组织员工作的实施意见》，进一步明确了组织员的工作职责，校党委组织部对专职组织员工作提出具体要求。</p><p class=\"vsbcontent_end\">&nbsp; &nbsp; &nbsp; &nbsp;同时，大家专题学习了教育部党组近期发布的《普通高等学校学生党建工作标准》，结合有关要求对进一步优化我校学生党支部的设置进行了全面分析和深入探讨，并就2017年发展党员工作进行了研究和部署。</p><p class=\"vsbcontent_end\"><img src=\"http://127.0.0.1:8080/upload/img/16/1492340547311.jpg\" alt=\"undefined\"><br></p>', '党委组织部召开专职组织员工作会议', '党委组织部召开专职组织员工作会议', '0');
INSERT INTO `t_news` VALUES ('11', '2017-04-16 19:03:18', null, '<p class=\"vsbcontent_start\"><strong>&nbsp; &nbsp; &nbsp; 本校讯</strong>（通讯员 孙旭雅）日前，从天津市人才工作领导小组获悉，我校依托土木工程、环境科学与工程市级重点学科申报并分别入选天津市第十二批“千人计划”创新人才长期项目1人、创新人才短期项目2人和外专短期项目1人。截至目前，我校已引进天津市“千人计划”人选13名。</p><p class=\"vsbcontent_end\">&nbsp; &nbsp; &nbsp; 海外高层次人才的引进，对我校加强重点学科建设、提升学术研究和教学科研水平、提升国际知名度和影响力方面起到了重要的指导和促进作用。</p>', '我校新增四位天津市“千人计划”人选', '我校新增四位天津市“千人计划”人选', '0');

-- ----------------------------
-- Table structure for t_notes
-- ----------------------------
DROP TABLE IF EXISTS `t_notes`;
CREATE TABLE `t_notes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `contents` text,
  `file_url` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `view_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notes
-- ----------------------------
INSERT INTO `t_notes` VALUES ('3', '2017-04-16 19:04:19', null, '为迎接全运会，进一步提升校园环境，经学校研究决定，自即日起对停放在校园内的废弃自行车进行集中清理，现将有关事宜通告如下：\r\n\r\n1.此次清理的对象为长期停放在校园内的车把、车轮、脚蹬三个主要部件中任意一项缺失的废弃自行车；\r\n\r\n2.学校自即日起至2017年4月30日统一将校内废弃自行车集中停放。前校区废弃自行车集中停放在前校区宿舍楼与篮球场中间的过道处；新校区废弃自行车集中停放在新校区西南角西环路尽头处。如有误清理的废弃自行车，请车主于4月30日前到停放场地认领，5月1日后将统一清理出校园。', '', '关于集中清理校园废弃自行车的通告', '关于集中清理校园废弃自行车的通告', '0');
INSERT INTO `t_notes` VALUES ('4', '2017-04-16 19:05:03', null, '各单位、部门：\r\n\r\n根据学校迎全运校园环境改造提升工程道路施工计划，定于2017年4月15日（周六）上午6：00～4月16日（周日）晚上20：00进行道路二次沥青混凝土施工作业。经与相关部门研究，并请示领导，施工安排在周末，施工期间对前校区（学校西环路和煦园北道南侧）所有道路进行封闭。为顺利完成施工任务，现将有关事宜通知如下：\r\n\r\n1、施工期间前校区西环路和煦园北道（不包括西环路和煦园北道）南侧所用道路禁止任何机动车与非机动车通行和停泊，涉及道路包括：学校东环路、建园一路、建园二路、西环路、煦园南道、鸣飞北道、鸣飞南道、东环路和南环路；\r\n\r\n2、施工期间，学校南门禁止任何车辆通行，所有车辆均由学校西门进出；\r\n\r\n3、施工期间，教师和学生应避免行走机动车道；\r\n\r\n \r\n\r\n附图：道路施工期间前校区限行图\r\n\r\n2017年4月16日（周日）晚上20：00以后恢复正常通行，施工给您带来不便，敬请见谅。\r\n', '', '关于学校前校区道路施工限行的通知', '关于学校前校区道路施工限行的通知', '0');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permission_code` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r86y0f9jak7tpl7hvcrqnrgtn` (`pid`),
  CONSTRAINT `FK_r86y0f9jak7tpl7hvcrqnrgtn` FOREIGN KEY (`pid`) REFERENCES `t_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `roleid` bigint(20) NOT NULL,
  `permissionid` bigint(20) NOT NULL,
  KEY `FK_ert0qmlegpoex4t0rpmwmjy8` (`permissionid`),
  KEY `FK_rupcqwpf3vh5f391cn4xcg1x0` (`roleid`),
  CONSTRAINT `FK_ert0qmlegpoex4t0rpmwmjy8` FOREIGN KEY (`permissionid`) REFERENCES `t_permission` (`id`),
  CONSTRAINT `FK_rupcqwpf3vh5f391cn4xcg1x0` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_topic
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `comment_text` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_topic
-- ----------------------------
INSERT INTO `t_topic` VALUES ('2', '2017-04-16 19:09:26', null, '我校研究生教育多年来取得了长足进步，自1998年获得硕士学位授权单位，', 'admin', '1');
INSERT INTO `t_topic` VALUES ('3', '2017-04-16 19:10:56', null, '开学首日教学秩序井然有序', 'admin', '1');
INSERT INTO `t_topic` VALUES ('4', '2017-04-16 19:10:57', null, '开学首日教学秩序井然有序', 'admin', '1');
INSERT INTO `t_topic` VALUES ('5', '2017-04-16 19:11:13', null, '国际交流处是学院负责国际交流事务的行政职能部门', 'admin', '1');

-- ----------------------------
-- Table structure for t_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_topic_comment`;
CREATE TABLE `t_topic_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `comment_text` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_uid` bigint(20) NOT NULL,
  `to_name` varchar(255) DEFAULT NULL,
  `to_uid` bigint(20) NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  `topic_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_topic_comment
-- ----------------------------
INSERT INTO `t_topic_comment` VALUES ('3', '2017-04-16 19:14:20', null, '确实是这样', 'admin', '0', 'admin', '1', '2', '0');

-- ----------------------------
-- Table structure for t_topic_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_topic_reply`;
CREATE TABLE `t_topic_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `comment_id` bigint(20) NOT NULL,
  `comment_text` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_uid` bigint(20) NOT NULL,
  `reply_id` bigint(20) NOT NULL,
  `reply_type` bigint(20) NOT NULL,
  `to_name` varchar(255) DEFAULT NULL,
  `to_uid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_topic_reply
-- ----------------------------

-- ----------------------------
-- Table structure for t_trends
-- ----------------------------
DROP TABLE IF EXISTS `t_trends`;
CREATE TABLE `t_trends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `contents` text,
  `sub_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `view_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_trends
-- ----------------------------
INSERT INTO `t_trends` VALUES ('4', '2017-04-16 19:06:46', null, '本校讯（通讯员 杨福来 李德旺）为进一步提升我校师生、在校务工人员消防安全责任意识，增强应对火灾等紧急突发事件的能力，消除春季防火隐患，高水平迎接全运会赛事，4月11日，我校在新食堂北门举行了消防器材使用讲解演练，物业服务人员、驻校经营单位负责人、保卫处干部、后勤处干部共100余人参加。保卫处防火科赵海燕科长结合近期火灾典型案例为大家讲解了火灾的危害和逃生技能，崔全宏老师现场为大家示范了消防器材的使用技巧，提示了相关注意事项，并组织参与者进行模拟火灾扑救，活动取得了良好效果。', '我校举办消防器材使用讲解演练', '我校举办消防器材使用讲解演练', '0');
INSERT INTO `t_trends` VALUES ('5', '2017-04-16 19:07:20', null, '本校讯（通讯员 王兆芹）日前，我校教职工乒乒球比赛圆满结束。本次比赛设男子团体、女子团体、男子单打和女子单打四个比赛项目，全校共11支男子代表队和4支女子代表队参加团体赛，近80名教职工参加单打比赛。经过激烈角逐，最终，机关1队、经管学院代表队分获男子团体一二名，理学院和土木学院代表队并列第三名；经管学院代表队、土木学院代表队分获女子团体一二名；胡志刚、魏以鹏分获男子单打一二名,郭汉丁和万诗敏并列第三名；陈荣、陈娜分获女子单打一二名。', '2017年教职工乒乒球比赛圆满结束', '2017年教职工乒乒球比赛圆满结束', '0');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '2017-04-16 17:13:15', null, null, null, '1123@123.com', null, 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, '0', 'admin');
INSERT INTO `t_user` VALUES ('2', '2017-04-16 17:14:01', null, null, null, 'test@13.com', null, 'test', 'e10adc3949ba59abbe56e057f20f883e', null, '0', 'test');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL,
  KEY `FK_ctr9iiktd8na85op2w996e08p` (`roleid`),
  KEY `FK_33njv6qae26quls3a6vtwexl3` (`userid`),
  CONSTRAINT `FK_33njv6qae26quls3a6vtwexl3` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_ctr9iiktd8na85op2w996e08p` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------

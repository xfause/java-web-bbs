/*
Navicat MySQL Data Transfer

Source Server         : Taixu Wang
Source Server Version : 50006
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50006
File Encoding         : 65001

Date: 2017-07-01 15:19:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `boardinfo`
-- ----------------------------
DROP TABLE IF EXISTS `boardinfo`;
CREATE TABLE `boardinfo` (
  `boardID` int(4) NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  `content` mediumtext,
  `author` varchar(20) default NULL,
  `authorID` int(4) default '0',
  PRIMARY KEY  (`boardID`),
  KEY `boardID` (`boardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boardinfo
-- ----------------------------
INSERT INTO `boardinfo` VALUES ('4', '经验总结', '大作业的经验总结', 'xfause', '0');
INSERT INTO `boardinfo` VALUES ('6', 'test', 'test program', 'test', '0');
INSERT INTO `boardinfo` VALUES ('14', 'test filter2', '2', 'test', '0');
INSERT INTO `boardinfo` VALUES ('15', 'test filter3', '3', 'test', '0');
INSERT INTO `boardinfo` VALUES ('16', 'test filter4', '4', 'test', '0');
INSERT INTO `boardinfo` VALUES ('17', 'test filter5', '5', 'test', '0');
INSERT INTO `boardinfo` VALUES ('18', '测试分页板块', '测试分页', 'test', '0');
INSERT INTO `boardinfo` VALUES ('19', '测试管理员', '测试管理员添加板块功能', 'xfause', '0');
INSERT INTO `boardinfo` VALUES ('20', '测试添加板块', '测试板块', 'test', '0');

-- ----------------------------
-- Table structure for `commentinfo`
-- ----------------------------
DROP TABLE IF EXISTS `commentinfo`;
CREATE TABLE `commentinfo` (
  `commentID` int(4) NOT NULL auto_increment,
  `title` varchar(100) default NULL,
  `content` mediumtext,
  `time` datetime default NULL,
  `userName` varchar(50) default NULL,
  `userID` int(4) default NULL,
  PRIMARY KEY  (`commentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commentinfo
-- ----------------------------
INSERT INTO `commentinfo` VALUES ('8', '1111111', '222222', '2017-07-01 12:12:19', 'test', '1');
INSERT INTO `commentinfo` VALUES ('10', '1', '1', '2017-07-01 17:08:38', 'go', '3');
INSERT INTO `commentinfo` VALUES ('11', 'i\'m angry', 'I want pp to be the manager!!!', '2017-07-01 09:24:27', 'pp', '16');
INSERT INTO `commentinfo` VALUES ('12', '测试留言', '如题', '2017-07-01 09:27:40', 'test', '1');
INSERT INTO `commentinfo` VALUES ('13', '测试刚注册的用户', '用户留言', '2017-07-01 09:31:56', 'testreg5', '23');
INSERT INTO `commentinfo` VALUES ('14', '测试成功！', '问题：因为在直接注册的reg.jsp中没有存入用户的ID属性，以致于session中没有userID，所以之前的测试都没有通过。\r\n改进方法：\r\n直接获取userID属性后添加', '2017-07-01 09:33:39', 'testreg5', '23');

-- ----------------------------
-- Table structure for `foruminfo`
-- ----------------------------
DROP TABLE IF EXISTS `foruminfo`;
CREATE TABLE `foruminfo` (
  `msgID` int(4) NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  `content` mediumtext,
  `firstTime` datetime default NULL,
  `lastTime` datetime default NULL,
  `author` varchar(20) default NULL,
  `authorIP` varchar(100) default NULL,
  `PID` int(4) unsigned default NULL,
  `boardID` int(4) unsigned default NULL,
  `authorID` int(4) unsigned default NULL,
  `clicks` int(4) unsigned default NULL,
  `replies` int(4) unsigned default NULL,
  `flag` int(2) NOT NULL default '0' COMMENT '置顶',
  PRIMARY KEY  (`msgID`),
  KEY `msgID` (`msgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foruminfo
-- ----------------------------
INSERT INTO `foruminfo` VALUES ('340', '??±ê??', 'test hui fu', '2017-07-01 13:42:33', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '339', '6', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('341', '??±ê??', '111111', '2017-07-01 13:47:20', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '31', '4', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('342', '??±ê??', '111', '2017-07-01 14:05:47', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '31', '4', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('343', '??±ê??', 'test URL paragram', '2017-07-01 14:20:13', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '329', '4', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('344', 'test ', 'test URL2', '2017-07-01 14:21:28', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '329', '4', '1', '0', '0', '1');
INSERT INTO `foruminfo` VALUES ('345', '??±ê??', 'test URL3', '2017-07-01 14:22:41', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '329', '4', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('346', '??±ê??', 'test URL3', '2017-07-01 14:26:51', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '329', '4', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('347', '??±ê??', 'test URL 4', '2017-07-01 14:33:24', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '329', '4', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('348', '1111', '22222', '2017-07-01 09:00:22', null, 'test', 'fe80:0:0:0:1915:6552:665c:ec0a', '333', '1', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('349', '???÷??', '!!!!', '2017-07-01 13:13:03', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '33', '4', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('350', '???÷??1', '??????', '2017-07-01 08:27:09', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '339', '6', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('351', '???÷??2', '??????', '2017-07-01 08:32:15', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '339', '6', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('352', '???÷??3', 'test', '2017-07-01 08:33:04', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '339', '6', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('353', '??????é??4', '!!!', '2017-07-01 08:33:53', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '339', '6', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('354', '??????é??5', '1', '2017-07-01 08:34:35', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '339', '6', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('355', '??????é??', '6', '2017-07-01 08:36:33', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '339', '6', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('356', 'test filter', '111', '2017-07-01 16:42:33', null, 'go', 'fe80:0:0:0:1915:6552:665c:ec0a', '0', '6', '3', '2', '0', '0');
INSERT INTO `foruminfo` VALUES ('357', 'test addmsg', '111', '2017-07-01 16:45:34', null, 'go', 'fe80:0:0:0:1915:6552:665c:ec0a', '0', '6', '3', '11', '5', '0');
INSERT INTO `foruminfo` VALUES ('358', 'test ', 'test request.getParameter(\"submit\");', '2017-07-01 16:51:19', null, 'go', 'fe80:0:0:0:1915:6552:665c:ec0a', '357', '6', '3', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('359', '111', '111', '2017-07-01 16:53:09', null, 'go', 'fe80:0:0:0:1915:6552:665c:ec0a', '357', '6', '3', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('360', '222', '222', '2017-07-01 16:58:16', null, 'go', 'fe80:0:0:0:1915:6552:665c:ec0a', '357', '6', '3', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('361', '333', '333', '2017-07-01 16:59:43', null, 'go', 'fe80:0:0:0:1915:6552:665c:ec0a', '357', '6', '3', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('362', '444', '444', '2017-07-01 17:04:20', null, 'go', 'fe80:0:0:0:1915:6552:665c:ec0a', '357', '6', '3', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('363', 'test addmsg', 'test addmsy', '2017-07-01 17:04:40', null, 'go', 'fe80:0:0:0:1915:6552:665c:ec0a', '0', '6', '3', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('364', '???÷??', 'i\'m pp!!!', '2017-07-01 09:21:26', null, 'pp', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '31', '4', '16', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('371', '??????é??', '???è????????', '2017-07-01 09:41:45', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '15', '1', '2', '0', '0');
INSERT INTO `foruminfo` VALUES ('377', '??????é??', '??????', '2017-07-01 10:14:05', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '15', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('378', '无主题', '南宁', '2017-07-01 10:27:23', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '16', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('379', '无主题', '啊啊', '2017-07-01 10:27:39', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '16', '1', '2', '0', '0');
INSERT INTO `foruminfo` VALUES ('380', '无主题', '测试500', '2017-07-01 10:31:34', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '14', '1', '8', '2', '0');
INSERT INTO `foruminfo` VALUES ('381', '无主题', '测试回帖', '2017-07-01 01:41:53', null, 'test', 'fe80:0:0:0:1915:6552:665c:ec0a', '380', '14', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('382', '无主题', '测试回帖2', '2017-07-01 01:44:02', null, 'test', 'fe80:0:0:0:1915:6552:665c:ec0a', '380', '14', '1', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('383', '无主题', '测试字符', '2017-07-01 10:00:58', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '6', '1', '2', '0', '0');
INSERT INTO `foruminfo` VALUES ('384', '测试置顶1', '1', '2017-07-01 10:03:05', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '16', '1', '1', '0', '1');
INSERT INTO `foruminfo` VALUES ('385', '测试置顶2', '2', '2017-07-01 10:03:19', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '16', '1', '1', '0', '0');
INSERT INTO `foruminfo` VALUES ('386', '关于字符的问题', '之前的字符一直是乱码，我把所有的页面和数据库的编码都改为utf-8都不能解决这个问题.\r\n解决方法：添加一个字符集的filter，通过过滤器来处理所有request和response的请求编码，并把其转换为utf-8。', '2017-07-01 09:43:10', null, 'xfause', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '4', '2', '5', '1', '1');
INSERT INTO `foruminfo` VALUES ('387', '稍稍测试一下回复', '如题', '2017-07-01 09:43:41', null, 'xfause', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '386', '4', '2', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('388', '测试置顶功能', '如题', '2017-07-01 09:44:07',null, 'xfause', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '4', '2', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('389', '测试置顶功能2', '如题', '2017-07-01 09:44:20', null, 'xfause', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '4', '2', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('390', '测试置顶功能3', '如题', '2017-07-01 09:44:37', null, 'xfause', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '4', '2', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('391', '测试分页', '如题', '2017-07-01 09:44:50', null, 'xfause', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '4', '2', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('392', '关于置顶功能的实现', '置顶功能实现起来其实很简单：在数据库中添加一个flag标签即可。标签为1表示置顶，标签为0表示普通。', '2017-07-01 09:46:53', null, 'xfause', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '4', '2', '2', '1', '0');
INSERT INTO `foruminfo` VALUES ('393', '无主题', '说得好！！', '2017-07-01 09:47:07',null, 'xfause', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '392', '4', '2', '0', '0', '0');
INSERT INTO `foruminfo` VALUES ('394', '测试字符', '如题', '2017-07-01 10:27:16', null, 'test', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0', '6', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userID` int(3) unsigned NOT NULL auto_increment,
  `userName` char(20) default NULL,
  `password` char(20) default NULL,
  `sex` char(10) default NULL,
  `phone` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `regTime` datetime default NULL,
  `regIP` varchar(100) default NULL,
  `property` int(3) NOT NULL default '0',
  PRIMARY KEY  (`userID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'test', 'test', '未知', '', '', '2017-07-01 23:25:28', '127.0.0.1', '1');
INSERT INTO `userinfo` VALUES ('2', 'xfause', '111', '男', '111', '111', '2017-07-01 01:11:36', '127.0.0.1', '1');
INSERT INTO `userinfo` VALUES ('3', 'go', '111', '女', '1111111', '111111', '2017-07-01 08:43:12', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('4', 'xfause2', '111', '男', '11111', '11111', '2017-07-01 10:47:03', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('5', 'xfause3', '111', '男', '11111', '11111', '2017-07-01 10:49:00', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('7', 'xfause5', '111', '男', '11111', '11111', '2017-07-01 10:54:15', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('8', 'xfause6', '111', '男', '111', '111', '2017-07-01 10:56:43', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('9', 'xfause7', '111', '男', '111', '111', '2017-07-01 10:58:23', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('10', 'xfause8', '111', '男', '111', '111', '2017-07-01 11:04:28', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('11', 'xfause9', '111', '男', '11', '11', '2017-07-01 11:05:09', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('12', 'go2', '111', '女', '1', '1', '2017-07-01 11:08:37', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('13', 'go3', '111', '女', '111', '111', '2017-07-01 11:20:03', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('14', 'gou', '111', '女', '11', '11', '2017-07-01 11:21:16', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('15', 'admin', '111', 'male', '18888888888', 'xfause@gmail.com', null, null, '1');
INSERT INTO `userinfo` VALUES ('16', 'pp', '111', 'female', '13333333333', 'test@163.com', '2017-07-01 09:19:12', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('17', 'ppp', '111', 'male', '111', '111', '2017-07-01 09:30:36', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('18', 'pp2', '111', 'female', '111', '111', '2017-07-01 09:41:15', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('19', 'pp3', '111', 'female', '111', '111', '2017-07-01 09:46:51', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('20', 'testreg', '111', 'male', '1234567890', '123@outlook.com', '2017-07-01 09:08:57', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('21', 'testreg2', '111', 'male', '1234567890', '123@outlook.com', '2017-07-01 09:22:11', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('22', 'testreg3', '111', 'male', '1234567890', '123@outlook.com', '2017-07-01 09:25:02', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');
INSERT INTO `userinfo` VALUES ('23', 'testreg5', '111', 'male', '1234567890', '123@outlook.com', '2017-07-01 09:31:35', 'fe80:0:0:0:a94f:ab3e:6587:45a3', '0');

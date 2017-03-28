/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : personnel

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2017-03-29 07:06:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bak`
-- ----------------------------
DROP TABLE IF EXISTS `bak`;
CREATE TABLE `bak` (
  `bakId` varchar(200) NOT NULL,
  `opId` varchar(200) DEFAULT NULL,
  `bakRemark` varchar(200) DEFAULT NULL,
  `bakDate` datetime DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`bakId`),
  KEY `FK17C0C16837361` (`opId`),
  CONSTRAINT `FK17C0C16837361` FOREIGN KEY (`opId`) REFERENCES `operater` (`opId`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`opId`) REFERENCES `operater` (`opId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bak
-- ----------------------------
INSERT INTO `bak` VALUES ('aaeee95f-51b4-11e4-8af9-28d24416f802', '1', '基本设置设置完毕即初始化设置', '2014-10-12 10:08:33', 'personnel.sql', '0');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentId` varchar(200) NOT NULL,
  `departmentName` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('50102adf-1131-11e7-978b-201a068a3081', 'test', '1');
INSERT INTO `department` VALUES ('53777960-1131-11e7-978b-201a068a3081', 'test', '0');
INSERT INTO `department` VALUES ('df7d27a4-51af-11e4-8af9-28d24416f802', '业务部', '0');
INSERT INTO `department` VALUES ('e4c0d7a6-51af-11e4-8af9-28d24416f802', '工程部', '0');
INSERT INTO `department` VALUES ('ebe901c5-51af-11e4-8af9-28d24416f802', '生产部', '0');
INSERT INTO `department` VALUES ('f01ff124-51af-11e4-8af9-28d24416f802', '品质部', '0');
INSERT INTO `department` VALUES ('f32c6a22-51af-11e4-8af9-28d24416f802', '管理部', '0');

-- ----------------------------
-- Table structure for `dept_job_rel`
-- ----------------------------
DROP TABLE IF EXISTS `dept_job_rel`;
CREATE TABLE `dept_job_rel` (
  `dept_job_relId` varchar(200) NOT NULL,
  `salaryId` varchar(200) DEFAULT NULL,
  `departmentId` varchar(200) DEFAULT NULL,
  `jobId` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_job_relId`),
  KEY `FK5A2ED1DBA09BAB6` (`departmentId`),
  KEY `FK5A2ED1D6137DBE` (`jobId`),
  KEY `FK5A2ED1DF7CD5D26` (`salaryId`),
  CONSTRAINT `FK5A2ED1D6137DBE` FOREIGN KEY (`jobId`) REFERENCES `job` (`jobId`),
  CONSTRAINT `FK5A2ED1DBA09BAB6` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`),
  CONSTRAINT `FK5A2ED1DF7CD5D26` FOREIGN KEY (`salaryId`) REFERENCES `salary` (`salaryId`),
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`),
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`salaryId`) REFERENCES `salary` (`salaryId`),
  CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`jobId`) REFERENCES `job` (`jobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept_job_rel
-- ----------------------------
INSERT INTO `dept_job_rel` VALUES ('0b37f3cb-51b3-11e4-8af9-28d24416f802', null, 'e4c0d7a6-51af-11e4-8af9-28d24416f802', '1', '0');
INSERT INTO `dept_job_rel` VALUES ('12b60827-51b3-11e4-8af9-28d24416f802', null, 'e4c0d7a6-51af-11e4-8af9-28d24416f802', '2', '0');
INSERT INTO `dept_job_rel` VALUES ('172f9d44-51b3-11e4-8af9-28d24416f802', null, 'e4c0d7a6-51af-11e4-8af9-28d24416f802', 'f031b525-51b2-11e4-8af9-28d24416f802', '0');
INSERT INTO `dept_job_rel` VALUES ('1c54f434-51b3-11e4-8af9-28d24416f802', null, 'df7d27a4-51af-11e4-8af9-28d24416f802', 'f39727ba-51b2-11e4-8af9-28d24416f802', '1');
INSERT INTO `dept_job_rel` VALUES ('20527669-51b3-11e4-8af9-28d24416f802', null, 'ebe901c5-51af-11e4-8af9-28d24416f802', '1', '0');
INSERT INTO `dept_job_rel` VALUES ('26d195cf-51b3-11e4-8af9-28d24416f802', null, 'ebe901c5-51af-11e4-8af9-28d24416f802', '2', '0');
INSERT INTO `dept_job_rel` VALUES ('30c59761-51b3-11e4-8af9-28d24416f802', null, 'ebe901c5-51af-11e4-8af9-28d24416f802', '2', '1');
INSERT INTO `dept_job_rel` VALUES ('3c69870a-51b3-11e4-8af9-28d24416f802', null, 'ebe901c5-51af-11e4-8af9-28d24416f802', 'f031b525-51b2-11e4-8af9-28d24416f802', '0');
INSERT INTO `dept_job_rel` VALUES ('40ee1b5e-140a-11e7-978b-201a068a3081', '40ecc43a-140a-11e7-978b-201a068a3081', '50102adf-1131-11e7-978b-201a068a3081', '1', '0');
INSERT INTO `dept_job_rel` VALUES ('414415b5-51b3-11e4-8af9-28d24416f802', null, 'df7d27a4-51af-11e4-8af9-28d24416f802', 'f39727ba-51b2-11e4-8af9-28d24416f802', '1');
INSERT INTO `dept_job_rel` VALUES ('45a78387-51b3-11e4-8af9-28d24416f802', null, 'df7d27a4-51af-11e4-8af9-28d24416f802', 'f39727ba-51b2-11e4-8af9-28d24416f802', '1');
INSERT INTO `dept_job_rel` VALUES ('4d4bf4d4-51b3-11e4-8af9-28d24416f802', null, 'f01ff124-51af-11e4-8af9-28d24416f802', '1', '0');
INSERT INTO `dept_job_rel` VALUES ('5bc03304-51b2-11e4-8af9-28d24416f802', null, 'df7d27a4-51af-11e4-8af9-28d24416f802', '1', '0');
INSERT INTO `dept_job_rel` VALUES ('69ff0680-51b3-11e4-8af9-28d24416f802', null, 'ebe901c5-51af-11e4-8af9-28d24416f802', 'f39727ba-51b2-11e4-8af9-28d24416f802', '0');
INSERT INTO `dept_job_rel` VALUES ('70a54e68-51b3-11e4-8af9-28d24416f802', null, 'e4c0d7a6-51af-11e4-8af9-28d24416f802', 'f39727ba-51b2-11e4-8af9-28d24416f802', '0');
INSERT INTO `dept_job_rel` VALUES ('7c59c5ee-51b3-11e4-8af9-28d24416f802', null, 'f01ff124-51af-11e4-8af9-28d24416f802', '1', '0');
INSERT INTO `dept_job_rel` VALUES ('7f714cf3-51b3-11e4-8af9-28d24416f802', null, 'f01ff124-51af-11e4-8af9-28d24416f802', '2', '0');
INSERT INTO `dept_job_rel` VALUES ('827852d4-51b3-11e4-8af9-28d24416f802', null, 'df7d27a4-51af-11e4-8af9-28d24416f802', 'f031b525-51b2-11e4-8af9-28d24416f802', '0');
INSERT INTO `dept_job_rel` VALUES ('8731263c-51b3-11e4-8af9-28d24416f802', null, 'df7d27a4-51af-11e4-8af9-28d24416f802', 'f39727ba-51b2-11e4-8af9-28d24416f802', '0');
INSERT INTO `dept_job_rel` VALUES ('8b249115-51b3-11e4-8af9-28d24416f802', null, 'f32c6a22-51af-11e4-8af9-28d24416f802', '1', '0');
INSERT INTO `dept_job_rel` VALUES ('8e7214c6-51b3-11e4-8af9-28d24416f802', null, 'f32c6a22-51af-11e4-8af9-28d24416f802', '2', '0');
INSERT INTO `dept_job_rel` VALUES ('929dc8bb-51b3-11e4-8af9-28d24416f802', null, 'f32c6a22-51af-11e4-8af9-28d24416f802', '92823536-51b3-11e4-8af9-28d24416f802', '1');
INSERT INTO `dept_job_rel` VALUES ('9ad06130-51b3-11e4-8af9-28d24416f802', null, 'f32c6a22-51af-11e4-8af9-28d24416f802', 'f031b525-51b2-11e4-8af9-28d24416f802', '0');
INSERT INTO `dept_job_rel` VALUES ('9f28afc2-51b3-11e4-8af9-28d24416f802', null, 'f32c6a22-51af-11e4-8af9-28d24416f802', 'f39727ba-51b2-11e4-8af9-28d24416f802', '0');
INSERT INTO `dept_job_rel` VALUES ('eaf89d5c-51b2-11e4-8af9-28d24416f802', null, 'df7d27a4-51af-11e4-8af9-28d24416f802', '2', '0');
INSERT INTO `dept_job_rel` VALUES ('f0417b5e-51b2-11e4-8af9-28d24416f802', null, 'df7d27a4-51af-11e4-8af9-28d24416f802', 'f031b525-51b2-11e4-8af9-28d24416f802', '1');
INSERT INTO `dept_job_rel` VALUES ('f3b6f32b-51b2-11e4-8af9-28d24416f802', null, 'df7d27a4-51af-11e4-8af9-28d24416f802', 'f39727ba-51b2-11e4-8af9-28d24416f802', '1');

-- ----------------------------
-- Table structure for `diction_log`
-- ----------------------------
DROP TABLE IF EXISTS `diction_log`;
CREATE TABLE `diction_log` (
  `sId` varchar(200) NOT NULL,
  `pId` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `diction_logDate` datetime DEFAULT NULL,
  `diction_logRemark` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`sId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diction_log
-- ----------------------------
INSERT INTO `diction_log` VALUES ('1001', null, '性别', null, null, null);
INSERT INTO `diction_log` VALUES ('10010001', '1001', '女', null, null, null);
INSERT INTO `diction_log` VALUES ('10010002', '1001', '男', null, null, null);
INSERT INTO `diction_log` VALUES ('1002', null, '婚姻状况', null, null, null);
INSERT INTO `diction_log` VALUES ('10020001', '1002', '已婚', null, null, null);
INSERT INTO `diction_log` VALUES ('10020002', '1002', '未婚', null, null, null);
INSERT INTO `diction_log` VALUES ('1003', null, '政治面貌', null, null, null);
INSERT INTO `diction_log` VALUES ('10030001', '1003', '团员', null, null, null);
INSERT INTO `diction_log` VALUES ('10030002', '1003', '党员', null, null, null);
INSERT INTO `diction_log` VALUES ('10030003', '1003', '群众', null, null, null);
INSERT INTO `diction_log` VALUES ('1004', null, '聘用形式', null, null, null);
INSERT INTO `diction_log` VALUES ('10040001', '1004', '临时聘用', null, null, null);
INSERT INTO `diction_log` VALUES ('10040002', '1004', '长期聘用', null, null, null);
INSERT INTO `diction_log` VALUES ('1005', null, '最高学历', null, null, null);
INSERT INTO `diction_log` VALUES ('10050001', '1005', '小学', null, null, null);
INSERT INTO `diction_log` VALUES ('10050002', '1005', '初中', null, null, null);
INSERT INTO `diction_log` VALUES ('10050003', '1005', '高中', null, null, null);
INSERT INTO `diction_log` VALUES ('10050004', '1005', '大专', null, null, null);
INSERT INTO `diction_log` VALUES ('10050005', '1005', '大学本科', null, null, null);
INSERT INTO `diction_log` VALUES ('10050006', '1005', '硕士', null, null, null);
INSERT INTO `diction_log` VALUES ('10050007', '1005', '博士', null, null, null);
INSERT INTO `diction_log` VALUES ('1006', null, '在职状态', null, null, null);
INSERT INTO `diction_log` VALUES ('10060001', '1006', '在职', null, null, null);
INSERT INTO `diction_log` VALUES ('10060002', '1006', '离职', null, null, null);
INSERT INTO `diction_log` VALUES ('10060003', '1006', '带薪休假', null, null, null);
INSERT INTO `diction_log` VALUES ('10060004', '1006', '停职', null, null, null);
INSERT INTO `diction_log` VALUES ('10060005', '1006', '退休', null, null, null);
INSERT INTO `diction_log` VALUES ('10060006', '1006', '挂职锻炼', null, null, null);
INSERT INTO `diction_log` VALUES ('1007', null, '考评结果', null, null, null);
INSERT INTO `diction_log` VALUES ('10070001', '1007', '优秀', null, null, null);
INSERT INTO `diction_log` VALUES ('10070002', '1007', '良好', null, null, null);
INSERT INTO `diction_log` VALUES ('10070003', '1007', '中等', null, null, null);
INSERT INTO `diction_log` VALUES ('10070004', '1007', '合格', null, null, null);
INSERT INTO `diction_log` VALUES ('10070005', '1007', '不合格', null, null, null);

-- ----------------------------
-- Table structure for `duty`
-- ----------------------------
DROP TABLE IF EXISTS `duty`;
CREATE TABLE `duty` (
  `dutyId` varchar(200) NOT NULL,
  `dutyName` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`dutyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of duty
-- ----------------------------
INSERT INTO `duty` VALUES ('1a3a2fb4-51b4-11e4-8af9-28d24416f802', 'Java工程师', '0');
INSERT INTO `duty` VALUES ('1ee344ce-51b4-11e4-8af9-28d24416f802', '数据库工程师', '0');
INSERT INTO `duty` VALUES ('242295db-51b4-11e4-8af9-28d24416f802', '开发工程师', '0');
INSERT INTO `duty` VALUES ('286b41e3-51b4-11e4-8af9-28d24416f802', '架构师', '0');
INSERT INTO `duty` VALUES ('fefecfb0-51b3-11e4-8af9-28d24416f802', '工程师', '0');

-- ----------------------------
-- Table structure for `encorchast`
-- ----------------------------
DROP TABLE IF EXISTS `encorchast`;
CREATE TABLE `encorchast` (
  `encOrChastId` varchar(200) NOT NULL,
  `personnelEncOrChastPoint` decimal(10,0) DEFAULT NULL,
  `money` decimal(10,0) DEFAULT NULL,
  `personnelEncOrChastSort` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`encOrChastId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of encorchast
-- ----------------------------
INSERT INTO `encorchast` VALUES ('66b7fbab-51b4-11e4-8af9-28d24416f802', '10', '500', '一级', '0');
INSERT INTO `encorchast` VALUES ('72595ad9-51b4-11e4-8af9-28d24416f802', '20', '1000', '二级', '0');
INSERT INTO `encorchast` VALUES ('79345d79-51b4-11e4-8af9-28d24416f802', '30', '3000', '三级', '0');

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `jobId` varchar(200) NOT NULL,
  `jobName` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '经理', '0');
INSERT INTO `job` VALUES ('2', '助理', '0');
INSERT INTO `job` VALUES ('92823536-51b3-11e4-8af9-28d24416f802', '只管', '0');
INSERT INTO `job` VALUES ('f031b525-51b2-11e4-8af9-28d24416f802', '主管', '0');
INSERT INTO `job` VALUES ('f39727ba-51b2-11e4-8af9-28d24416f802', '员工', '0');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuId` varchar(200) NOT NULL,
  `men_menuId` varchar(200) DEFAULT NULL,
  `menuName` varchar(200) DEFAULT NULL,
  `menuUrl` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `menuDate` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `FK33155F876AEF59` (`men_menuId`),
  CONSTRAINT `FK33155F876AEF59` FOREIGN KEY (`men_menuId`) REFERENCES `menu` (`menuId`),
  CONSTRAINT `FK_Relationship_18` FOREIGN KEY (`men_menuId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('10001', null, '员工资料管理', '', null, null, '0');
INSERT INTO `menu` VALUES ('100010001', '10001', '基本资料', 'user_info.inf?method=queryAll', null, null, '0');
INSERT INTO `menu` VALUES ('100010002', '10001', '高级资料', 'user_info.inf?method=jumpAdvanceInfo', null, null, '0');
INSERT INTO `menu` VALUES ('10002', null, '统计管理', null, null, null, '0');
INSERT INTO `menu` VALUES ('100020001', '10002', '综合信息统计', 'managementJump.man?method=jumpAll', null, null, '0');
INSERT INTO `menu` VALUES ('100020002', '10002', '员工积分统计', 'managementJump.man?method=jumpScore', null, null, '0');
INSERT INTO `menu` VALUES ('100020003', '10002', '人事信息统计', 'personnelManagement.man?method=findAll&&all=all', null, null, '0');
INSERT INTO `menu` VALUES ('100020004', '10002', '人事记录统计', 'personnelRecords.man?method=findAllPersonnelRecords', null, null, '0');
INSERT INTO `menu` VALUES ('10003', null, '工资管理', null, null, null, '0');
INSERT INTO `menu` VALUES ('100030001', '10003', '员工帐套设置', 'setofbook.sal?method=wel', null, null, '0');
INSERT INTO `menu` VALUES ('100030002', '10003', '工资管理', 'salarymanage.sal?method=SalaryManageJump', null, null, '0');
INSERT INTO `menu` VALUES ('100030003', '10003', '工资表查询', 'searchPayRoll.sal?method=main', null, null, '0');
INSERT INTO `menu` VALUES ('100030004', '10003', '部门整体奖罚', 'departmentPB.sal?method=search', null, null, '0');
INSERT INTO `menu` VALUES ('10004', null, '系统管理', 'menu.sys?method=managemenu', null, null, '0');
INSERT INTO `menu` VALUES ('100040001', '10004', '基本信息设置', 'basicChoose.sys?method=jumpBasic', null, null, '0');
INSERT INTO `menu` VALUES ('100040002', '10004', '操作日志管理', 'operateLog.sys?method=query', null, null, '0');
INSERT INTO `menu` VALUES ('100040003', '10004', '备份恢复数据', 'bak.sys?method=query', null, null, '0');
INSERT INTO `menu` VALUES ('100040004', '10004', '初始化数据库', 'initDataBaseServlet.sys?method=initDB', null, null, '0');
INSERT INTO `menu` VALUES ('100040005', '10004', '系统管理', 'menu.sys?method=managemenu', null, null, '0');
INSERT INTO `menu` VALUES ('100040006', '10004', '操作员管理', 'operatermanage.sys?method=operater', '', null, '0');
INSERT INTO `menu` VALUES ('100040007', '10004', '字典管理', 'diction.sys?method=dictionMain', null, null, '0');
INSERT INTO `menu` VALUES ('10005', null, '人事管理', null, null, null, '0');
INSERT INTO `menu` VALUES ('100050001', '10005', '员工资料', 'personInfo.per?method=firstJumpIntoPage', null, null, '0');
INSERT INTO `menu` VALUES ('100050002', '10005', '员工奖惩', 'personEOC.per?method=firstJumpIntoPage', null, null, '0');
INSERT INTO `menu` VALUES ('100050003', '10005', '员工培训', 'personTrain.per?method=findAll&state=0&currentPage=1', null, null, '0');
INSERT INTO `menu` VALUES ('100050004', '10005', '员工好评', 'personAppraise.per?method=findAll&state=0&currentPage=1', null, null, '0');
INSERT INTO `menu` VALUES ('100050006', '10005', '员工调动', 'personnelRemove.per?method=showJob', null, null, '0');
INSERT INTO `menu` VALUES ('10006', null, '版本信息', null, null, null, '0');
INSERT INTO `menu` VALUES ('100060001', '10006', 'by Jessica(865171.cn)', 'http://Www.865171.cn', null, null, '0');

-- ----------------------------
-- Table structure for `operater`
-- ----------------------------
DROP TABLE IF EXISTS `operater`;
CREATE TABLE `operater` (
  `opId` varchar(200) NOT NULL,
  `personnelId` varchar(200) DEFAULT NULL,
  `popedom` varchar(200) DEFAULT NULL,
  `opName` varchar(200) DEFAULT NULL,
  `opPassword` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`opId`),
  KEY `FKE22A276ECAA98332` (`personnelId`),
  CONSTRAINT `FKE22A276ECAA98332` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operater
-- ----------------------------
INSERT INTO `operater` VALUES ('1', null, '0', 'admin', 'admin', '0');
INSERT INTO `operater` VALUES ('2', null, '员工资料', 'info', 'info', '0');
INSERT INTO `operater` VALUES ('3', null, '统计', 'mana', 'mana', '0');
INSERT INTO `operater` VALUES ('4', null, '工资', 'sal', 'sal', '0');
INSERT INTO `operater` VALUES ('5', null, '系统', 'sys', 'sys', '0');
INSERT INTO `operater` VALUES ('6', null, '人事', 'per', 'per', '0');
INSERT INTO `operater` VALUES ('7', null, '工资', 'info1', 'info1', '0');

-- ----------------------------
-- Table structure for `operate_log`
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log` (
  `operate_logId` varchar(200) NOT NULL,
  `opId` varchar(200) DEFAULT NULL,
  `bakDate` datetime DEFAULT NULL,
  `event` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`operate_logId`),
  KEY `FK77B7A0916837361` (`opId`),
  CONSTRAINT `FK77B7A0916837361` FOREIGN KEY (`opId`) REFERENCES `operater` (`opId`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`opId`) REFERENCES `operater` (`opId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate_log
-- ----------------------------
INSERT INTO `operate_log` VALUES ('01de2109-113d-11e7-978b-201a068a3081', '1', '2017-03-25 17:25:34', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('065d3860-140a-11e7-978b-201a068a3081', '1', '2017-03-29 06:58:10', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('0d69cdda-0f03-11e7-978b-201a068a3081', '1', '2017-03-22 21:25:40', '查询了所有父项和子项', '0');
INSERT INTO `operate_log` VALUES ('0d9bce46-0f03-11e7-978b-201a068a3081', '1', '2017-03-22 21:25:40', '查询了所有父项和子项', '0');
INSERT INTO `operate_log` VALUES ('10f9f769-10fc-11e7-978b-201a068a3081', '1', '2017-03-25 09:40:42', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('13d2e8b3-140a-11e7-978b-201a068a3081', '1', '2017-03-29 06:58:33', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('13d5123f-140a-11e7-978b-201a068a3081', '1', '2017-03-29 06:58:33', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('1481d983-140a-11e7-978b-201a068a3081', '1', '2017-03-29 06:58:34', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('1484aac2-140a-11e7-978b-201a068a3081', '1', '2017-03-29 06:58:34', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('1815469f-10fc-11e7-978b-201a068a3081', '1', '2017-03-25 09:40:54', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('19ad3eba-13c2-11e7-978b-201a068a3081', '2', '2017-03-28 22:23:19', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('1af7dcfc-13c2-11e7-978b-201a068a3081', '2', '2017-03-28 22:23:21', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('1b87c29b-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:00:23', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('1d7e7216-0f03-11e7-978b-201a068a3081', '1', '2017-03-22 21:26:07', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('205a2558-13c1-11e7-978b-201a068a3081', '2', '2017-03-28 22:16:21', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('2707a94f-0fd3-11e7-978b-201a068a3081', '1', '2017-03-23 22:15:18', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('2899edde-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:16:34', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('29ca4aff-13be-11e7-978b-201a068a3081', '1', '2017-03-28 21:55:08', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('2a6afee8-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:16:38', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('2a6e4db5-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:16:38', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('2ac3bff6-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:16:38', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('2ac606e7-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:16:38', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('2af9a246-1227-11e7-978b-201a068a3081', '1', '2017-03-26 21:21:45', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('2b7ebce4-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:16:39', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('2b814a3c-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:16:39', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('2d271598-1227-11e7-978b-201a068a3081', '1', '2017-03-26 21:21:48', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('2f081881-10fc-11e7-978b-201a068a3081', '1', '2017-03-25 09:41:32', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('36d5bed0-1227-11e7-978b-201a068a3081', '1', '2017-03-26 21:22:05', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('40df3b58-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:01:25', '查看了所有人的日志信息', '0');
INSERT INTO `operate_log` VALUES ('41e92a4e-5c25-11e4-82fd-28d24416f802', '1', '2014-10-25 16:59:41', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('423a35cc-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:01:28', '查看了所有人的日志信息', '0');
INSERT INTO `operate_log` VALUES ('44a0ea6f-13c0-11e7-978b-201a068a3081', '1', '2017-03-28 22:10:12', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('48ecb56a-13c0-11e7-978b-201a068a3081', '1', '2017-03-28 22:10:19', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('49406c22-13c0-11e7-978b-201a068a3081', '1', '2017-03-28 22:10:20', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('49c04d70-0be2-11e7-978b-201a068a3081', '1', '2017-03-18 21:53:38', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('49debba0-13c0-11e7-978b-201a068a3081', '1', '2017-03-28 22:10:21', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('4a0652f5-13c0-11e7-978b-201a068a3081', '1', '2017-03-28 22:10:21', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('4af45519-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:01:42', '查看了所有的部门', '0');
INSERT INTO `operate_log` VALUES ('5011ee8d-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:01:51', '增加了一个部门test', '0');
INSERT INTO `operate_log` VALUES ('5012c945-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:17:41', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('50145df1-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:01:51', '查看了所有的部门', '0');
INSERT INTO `operate_log` VALUES ('5168f14e-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:01:53', '删除了一个部门', '0');
INSERT INTO `operate_log` VALUES ('516abe6b-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:01:53', '查看了所有的部门', '0');
INSERT INTO `operate_log` VALUES ('537825fb-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:01:57', '增加了一个部门test', '0');
INSERT INTO `operate_log` VALUES ('5379e5f1-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:01:57', '查看了所有的部门', '0');
INSERT INTO `operate_log` VALUES ('55778f03-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:02:00', '查看了所有的部门', '0');
INSERT INTO `operate_log` VALUES ('5aa061f5-1132-11e7-978b-201a068a3081', '1', '2017-03-25 16:09:18', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('6026f86a-1227-11e7-978b-201a068a3081', '1', '2017-03-26 21:23:14', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('7089bc14-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:02:45', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('70cafa16-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:02:46', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('72b2fcf9-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:02:49', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('7332d2fa-1131-11e7-978b-201a068a3081', '1', '2017-03-25 16:02:50', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('745edfda-1227-11e7-978b-201a068a3081', '1', '2017-03-26 21:23:48', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('7730d68a-13c2-11e7-978b-201a068a3081', '2', '2017-03-28 22:25:56', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('7c9d401f-13c1-11e7-978b-201a068a3081', '1', '2017-03-28 22:18:55', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('7e7dfb77-13c2-11e7-978b-201a068a3081', '1', '2017-03-28 22:26:08', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('7f2dba5e-13c1-11e7-978b-201a068a3081', '1', '2017-03-28 22:19:00', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('83244b04-13c1-11e7-978b-201a068a3081', '2', '2017-03-28 22:19:06', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('8a8693b4-13bd-11e7-978b-201a068a3081', '1', '2017-03-28 21:50:41', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('8ada02dc-13c1-11e7-978b-201a068a3081', '2', '2017-03-28 22:19:19', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('8b726f3f-13c0-11e7-978b-201a068a3081', '1', '2017-03-28 22:12:11', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('8dc03cac-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:19:24', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('8f0865d4-13be-11e7-978b-201a068a3081', '1', '2017-03-28 21:57:58', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('90996f4f-1203-11e7-978b-201a068a3081', '1', '2017-03-26 17:06:53', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('909be361-1203-11e7-978b-201a068a3081', '1', '2017-03-26 17:06:53', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('9765dff5-13bf-11e7-978b-201a068a3081', '1', '2017-03-28 22:05:21', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('9db26746-0fd2-11e7-978b-201a068a3081', '1', '2017-03-23 22:11:28', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('a23603aa-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:19:59', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('a237c0a4-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:19:59', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('a2c55395-0f54-11e7-978b-201a068a3081', '2', '2017-03-23 07:09:40', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('a3c43aad-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:20:01', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('a3c66e06-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:20:01', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('a3fc8d78-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:20:01', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('a3ff1c9c-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:20:02', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('a629a648-13be-11e7-978b-201a068a3081', '1', '2017-03-28 21:58:37', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('b45607b7-0fd0-11e7-978b-201a068a3081', '1', '2017-03-23 21:57:47', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('b674dd75-13be-11e7-978b-201a068a3081', '1', '2017-03-28 21:59:04', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('b83cb633-113b-11e7-978b-201a068a3081', '1', '2017-03-25 17:16:21', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('b83f07be-113b-11e7-978b-201a068a3081', '1', '2017-03-25 17:16:21', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('b87e2d9c-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:20:36', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('b8807b78-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:20:36', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('be0ef65f-13c1-11e7-978b-201a068a3081', '2', '2017-03-28 22:20:45', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('be71807b-13bd-11e7-978b-201a068a3081', '1', '2017-03-28 21:52:08', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('c12507fd-13c1-11e7-978b-201a068a3081', '2', '2017-03-28 22:20:50', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('c3383595-13c1-11e7-978b-201a068a3081', '7', '2017-03-28 22:20:54', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('c48942ad-13be-11e7-978b-201a068a3081', '1', '2017-03-28 21:59:28', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('cc9fd39a-113b-11e7-978b-201a068a3081', '1', '2017-03-25 17:16:55', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('cd983f3c-113b-11e7-978b-201a068a3081', '1', '2017-03-25 17:16:56', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('d8d01769-1097-11e7-978b-201a068a3081', '2', '2017-03-24 21:43:18', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('ddad0fa2-0f03-11e7-978b-201a068a3081', '1', '2017-03-22 21:31:29', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('de43b6d1-5b72-11e4-ad9d-28d24416f802', '1', '2014-10-24 19:42:44', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('e1c9f1ab-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:09', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('e631c169-13c0-11e7-978b-201a068a3081', '1', '2017-03-28 22:14:43', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('e7323db4-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:18', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('e73ce640-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:18', '根据条件查看符合条件的人事信息', '0');
INSERT INTO `operate_log` VALUES ('e7a1fa8f-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:19', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('e7a730b0-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:19', '查看所有人的相关记录信息，比如调动次数，调薪次数。。。', '0');
INSERT INTO `operate_log` VALUES ('ead5b5a8-0fc5-11e7-978b-201a068a3081', '2', '2017-03-23 20:40:34', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('ead7f8e5-0fc5-11e7-978b-201a068a3081', '2', '2017-03-23 20:40:34', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('eb8bd2a2-13c0-11e7-978b-201a068a3081', '2', '2017-03-28 22:14:52', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('ec2cfc63-0fc5-11e7-978b-201a068a3081', '2', '2017-03-23 20:40:36', '执行了登出操作', '0');
INSERT INTO `operate_log` VALUES ('f361565f-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:38', '查看了所有人的备份信息', '0');
INSERT INTO `operate_log` VALUES ('f3b33c4a-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:39', '查看了所有人的备份信息', '0');
INSERT INTO `operate_log` VALUES ('f4eb0048-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:41', '查看了所有人的备份信息', '0');
INSERT INTO `operate_log` VALUES ('f4ed8447-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:41', '查看了所有人的备份信息', '0');
INSERT INTO `operate_log` VALUES ('f9c56bb8-0f02-11e7-978b-201a068a3081', '1', '2017-03-22 21:25:07', '执行了登陆操作', '0');
INSERT INTO `operate_log` VALUES ('ff30c80c-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:58', '初始化了数据库', '0');
INSERT INTO `operate_log` VALUES ('ff41e0db-1409-11e7-978b-201a068a3081', '1', '2017-03-29 06:57:58', '初始化了数据库', '0');

-- ----------------------------
-- Table structure for `peoc`
-- ----------------------------
DROP TABLE IF EXISTS `peoc`;
CREATE TABLE `peoc` (
  `peocId` varchar(200) NOT NULL,
  `encOrChastId` varchar(200) DEFAULT NULL,
  `personnelId` varchar(200) DEFAULT NULL,
  `peocDate` datetime DEFAULT NULL,
  `peocReason` varchar(200) DEFAULT NULL,
  `personnelTrainRemark` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`peocId`),
  KEY `FK347289EDA82452` (`encOrChastId`),
  KEY `FK347289CAA98332` (`personnelId`),
  CONSTRAINT `FK347289CAA98332` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`),
  CONSTRAINT `FK347289EDA82452` FOREIGN KEY (`encOrChastId`) REFERENCES `encorchast` (`encOrChastId`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`encOrChastId`) REFERENCES `encorchast` (`encOrChastId`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of peoc
-- ----------------------------

-- ----------------------------
-- Table structure for `personneladjustsalary`
-- ----------------------------
DROP TABLE IF EXISTS `personneladjustsalary`;
CREATE TABLE `personneladjustsalary` (
  `personnelAdjustSalaryId` varchar(200) NOT NULL,
  `dept_job_relId` varchar(200) DEFAULT NULL,
  `salaryId` varchar(200) DEFAULT NULL,
  `adjustSalaryDate` datetime DEFAULT NULL,
  `adjustSalaryReason` varchar(200) DEFAULT NULL,
  `personnelAdjustSalaryRemark` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`personnelAdjustSalaryId`),
  KEY `FK71267C39F7CD5D26` (`salaryId`),
  KEY `FK71267C39C323ECB0` (`dept_job_relId`),
  CONSTRAINT `FK71267C39C323ECB0` FOREIGN KEY (`dept_job_relId`) REFERENCES `dept_job_rel` (`dept_job_relId`),
  CONSTRAINT `FK71267C39F7CD5D26` FOREIGN KEY (`salaryId`) REFERENCES `salary` (`salaryId`),
  CONSTRAINT `FK_Relationship_17` FOREIGN KEY (`dept_job_relId`) REFERENCES `dept_job_rel` (`dept_job_relId`),
  CONSTRAINT `FK_Relationship_19` FOREIGN KEY (`salaryId`) REFERENCES `salary` (`salaryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personneladjustsalary
-- ----------------------------

-- ----------------------------
-- Table structure for `personnelappraise`
-- ----------------------------
DROP TABLE IF EXISTS `personnelappraise`;
CREATE TABLE `personnelappraise` (
  `personnelAppraiseId` varchar(200) NOT NULL,
  `personnelId` varchar(200) DEFAULT NULL,
  `personnelAppraiseDate` datetime DEFAULT NULL,
  `personnelAppraiseResult` varchar(200) DEFAULT NULL,
  `personnelAppraiseContent` varchar(200) DEFAULT NULL,
  `personnelAppraiseRemark` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`personnelAppraiseId`),
  KEY `FKAB158C8BCAA98332` (`personnelId`),
  CONSTRAINT `FKAB158C8BCAA98332` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personnelappraise
-- ----------------------------

-- ----------------------------
-- Table structure for `personnelinfo`
-- ----------------------------
DROP TABLE IF EXISTS `personnelinfo`;
CREATE TABLE `personnelinfo` (
  `personnelId` varchar(200) NOT NULL,
  `dutyId` varchar(200) DEFAULT NULL,
  `dept_job_relId` varchar(200) DEFAULT NULL,
  `personnelNo` varchar(200) DEFAULT NULL,
  `personnelName` varchar(200) DEFAULT NULL,
  `personnelSex` varchar(200) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `identityId` varchar(200) DEFAULT NULL,
  `wedLock` varchar(200) DEFAULT NULL,
  `race` varchar(200) DEFAULT NULL,
  `nativePlace` varchar(200) DEFAULT NULL,
  `politic` varchar(200) DEFAULT NULL,
  `e_mail` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `engageForm` varchar(200) DEFAULT NULL,
  `tipTopDegree` varchar(200) DEFAULT NULL,
  `spacialty` varchar(200) DEFAULT NULL,
  `school` varchar(200) DEFAULT NULL,
  `beginWorkDate` datetime DEFAULT NULL,
  `workState` varchar(200) DEFAULT NULL,
  `workId` varchar(200) DEFAULT NULL,
  `contractTerm` int(11) DEFAULT NULL,
  `beFormDate` datetime DEFAULT NULL,
  `notWorkState` datetime DEFAULT NULL,
  `beginContract` datetime DEFAULT NULL,
  `endContract` datetime DEFAULT NULL,
  `workAge` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`personnelId`),
  KEY `FKC71626CEB2797DFE` (`dutyId`),
  KEY `FKC71626CEC323ECB0` (`dept_job_relId`),
  CONSTRAINT `FKC71626CEB2797DFE` FOREIGN KEY (`dutyId`) REFERENCES `duty` (`dutyId`),
  CONSTRAINT `FKC71626CEC323ECB0` FOREIGN KEY (`dept_job_relId`) REFERENCES `dept_job_rel` (`dept_job_relId`),
  CONSTRAINT `FK_Relationship_13` FOREIGN KEY (`dept_job_relId`) REFERENCES `dept_job_rel` (`dept_job_relId`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`dutyId`) REFERENCES `duty` (`dutyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personnelinfo
-- ----------------------------
INSERT INTO `personnelinfo` VALUES ('1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `personnelremove`
-- ----------------------------
DROP TABLE IF EXISTS `personnelremove`;
CREATE TABLE `personnelremove` (
  `personnelRemoveId` varchar(200) NOT NULL,
  `personnelId` varchar(200) DEFAULT NULL,
  `afterRemoveDepartment` varchar(200) DEFAULT NULL,
  `beforeRemoveDepartment` varchar(200) DEFAULT NULL,
  `afterRemoveJob` varchar(200) DEFAULT NULL,
  `beforeRemoveJob` varchar(200) DEFAULT NULL,
  `removeDate` datetime DEFAULT NULL,
  `removeReason` varchar(200) DEFAULT NULL,
  `personnelRemoveRemark` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`personnelRemoveId`),
  KEY `FK6907B2A4CAA98332` (`personnelId`),
  CONSTRAINT `FK6907B2A4CAA98332` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personnelremove
-- ----------------------------

-- ----------------------------
-- Table structure for `personneltrain`
-- ----------------------------
DROP TABLE IF EXISTS `personneltrain`;
CREATE TABLE `personneltrain` (
  `personnelTrainId` varchar(200) NOT NULL,
  `personnelId` varchar(200) DEFAULT NULL,
  `personnelTrainDate` datetime DEFAULT NULL,
  `personnelTrainConten` varchar(200) DEFAULT NULL,
  `personnelTrainRemark` varchar(200) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`personnelTrainId`),
  KEY `FK1C4B73E8CAA98332` (`personnelId`),
  CONSTRAINT `FK1C4B73E8CAA98332` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`personnelId`) REFERENCES `personnelinfo` (`personnelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personneltrain
-- ----------------------------

-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `salaryId` varchar(200) NOT NULL,
  `bonus` decimal(10,0) DEFAULT NULL,
  `lunchSalary` decimal(10,0) DEFAULT NULL,
  `trafficSalary` decimal(10,0) DEFAULT NULL,
  `basicSalary` decimal(10,0) DEFAULT NULL,
  `allSalary` decimal(10,0) DEFAULT NULL,
  `useredDate` datetime DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`salaryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('40ecc43a-140a-11e7-978b-201a068a3081', '1000', '1000', '1000', '5000', '8000', '2017-03-29 06:59:49', '0');
INSERT INTO `salary` VALUES ('657ccc7a-1131-11e7-978b-201a068a3081', '123', '1312', '123', '13', '1571', null, null);

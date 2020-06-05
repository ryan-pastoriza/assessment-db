/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50723
Source Host           : 127.0.0.1:3306
Source Database       : acs

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2020-06-04 09:52:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assessment
-- ----------------------------
DROP TABLE IF EXISTS `assessment`;
CREATE TABLE `assessment` (
  `assessmentId` int(11) NOT NULL AUTO_INCREMENT,
  `ssi_id` int(11) DEFAULT NULL,
  `particular` varchar(100) DEFAULT NULL,
  `amt1` double DEFAULT NULL,
  `amt2` double DEFAULT NULL,
  `feeType` varchar(100) DEFAULT NULL,
  `semId` int(11) NOT NULL,
  `syId` int(11) NOT NULL,
  `collectionReportGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`assessmentId`),
  KEY `sem_assessment` (`semId`),
  KEY `sy_assessment` (`syId`),
  CONSTRAINT `sem_assessment` FOREIGN KEY (`semId`) REFERENCES `sem` (`semId`),
  CONSTRAINT `sy_assessment` FOREIGN KEY (`syId`) REFERENCES `sy` (`syId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assessment
-- ----------------------------

-- ----------------------------
-- Table structure for collectionreport
-- ----------------------------
DROP TABLE IF EXISTS `collectionreport`;
CREATE TABLE `collectionreport` (
  `collectionReportId` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(50) DEFAULT NULL,
  `or` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `particular` text,
  `grossReceipt` double DEFAULT NULL,
  `merchandise` double DEFAULT NULL,
  `others` double DEFAULT NULL,
  `unifast` double DEFAULT NULL,
  `specialExam` double DEFAULT NULL,
  `scnl` double DEFAULT NULL,
  `elearning` double DEFAULT NULL,
  `nccUk` double DEFAULT NULL,
  `msFee` double DEFAULT NULL,
  `oracle` double DEFAULT NULL,
  `hp` double DEFAULT NULL,
  `studentServices` double DEFAULT NULL,
  `sap` double DEFAULT NULL,
  `stcab` double DEFAULT NULL,
  `insurance` double DEFAULT NULL,
  `office365` double DEFAULT NULL,
  `shs` double DEFAULT NULL,
  `netR` double DEFAULT NULL,
  PRIMARY KEY (`collectionReportId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of collectionreport
-- ----------------------------

-- ----------------------------
-- Table structure for discount
-- ----------------------------
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `discountId` int(11) NOT NULL AUTO_INCREMENT,
  `ssi_id` int(11) DEFAULT NULL,
  `discountDesc` varchar(100) DEFAULT NULL,
  `amt1` double(10,2) DEFAULT NULL,
  `amt2` double(10,2) DEFAULT NULL,
  `semId` int(11) NOT NULL,
  `syId` int(11) NOT NULL,
  PRIMARY KEY (`discountId`),
  KEY `sem_discount` (`semId`),
  KEY `sy_discount` (`syId`),
  CONSTRAINT `sem_discount` FOREIGN KEY (`semId`) REFERENCES `sem` (`semId`),
  CONSTRAINT `sy_discount` FOREIGN KEY (`syId`) REFERENCES `sy` (`syId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of discount
-- ----------------------------

-- ----------------------------
-- Table structure for fee_schedule
-- ----------------------------
DROP TABLE IF EXISTS `fee_schedule`;
CREATE TABLE `fee_schedule` (
  `feeSchedId` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(40) DEFAULT NULL,
  `year` varchar(40) DEFAULT NULL,
  `percent` varchar(40) DEFAULT NULL,
  `label` varchar(40) DEFAULT NULL,
  `semId` int(11) NOT NULL,
  `syId` int(11) NOT NULL,
  PRIMARY KEY (`feeSchedId`),
  KEY `sem_fee_schedule` (`semId`),
  KEY `sy_fee_schedule` (`syId`),
  CONSTRAINT `sem_fee_schedule` FOREIGN KEY (`semId`) REFERENCES `sem` (`semId`),
  CONSTRAINT `sy_fee_schedule` FOREIGN KEY (`syId`) REFERENCES `sy` (`syId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fee_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for particulars
-- ----------------------------
DROP TABLE IF EXISTS `particulars`;
CREATE TABLE `particulars` (
  `particularId` int(11) NOT NULL AUTO_INCREMENT,
  `particularName` varchar(100) DEFAULT NULL,
  `amt1` double DEFAULT NULL,
  `amt2` double DEFAULT NULL,
  `courseType` varchar(100) DEFAULT NULL,
  `studentStatus` varchar(100) DEFAULT NULL,
  `feeType` varchar(40) DEFAULT NULL,
  `billType` varchar(20) DEFAULT NULL,
  `semId` int(11) NOT NULL,
  `syId` int(11) NOT NULL,
  `collectionReportGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`particularId`),
  KEY `sy_particulars` (`syId`),
  KEY `sem_particulars` (`semId`),
  CONSTRAINT `sem_particulars` FOREIGN KEY (`semId`) REFERENCES `sem` (`semId`),
  CONSTRAINT `sy_particulars` FOREIGN KEY (`syId`) REFERENCES `sy` (`syId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of particulars
-- ----------------------------

-- ----------------------------
-- Table structure for paymentdetails
-- ----------------------------
DROP TABLE IF EXISTS `paymentdetails`;
CREATE TABLE `paymentdetails` (
  `paymentDetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentId` int(11) DEFAULT NULL,
  `particularId` int(11) DEFAULT NULL,
  `oldParticular` varchar(225) DEFAULT NULL,
  `amt1` double DEFAULT NULL,
  `amt2` double DEFAULT NULL,
  `paymentId` int(11) NOT NULL,
  PRIMARY KEY (`paymentDetailsId`),
  KEY `payments_paymentdetails` (`paymentId`),
  CONSTRAINT `payments_paymentdetails` FOREIGN KEY (`paymentId`) REFERENCES `payments` (`paymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of paymentdetails
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `paymentId` int(11) NOT NULL AUTO_INCREMENT,
  `ssi_id` int(11) DEFAULT NULL,
  `acctno` varchar(12) DEFAULT NULL,
  `otherPayeeId` int(11) DEFAULT NULL,
  `orNo` varchar(40) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `amt1` double DEFAULT NULL,
  `amt2` double DEFAULT NULL,
  `paymentMode` varchar(40) DEFAULT NULL,
  `cashier` varchar(100) DEFAULT NULL,
  `semId` int(11) DEFAULT NULL,
  `syId` int(11) DEFAULT NULL,
  `printingType` varchar(10) DEFAULT NULL,
  `paymentStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `sem_payments` (`semId`),
  KEY `sy_payments` (`syId`),
  CONSTRAINT `sem_payments` FOREIGN KEY (`semId`) REFERENCES `sem` (`semId`),
  CONSTRAINT `sy_payments` FOREIGN KEY (`syId`) REFERENCES `sy` (`syId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for personnel
-- ----------------------------
DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `first` varchar(255) DEFAULT NULL,
  `middle` varchar(255) DEFAULT NULL,
  `last` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of personnel
-- ----------------------------
INSERT INTO `personnel` VALUES ('1', 'admin', 'admin', 'adin', 'admin', 'admin');
INSERT INTO `personnel` VALUES ('2', 'cashier', 'cashier', 'cashier', 'cashier', 'cashier');
INSERT INTO `personnel` VALUES ('4', 'sade', null, 'sade', 'sade', null);
INSERT INTO `personnel` VALUES ('5', 'cashier', null, 'cashier', 'cashier', null);
INSERT INTO `personnel` VALUES ('6', 'cashier', null, 'cashier', 'cashier', null);
INSERT INTO `personnel` VALUES ('7', 'cashier', null, 'cashier', 'casheir', null);
INSERT INTO `personnel` VALUES ('8', 'test', 'test', 'test', null, null);
INSERT INTO `personnel` VALUES ('9', 'sade', 'sade', 'sade', null, null);
INSERT INTO `personnel` VALUES ('10', 'asd', 'asd', 'qwe', null, null);
INSERT INTO `personnel` VALUES ('11', 'asd', 'asd', 'qwe', null, null);
INSERT INTO `personnel` VALUES ('12', 'asd', 'asd', 'qwe', null, null);
INSERT INTO `personnel` VALUES ('13', 'asd', 'asd', 'qwe', null, null);
INSERT INTO `personnel` VALUES ('14', 'sample', 'sample', 'sample', null, null);
INSERT INTO `personnel` VALUES ('15', 'sample', 'sample', 'sample', null, null);
INSERT INTO `personnel` VALUES ('16', 'sade', 'sade', 'sade', null, null);

-- ----------------------------
-- Table structure for sem
-- ----------------------------
DROP TABLE IF EXISTS `sem`;
CREATE TABLE `sem` (
  `semId` int(11) NOT NULL AUTO_INCREMENT,
  `sem` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`semId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sem
-- ----------------------------
INSERT INTO `sem` VALUES ('1', '1st');
INSERT INTO `sem` VALUES ('2', '2nd');
INSERT INTO `sem` VALUES ('3', 'summer');

-- ----------------------------
-- Table structure for sy
-- ----------------------------
DROP TABLE IF EXISTS `sy`;
CREATE TABLE `sy` (
  `syId` int(11) NOT NULL AUTO_INCREMENT,
  `sy` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`syId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sy
-- ----------------------------
INSERT INTO `sy` VALUES ('21', '2020-2021');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `per_id` int(11) DEFAULT NULL,
  `userRole` varchar(255) DEFAULT NULL,
  `userStatus` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `fk_users_personnel_1` (`per_id`),
  CONSTRAINT `fk_users_personnel_1` FOREIGN KEY (`per_id`) REFERENCES `personnel` (`per_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('14', 'cashier', '98883c3d87aec5a302b4c69549f36cb5500c47a0f891c1f901727562f510f7af', null, '14', 'Cashier', 'offline', null, '2018-09-10 02:42:35', '2019-07-11 09:29:40', '01pU1YlJk34qAPicT3Mk');
INSERT INTO `users` VALUES ('31', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', null, null, 'Queue Admin', 'Offline', null, '2019-07-10 03:33:22', '2019-09-27 02:41:51', null);
INSERT INTO `users` VALUES ('32', 'ss', 'd41d8cd98f00b204e9800998ecf8427e', null, null, 'Accounting', null, null, '2019-07-10 03:33:58', '2019-07-15 01:10:47', null);
INSERT INTO `users` VALUES ('33', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, null, 'Admin', 'Online', null, '2019-09-23 02:16:30', '2020-03-17 05:09:53', null);
INSERT INTO `users` VALUES ('34', 'cashier', '21232f297a57a5a743894a0e4a801fc3', null, null, 'cashier', null, null, null, null, null);
-- ----------------------------
-- Table structure for or_serving
-- ----------------------------
DROP TABLE IF EXISTS `or_serving`;
CREATE TABLE `or_serving` (
  `or_no` int(45) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`or_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of or_serving
-- ----------------------------
-- ----------------------------
-- Table structure for other_payee
-- ----------------------------
DROP TABLE IF EXISTS `other_payee`;
CREATE TABLE `other_payee` (
  `otherPayeeId` int(11) NOT NULL AUTO_INCREMENT,
  `payeeLast` varchar(40) NOT NULL,
  `payeeFirst` varchar(40) DEFAULT NULL,
  `payeeMiddle` varchar(40) DEFAULT NULL,
  `payeeExt` varchar(40) DEFAULT NULL,
  `payeeAddress` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`otherPayeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
-- ----------------------------
-- Table structure for or_served
-- ----------------------------
DROP TABLE IF EXISTS `or_served`;
CREATE TABLE `or_served` (
  `os_id` int(11) NOT NULL AUTO_INCREMENT,
  `or` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`os_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


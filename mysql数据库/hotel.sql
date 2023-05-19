/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2019-07-23 18:50:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `arrange`
-- ----------------------------
DROP TABLE IF EXISTS `arrange`;
CREATE TABLE `arrange` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `roomid` varchar(32) DEFAULT NULL COMMENT '房间号',
  `date` varchar(32) DEFAULT NULL COMMENT '日期',
  `price` float DEFAULT NULL COMMENT '价格',
  `status` char(1) DEFAULT '0' COMMENT '状态状态 0空位   1住人了   2退房结账了',
  PRIMARY KEY (`id`),
  KEY `roomid` (`roomid`),
  CONSTRAINT `arrange_ibfk_1` FOREIGN KEY (`roomid`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每一间房每天的数据';

-- ----------------------------
-- Records of arrange
-- ----------------------------
INSERT INTO `arrange` VALUES ('026e33bdabcd4cef8503d381d4a08b93', 'b10f5748e86a4de5a126323227c4e4e1', '2019-03-27', '80', '0');
INSERT INTO `arrange` VALUES ('0841899d9b89438282ace436ee9a54d3', '031c83d581b04e3895d0e81a67aee16a', '2019-03-30', '100', '2');
INSERT INTO `arrange` VALUES ('08e804737a384c9bae13112ebb87e008', '031dd87d13e74d8f9c4ced7eaef2b15e', '2019-03-28', '100', '0');
INSERT INTO `arrange` VALUES ('099e8de15e9b4d268018155cadd5addb', '031c83d581b04e3895d0e81a67aee16a', '2019-03-26', '100', '2');
INSERT INTO `arrange` VALUES ('0a4c1c2f257347cbb38e0085b192bf8d', '3adb029854a34420a871231968397783', '2019-03-26', '100', '2');
INSERT INTO `arrange` VALUES ('0ea9310443be443cbb3a69552ee81dd6', '85545ab422fb401194b2c806fcaa97d4', '2019-03-27', '100', '0');
INSERT INTO `arrange` VALUES ('10574754edaf4fafbe61ccef9149d5fb', '9901f1f3ac2e4f61b4ae74d28a402896', '2019-03-27', '80', '0');
INSERT INTO `arrange` VALUES ('14f7704ca67e4980933d7e199970fe99', 'e770fbee671040d4a40a46f5aef6a02c', '2019-03-25', '150', '0');
INSERT INTO `arrange` VALUES ('1aa8eb72285b4ce18ad4e1bd716c5012', '8647bfdba67c4e0d8519c15e8fe95aee', '2019-03-25', '150', '0');
INSERT INTO `arrange` VALUES ('1f16a9b994084946b173974338cc5a7c', '3adb029854a34420a871231968397783', '2019-03-25', '100', '0');
INSERT INTO `arrange` VALUES ('1ff506d6d1c44676867dc9dc057a1901', '6fd16dd84a064be9b88c98cd837118af', '2019-03-26', '80', '0');
INSERT INTO `arrange` VALUES ('226f3903951447c896d3092d78501b81', '85545ab422fb401194b2c806fcaa97d4', '2019-03-31', '100', '0');
INSERT INTO `arrange` VALUES ('262468cd31b044b2b385b18f8ff0ac11', '8647bfdba67c4e0d8519c15e8fe95aee', '2019-03-26', '150', '0');
INSERT INTO `arrange` VALUES ('27245e3a537a41fcae29f5a75105eced', '8647bfdba67c4e0d8519c15e8fe95aee', '2019-03-29', '150', '0');
INSERT INTO `arrange` VALUES ('281422fe22d84ae1ba9094f4c677e9c7', '6fd16dd84a064be9b88c98cd837118af', '2019-03-28', '80', '0');
INSERT INTO `arrange` VALUES ('304129fd2a6b42b0b8a7cda5e7bddd5d', 'b10f5748e86a4de5a126323227c4e4e1', '2019-03-28', '80', '0');
INSERT INTO `arrange` VALUES ('30e2fc853244499c9682b885e990a936', '39a431e179ee4aea97f8ea7a285566a7', '2019-03-27', '80', '0');
INSERT INTO `arrange` VALUES ('374768f3a5d049e491b495bf74f5b133', '39a431e179ee4aea97f8ea7a285566a7', '2019-03-31', '80', '0');
INSERT INTO `arrange` VALUES ('38af4cc68eec4e53baa191ae42233555', 'b10f5748e86a4de5a126323227c4e4e1', '2019-03-29', '80', '0');
INSERT INTO `arrange` VALUES ('4486e924b5db4be080089e3e8927d496', '8647bfdba67c4e0d8519c15e8fe95aee', '2019-03-28', '150', '0');
INSERT INTO `arrange` VALUES ('44fdc84404494f9c8646d2654b16448e', 'e770fbee671040d4a40a46f5aef6a02c', '2019-03-27', '150', '0');
INSERT INTO `arrange` VALUES ('4788df380966499382374b90fa7ea674', '031c83d581b04e3895d0e81a67aee16a', '2019-03-25', '100', '0');
INSERT INTO `arrange` VALUES ('47a7c797a7e540d79bb566f6e011a483', '85545ab422fb401194b2c806fcaa97d4', '2019-03-25', '100', '0');
INSERT INTO `arrange` VALUES ('51a78610e2514a27bd720e49a944590a', '882a69d9af4d4ba2a4f2fb1bb7e92dca', '2019-03-29', '150', '0');
INSERT INTO `arrange` VALUES ('5e255e28e45e40a2afdf0bdba0f7098d', '9901f1f3ac2e4f61b4ae74d28a402896', '2019-03-28', '80', '0');
INSERT INTO `arrange` VALUES ('5fd929265f7445ff9472e07a5e4029cc', '39a431e179ee4aea97f8ea7a285566a7', '2019-03-28', '80', '0');
INSERT INTO `arrange` VALUES ('6101558e01714a979e8b5507834a5318', '6fd16dd84a064be9b88c98cd837118af', '2019-03-25', '80', '0');
INSERT INTO `arrange` VALUES ('6143c29be2324448a7b73a89c626182e', '8647bfdba67c4e0d8519c15e8fe95aee', '2019-03-31', '150', '2');
INSERT INTO `arrange` VALUES ('6292b71be57d48b1854c4f010f7db0aa', '3adb029854a34420a871231968397783', '2019-03-31', '100', '0');
INSERT INTO `arrange` VALUES ('6677f6cb81234880a43bba43c80204d7', '9901f1f3ac2e4f61b4ae74d28a402896', '2019-03-26', '80', '0');
INSERT INTO `arrange` VALUES ('697843b990964e919b2752b54e1256ac', 'e770fbee671040d4a40a46f5aef6a02c', '2019-03-29', '150', '0');
INSERT INTO `arrange` VALUES ('69890088cf90442bab0ed099e182f496', '85545ab422fb401194b2c806fcaa97d4', '2019-03-30', '100', '0');
INSERT INTO `arrange` VALUES ('77a2a652739d41de8cbc815069fac25f', '6fd16dd84a064be9b88c98cd837118af', '2019-03-27', '80', '0');
INSERT INTO `arrange` VALUES ('7c5126706ad74457951035ebfb2f76d7', '9901f1f3ac2e4f61b4ae74d28a402896', '2019-03-31', '80', '2');
INSERT INTO `arrange` VALUES ('7cc3f9acc03648bbbe1e831840674c72', '39a431e179ee4aea97f8ea7a285566a7', '2019-03-25', '80', '0');
INSERT INTO `arrange` VALUES ('7e8ddd18c67441c4b1f2a38d972de410', '85545ab422fb401194b2c806fcaa97d4', '2019-03-26', '100', '0');
INSERT INTO `arrange` VALUES ('7f831814570244768621a3d4c49f388a', '882a69d9af4d4ba2a4f2fb1bb7e92dca', '2019-03-26', '150', '0');
INSERT INTO `arrange` VALUES ('7fb0b08e1d744b55b49ff71e757b88fb', '031c83d581b04e3895d0e81a67aee16a', '2019-03-31', '100', '0');
INSERT INTO `arrange` VALUES ('836a5a5678a84e138c95ef988d43a2b1', '3adb029854a34420a871231968397783', '2019-03-29', '100', '0');
INSERT INTO `arrange` VALUES ('84f33aff644449c09acbfffdf44be984', '9901f1f3ac2e4f61b4ae74d28a402896', '2019-03-29', '80', '0');
INSERT INTO `arrange` VALUES ('850bf7144af24d8989349d873d69dc00', '882a69d9af4d4ba2a4f2fb1bb7e92dca', '2019-03-25', '150', '0');
INSERT INTO `arrange` VALUES ('869c2bf2eb9140a3b5262a392023685a', 'e770fbee671040d4a40a46f5aef6a02c', '2019-03-30', '150', '0');
INSERT INTO `arrange` VALUES ('8bca0f9698824a3689689ac4c1340969', '031c83d581b04e3895d0e81a67aee16a', '2019-03-27', '120', '2');
INSERT INTO `arrange` VALUES ('8bfe05b4f14c4432b121b692f2436837', '3c64b99fea9841ff8bf4106334fd7415', '2019-03-31', '150', '0');
INSERT INTO `arrange` VALUES ('8fcd2dfaa9834721963cbce334475334', '3c64b99fea9841ff8bf4106334fd7415', '2019-03-29', '150', '0');
INSERT INTO `arrange` VALUES ('912d5f2e33ab413e89d7feff8b0a7710', '031c83d581b04e3895d0e81a67aee16a', '2019-03-29', '100', '0');
INSERT INTO `arrange` VALUES ('92825d34d4d94c2b9418e6d7d0ecc8be', '8647bfdba67c4e0d8519c15e8fe95aee', '2019-03-27', '150', '0');
INSERT INTO `arrange` VALUES ('9e3153b46d794a38a472150e13c8662f', '3adb029854a34420a871231968397783', '2019-03-30', '100', '2');
INSERT INTO `arrange` VALUES ('a786d3266d7e44cfa6f4b75a26868a81', '031dd87d13e74d8f9c4ced7eaef2b15e', '2019-03-31', '100', '0');
INSERT INTO `arrange` VALUES ('aa126f4d22af4102affa01479a7c845c', 'e770fbee671040d4a40a46f5aef6a02c', '2019-03-26', '150', '0');
INSERT INTO `arrange` VALUES ('b0562f2c4dcf4e8b9c68120f60a706f3', '882a69d9af4d4ba2a4f2fb1bb7e92dca', '2019-03-27', '150', '0');
INSERT INTO `arrange` VALUES ('b5ff482a03b2430cbccdc9b5fc5728a7', 'b10f5748e86a4de5a126323227c4e4e1', '2019-03-31', '80', '2');
INSERT INTO `arrange` VALUES ('b85393e3677342a782e848c521074e41', '031dd87d13e74d8f9c4ced7eaef2b15e', '2019-03-25', '100', '0');
INSERT INTO `arrange` VALUES ('b9ecc5e01f84416985f5051d426c99fa', '882a69d9af4d4ba2a4f2fb1bb7e92dca', '2019-03-31', '150', '2');
INSERT INTO `arrange` VALUES ('ba7b560c23e7400ca5029bb479689a9c', '9901f1f3ac2e4f61b4ae74d28a402896', '2019-03-30', '80', '0');
INSERT INTO `arrange` VALUES ('ba9583db97f443b6ac4c33c70f939397', '3c64b99fea9841ff8bf4106334fd7415', '2019-03-27', '150', '0');
INSERT INTO `arrange` VALUES ('bdb5065fb595421db00bf78fe62608c0', '3c64b99fea9841ff8bf4106334fd7415', '2019-03-26', '150', '0');
INSERT INTO `arrange` VALUES ('c010e6e9daaf4b779104d9e31fd58be7', '3c64b99fea9841ff8bf4106334fd7415', '2019-03-25', '150', '0');
INSERT INTO `arrange` VALUES ('c028d2857bf94d15a2822754ca13ed5c', '39a431e179ee4aea97f8ea7a285566a7', '2019-03-26', '80', '0');
INSERT INTO `arrange` VALUES ('c2d9d494f78a47fdbf776f5421de5ece', 'b10f5748e86a4de5a126323227c4e4e1', '2019-03-25', '80', '0');
INSERT INTO `arrange` VALUES ('c6931ce0775c44388fdc3dbed5fafc32', '031dd87d13e74d8f9c4ced7eaef2b15e', '2019-03-27', '100', '2');
INSERT INTO `arrange` VALUES ('cc7240f6d1dc4526a81d5187c7957e7d', 'b10f5748e86a4de5a126323227c4e4e1', '2019-03-26', '80', '0');
INSERT INTO `arrange` VALUES ('cdbb7da056a248ffbb1e69ffdfad4460', '9901f1f3ac2e4f61b4ae74d28a402896', '2019-03-25', '80', '0');
INSERT INTO `arrange` VALUES ('ce5f3e36f6af4f16a6900dd3f8d357a4', '3c64b99fea9841ff8bf4106334fd7415', '2019-03-30', '150', '2');
INSERT INTO `arrange` VALUES ('ce66aad815674d1aa762d6ad6d404cba', 'e770fbee671040d4a40a46f5aef6a02c', '2019-03-28', '150', '2');
INSERT INTO `arrange` VALUES ('d1831e1680014348841a90e9fd0afa8f', '3c64b99fea9841ff8bf4106334fd7415', '2019-03-28', '150', '0');
INSERT INTO `arrange` VALUES ('d1c3c3f53e4a4ab686d942d1ca877efe', '85545ab422fb401194b2c806fcaa97d4', '2019-03-28', '100', '0');
INSERT INTO `arrange` VALUES ('d4a781c3f5c848f585720df16f77d472', '031dd87d13e74d8f9c4ced7eaef2b15e', '2019-03-30', '100', '0');
INSERT INTO `arrange` VALUES ('d53a9d6d9bde4603af4ae696de10a1fd', '882a69d9af4d4ba2a4f2fb1bb7e92dca', '2019-03-28', '150', '0');
INSERT INTO `arrange` VALUES ('d9495023ef744c4094b46570f383ded4', '39a431e179ee4aea97f8ea7a285566a7', '2019-03-30', '80', '0');
INSERT INTO `arrange` VALUES ('dab72c4422e14506b5482ca02d8ad565', '6fd16dd84a064be9b88c98cd837118af', '2019-03-31', '80', '0');
INSERT INTO `arrange` VALUES ('df1a55d70bf64a8b927bdd00cd7a033a', '6fd16dd84a064be9b88c98cd837118af', '2019-03-29', '80', '0');
INSERT INTO `arrange` VALUES ('e2c9b1172ad44beabf1853c2b9e42a63', '031dd87d13e74d8f9c4ced7eaef2b15e', '2019-03-29', '100', '0');
INSERT INTO `arrange` VALUES ('e4ffd9c2e35b435cb62e71b5df3c373b', '882a69d9af4d4ba2a4f2fb1bb7e92dca', '2019-03-30', '150', '2');
INSERT INTO `arrange` VALUES ('ea99207c5c0d4e379c4f9cb74c642e6f', '85545ab422fb401194b2c806fcaa97d4', '2019-03-29', '100', '0');
INSERT INTO `arrange` VALUES ('ec1b94008f9b46b4bf8fbf065031d839', '6fd16dd84a064be9b88c98cd837118af', '2019-03-30', '80', '0');
INSERT INTO `arrange` VALUES ('ef84623f08e4435d9bb7c5560dac620e', '3adb029854a34420a871231968397783', '2019-03-27', '120', '2');
INSERT INTO `arrange` VALUES ('f2da832aeb084a598f7540039dfc0733', '031c83d581b04e3895d0e81a67aee16a', '2019-03-28', '100', '0');
INSERT INTO `arrange` VALUES ('f4e64fcfb921420a8d20b8dad1b7ba44', '031dd87d13e74d8f9c4ced7eaef2b15e', '2019-03-26', '100', '2');
INSERT INTO `arrange` VALUES ('f614194492644ba3844eed09b910adc7', 'b10f5748e86a4de5a126323227c4e4e1', '2019-03-30', '80', '0');
INSERT INTO `arrange` VALUES ('f94f80de1c864fa995f581a278549ede', '39a431e179ee4aea97f8ea7a285566a7', '2019-03-29', '80', '0');
INSERT INTO `arrange` VALUES ('fa940794a92d4e54932425c0e1db12fe', '3adb029854a34420a871231968397783', '2019-03-28', '100', '0');
INSERT INTO `arrange` VALUES ('faeade13068047bdbbe41adbbc93e331', '8647bfdba67c4e0d8519c15e8fe95aee', '2019-03-30', '150', '0');
INSERT INTO `arrange` VALUES ('fe8c629ddde84a138003d51e9e8d67a9', 'e770fbee671040d4a40a46f5aef6a02c', '2019-03-31', '150', '2');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` varchar(32) NOT NULL COMMENT '顾客表主键',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机',
  `idcardno` varchar(32) DEFAULT NULL COMMENT '身份证',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `sex` varchar(32) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顾客信息表';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('b1e628808d5b4a64832c4eaa580b9d8d', '李四', '13800000001', '340101199001010002', '她是女的', '女');
INSERT INTO `customer` VALUES ('be005a1c17574d9280cb69e50bb5b8e4', '张三', '13800000002', '340101199001010001', '', '男');
INSERT INTO `customer` VALUES ('e236064a1caf40789deeeff6dd1c2534', '李军', '13800000004', '340101199001010004', '', '男');
INSERT INTO `customer` VALUES ('e4adc0d3e3654ab28551558fe4b89c1e', '刘红', '13800000003', '340101199001010003', '', '男');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logId` varchar(32) NOT NULL COMMENT '日志',
  `userName` varchar(30) DEFAULT NULL COMMENT '操作人',
  `createTime` varchar(30) DEFAULT NULL COMMENT '时间',
  `content` text COMMENT '详细',
  `operation` varchar(300) DEFAULT NULL COMMENT '操作类型（增删改）',
  `ip` varchar(60) DEFAULT NULL COMMENT 'IP地址',
  `module` varchar(40) DEFAULT NULL COMMENT '所属模块',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('0013b27e27a24f3ab848d1f70c1c8201', 'lisi', '2017-04-21 00:17:22', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('012b537cd9834aad8e9a22f85e99179a', 'zhangsan', '2017-04-20 22:31:21', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('019373e60c074a6fbdc2c3e11ccd8cbc', 'sysAdm', '2017-01-10 12:01:41', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('04e11dd28e6041a9b8a20467b84309dc', 'zhangsan', '2017-04-18 23:38:03', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('052fbabfd9bc4d0caa2df8d4539bd1d5', 'sysAdm', '2017-01-10 11:03:49', null, '退出', '127.0.0.1', null);
INSERT INTO `log` VALUES ('0d216245796242b19004f468286a0200', 'sysAdm', '2017-04-20 23:56:04', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('0d463d8e72704b74b53c542226095bc0', 'sysAdm', '2017-01-10 16:01:40', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('12304221afda4c04bfa8e8331bc351f9', 'zhangsan', '2017-04-21 00:12:03', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('13ecf1a4fcd34710bb24b9655b29eb69', 'admin', '2017-04-19 00:01:45', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('18ebd7540c2e4bd48e2a8686902b8cc3', 'sysAdm', '2017-01-10 16:29:13', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('1fa56bfc04f947ddb6901a91f9128d2c', 'admin', '2017-04-18 23:41:45', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('2043d0aceffe4fc4802cf40a8ca43e36', 'sysAdm', '2017-01-10 11:55:25', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('21a829d7e6a14066919bc6bc6ba2f218', 'zhangsan', '2017-04-21 00:24:00', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('22c90a20676c4513868beaca603ecbc1', 'lisi', '2017-04-22 00:06:43', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('257c59314ab04c68a66d058d6f917390', 'sysAdm', '2017-04-20 00:07:43', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('25b2b3e77add4bcc9572b6bc7e007f49', 'zhangsan', '2017-04-20 22:45:12', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('26023887de63492cafa309f9f5c7ad3e', 'admin', '2017-04-18 23:42:16', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('263951d9173541239fe44db2d8bdd2bc', 'zhangsan', '2017-04-21 22:39:47', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('28493ae58e9e43ca93952489382dd029', 'sysAdm', '2017-01-10 16:11:17', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('28e24a4f0a6945dd8bc6edfd136cc2ea', 'zhangsan', '2017-04-21 22:42:00', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('291378a04f944368a50ba9aae99987aa', 'zhangsan', '2017-04-20 22:17:34', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('2f48bf1d282949069ba74650924f3796', 'lisi', '2017-04-21 01:21:30', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('33429e1f561545818ee40f2b28f5e78e', 'sysAdm', '2017-01-10 15:50:56', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('33525eed7c174bd3a479ad49d3333cc2', 'sysAdm', '2017-04-19 00:00:11', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('3545f9e645d540ccada409c843a57cac', 'zhangsan', '2017-04-20 23:40:28', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('37a8ddd9606146e294088473fd3dc957', 'sysAdm', '2017-04-20 00:00:40', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('3841040b3617497f9fa46aa50827136b', 'sysAdm', '2017-04-20 21:21:15', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('3869d5e34df344d38f47efb97ead6677', 'sysAdm', '2017-04-18 22:50:16', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('3a012bd1512e499ca77007a4c5c3c5eb', 'admin', '2017-04-19 00:01:41', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('3e97cef4721048238267dbaaf1042f9a', 'zhangsan', '2017-04-20 23:43:24', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('3ec89620e24645ba9a8f8deea0448199', 'sysAdm', '2017-04-18 23:40:20', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('3f93702a39554fab89749a1dbdc73725', 'lisi', '2017-04-21 01:13:51', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('40b719bb399c4bf79fefa74852df9cde', 'sysAdm', '2017-04-19 23:56:17', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('40d0e3f58bd54728beeee9ffa10024c3', 'lisi', '2017-04-21 01:08:10', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('4102867dfbed48ea8a4af7fafb7da0d4', 'sysAdm', '2017-04-22 00:00:09', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('4152bc5402fd4115a5adc291d236dd8a', 'sysAdm', '2017-04-21 23:18:09', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('417960375dde4f7aba5b6f1ac93e4100', 'lisi', '2017-04-21 00:21:23', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('451447b91baf40c3bca9508af1eeb4f6', 'sysAdm', '2017-04-18 23:37:48', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('45a2c54ee3544e2fb5763c149f4eeaf7', 'zhangsan', '2017-04-21 23:23:52', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('46b0bf345f13481ab24a5ca46e846197', 'lisi', '2017-04-21 00:22:34', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('47d22c099a054677adfea6dfa9286418', 'sysAdm', '2017-01-10 11:52:53', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('49f97a01942a4a53baf6973f4cea38bc', 'sdf', '2017-01-10 16:23:08', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('4abda95b0cf143c4bd03f2cbcfcc6efa', 'sysAdm', '2017-04-21 00:02:32', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('517eeac2856d4af29d85c14404fb28e9', 'sysAdm', '2017-04-21 23:36:46', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('53523c2eb2f6493a9862bf3ddb476e44', 'zhangsan', '2017-04-18 23:36:20', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('5426d29a21bf4ec7aa5d2568c7a6d783', 'lisi', '2017-04-20 23:46:44', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('54d3e86204b141f3be0c2e3e482f5e14', 'sysAdm', '2017-04-21 23:31:11', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('552b09feba16466fa283085dc2d71e9a', 'sysAdm', '2017-04-18 23:41:56', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('57ad47d1d87b4f46ab8eef29a3628ffe', 'sysAdm', '2017-04-21 20:38:27', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('57fb44fb6a20448eb9f9d5c8f267dac1', 'sdf', '2017-01-10 16:19:22', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('580be274b3964a5fa018b60a80c292a8', 'lisi', '2017-04-21 00:52:21', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('585357cec5ac4bee8fc9b2e4a5eae645', 'sysAdm', '2017-01-10 16:19:04', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('58e9fa42c4df40078ff15129499c2e35', 'zhangsan', '2017-04-20 22:53:33', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('5924036e313c45f5bfdad5d260ebd29f', 'sysAdm', '2017-04-22 00:06:06', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('5b73f1f213574ca69e8df935ce3356d8', 'sysAdm', '2017-01-10 16:21:41', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('5b7dd0e7b9dc436988f381ae3ec6b745', 'sysAdm', '2017-04-20 00:12:46', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('5d9384128a6f4b4fb79638eb714ba665', 'sysAdm', '2017-04-20 22:17:40', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('5e82ba95467c467d928ede48c5d92042', 'sysAdm', '2017-04-21 23:18:16', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('64c300e691344c169e59d6cd139004be', 'sysAdm', '2017-04-21 23:25:29', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('669da45d455249c98930db6e9489624d', 'sysAdm', '2017-04-18 23:41:39', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('68e111cd6f5a448a8237fefbc7862dd9', 'sysAdm', '2017-04-19 23:01:45', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('69e777d028b3427bbfbce7b0324626ea', 'sysAdm', '2017-04-21 23:18:04', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('6cd4e8d50d8e4625944edecf5d16ed5a', 'sysAdm', '2017-04-21 00:22:53', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('6d292bf155624261ac8a3e643a38ea95', 'sysAdm', '2017-04-19 23:03:21', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('7057a69a0ac44f02bd2204919e1deb11', 'sysAdm', '2017-04-21 00:23:56', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('709e768c0afc4a409ec6383b111a3510', 'sysAdm', '2017-01-10 15:58:19', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('71a353a5c38a4563b9b30e1d5a8ac265', 'zhangsan', '2017-04-21 20:39:24', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('739f9e2259894313a23b9e5466f85f0d', 'zhangsan', '2017-04-20 22:28:56', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('792dcf98c0ce412b902d43664060eb3d', 'zhangsan', '2017-04-21 00:22:44', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('79f472b97a1c4f51a63d7b87d71f9bfe', 'sysAdm', '2017-04-18 22:48:20', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('7b703e33458c47e786aa31a113f2d63a', 'zhangsan', '2017-04-18 23:38:07', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('7dcaa44cd5fb4488893b827603ff3ee3', 'sysAdm', '2017-01-10 16:19:15', null, '退出', '127.0.0.1', null);
INSERT INTO `log` VALUES ('7f1eb5743cf340e8b8f07f819c1468fa', 'zhangsan', '2017-04-20 23:56:31', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('8206fd0963294127b398af7333d63949', 'zhangsan', '2017-04-21 23:35:57', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('836fbdf2932a46c2babbbd6e61792fc0', 'sysAdm', '2017-01-10 16:11:37', null, '退出', '127.0.0.1', null);
INSERT INTO `log` VALUES ('869bc6a030eb4c949be6bc86c3538949', 'sysAdm', '2017-04-19 23:05:30', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('87286cde4643409198b31cb92e6b610d', 'sysAdm', '2017-04-21 20:04:31', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('881724fff0e64e5b9634780bd7c7fba7', 'zhangsan', '2017-04-21 23:18:21', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('8ca6eb7b247f4fe99488d2f1a1a51d55', 'admin', '2017-04-18 23:42:46', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('8f33b11d320a4a11bf3faa1c01378c7b', 'sysAdm', '2017-04-20 00:17:41', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('92f0bfb450f24360b91f11cfee962a45', 'lisi', '2017-04-21 01:10:44', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('9394f96559be4bbbaf87c6643b3c4399', 'lisi', '2017-04-21 01:02:23', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('97149fa2ee82409187cb31401bc340bc', 'lisi', '2017-04-21 01:19:58', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('97514a44e499426ba2a54cb224f75834', 'zhangsan', '2017-04-20 22:43:55', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('994c77bab2d049b388dce4b5a0b103dd', 'zhangsan', '2017-04-21 00:22:38', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('995e3f47b079454eade990b39ef77192', 'lisi', '2017-04-21 00:14:21', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('99bdb1b480e34ec983648c3212c54073', 'sysAdm', '2017-01-10 14:37:46', null, '退出', '127.0.0.1', null);
INSERT INTO `log` VALUES ('9a1cff6adc3443aebea44e4662d4751f', 'sysAdm', '2017-04-18 23:38:31', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('9b9dcaeef4414272a33c88dc6baf5115', 'sysAdm', '2017-01-10 14:58:22', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('9da6f5c93e6048d284618433f06346f6', 'sysAdm', '2017-01-10 14:37:15', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('9dc8df9663b54b11836f79225b886948', 'lisi', '2017-04-21 01:04:44', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('9e5d9387661546b48109af3edea08559', 'sysAdm', '2017-04-21 20:39:19', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('a2f531a65f2a4ce8ba80b39f9900e0c7', 'sysAdm', '2017-04-21 00:01:02', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('a3d55132d7214d4f9f4bfa66489b3e28', 'sysAdm', '2017-04-22 00:06:39', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('a641f6fb65424b538d365f1ee063fc97', 'sysAdm', '2017-04-21 20:02:32', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('a8bf522d6ced49158448da43017df8aa', 'sysAdm', '2017-04-21 20:42:59', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('a8f8130d20a04e15b9c8959f70d5203c', 'zhangsan', '2017-04-21 20:43:42', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('a938dcd2d36f45d7b3afac6e6ee1dbf7', 'sysAdm', '2017-04-21 20:43:35', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('a9bebc160e7343c9b781e7a2894edf1e', 'zhangsan', '2017-04-20 22:37:27', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('a9cc2854f6364ed9a0ffe400c701fa66', 'sysAdm', '2017-04-20 00:23:05', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('aac80b6e98b74bd9ae39a7c6e0b6afcc', 'sysAdm', '2017-04-21 23:58:32', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('ac2a0fd71bc54912b1de386d8888abd1', 'sysAdm', '2017-04-21 23:16:20', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('ad18a3355cd34712b01a1e8354923a39', 'zhangsan', '2017-04-21 22:30:40', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('ad7910b7721d424a8f2865e675944542', 'sysAdm', '2017-04-21 22:30:32', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('aec82d08a8914c0999e2f5fd1da85918', 'zhangsan', '2017-04-21 00:04:46', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('b03cc39957d440e3a6a4083c697a5720', 'sysAdm', '2017-04-19 00:00:55', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('b43635d8490c4fb5b68380cfeb850af6', 'zhangsan', '2017-04-21 23:24:40', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('b47afce0baea448182f42383f33de3c2', 'zhangsan', '2017-04-20 22:46:49', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('b59c9611f6434c92908b34304f271b69', 'zhangsan', '2017-04-21 00:02:36', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('b624627ed16d4fbbb5191dec786941ab', 'sysAdm', '2017-04-18 23:42:54', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('bbe38769edeb43deadaf1b74a22481dd', 'lisi', '2017-04-21 00:59:12', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('bd03bacb5e5541718384df6d95417c78', 'lisi', '2017-04-21 23:25:21', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('bebed17ddabf46e0bcd4b0baf88dd766', 'lisi', '2017-04-21 00:07:44', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('bfbbd509e8ce43f8ada2d7247fd062fd', 'zhangsan', '2017-04-20 22:17:25', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('c049c925dd43435dbd71d6b6b425929c', 'lisi', '2017-04-21 01:05:36', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('c9c114df60224af1ba0c257f4fa9b42e', 'zhangsan', '2017-04-20 22:18:05', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('ce4a95a4fd9142b5b5206b7be00b5d2d', 'sdf', '2017-01-10 16:06:00', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('ce87bc95685349f998034812bbfeef1f', 'sysAdm', '2017-04-20 23:40:22', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('cf99417257144c8c9bbddfd8494b88d8', 'sysAdm', '2017-04-20 22:18:00', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('d26d327c501345a38afd82a9b7b6114a', 'lisi', '2017-04-21 23:24:44', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('d29c2994e3ff4d349032731d939b87b4', 'zhangsan', '2017-04-20 22:27:18', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('d3128f3f7f96427eb960fb91b3bc3145', 'sysAdm', '2017-01-10 11:04:15', null, '退出', '127.0.0.1', null);
INSERT INTO `log` VALUES ('d77d64a50f6c44f4b9ca00d23c8fe676', 'sysAdm', '2017-04-20 23:56:22', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('d805d18a9cb047bdb461fcf04e13bbab', 'zhangsan', '2017-04-21 20:43:48', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('d9b59f03f1a0400e8a3fd8398c90bdb1', 'lisi', '2017-04-20 23:52:01', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('d9ccb6ae79fe4948b8f0aaa088fa4e31', 'sdf', '2017-01-10 16:11:41', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('da03a2fbc9ed4d5194a8cda90460af48', 'sysAdm', '2017-04-21 22:26:29', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('da5b8964c2754fc5af2002c5b31bfabd', 'sysAdm', '2017-04-20 23:39:09', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('de765a09ed864c788ee15e53941f6eba', 'zhangsan', '2017-04-20 22:55:38', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('df57cade77674954841c7b0f7dfe30f5', 'sysAdm', '2017-01-10 14:37:50', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('df6f9bd54031466284f78d111230e86c', 'sysAdm', '2017-01-10 16:05:24', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('e05b8769f51a4131b77aed0471fa7c68', 'sysAdm', '2017-04-18 23:36:59', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e0bc1cf4c3ac4680a142b4e8a8f56f5f', 'lisi', '2017-04-22 00:07:03', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e14e94168ca8492d915755232f1a91ac', 'zhangsan', '2017-04-22 00:07:08', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e1f618f4aee949baad487837cd9a4ee4', 'zhangsan', '2017-04-21 23:36:39', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e2939670ec4c483f8d49de11c70b886e', 'sysAdm', '2017-04-18 23:48:15', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e38f940e76884e02a594fdd9de501cbf', 'sysAdm', '2017-04-21 20:04:24', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e3cae591c7504409a709af4627c8904a', 'admin', '2017-04-18 23:41:48', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e3e8cecc0c4a462192126baad09cffb3', 'zhangsan', '2017-04-21 20:42:53', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e467af76d6d24b37961771b6382ae3a6', 'sysAdm', '2017-04-20 00:20:11', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e66ecb32e7654b329714b42c377b21d6', 'zhangsan', '2017-04-21 23:19:33', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('e879bda75ea34b76a934c4d0d9d5e7da', 'sysAdm', '2017-04-20 23:01:29', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('ec5a9bd1cfce4087ac95b892d1bc81e5', 'zhangsan', '2017-04-21 00:06:37', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('ecc5ba5c9b144d299023f86d45f69723', 'zhangsan', '2017-04-21 19:33:15', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('ecf6fe61bbba4f4db1ce684151ec2274', 'sysAdm', '2017-04-20 00:00:34', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('f2a859fcd63d4b5d99aac954a0e6852d', 'sysAdm', '2017-04-20 21:22:11', null, '退出', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('f433bb1db4d84c56aa78b2be39e5671d', 'sysAdm', '2017-01-10 11:58:15', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('f4561cc5e2de442b9f367b6228417347', 'sysAdm', '2017-01-10 11:03:55', null, '登录', '127.0.0.1', null);
INSERT INTO `log` VALUES ('f463e7437807418da0daaddecd612807', 'lisi', '2017-04-20 23:43:52', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('f840e94cf1cd4060b97b9e78266d2aca', 'lisi', '2017-04-21 00:55:38', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('f93653c190924f548d9e0827332c4ea7', 'sysAdm', '2017-04-19 23:58:44', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('f9fd60138c2b49e798191615582e53bf', 'sysAdm', '2017-01-10 16:05:34', null, '退出', '127.0.0.1', null);
INSERT INTO `log` VALUES ('fa5e4f4afbf34f9fbce65c76f0052831', 'sysAdm', '2017-04-21 20:43:55', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('fa7c1aa783134391ab42a5de62eaca98', 'sysAdm', '2017-04-20 22:56:50', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('fabf9e79ce0348339a1f827421bf4979', 'sysAdm', '2017-04-18 23:51:00', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('ff58c0a69ba24e33a3ef839e7adce365', 'zhangsan', '2017-04-20 22:35:42', null, '登录', '0:0:0:0:0:0:0:1', null);
INSERT INTO `log` VALUES ('ff60dac0dd11476c90bac67ecfbb9aac', 'sysAdm', '2017-04-18 23:42:08', null, '退出', '0:0:0:0:0:0:0:1', null);

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuId` varchar(32) NOT NULL COMMENT '菜单ID',
  `menuName` varchar(50) DEFAULT NULL COMMENT '名称',
  `menuUrl` varchar(100) DEFAULT NULL COMMENT '方法',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父ID',
  `menuDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  `state` varchar(20) DEFAULT NULL COMMENT '状态/OPEN/CLOSED',
  `iconCls` varchar(50) DEFAULT NULL COMMENT '图标',
  `seq` int(11) DEFAULT NULL COMMENT '顺序排序',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单管理表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('260bea62556c4b468f39519f80fd3ab4', '数据统计', '', 'assadd5325af432db5dc825499dede71', '', 'closed', 'icon-', '3');
INSERT INTO `menu` VALUES ('54475f4f787b45daa3df6f2ee0b312aa', '系统管理', '', 'assadd5325af432db5dc825499dede71', '', 'closed', 'icon-permission', '1');
INSERT INTO `menu` VALUES ('57295d5325af432db5dc825499dede71', '基础信息', '', 'assadd5325af432db5dc825499dede71', '', 'closed', 'icon-265', '2');
INSERT INTO `menu` VALUES ('5c796c8fedf8430b8f07dfe27f4c48dd', '角色管理', 'role/roleIndex.htm', '54475f4f787b45daa3df6f2ee0b312aa', '', 'open', 'icon-486', '3');
INSERT INTO `menu` VALUES ('832e029cfe764b249b5c14b0764beb4c', '顾客管理', 'customer/customerIndex.htm', '57295d5325af432db5dc825499dede71', '', 'open', 'icon-', '1');
INSERT INTO `menu` VALUES ('850a8850cbf746cfa6a0b6b048e0fd69', '订单明细', 'order/orderIndex.htm', '57295d5325af432db5dc825499dede71', '', 'open', 'icon-', '4');
INSERT INTO `menu` VALUES ('902a007a778b4e1896edfd5e46dc71de', '按月统计', 'statistic/monthIndex.htm', '260bea62556c4b468f39519f80fd3ab4', '', 'open', 'icon-', '2');
INSERT INTO `menu` VALUES ('922b1f2962574a9084f80ea0ceb2f0c5', '菜单管理', 'menu/menuIndex.htm', '54475f4f787b45daa3df6f2ee0b312aa', '', 'open', 'icon-menuManage', '4');
INSERT INTO `menu` VALUES ('9b442e122a934c888fcbc2ed6ef031c5', '客房查询', 'arrange/arrangeIndex.htm', '57295d5325af432db5dc825499dede71', '', 'open', 'icon-', '3');
INSERT INTO `menu` VALUES ('9e74f769ab1246cabb409327807716fd', '退房续费', 'orderArrange/orderIndex.htm', '57295d5325af432db5dc825499dede71', '', 'open', 'icon-', '5');
INSERT INTO `menu` VALUES ('a32fbcb83d1a4d359c574be1b49211ac', '按天统计', 'statistic/index.htm', '260bea62556c4b468f39519f80fd3ab4', '', 'open', 'icon-', '1');
INSERT INTO `menu` VALUES ('a674184e5dc8406da46d365922fb2344', '客房管理', 'room/roomIndex.htm', '57295d5325af432db5dc825499dede71', '', 'open', 'icon-', '2');
INSERT INTO `menu` VALUES ('assadd5325af432db5dc825499dede71', '万豪酒店管理系统', '', '-1', '主菜单', 'closed', 'icon-home', '1');
INSERT INTO `menu` VALUES ('f6c7b05fef0d4b75a3496fcf281c2524', '用户管理', 'user/userIndex.htm', '54475f4f787b45daa3df6f2ee0b312aa', '', 'open', 'icon-489', '2');

-- ----------------------------
-- Table structure for `operation`
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `operationId` varchar(64) NOT NULL COMMENT '具体的方法',
  `operationName` varchar(100) DEFAULT NULL COMMENT '方法名',
  `menuId` varchar(32) DEFAULT NULL COMMENT '所属菜单',
  `menuName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`operationId`),
  KEY `menuId` (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='具体的页面按钮上的方法\r\n（此自增ID至少从10000开始）';

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('05da9b23441449b88cf56a3c762b4c', '授权', '5c796c8fedf8430b8f07dfe27f4c48dd', '角色管理');
INSERT INTO `operation` VALUES ('0f209d86e9514d04986d1f6058c6aa', '修改价格', '9b442e122a934c888fcbc2ed6ef031c5', '客房查询');
INSERT INTO `operation` VALUES ('2bd54615b5b8418aa27ab37e0fb675', '顾客入住', '9b442e122a934c888fcbc2ed6ef031c5', '客房查询');
INSERT INTO `operation` VALUES ('437de6e644bc4767adf0c699af5d3c', '删除', 'a674184e5dc8406da46d365922fb2344', '客房管理');
INSERT INTO `operation` VALUES ('5072e087f81544fd9b332880b47a69', '添加', 'a674184e5dc8406da46d365922fb2344', '客房管理');
INSERT INTO `operation` VALUES ('570c269b28dc483da09f32fa75fb1c', '添加', '5c796c8fedf8430b8f07dfe27f4c48dd', '角色管理');
INSERT INTO `operation` VALUES ('6de09cc41d834dd3a5b66f9bcbc3a9', '删除', '922b1f2962574a9084f80ea0ceb2f0c5', '菜单管理');
INSERT INTO `operation` VALUES ('7360ca61da574656807568d18f61a3', '生成数据', '9b442e122a934c888fcbc2ed6ef031c5', '客房查询');
INSERT INTO `operation` VALUES ('7581831ec7504ea592241df49441b5', '删除', '5c796c8fedf8430b8f07dfe27f4c48dd', '角色管理');
INSERT INTO `operation` VALUES ('78cfc2d05f394e619300c3c22ba51c', '添加', '922b1f2962574a9084f80ea0ceb2f0c5', '菜单管理');
INSERT INTO `operation` VALUES ('795f2fefd6ea4e4cae96ef6633ca9a', '修改', '5c796c8fedf8430b8f07dfe27f4c48dd', '角色管理');
INSERT INTO `operation` VALUES ('7e609bcf3b5b4313bd6bd01e1bcb36', '添加', 'f6c7b05fef0d4b75a3496fcf281c2524', '用户管理');
INSERT INTO `operation` VALUES ('7f1f1c3bf1de4e5fbc8e95a4851871', '修改', '922b1f2962574a9084f80ea0ceb2f0c5', '菜单管理');
INSERT INTO `operation` VALUES ('80d7884980f546688054be57f327ab', '退房', '9e74f769ab1246cabb409327807716fd', '退房续费');
INSERT INTO `operation` VALUES ('8a5cc94bc02c4ec9a082524bc9b396', '修改', 'f6c7b05fef0d4b75a3496fcf281c2524', '用户管理');
INSERT INTO `operation` VALUES ('b3e797ed44254a828c4e0b3b0e5395', '删除', '832e029cfe764b249b5c14b0764beb4c', '顾客管理');
INSERT INTO `operation` VALUES ('b58414d32ade4f00aae39177ab2640', '添加', '832e029cfe764b249b5c14b0764beb4c', '顾客管理');
INSERT INTO `operation` VALUES ('b9d2596fb6914b8392809ec16be0cb', '删除', 'f6c7b05fef0d4b75a3496fcf281c2524', '用户管理');
INSERT INTO `operation` VALUES ('df50628c16164d61857cf6699b88cd', '修改', '832e029cfe764b249b5c14b0764beb4c', '顾客管理');
INSERT INTO `operation` VALUES ('ebf5a2f3af5f4d67ad05fd9a5691b2', '按钮管理', '922b1f2962574a9084f80ea0ceb2f0c5', '菜单管理');
INSERT INTO `operation` VALUES ('ef01768920b14dca8b9d94bbc0356a', '修改', 'a674184e5dc8406da46d365922fb2344', '客房管理');
INSERT INTO `operation` VALUES ('f3911a7f3fd9490d8e779989dbf1fb', '详情', '850a8850cbf746cfa6a0b6b048e0fd69', '订单明细');
INSERT INTO `operation` VALUES ('faa7d76a401a4747ba8af2b6eea637', '续费', '9e74f769ab1246cabb409327807716fd', '退房续费');

-- ----------------------------
-- Table structure for `orderarrange`
-- ----------------------------
DROP TABLE IF EXISTS `orderarrange`;
CREATE TABLE `orderarrange` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `orderid` varchar(32) DEFAULT NULL COMMENT '关联order表',
  `arrangeid` varchar(32) DEFAULT NULL COMMENT '关联arrange表',
  PRIMARY KEY (`id`),
  KEY `arrangeid` (`arrangeid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `orderarrange_ibfk_1` FOREIGN KEY (`arrangeid`) REFERENCES `arrange` (`id`),
  CONSTRAINT `orderarrange_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `torder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderarrange
-- ----------------------------
INSERT INTO `orderarrange` VALUES ('0585f73f48fe4e8f92fa4bcb823c9792', '80c08f9cc2bc42eab91f2675a5040a79', '8bca0f9698824a3689689ac4c1340969');
INSERT INTO `orderarrange` VALUES ('0b3ea76b04ba40d5a7f3aaf86ecbb627', '34827499884945a994819ebbd0c3d45f', '0841899d9b89438282ace436ee9a54d3');
INSERT INTO `orderarrange` VALUES ('0d2be2ea6f234becb34695c55abfef04', '64927dd7b4b3486bbc74a775f2ca0c3b', 'ce5f3e36f6af4f16a6900dd3f8d357a4');
INSERT INTO `orderarrange` VALUES ('1aea4464d6bf4763b21a5154cdcf0493', '7c5340c1fb454d48a23122c1b242aeba', '7c5126706ad74457951035ebfb2f76d7');
INSERT INTO `orderarrange` VALUES ('21ab1450c55f4ec593c6ff335c3a5821', '34827499884945a994819ebbd0c3d45f', '9e3153b46d794a38a472150e13c8662f');
INSERT INTO `orderarrange` VALUES ('30079726988d437294aefbd2c7338085', '80c08f9cc2bc42eab91f2675a5040a79', 'c6931ce0775c44388fdc3dbed5fafc32');
INSERT INTO `orderarrange` VALUES ('5adb0fa06158492e9b13f9ec50701cfe', 'ed537f2a433d461f85d60cc3421ce554', 'e4ffd9c2e35b435cb62e71b5df3c373b');
INSERT INTO `orderarrange` VALUES ('6c881a5fd02e494e90ac4af4e8d146f5', '7c5340c1fb454d48a23122c1b242aeba', 'b5ff482a03b2430cbccdc9b5fc5728a7');
INSERT INTO `orderarrange` VALUES ('6c943bda3a174ee99253df735b241edc', '80c08f9cc2bc42eab91f2675a5040a79', '0a4c1c2f257347cbb38e0085b192bf8d');
INSERT INTO `orderarrange` VALUES ('7df5348b35314bf78b3beb862321984d', '80c08f9cc2bc42eab91f2675a5040a79', '099e8de15e9b4d268018155cadd5addb');
INSERT INTO `orderarrange` VALUES ('8b0276bd7424496fae2766ff31192a48', 'ed537f2a433d461f85d60cc3421ce554', 'b9ecc5e01f84416985f5051d426c99fa');
INSERT INTO `orderarrange` VALUES ('961e1d4e477040c4a8a0170fde5b2020', '80c08f9cc2bc42eab91f2675a5040a79', 'f4e64fcfb921420a8d20b8dad1b7ba44');
INSERT INTO `orderarrange` VALUES ('9d48784f46524186b1bda8bccf471fe6', '64927dd7b4b3486bbc74a775f2ca0c3b', 'ce66aad815674d1aa762d6ad6d404cba');
INSERT INTO `orderarrange` VALUES ('bc9c40a89cfe4133864e1bf426b21eef', 'ed537f2a433d461f85d60cc3421ce554', 'fe8c629ddde84a138003d51e9e8d67a9');
INSERT INTO `orderarrange` VALUES ('c547f650422c476c808eb9b9cc212667', '80c08f9cc2bc42eab91f2675a5040a79', 'ef84623f08e4435d9bb7c5560dac620e');
INSERT INTO `orderarrange` VALUES ('d6d6caa8c22f484193399778a5e9b56b', 'ed537f2a433d461f85d60cc3421ce554', '6143c29be2324448a7b73a89c626182e');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` varchar(32) NOT NULL COMMENT '角色ID',
  `roleName` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `menuIds` longtext COMMENT '菜单IDs',
  `operationIds` longtext COMMENT '按钮IDS',
  `roleDescription` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', 'assadd5325af432db5dc825499dede71,54475f4f787b45daa3df6f2ee0b312aa,f6c7b05fef0d4b75a3496fcf281c2524,5c796c8fedf8430b8f07dfe27f4c48dd,922b1f2962574a9084f80ea0ceb2f0c5,57295d5325af432db5dc825499dede71,832e029cfe764b249b5c14b0764beb4c,a674184e5dc8406da46d365922fb2344,9b442e122a934c888fcbc2ed6ef031c5,850a8850cbf746cfa6a0b6b048e0fd69,9e74f769ab1246cabb409327807716fd,260bea62556c4b468f39519f80fd3ab4,a32fbcb83d1a4d359c574be1b49211ac,902a007a778b4e1896edfd5e46dc71de', '7e609bcf3b5b4313bd6bd01e1bcb36,8a5cc94bc02c4ec9a082524bc9b396,b9d2596fb6914b8392809ec16be0cb,05da9b23441449b88cf56a3c762b4c,570c269b28dc483da09f32fa75fb1c,7581831ec7504ea592241df49441b5,795f2fefd6ea4e4cae96ef6633ca9a,6de09cc41d834dd3a5b66f9bcbc3a9,78cfc2d05f394e619300c3c22ba51c,7f1f1c3bf1de4e5fbc8e95a4851871,ebf5a2f3af5f4d67ad05fd9a5691b2,b3e797ed44254a828c4e0b3b0e5395,b58414d32ade4f00aae39177ab2640,df50628c16164d61857cf6699b88cd,437de6e644bc4767adf0c699af5d3c,5072e087f81544fd9b332880b47a69,ef01768920b14dca8b9d94bbc0356a,0f209d86e9514d04986d1f6058c6aa,2bd54615b5b8418aa27ab37e0fb675,7360ca61da574656807568d18f61a3,f3911a7f3fd9490d8e779989dbf1fb,80d7884980f546688054be57f327ab,faa7d76a401a4747ba8af2b6eea637', '拥有全部权限的超级管理员角色');
INSERT INTO `role` VALUES ('815f6fd1f3904e25b779120f7e3b63be', '前台', 'assadd5325af432db5dc825499dede71,57295d5325af432db5dc825499dede71,832e029cfe764b249b5c14b0764beb4c,9b442e122a934c888fcbc2ed6ef031c5,850a8850cbf746cfa6a0b6b048e0fd69,9e74f769ab1246cabb409327807716fd', 'b58414d32ade4f00aae39177ab2640,df50628c16164d61857cf6699b88cd,0f209d86e9514d04986d1f6058c6aa,2bd54615b5b8418aa27ab37e0fb675,7360ca61da574656807568d18f61a3,f3911a7f3fd9490d8e779989dbf1fb,80d7884980f546688054be57f327ab,faa7d76a401a4747ba8af2b6eea637', '');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` varchar(32) NOT NULL COMMENT '客房主键ID',
  `name` varchar(32) DEFAULT NULL COMMENT '编号',
  `price` float DEFAULT NULL COMMENT '价格',
  `type` varchar(32) DEFAULT NULL COMMENT '类型大床房，商务间，标准间，单人间 其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='酒店房间信息表';

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('031c83d581b04e3895d0e81a67aee16a', '8201', '100', '标准间');
INSERT INTO `room` VALUES ('031dd87d13e74d8f9c4ced7eaef2b15e', '8203', '100', '标准间');
INSERT INTO `room` VALUES ('39a431e179ee4aea97f8ea7a285566a7', '8303', '80', '单人间');
INSERT INTO `room` VALUES ('3adb029854a34420a871231968397783', '8202', '100', '标准间');
INSERT INTO `room` VALUES ('3c64b99fea9841ff8bf4106334fd7415', '8403', '150', '商务间');
INSERT INTO `room` VALUES ('6fd16dd84a064be9b88c98cd837118af', '8304', '80', '单人间');
INSERT INTO `room` VALUES ('85545ab422fb401194b2c806fcaa97d4', '8204', '100', '标准间');
INSERT INTO `room` VALUES ('8647bfdba67c4e0d8519c15e8fe95aee', '8404', '150', '商务间');
INSERT INTO `room` VALUES ('882a69d9af4d4ba2a4f2fb1bb7e92dca', '8402', '150', '商务间');
INSERT INTO `room` VALUES ('9901f1f3ac2e4f61b4ae74d28a402896', '8302', '80', '单人间');
INSERT INTO `room` VALUES ('b10f5748e86a4de5a126323227c4e4e1', '8301', '80', '单人间');
INSERT INTO `room` VALUES ('e770fbee671040d4a40a46f5aef6a02c', '8401', '150', '商务间');

-- ----------------------------
-- Table structure for `torder`
-- ----------------------------
DROP TABLE IF EXISTS `torder`;
CREATE TABLE `torder` (
  `id` varchar(32) NOT NULL COMMENT '订单',
  `customerid` varchar(32) DEFAULT NULL COMMENT '顾客',
  `starttime` varchar(32) DEFAULT NULL COMMENT '入住时间',
  `endtime` varchar(32) DEFAULT NULL COMMENT '退房时间',
  `totalPrice` float DEFAULT NULL COMMENT '总价格',
  PRIMARY KEY (`id`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `torder_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of torder
-- ----------------------------
INSERT INTO `torder` VALUES ('34827499884945a994819ebbd0c3d45f', 'e236064a1caf40789deeeff6dd1c2534', '2019-03-27 21:16:11', '2019-07-23 18:49:35', '200');
INSERT INTO `torder` VALUES ('64927dd7b4b3486bbc74a775f2ca0c3b', 'be005a1c17574d9280cb69e50bb5b8e4', '2019-03-27 21:16:30', '2019-07-23 18:49:38', '300');
INSERT INTO `torder` VALUES ('7c5340c1fb454d48a23122c1b242aeba', 'be005a1c17574d9280cb69e50bb5b8e4', '2019-03-26 23:44:44', '2019-07-23 18:49:31', '160');
INSERT INTO `torder` VALUES ('80c08f9cc2bc42eab91f2675a5040a79', 'e236064a1caf40789deeeff6dd1c2534', '2019-03-26 21:36:38', '2019-03-26 22:19:17', '600');
INSERT INTO `torder` VALUES ('ed537f2a433d461f85d60cc3421ce554', 'be005a1c17574d9280cb69e50bb5b8e4', '2019-03-26 23:44:56', '2019-07-23 18:49:27', '600');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL COMMENT '用户ID',
  `name` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `roleId` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `description` varchar(200) DEFAULT NULL COMMENT '描述信息',
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '1', '', null);
INSERT INTO `user` VALUES ('d094e13c596646d2af6df5eedab8e8de', '操作员', '123456', '815f6fd1f3904e25b779120f7e3b63be', '', null);

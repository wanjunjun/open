# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.1.55-community
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2013-10-08 17:56:04
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table cwz.c_module
DROP TABLE IF EXISTS `c_module`;
CREATE TABLE IF NOT EXISTS `c_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `sort_num` int(11) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DCFFDC843C2355` (`parent`),
  CONSTRAINT `FK8DCFFDC843C2355` FOREIGN KEY (`parent`) REFERENCES `c_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

# Dumping data for table cwz.c_module: ~22 rows (approximately)
/*!40000 ALTER TABLE `c_module` DISABLE KEYS */;
INSERT INTO `c_module` (`id`, `name`, `status`, `url`, `sort_num`, `parent`) VALUES
	(1, '模块管理', NULL, '', 1, NULL),
	(2, '用户管理', NULL, '', 2, NULL),
	(3, '权限管理', NULL, '', 3, NULL),
	(5, '模块定义', NULL, 'page.do?page=base/module/index', NULL, 1),
	(9, '用户定义', NULL, 'page.do?page=base/user/index', NULL, 2),
	(10, '权限定义', NULL, 'page.do?page=base/role/index', NULL, 3),
	(11, '流程管理', NULL, '', 4, NULL),
	(12, '流程定义', NULL, 'page.do?page=flow/index', 1, 11),
	(13, '业务管理', NULL, '', 5, NULL),
	(14, '芯片管理', NULL, 'page.do?page=business/manage/box', 1, 13),
	(15, '仓库管理', NULL, 'page.do?page=business/manage/depo', 2, 13),
	(16, '待审批流程', NULL, 'page.do?page=flow/wait', 2, 11),
	(17, '已审批流程', NULL, 'page.do?page=flow/approved', 3, 11),
	(18, '草稿箱', NULL, 'page.do?page=flow/draft', 4, 11),
	(19, '阅读器管理', NULL, 'page.do?page=business/manage/reader', 3, 13),
	(20, '芯片查询', NULL, 'page.do?page=business/manage/view_chip', 4, 13),
	(21, '阅读器轨迹查询', NULL, 'page.do?page=business/manage/view_reader', 5, 13),
	(22, '基础管理', NULL, '', 6, NULL),
	(23, '字典管理', NULL, 'page.do?page=base/dict/index', 1, 22),
	(24, '物流入驻', NULL, '', 15, NULL),
	(25, '厂商资格附件上传', NULL, 'page.do?page=base/logisIn/logisIn_upload', 16, 24),
	(26, '厂商资格核对', NULL, 'page.do?page=base/logisIn/logisIn_Check', 17, 24),
	(27, '网点维护', NULL, 'page.do?page=base/logisIn/UserOutlets', 18, 24),
	(28, '定义路线', NULL, 'page.do?page=base/logisIn/logline', 19, 24);
/*!40000 ALTER TABLE `c_module` ENABLE KEYS */;


# Dumping structure for table cwz.c_role_module
DROP TABLE IF EXISTS `c_role_module`;
CREATE TABLE IF NOT EXISTS `c_role_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `module_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3BB8B479548A8DF9` (`role_id`),
  KEY `FK3BB8B479E30E3E79` (`module_id`),
  CONSTRAINT `FK3BB8B479E30E3E79` FOREIGN KEY (`module_id`) REFERENCES `c_module` (`id`),
  CONSTRAINT `FK3BB8B479548A8DF9` FOREIGN KEY (`role_id`) REFERENCES `c_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

# Dumping data for table cwz.c_role_module: ~25 rows (approximately)
/*!40000 ALTER TABLE `c_role_module` DISABLE KEYS */;
INSERT INTO `c_role_module` (`id`, `status`, `module_id`, `role_id`) VALUES
	(52, NULL, 11, 2),
	(53, NULL, 17, 2),
	(54, NULL, 16, 2),
	(159, NULL, 10, 1),
	(160, NULL, 23, 1),
	(161, NULL, 16, 1),
	(162, NULL, 20, 1),
	(163, NULL, 15, 1),
	(164, NULL, 1, 1),
	(165, NULL, 12, 1),
	(166, NULL, 18, 1),
	(167, NULL, 27, 1),
	(168, NULL, 26, 1),
	(169, NULL, 17, 1),
	(170, NULL, 14, 1),
	(171, NULL, 13, 1),
	(172, NULL, 24, 1),
	(173, NULL, 22, 1),
	(174, NULL, 3, 1),
	(175, NULL, 5, 1),
	(176, NULL, 9, 1),
	(177, NULL, 2, 1),
	(178, NULL, 11, 1),
	(179, NULL, 25, 1),
	(180, NULL, 19, 1),
	(181, NULL, 28, 1);
/*!40000 ALTER TABLE `c_role_module` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

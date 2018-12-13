create database logistics_demo;

use logistics_demo;

-- ----------------------------
-- Table structure for courier_list
-- ----------------------------
DROP TABLE IF EXISTS `courier_list`;
CREATE TABLE `courier_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_name` varchar(10) NOT NULL,
  `courier_other_info` varchar(2) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courier_list_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='list of couier';

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for courier_role
-- ----------------------------
DROP TABLE IF EXISTS `courier_role`;
CREATE TABLE `courier_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courier_role_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='each courier role list';

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for customer_list
-- ----------------------------
DROP TABLE IF EXISTS `customer_list`;
CREATE TABLE `customer_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(10) NOT NULL COMMENT 'the name of this customer',
  `membership_level` varchar(2) NOT NULL DEFAULT '1' COMMENT 'the membership level of this customer',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for goods_name
-- ----------------------------
DROP TABLE IF EXISTS `goods_name`;
CREATE TABLE `goods_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_type` int(11) NOT NULL COMMENT 'goods type',
  `goods_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'normall_goods' COMMENT 'goods desc',
  `sender_id` int(11) NOT NULL COMMENT 'the id of sender',
  `sender_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'the name of the sender',
  `sender_path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'the location of sender',
  `receiver_id` int(11) NOT NULL COMMENT 'id of the receiver',
  `receiver_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'the name of receiver',
  `receiver_path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'the path of receiver',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_name_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='list of the goods';

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for role_list
-- ----------------------------
DROP TABLE IF EXISTS `role_list`;
CREATE TABLE `role_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_type` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'type of the role',
  `role_desc` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'role desc',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_list_id_uindex` (`id`),
  UNIQUE KEY `role_list_role_type_uindex` (`role_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='list of the courier role';

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for working_flow
-- ----------------------------
DROP TABLE IF EXISTS `working_flow`;
CREATE TABLE `working_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `working_flow` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'waiting confirm' COMMENT 'the goods delievery flow',
  `duty_sender` int(11) DEFAULT NULL COMMENT 'the courier''s id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `working_flow_id_uindex` (`id`),
  UNIQUE KEY `working_flow_duty_sender_uindex` (`duty_sender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='goods working flow';

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for working_list
-- ----------------------------
DROP TABLE IF EXISTS `working_list`;
CREATE TABLE `working_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'the name of the sender',
  `sender_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'the path of the sender',
  `goods_id` int(11) NOT NULL COMMENT 'the goods id of this process',
  `receiver_id` int(11) NOT NULL COMMENT 'the id of this receiver',
  `recevier_name` varchar(10) NOT NULL COMMENT 'the name of the receiver',
  `receiver_path` varchar(100) NOT NULL COMMENT 'the receiver path',
  `sender_id` int(11) DEFAULT NULL COMMENT 'the id of this customer',
  `working_flow_id` int(11) DEFAULT NULL COMMENT 'the woring flow id',
  `working_flow_status` char(2) DEFAULT NULL COMMENT 'the working flow status',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_name_goods_id_uindex` (`goods_id`),
  UNIQUE KEY `sender_name_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='All goods life cycle and info';

SET FOREIGN_KEY_CHECKS = 1;

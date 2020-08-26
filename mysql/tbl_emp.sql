/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : mybatis

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 26/08/2020 16:03:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `d_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `d_id`(`d_id`) USING BTREE,
  CONSTRAINT `tbl_emp_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES (1, 'lgq', 'M', '1234545@163.com', 1);
INSERT INTO `tbl_emp` VALUES (2, 'Jerry', 'M', 'Jerry@163.com', 2);
INSERT INTO `tbl_emp` VALUES (3, '4572b0', 'F', 'hahaha0@163.com', 3);
INSERT INTO `tbl_emp` VALUES (4, '3eca41', 'M', '3eca41@163.com', 1);
INSERT INTO `tbl_emp` VALUES (10, '9852f7', 'M', '9852f7@163.com', 1);
INSERT INTO `tbl_emp` VALUES (11, '8e4308', 'M', '8e4308@163.com', 1);
INSERT INTO `tbl_emp` VALUES (12, '35a2d9', 'M', '35a2d9@163.com', 1);
INSERT INTO `tbl_emp` VALUES (13, '9d4df10', 'M', '9d4df10@163.com', 1);
INSERT INTO `tbl_emp` VALUES (14, 'dd9ce11', 'M', 'dd9ce11@163.com', 1);
INSERT INTO `tbl_emp` VALUES (15, '8c1e012', 'M', '8c1e012@163.com', 1);
INSERT INTO `tbl_emp` VALUES (16, 'd242313', 'M', 'd242313@163.com', 1);
INSERT INTO `tbl_emp` VALUES (17, '8b7be14', 'M', '8b7be14@163.com', 1);
INSERT INTO `tbl_emp` VALUES (23, '93f1520', 'M', '93f1520@163.com', 1);
INSERT INTO `tbl_emp` VALUES (24, 'da6cc21', 'M', 'da6cc21@163.com', 1);
INSERT INTO `tbl_emp` VALUES (25, '64af622', 'M', '64af622@163.com', 1);
INSERT INTO `tbl_emp` VALUES (26, '8465d23', 'M', '8465d23@163.com', 1);
INSERT INTO `tbl_emp` VALUES (27, '5d24524', 'M', '5d24524@163.com', 1);
INSERT INTO `tbl_emp` VALUES (33, '4022030', 'M', '4022030@163.com', 1);
INSERT INTO `tbl_emp` VALUES (34, 'fc81531', 'M', 'fc81531@163.com', 1);
INSERT INTO `tbl_emp` VALUES (35, '7210932', 'M', '7210932@163.com', 1);
INSERT INTO `tbl_emp` VALUES (36, '2ab1633', 'M', '2ab1633@163.com', 1);
INSERT INTO `tbl_emp` VALUES (37, 'e55c234', 'M', 'e55c234@163.com', 1);
INSERT INTO `tbl_emp` VALUES (38, 'b859f35', 'M', 'b859f35@163.com', 1);
INSERT INTO `tbl_emp` VALUES (39, 'e623336', 'M', 'e623336@163.com', 1);
INSERT INTO `tbl_emp` VALUES (40, 'c75a637', 'M', 'c75a637@163.com', 1);
INSERT INTO `tbl_emp` VALUES (41, 'a329438', 'M', 'a329438@163.com', 1);
INSERT INTO `tbl_emp` VALUES (42, '28ff039', 'M', '28ff039@163.com', 1);
INSERT INTO `tbl_emp` VALUES (43, '9eb3b40', 'M', '9eb3b40@163.com', 1);
INSERT INTO `tbl_emp` VALUES (44, '0f04841', 'M', '0f04841@163.com', 1);
INSERT INTO `tbl_emp` VALUES (45, '5536b42', 'M', '5536b42@163.com', 1);
INSERT INTO `tbl_emp` VALUES (46, 'b039843', 'M', 'b039843@163.com', 1);
INSERT INTO `tbl_emp` VALUES (47, 'a833344', 'M', 'a833344@163.com', 1);
INSERT INTO `tbl_emp` VALUES (48, 'e05d745', 'M', 'e05d745@163.com', 1);
INSERT INTO `tbl_emp` VALUES (49, '355fc46', 'M', '355fc46@163.com', 1);
INSERT INTO `tbl_emp` VALUES (50, '804e147', 'M', '804e147@163.com', 1);
INSERT INTO `tbl_emp` VALUES (51, '4850248', 'M', '4850248@163.com', 1);
INSERT INTO `tbl_emp` VALUES (52, '592d249', 'M', '592d249@163.com', 1);
INSERT INTO `tbl_emp` VALUES (53, 'ed1e550', 'M', 'ed1e550@163.com', 1);
INSERT INTO `tbl_emp` VALUES (54, 'b488551', 'M', 'b488551@163.com', 1);
INSERT INTO `tbl_emp` VALUES (55, 'd8c2052', 'M', 'd8c2052@163.com', 1);
INSERT INTO `tbl_emp` VALUES (56, '5918453', 'M', '5918453@163.com', 1);
INSERT INTO `tbl_emp` VALUES (57, 'd650954', 'M', 'd650954@163.com', 1);
INSERT INTO `tbl_emp` VALUES (58, 'e55b855', 'M', 'e55b855@163.com', 1);
INSERT INTO `tbl_emp` VALUES (59, 'a419156', 'M', 'a419156@163.com', 1);
INSERT INTO `tbl_emp` VALUES (60, '51aaf57', 'M', '51aaf57@163.com', 1);
INSERT INTO `tbl_emp` VALUES (61, 'dc75258', 'M', 'dc75258@163.com', 1);
INSERT INTO `tbl_emp` VALUES (62, 'fd07a59', 'M', 'fd07a59@163.com', 1);
INSERT INTO `tbl_emp` VALUES (63, '9616f60', 'M', '9616f60@163.com', 1);
INSERT INTO `tbl_emp` VALUES (64, '8110161', 'M', '8110161@163.com', 1);
INSERT INTO `tbl_emp` VALUES (65, '42ba362', 'M', '42ba362@163.com', 1);
INSERT INTO `tbl_emp` VALUES (66, '2c41063', 'M', '2c41063@163.com', 1);
INSERT INTO `tbl_emp` VALUES (67, '398d164', 'M', '398d164@163.com', 1);
INSERT INTO `tbl_emp` VALUES (68, 'ef88265', 'M', 'ef88265@163.com', 1);
INSERT INTO `tbl_emp` VALUES (69, '8dd5c66', 'M', '8dd5c66@163.com', 1);
INSERT INTO `tbl_emp` VALUES (70, 'aeb3b67', 'M', 'aeb3b67@163.com', 1);
INSERT INTO `tbl_emp` VALUES (71, '9b4ff68', 'M', '9b4ff68@163.com', 1);
INSERT INTO `tbl_emp` VALUES (72, '75d8a69', 'M', '75d8a69@163.com', 1);
INSERT INTO `tbl_emp` VALUES (73, '4766c70', 'M', '4766c70@163.com', 1);
INSERT INTO `tbl_emp` VALUES (74, '1a1c971', 'M', '1a1c971@163.com', 1);
INSERT INTO `tbl_emp` VALUES (75, '8e8d372', 'M', '8e8d372@163.com', 1);
INSERT INTO `tbl_emp` VALUES (76, 'f26e973', 'M', 'f26e973@163.com', 1);
INSERT INTO `tbl_emp` VALUES (77, 'c6b7a74', 'M', 'c6b7a74@163.com', 1);
INSERT INTO `tbl_emp` VALUES (83, '2081780', 'M', '2081780@163.com', 1);
INSERT INTO `tbl_emp` VALUES (84, 'a588681', 'M', 'a588681@163.com', 1);
INSERT INTO `tbl_emp` VALUES (85, '378cb82', 'M', '378cb82@163.com', 1);
INSERT INTO `tbl_emp` VALUES (86, '3514683', 'M', '3514683@163.com', 1);
INSERT INTO `tbl_emp` VALUES (87, '51a4c84', 'M', '51a4c84@163.com', 1);
INSERT INTO `tbl_emp` VALUES (88, 'fa35185', 'M', 'fa35185@163.com', 1);
INSERT INTO `tbl_emp` VALUES (89, '78f0286', 'M', '78f0286@163.com', 1);
INSERT INTO `tbl_emp` VALUES (90, '6f72b87', 'M', '6f72b87@163.com', 1);
INSERT INTO `tbl_emp` VALUES (91, '1e8a988', 'M', '1e8a988@163.com', 1);
INSERT INTO `tbl_emp` VALUES (92, '576dc89', 'M', '576dc89@163.com', 1);
INSERT INTO `tbl_emp` VALUES (98, 'b60a395', 'M', 'b60a395@163.com', 1);
INSERT INTO `tbl_emp` VALUES (99, '07b3996', 'M', '07b3996@163.com', 1);
INSERT INTO `tbl_emp` VALUES (100, '33ca697', 'M', '33ca697@163.com', 1);
INSERT INTO `tbl_emp` VALUES (101, '4973b98', 'M', '4973b98@163.com', 1);
INSERT INTO `tbl_emp` VALUES (102, '00d1899', 'M', '00d1899@163.com', 1);
INSERT INTO `tbl_emp` VALUES (103, 'aaa', 'F', '125@163.com', 1);
INSERT INTO `tbl_emp` VALUES (104, '张娜', 'F', '123@164.com', 1);

SET FOREIGN_KEY_CHECKS = 1;

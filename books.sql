/*
Navicat MySQL Data Transfer

Source Server         : mm
Source Server Version : 80025
Source Host           : localhost:3306
Source Database       : books

Target Server Type    : MYSQL
Target Server Version : 80025
File Encoding         : 65001

Date: 2022-03-06 20:53:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for booklist
-- ----------------------------
DROP TABLE IF EXISTS `booklist`;
CREATE TABLE `booklist` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `barcode` varchar(255) DEFAULT NULL,
  `book_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_price` double DEFAULT NULL,
  `book_shelf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_isbn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_type` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of booklist
-- ----------------------------
INSERT INTO `booklist` VALUES ('3', '3', '3', '3', '3', '3', null, '3', '3', '3', null, '3', null, '1');
INSERT INTO `booklist` VALUES ('4', '000023', 'P29/3', '斗罗大陆', '天蚕土豆', '重庆新华社', '重庆', '36', 'A层一架', '987-125-698', '2018', '2', null, '1');
INSERT INTO `booklist` VALUES ('5', '00002', 'A21/3', '盗墓笔记', '南派三叔', '北京新华社', '北京', '58', 'A一层三架', '547-752-159', '2009', '2', '0', '1');
INSERT INTO `booklist` VALUES ('6', '00000014', '1', '风犬少年的天空', '1', '测试社区', '1', '1', '1', '1', '1', '4', '0', '1');
INSERT INTO `booklist` VALUES ('7', '00000012', '2', 'L love you', '2', '11', '2', '2', '2', '2', '2', '6', '0', '1');
INSERT INTO `booklist` VALUES ('8', '00000015', '3', '假如我变得很有钱', '3', null, '3', '3', '3', '3', '3', '5', '0', '1');
INSERT INTO `booklist` VALUES ('10', '0005', '5', '我们', '5', null, '5', '5', '5', '5', '5', '4', '0', '1');
INSERT INTO `booklist` VALUES ('11', 'vue深入浅出', '7', '7', '7', null, '7', '7', '7', '7', '7', '6', '0', '1');
INSERT INTO `booklist` VALUES ('12', '00009', 'P32/1', '科技影响生活', 'gy', null, '重庆市', '38', '3层B架', '978-657-36', '2022', '6', '0', '1');
INSERT INTO `booklist` VALUES ('13', '0022', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1');
INSERT INTO `booklist` VALUES ('14', '0003', '2', '2', '2', '2', '2', '2', '2', '2', '2', '1', '0', '1');

-- ----------------------------
-- Table structure for bookstype
-- ----------------------------
DROP TABLE IF EXISTS `bookstype`;
CREATE TABLE `bookstype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Typename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bookstype
-- ----------------------------
INSERT INTO `bookstype` VALUES ('1', '文学');
INSERT INTO `bookstype` VALUES ('2', '流行');
INSERT INTO `bookstype` VALUES ('3', '文化');
INSERT INTO `bookstype` VALUES ('4', '生活');
INSERT INTO `bookstype` VALUES ('5', '经管');
INSERT INTO `bookstype` VALUES ('6', '科技');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `statusname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', '在馆');
INSERT INTO `status` VALUES ('2', '借出');
INSERT INTO `status` VALUES ('3', '丢失');
INSERT INTO `status` VALUES ('4', '预约');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '20311421', '123456', 'gy', '23', '18696519442', '男', '1');
INSERT INTO `user` VALUES ('2', '20184412', '123456', '张三', '18', null, '男', '2');
INSERT INTO `user` VALUES ('3', '1', '1', '1', '1', null, '男', '2');
INSERT INTO `user` VALUES ('4', '2', '2', '2', '2', null, '女', '2');

-- ----------------------------
-- Table structure for user_type
-- ----------------------------
DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_type
-- ----------------------------
INSERT INTO `user_type` VALUES ('1', '管理员');
INSERT INTO `user_type` VALUES ('2', '读者');

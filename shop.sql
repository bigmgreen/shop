/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 25/11/2019 07:13:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NULL DEFAULT NULL,
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, 1, '//img.alicdn.com/tfs/TB1vbTkna61gK0jSZFlXXXDKFXa-520-280.jpg_q90_.webp');
INSERT INTO `banner` VALUES (2, 2, 'https://img.alicdn.com/simba/img/TB15q1AmYY1gK0jSZTESutDQVXa.jpg');
INSERT INTO `banner` VALUES (3, 3, 'https://img.alicdn.com/simba/img/TB1XBHlhHvpK1RjSZFqSuwXUVXa.jpg');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ispost` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `price` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `oldprice` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `salecount` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `type` int(10) NULL DEFAULT NULL,
  `imgs` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `colors` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `sizes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000000, 0000000239, 0000000599, 0000000001, 1, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 252, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (2, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000038, 0000000059, 0000000366, 2, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 524, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (3, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000237, 0000000599, 0000000366, 3, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 4555, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (4, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000236, 0000000599, 0000000366, 2, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 244, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (5, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000236, 0000000599, 0000000366, 4, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 55, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (6, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000236, 0000000599, 0000000366, 3, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 445, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (7, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000236, 0000000599, 0000000366, 1, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 4564, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (8, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000236, 0000000599, 0000000366, 1, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 4454, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (9, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000236, 0000000599, 0000000366, 2, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 578, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (10, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000236, 0000000599, 0000000366, 3, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 578, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (11, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000236, 0000000599, 0000000366, 2, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 768, 'S,M,L,XL,2XL,3XL');
INSERT INTO `goods` VALUES (12, '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 0000000001, 0000000236, 0000000599, 0000000366, 4, '//img.alicdn.com/imgextra/i1/2010921214/O1CN01z7GoGc1Kq3OhP1T6J_!!2010921214-0-pixelsss.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01AihXRJ1Kq3O9k60sl_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i1/2010921214/O1CN01ib1mns1Kq3O8gq5Kw_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i3/2010921214/O1CN01sX17ja1Kq3O9k6HVG_!!2010921214.jpg_60x60q90.jpg;//img.alicdn.com/imgextra/i4/2010921214/O1CN01vXNy4X1Kq3O3BdrZ6_!!2010921214.jpg_60x60q90.jpg', '黑,白,红,绿,蓝,紫', 568, 'S,M,L,XL,2XL,3XL');

-- ----------------------------
-- Table structure for t_test
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gtm_create` datetime(0) NULL DEFAULT NULL,
  `gtm_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postelcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zx', '123456', NULL, NULL, NULL);
INSERT INTO `user` VALUES (4, 'zxx', '111', 'b@163.com', '333', '336666');
INSERT INTO `user` VALUES (5, 'b@163.com', '111', 'bb@163.com', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

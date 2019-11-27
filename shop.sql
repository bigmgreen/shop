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

 Date: 28/11/2019 00:35:59
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for goods_car
-- ----------------------------
DROP TABLE IF EXISTS `goods_car`;
CREATE TABLE `goods_car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT NULL,
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(10) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `date` datetime(6) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `replyuserid` int(11) NULL DEFAULT NULL,
  `replyusername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `txt` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_comment
-- ----------------------------
INSERT INTO `goods_comment` VALUES (29, 1, 5, '2019-11-27 13:36:41.319000', 'b@163.com', NULL, NULL, '666');
INSERT INTO `goods_comment` VALUES (30, 1, 5, '2019-11-27 14:49:02.392000', 'b@163.com', NULL, NULL, '6666/t/tb<br>@163.com说：6666/n');
INSERT INTO `goods_comment` VALUES (34, 2, 5, '2019-11-27 15:39:12.005000', 'b@163.com', NULL, NULL, '666<br>b@163.com 回复 b@163.com 说：888<br>b@163.com 回复 b@163.com 说：999<br>b@163.com 回复 b@163.com 说：ok');
INSERT INTO `goods_comment` VALUES (35, 1, 5, '2019-11-27 16:06:28.796000', 'b@163.com', NULL, NULL, 'aa++\n\n\naaaa\ndd');
INSERT INTO `goods_comment` VALUES (36, 1, 5, '2019-11-27 16:16:47.266000', 'b@163.com', NULL, NULL, '<span class=\"comments__item__content\">aa++\n\n\naaaa\ndd</span>');

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT NULL,
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(10) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_order
-- ----------------------------
INSERT INTO `goods_order` VALUES (13, 1, 5, 1, '黑', 'S', -1, '4d28ce63340344dd993254d2ba7cae9c', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 239, 'b@163.com', '2019-11-26 15:51:12.145000');
INSERT INTO `goods_order` VALUES (14, 2, 5, 1, '黑', 'S', 1, '323fcc07354244fa8971262803fb25da', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-26 22:57:45.338000');
INSERT INTO `goods_order` VALUES (15, 2, 5, 1, '黑', 'S', 1, 'd2027f9cdf004b2eb2e11a9f9476cf76', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-26 23:15:58.194000');
INSERT INTO `goods_order` VALUES (16, 2, 5, 1, '黑', 'S', 1, '648106ccc34f42208b507c2cb968ca3e', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-26 23:20:22.232000');
INSERT INTO `goods_order` VALUES (17, 2, 5, 1, '黑', 'S', 1, 'ff7d58fca9f7474ab6b162ef441d8386', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-26 23:21:22.217000');
INSERT INTO `goods_order` VALUES (18, 2, 5, 1, '黑', 'S', 1, '62707e9b39134a01aef80506a5dcfcc1', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-26 23:22:21.540000');
INSERT INTO `goods_order` VALUES (19, 2, 5, 1, '黑', 'S', 1, 'e33e85c958694374808535aa2fcd3bef', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-26 23:23:47.015000');
INSERT INTO `goods_order` VALUES (20, 2, 5, 1, '黑', 'S', 1, '2852ca007903443984eadbfb242d8b50', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-26 23:24:49.859000');
INSERT INTO `goods_order` VALUES (21, 2, 5, 1, '黑', 'S', 1, 'b0fcf9f07b27449fbc67a508cc4c276c', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-27 12:42:37.465000');
INSERT INTO `goods_order` VALUES (22, 2, 5, 1, '黑', 'S', 1, 'fcf16ca85df34119b815562c90cec0bb', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-27 12:42:37.465000');
INSERT INTO `goods_order` VALUES (23, 2, 5, 1, '黑', 'S', 1, '7ad5c70b788e40c0886d72d6b6749581', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-27 12:42:37.465000');
INSERT INTO `goods_order` VALUES (24, 2, 5, 1, '黑', 'S', 1, 'e679a853f2254ee894596c3d565db470', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-27 12:42:37.465000');
INSERT INTO `goods_order` VALUES (25, 2, 5, 4, '黑', 'S', 1, '7fd32ea8579b4ef292d227734b06c7b2', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-27 12:42:37.465000');
INSERT INTO `goods_order` VALUES (26, 2, 5, 4, '黑', 'S', 1, '23af39773b9947e3b36b6146e932b25e', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-27 12:42:37.465000');
INSERT INTO `goods_order` VALUES (27, 2, 5, 4, '黑', 'S', 1, '18d9c4958f634fb083ea805453b90abc', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-27 12:42:37.465000');
INSERT INTO `goods_order` VALUES (28, 2, 5, 4, '黑', 'S', 1, 'fa51cdea56f34515aa2176e757d2d0ad', '//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp', '冬宽松休闲外套大毛领连帽工装棉服男潮外套', 38, 'b@163.com', '2019-11-27 12:42:37.465000');

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
INSERT INTO `user` VALUES (5, 'b@163.com', '111', 'bb@163.com', '45245254', '7245254');

SET FOREIGN_KEY_CHECKS = 1;

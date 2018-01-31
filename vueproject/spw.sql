/*
Navicat MySQL Data Transfer

Source Server         : longye
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : spw

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-01-31 16:26:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(11) NOT NULL COMMENT '用户id',
  `goodsid` varchar(200) DEFAULT NULL COMMENT '商品id',
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', '1', '[{\"gid\":\"9\",\"qty\":\"1\"},{\"gid\":\"12\",\"qty\":2}]', '2018-01-27 19:32:37');
INSERT INTO `car` VALUES ('2', '3', '[{gid:1,qty:1},{gid:16,qty:2},{gid:30,qty:1}]', '2018-01-21 16:54:59');
INSERT INTO `car` VALUES ('3', '4', '[{gid:40,qty:10}]', '2018-01-22 11:17:26');
INSERT INTO `car` VALUES ('4', '7', '[{gid:20,qty:30}]', '2018-01-22 11:17:45');
INSERT INTO `car` VALUES ('5', '5', '[{\"gid\":\"100\",\"qty\":\"1\"}]', '2018-01-22 11:24:44');
INSERT INTO `car` VALUES ('6', '6', '[{\"gid\":\"101\",\"qty\":\"1\"},{\"gid\":\"6\",\"qty\":\"1\"}]', '2018-01-27 17:03:21');
INSERT INTO `car` VALUES ('7', '7', '[{gid:34,qty:3}]', '2018-01-23 14:36:46');
INSERT INTO `car` VALUES ('8', '35', '[{gid:34,qty:3}]', '2018-01-24 17:45:52');
INSERT INTO `car` VALUES ('18', '9', '[{\"gid\":\"9\",\"qty\":\"1\"}]', '2018-01-27 20:05:38');
INSERT INTO `car` VALUES ('40', '33', '[{\"gid\":\"7\",\"qty\":\"1\"},{\"gid\":\"6\",\"qty\":\"1\"},{\"gid\":\"8\",\"qty\":\"1\"}]', '2018-01-30 19:14:01');
INSERT INTO `car` VALUES ('10', '83', '[{\"gid\":\"83\",\"qty\":\"1\"}]', '2018-01-27 18:17:01');
INSERT INTO `car` VALUES ('11', '12', '[{\"gid\":\"12\",\"qty\":\"1\"}]', '2018-01-27 18:30:03');
INSERT INTO `car` VALUES ('12', '7', '[{\"gid\":\"7\",\"qty\":\"1\"}]', '2018-01-27 18:31:41');
INSERT INTO `car` VALUES ('13', '7', '[{\"gid\":\"7\",\"qty\":\"1\"}]', '2018-01-27 18:31:42');
INSERT INTO `car` VALUES ('14', '7', '[{\"gid\":\"7\",\"qty\":\"1\"}]', '2018-01-27 18:35:12');
INSERT INTO `car` VALUES ('15', '22', '[{\"gid\":\"22\",\"qty\":\"1\"}]', '2018-01-27 18:38:52');
INSERT INTO `car` VALUES ('16', '7', '[{\"gid\":\"7\",\"qty\":\"1\"}]', '2018-01-27 18:44:09');
INSERT INTO `car` VALUES ('17', '9', '[{\"gid\":\"9\",\"qty\":\"1\"}]', '2018-01-27 18:53:52');
INSERT INTO `car` VALUES ('19', '7', '[{\"gid\":\"7\",\"qty\":\"1\"}]', '2018-01-29 12:02:51');
INSERT INTO `car` VALUES ('20', '37', '[{\"gid\":\"37\",\"qty\":\"1\"},{\"gid\":\"6\",\"qty\":\"1\"},{\"gid\":\"8\",\"qty\":\"1\"}]', '2018-01-31 16:23:29');
INSERT INTO `car` VALUES ('21', '79', '[{\"gid\":\"79\",\"qty\":\"1\"}]', '2018-01-29 12:03:43');
INSERT INTO `car` VALUES ('22', '39', '[{\"gid\":\"39\",\"qty\":\"1\"}]', '2018-01-29 12:04:29');
INSERT INTO `car` VALUES ('23', '9', '[{\"gid\":\"9\",\"qty\":\"1\"}]', '2018-01-29 12:05:53');
INSERT INTO `car` VALUES ('24', '8', '[{\"gid\":\"8\",\"qty\":\"1\"}]', '2018-01-29 12:10:32');
INSERT INTO `car` VALUES ('25', '11', '[{\"gid\":\"11\",\"qty\":\"1\"}]', '2018-01-29 12:20:15');
INSERT INTO `car` VALUES ('26', '7', '[{\"gid\":\"7\",\"qty\":\"1\"}]', '2018-01-29 12:22:06');
INSERT INTO `car` VALUES ('27', '9', '[{\"gid\":\"9\",\"qty\":\"1\"}]', '2018-01-29 12:25:27');
INSERT INTO `car` VALUES ('28', '11', '[{\"gid\":\"11\",\"qty\":\"1\"}]', '2018-01-29 12:27:11');
INSERT INTO `car` VALUES ('29', '11', '[{\"gid\":\"12\",\"qty\":\"1\"}]', '2018-01-29 12:30:49');
INSERT INTO `car` VALUES ('41', '142', '[{\"gid\":\"6\",\"qty\":\"1\"}]', '2018-01-31 16:06:57');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `userid` int(11) NOT NULL COMMENT '评论用户id',
  `content` varchar(255) NOT NULL COMMENT '评论',
  `star` int(10) NOT NULL COMMENT '1-5星级评级',
  `date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  `goodsid` int(11) NOT NULL COMMENT '评论的商品',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `brand` varchar(255) NOT NULL COMMENT '品牌',
  `title` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `imgurl` varchar(255) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL COMMENT '原价',
  `saleprice` float(10,2) DEFAULT NULL COMMENT '现价',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `qty` int(10) DEFAULT '1' COMMENT '数量',
  `saleqty` int(11) DEFAULT NULL COMMENT '销量',
  `size` varchar(255) DEFAULT NULL COMMENT '尺码',
  `type` varchar(255) DEFAULT NULL COMMENT '分类',
  `surplus` int(11) DEFAULT NULL COMMENT '库存',
  `date` varchar(255) DEFAULT NULL COMMENT '上架时间',
  PRIMARY KEY (`id`,`brand`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('6', 'STUART WEITZMAN', '休闲女士中长款开衫', 'src/assets/imgs/lady/g8.jpg', '199.00', '150.00', '黑色', '1', '1000', 's', '女士', '200', '2018-01-19 21:14:22');
INSERT INTO `goods` VALUES ('7', 'SUBO?', '女士短袖T恤', 'src/assets/imgs/lady/g9.jpg', '199.00', '150.00', '黑色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:14:28');
INSERT INTO `goods` VALUES ('8', 'MO&CO', '修身舒适新款上衣', 'src/assets/imgs/lady/g10.jpg', '249.00', '150.00', '黑色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:14:35');
INSERT INTO `goods` VALUES ('9', 'TOPSHOP', '休闲女士中长款开衫', 'src/assets/imgs/lady/g11.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:14:51');
INSERT INTO `goods` VALUES ('10', 'KENZO', '女士短袖T恤', 'src/assets/imgs/lady/g12.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:14:55');
INSERT INTO `goods` VALUES ('11', 'FENDI', '修身舒适新款上衣', 'src/assets/imgs/lady/g13.jpg', '249.00', '180.00', '黑色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:15:00');
INSERT INTO `goods` VALUES ('12', 'GUCCI', '休闲女士中长款开衫', 'src/assets/imgs/lady/g14.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:15:04');
INSERT INTO `goods` VALUES ('13', 'JIMMY CHOO', '女士短袖T恤', 'src/assets/imgs/lady/g15.jpg', '249.00', '180.00', '黑色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:15:08');
INSERT INTO `goods` VALUES ('14', 'MOOSE KNUCKLES', '修身舒适新款上衣', 'src/assets/imgs/lady/g16.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:15:17');
INSERT INTO `goods` VALUES ('15', 'STUART WEITZMAN', '休闲女士中长款开衫', 'src/assets/imgs/lady/g17.jpg', '249.00', '180.00', '黑色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:15:20');
INSERT INTO `goods` VALUES ('17', 'MO&CO', '修身舒适新款上衣', 'src/assets/imgs/lady/g19.jpg', '250.00', '180.00', '白色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:15:27');
INSERT INTO `goods` VALUES ('18', 'TOPSHOP', '休闲女士中长款开衫', 'src/assets/imgs/lady/g20.jpg', '249.00', '150.00', '白色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:15:32');
INSERT INTO `goods` VALUES ('19', 'KENZO', '女士短袖T恤', 'src/assets/imgs/lady/g21.jpg', '199.00', '150.00', '白色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:15:39');
INSERT INTO `goods` VALUES ('20', 'FENDI', '修身舒适新款上衣', 'src/assets/imgs/lady/g22.jpg', '249.00', '150.00', '白色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:15:43');
INSERT INTO `goods` VALUES ('21', 'GUCCI', '休闲女士中长款开衫', 'src/assets/imgs/lady/g23.jpg', '250.00', '150.00', '白色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:16:09');
INSERT INTO `goods` VALUES ('22', 'JIMMY CHOO', '女士短袖T恤', 'src/assets/imgs/lady/g24.jpg', '199.00', '150.00', '白色', '1', '1000', 'm', '女士', '200', '2018-01-19 21:16:14');
INSERT INTO `goods` VALUES ('23', 'MOOSE KNUCKLES', '修身舒适新款上衣', 'src/assets/imgs/lady/g25.jpg', '250.00', '150.00', '白色', '1', '1000', 's', '女士', '200', '2018-01-19 21:16:18');
INSERT INTO `goods` VALUES ('24', 'STUART WEITZMAN', '休闲女士中长款开衫', 'src/assets/imgs/lady/g26.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '女士', '200', '2018-01-19 21:16:22');
INSERT INTO `goods` VALUES ('25', 'SUBO?', '女士短袖T恤', 'src/assets/imgs/lady/g27.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '女士', '200', '2018-01-19 21:16:28');
INSERT INTO `goods` VALUES ('26', 'MO&CO', '修身舒适新款上衣', 'src/assets/imgs/lady/g28.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '女士', '200', '2018-01-19 21:16:32');
INSERT INTO `goods` VALUES ('27', 'TOPSHOP', '休闲女士中长款开衫', 'src/assets/imgs/lady/g29.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '女士', '200', '2018-01-19 21:16:36');
INSERT INTO `goods` VALUES ('28', 'KENZO', '女士短袖T恤', 'src/assets/imgs/lady/g30.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '女士', '200', '2018-01-19 21:16:44');
INSERT INTO `goods` VALUES ('29', 'FENDI', '修身舒适新款上衣', 'src/assets/imgs/lady/g31.jpg', '250.00', '180.00', '白色', '1', '1000', 's', '女士', '200', '2018-01-19 21:16:48');
INSERT INTO `goods` VALUES ('30', 'GUCCI', '休闲女士中长款开衫', 'src/assets/imgs/lady/g32.jpg', '250.00', '150.00', '白色', '1', '1000', 's', '女士', '200', '2018-01-19 21:16:56');
INSERT INTO `goods` VALUES ('31', 'JIMMY CHOO', '女士短袖T恤', 'src/assets/imgs/lady/g33.jpg', '250.00', '150.00', '白色', '1', '1000', 's', '女士', '200', '2018-01-19 21:17:01');
INSERT INTO `goods` VALUES ('32', 'MOOSE KNUCKLES', '修身舒适新款上衣', 'src/assets/imgs/lady/g34.jpg', '250.00', '150.00', '白色', '1', '1000', 'l', '女士', '200', '2018-01-19 21:17:04');
INSERT INTO `goods` VALUES ('33', 'STUART WEITZMAN', '休闲女士中长款开衫', 'src/assets/imgs/lady/g35.jpg', '250.00', '150.00', '白色', '1', '1000', 'l', '女士', '200', '2018-01-19 21:17:10');
INSERT INTO `goods` VALUES ('34', 'SUBO?', '女士短袖T恤', 'src/assets/imgs/lady/g36.jpg', '250.00', '150.00', '白色', '1', '1000', 'l', '女士', '200', '2018-01-19 21:17:19');
INSERT INTO `goods` VALUES ('35', 'MO&CO', '修身舒适新款上衣魏鹊无枝', 'src/assets/imgs/lady/g37.jpg', '249.00', '180.00', '蓝色', '1', '1000', 'l', '女士', '200', '2018/1/19 下午9:17:25');
INSERT INTO `goods` VALUES ('36', 'TOPSHOP', '休闲女士中长款开衫', 'src/assets/imgs/lady/g38.jpg', '250.00', '180.00', '蓝色', '1', '1000', 'l', '女士', '200', '2018-01-19 21:17:35');
INSERT INTO `goods` VALUES ('37', 'KENZO', '女士短袖T恤', 'src/assets/imgs/lady/g39.jpg', '250.00', '180.00', '蓝色', '1', '1000', 'l', '女士', '200', '2018-01-19 21:17:43');
INSERT INTO `goods` VALUES ('38', 'GUCCI', '修身舒适新款上衣', 'src/assets/imgs/lady/g40.jpg', '249.00', '180.00', '蓝色', '1', '1000', 'l', '女士', '200', '2018-01-19 21:17:54');
INSERT INTO `goods` VALUES ('39', 'TOPSHOP', '真绒料保暖外嘚嘚饿', 'src/assets/imgs/man/g2.jpg', '249.00', '180.00', '黑色', '1', '1000', 's', '男士', '200222', 'Invalid Date');
INSERT INTO `goods` VALUES ('40', 'KENZO', '男士个性休闲外衣', 'src/assets/imgs/man/g3.jpg', '199.00', '180.00', '黑色', '1', '1000', 's', '男士', '200', '2018-01-19 21:22:15');
INSERT INTO `goods` VALUES ('41', 'FENDI', '真绒料保暖外套', 'src/assets/imgs/man/g4.jpg', '199.00', '180.00', '黑色', '1', '1000', 's', '男士', '200', '2018-01-19 21:22:18');
INSERT INTO `goods` VALUES ('42', 'GUCCI', '男士个性休闲外衣', 'src/assets/imgs/man/g5.jpg', '199.00', '150.00', '黑色', '1', '1000', 's', '男士', '200', '2018-01-19 21:22:23');
INSERT INTO `goods` VALUES ('43', 'JIMMY CHOO', '真绒料保暖外套', 'src/assets/imgs/man/g6.jpg', '199.00', '150.00', '黑色', '1', '1000', 's', '男士', '200', '2018-01-19 21:22:28');
INSERT INTO `goods` VALUES ('44', 'MOOSE KNUCKLES', '男士个性休闲外衣', 'src/assets/imgs/man/g7.jpg', '249.00', '150.00', '黑色', '1', '1000', 's', '男士', '200', '2018-01-19 21:22:33');
INSERT INTO `goods` VALUES ('45', 'STUART WEITZMAN', '真绒料保暖外套', 'src/assets/imgs/man/g8.jpg', '199.00', '150.00', '黑色', '1', '1000', 's', '男士', '200', '2018-01-19 21:22:36');
INSERT INTO `goods` VALUES ('46', 'SUBO?', '男士个性休闲外衣', 'src/assets/imgs/man/g9.jpg', '199.00', '150.00', '黑色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:22:44');
INSERT INTO `goods` VALUES ('47', 'MO&CO', '真绒料保暖外套', 'src/assets/imgs/man/g10.jpg', '249.00', '150.00', '黑色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:22:48');
INSERT INTO `goods` VALUES ('48', 'TOPSHOP', '男士个性休闲外衣', 'src/assets/imgs/man/g11.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:22:53');
INSERT INTO `goods` VALUES ('49', 'KENZO', '真绒料保暖外套', 'src/assets/imgs/man/g12.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:22:56');
INSERT INTO `goods` VALUES ('50', 'FENDI', '男士个性休闲外衣', 'src/assets/imgs/man/g13.jpg', '249.00', '180.00', '黑色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:22:59');
INSERT INTO `goods` VALUES ('51', 'GUCCI', '真绒料保暖外套', 'src/assets/imgs/man/g14.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:23:04');
INSERT INTO `goods` VALUES ('52', 'JIMMY CHOO', '男士个性休闲外衣', 'src/assets/imgs/man/g15.jpg', '249.00', '180.00', '黑色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:23:06');
INSERT INTO `goods` VALUES ('53', 'MOOSE KNUCKLES', '真绒料保暖外套', 'src/assets/imgs/man/g16.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:23:09');
INSERT INTO `goods` VALUES ('54', 'STUART WEITZMAN', '男士个性休闲外衣', 'src/assets/imgs/man/g17.jpg', '249.00', '180.00', '黑色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:23:12');
INSERT INTO `goods` VALUES ('55', 'SUBO?', '真绒料保暖外套', 'src/assets/imgs/man/g18.jpg', '199.00', '180.00', '白色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:23:16');
INSERT INTO `goods` VALUES ('56', 'MO&CO', '男士个性休闲外衣', 'src/assets/imgs/man/g19.jpg', '250.00', '180.00', '白色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:35:24');
INSERT INTO `goods` VALUES ('57', 'TOPSHOP', '真绒料保暖外套', 'src/assets/imgs/man/g20.jpg', '249.00', '150.00', '白色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:35:27');
INSERT INTO `goods` VALUES ('58', 'KENZO', '男士个性休闲外衣', 'src/assets/imgs/man/g21.jpg', '199.00', '150.00', '白色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:35:30');
INSERT INTO `goods` VALUES ('59', 'FENDI', '真绒料保暖外套', 'src/assets/imgs/man/g22.jpg', '249.00', '150.00', '白色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:35:34');
INSERT INTO `goods` VALUES ('60', 'GUCCI', '真绒料保暖外套', 'src/assets/imgs/man/g23.jpg', '250.00', '150.00', '白色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:35:38');
INSERT INTO `goods` VALUES ('61', 'JIMMY CHOO', '男士个性休闲外衣', 'src/assets/imgs/man/g24.jpg', '199.00', '150.00', '白色', '1', '1000', 'm', '男士', '200', '2018-01-19 21:35:42');
INSERT INTO `goods` VALUES ('62', 'MOOSE KNUCKLES', '真绒料保暖外套', 'src/assets/imgs/man/g25.jpg', '250.00', '150.00', '白色', '1', '1000', 's', '男士', '200', '2018-01-19 21:35:50');
INSERT INTO `goods` VALUES ('63', 'STUART WEITZMAN', '男士个性休闲外衣', 'src/assets/imgs/man/g26.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '男士', '200', '2018-01-19 21:35:54');
INSERT INTO `goods` VALUES ('64', 'SUBO?', '真绒料保暖外套', 'src/assets/imgs/man/g27.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '男士', '200', '2018-01-19 21:36:00');
INSERT INTO `goods` VALUES ('65', 'MO&CO', '男士个性休闲外衣', 'src/assets/imgs/man/g28.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '男士', '200', '2018-01-19 21:36:04');
INSERT INTO `goods` VALUES ('66', 'TOPSHOP', '真绒料保暖外套', 'src/assets/imgs/man/g29.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '男士', '200', '2018-01-19 21:36:08');
INSERT INTO `goods` VALUES ('67', 'KENZO', '男士个性休闲外衣', 'src/assets/imgs/man/g30.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '男士', '200', '2018-01-19 21:36:12');
INSERT INTO `goods` VALUES ('68', 'FENDI', '真绒料保暖外套', 'src/assets/imgs/man/g31.jpg', '250.00', '180.00', '白色', '1', '1000', 's', '男士', '200', '2018-01-19 21:36:15');
INSERT INTO `goods` VALUES ('69', 'GUCCI', '男士个性休闲外衣', 'src/assets/imgs/man/g32.jpg', '250.00', '150.00', '白色', '1', '1000', 's', '男士', '200', '2018-01-19 21:36:19');
INSERT INTO `goods` VALUES ('70', 'JIMMY CHOO', '真绒料保暖外套', 'src/assets/imgs/man/g33.jpg', '250.00', '150.00', '白色', '1', '1000', 's', '男士', '200', '2018-01-19 21:36:24');
INSERT INTO `goods` VALUES ('71', 'MOOSE KNUCKLES', '男士个性休闲外衣', 'src/assets/imgs/man/g34.jpg', '250.00', '150.00', '白色', '1', '1000', 'l', '男士', '200', '2018-01-19 21:36:29');
INSERT INTO `goods` VALUES ('72', 'STUART WEITZMAN', '真绒料保暖外套', 'src/assets/imgs/man/g35.jpg', '250.00', '150.00', '白色', '1', '1000', 'l', '男士', '200', '2018-01-19 21:36:33');
INSERT INTO `goods` VALUES ('73', 'SUBO?', '男士个性休闲外衣', 'src/assets/imgs/man/g36.jpg', '250.00', '150.00', '白色', '1', '1000', 'l', '男士', '200', '2018-01-19 21:36:41');
INSERT INTO `goods` VALUES ('74', 'MO&CO', '真绒料保暖外套', 'src/assets/imgs/man/g37.jpg', '249.00', '180.00', '蓝色', '1', '1000', 'l', '男士', '200', '2018-01-19 21:36:44');
INSERT INTO `goods` VALUES ('75', 'TOPSHOP', '男士个性休闲外衣', 'src/assets/imgs/man/g38.jpg', '250.00', '180.00', '蓝色', '1', '1000', 'l', '男士', '200', '2018-01-19 21:36:51');
INSERT INTO `goods` VALUES ('76', 'KENZO', '真绒料保暖外套', 'src/assets/imgs/man/g39.jpg', '250.00', '180.00', '蓝色', '1', '1000', 'l', '男士', '200', '2018-01-19 21:36:54');
INSERT INTO `goods` VALUES ('77', 'FENDI', '男士个性休闲外衣', 'src/assets/imgs/man/g40.jpg', '249.00', '180.00', '蓝色', '1', '1000', 'l', '男士', '200', '2018-01-19 21:36:59');
INSERT INTO `goods` VALUES ('79', 'TOPSHOP', '舒适保暖上衣', 'src/assets/imgs/children/g2.jpg', '249.00', '180.00', '黑色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:37:20');
INSERT INTO `goods` VALUES ('80', 'KENZO', '儿童服饰套装', 'src/assets/imgs/children/g3.jpg', '199.00', '180.00', '黑色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:37:24');
INSERT INTO `goods` VALUES ('81', 'FENDI', '舒适保暖上衣', 'src/assets/imgs/children/g4.jpg', '199.00', '180.00', '黑色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:37:31');
INSERT INTO `goods` VALUES ('83', 'JIMMY CHOO', '舒适保暖上衣', 'src/assets/imgs/children/g6.jpg', '199.00', '150.00', '黑色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:37:41');
INSERT INTO `goods` VALUES ('84', 'MOOSE KNUCKLES', '儿童服饰套装', 'src/assets/imgs/children/g7.jpg', '249.00', '150.00', '黑色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:37:46');
INSERT INTO `goods` VALUES ('85', 'STUART WEITZMAN', '舒适保暖上衣', 'src/assets/imgs/children/g8.jpg', '199.00', '150.00', '黑色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:37:53');
INSERT INTO `goods` VALUES ('86', 'SUBO?', '儿童服饰套装', 'src/assets/imgs/children/g9.jpg', '199.00', '150.00', '黑色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:37:56');
INSERT INTO `goods` VALUES ('87', 'MO&CO', '舒适保暖上衣', 'src/assets/imgs/children/g10.jpg', '249.00', '150.00', '黑色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:37:59');
INSERT INTO `goods` VALUES ('88', 'TOPSHOP', '儿童服饰套装', 'src/assets/imgs/children/g11.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:02');
INSERT INTO `goods` VALUES ('89', 'KENZO', '舒适保暖上衣', 'src/assets/imgs/children/g12.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:06');
INSERT INTO `goods` VALUES ('90', 'FENDI', '儿童服饰套装', 'src/assets/imgs/children/g13.jpg', '249.00', '180.00', '黑色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:13');
INSERT INTO `goods` VALUES ('91', 'GUCCI', '舒适保暖上衣', 'src/assets/imgs/children/g14.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:16');
INSERT INTO `goods` VALUES ('92', 'JIMMY CHOO', '儿童服饰套装', 'src/assets/imgs/children/g15.jpg', '249.00', '180.00', '黑色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:19');
INSERT INTO `goods` VALUES ('93', 'MOOSE KNUCKLES', '舒适保暖上衣', 'src/assets/imgs/children/g16.jpg', '199.00', '180.00', '黑色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:24');
INSERT INTO `goods` VALUES ('94', 'STUART WEITZMAN', '儿童服饰套装', 'src/assets/imgs/children/g17.jpg', '249.00', '180.00', '黑色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:29');
INSERT INTO `goods` VALUES ('95', 'SUBO?', '舒适保暖上衣', 'src/assets/imgs/children/g18.jpg', '199.00', '180.00', '白色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:32');
INSERT INTO `goods` VALUES ('96', 'MO&CO', '儿童服饰套装', 'src/assets/imgs/children/g19.jpg', '250.00', '180.00', '白色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:36');
INSERT INTO `goods` VALUES ('97', 'TOPSHOP', '舒适保暖上衣', 'src/assets/imgs/children/g20.jpg', '249.00', '150.00', '白色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:40');
INSERT INTO `goods` VALUES ('98', 'KENZO', '儿童服饰套装', 'src/assets/imgs/children/g21.jpg', '199.00', '150.00', '白色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:46');
INSERT INTO `goods` VALUES ('99', 'FENDI', '舒适保暖上衣', 'src/assets/imgs/children/g22.jpg', '249.00', '150.00', '白色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:50');
INSERT INTO `goods` VALUES ('100', 'GUCCI', '儿童服饰套装', 'src/assets/imgs/children/g23.jpg', '250.00', '150.00', '白色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:52');
INSERT INTO `goods` VALUES ('101', 'JIMMY CHOO', '舒适保暖上衣', 'src/assets/imgs/children/g24.jpg', '199.00', '150.00', '白色', '1', '1000', 'm', '儿童', '200', '2018-01-19 21:38:55');
INSERT INTO `goods` VALUES ('102', 'MOOSE KNUCKLES', '儿童服饰套装', 'src/assets/imgs/children/g25.jpg', '250.00', '150.00', '白色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:38:58');
INSERT INTO `goods` VALUES ('103', 'STUART WEITZMAN', '舒适保暖上衣', 'src/assets/imgs/children/g26.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:39:01');
INSERT INTO `goods` VALUES ('104', 'SUBO?', '儿童服饰套装', 'src/assets/imgs/children/g27.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:39:04');
INSERT INTO `goods` VALUES ('105', 'MO&CO', '舒适保暖上衣', 'src/assets/imgs/children/g28.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:39:11');
INSERT INTO `goods` VALUES ('106', 'TOPSHOP', '儿童服饰套装', 'src/assets/imgs/children/g29.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:39:17');
INSERT INTO `goods` VALUES ('107', 'KENZO', '舒适保暖上衣', 'src/assets/imgs/children/g30.jpg', '249.00', '180.00', '白色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:39:20');
INSERT INTO `goods` VALUES ('108', 'FENDI', '儿童服饰套装', 'src/assets/imgs/children/g31.jpg', '250.00', '180.00', '白色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:39:23');
INSERT INTO `goods` VALUES ('109', 'GUCCI', '舒适保暖上衣', 'src/assets/imgs/children/g32.jpg', '250.00', '150.00', '白色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:39:29');
INSERT INTO `goods` VALUES ('110', 'JIMMY CHOO', '儿童服饰套装', 'src/assets/imgs/children/g33.jpg', '250.00', '150.00', '白色', '1', '1000', 's', '儿童', '200', '2018-01-19 21:39:35');
INSERT INTO `goods` VALUES ('111', 'MOOSE KNUCKLES', '舒适保暖上衣', 'src/assets/imgs/children/g34.jpg', '250.00', '150.00', '白色', '1', '1000', 'l', '儿童', '200', '2018-01-19 21:39:40');
INSERT INTO `goods` VALUES ('112', 'STUART WEITZMAN', '儿童服饰套装', 'src/assets/imgs/children/g35.jpg', '250.00', '150.00', '白色', '1', '1000', 'l', '儿童', '200', '2018-01-19 21:39:45');
INSERT INTO `goods` VALUES ('113', 'SUBO?', '舒适保暖上衣', 'src/assets/imgs/children/g36.jpg', '250.00', '150.00', '白色', '1', '1000', 'l', '儿童', '200', '2018-01-19 21:39:51');
INSERT INTO `goods` VALUES ('114', 'MO&CO', '儿童服饰套装', 'src/assets/imgs/children/g37.jpg', '249.00', '180.00', '蓝色', '1', '1000', 'l', '儿童', '200', '2018-01-19 21:40:04');
INSERT INTO `goods` VALUES ('115', 'TOPSHOP', '舒适保暖上衣', 'src/assets/imgs/children/g38.jpg', '250.00', '180.00', '蓝色', '1', '1000', 'l', '儿童', '200', '2018-01-19 21:40:07');
INSERT INTO `goods` VALUES ('116', 'KENZO', '儿童服饰套装', 'src/assets/imgs/children/g39.jpg', '250.00', '180.00', '蓝色', '1', '1000', 'l', '儿童', '200', '2018-01-19 21:40:09');
INSERT INTO `goods` VALUES ('117', 'FENDI', '舒适保暖上衣', 'src/assets/imgs/children/g40.jpg', '249.00', '180.00', '蓝色', '1', '1000', 'l', '儿童', '200', '2018-01-19 21:40:17');

-- ----------------------------
-- Table structure for htuser
-- ----------------------------
DROP TABLE IF EXISTS `htuser`;
CREATE TABLE `htuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `position` varchar(255) DEFAULT NULL COMMENT '职位级别',
  `name` varchar(255) DEFAULT NULL,
  `chan` varchar(10) DEFAULT NULL COMMENT '修改内容的权限',
  `del` varchar(10) DEFAULT NULL COMMENT '删除',
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of htuser
-- ----------------------------
INSERT INTO `htuser` VALUES ('1', 'DK', '123456', '管主', 'DK', '1', '1', '2018-01-25 19:02:16');
INSERT INTO `htuser` VALUES ('2', '110', '888888', '客服', '龙飞宇', '1', '0', '2018-01-25 19:23:26');
INSERT INTO `htuser` VALUES ('3', '111', '888888', '员工', '冯志伟', '1', '0', '2018-01-25 19:23:11');
INSERT INTO `htuser` VALUES ('4', '112', '888888', '员工', '韦职丽', '1', '0', '2018-01-25 19:23:17');
INSERT INTO `htuser` VALUES ('5', '113', '888888', '员工', '林青璇', '1', '0', '2018-01-25 19:23:18');
INSERT INTO `htuser` VALUES ('6', '114', '888888', '员工', '周会军', '1', '0', '2018-01-25 19:23:21');
INSERT INTO `htuser` VALUES ('7', '11111', '11111', '经理', null, '1', '1', '2018-01-25 19:36:23');
INSERT INTO `htuser` VALUES ('8', '111放入放入放入发热发', '111111111', '经理', null, '1', '1', '2018-01-25 20:23:10');
INSERT INTO `htuser` VALUES ('9', '维权维权维权维', '11111111', '经理', null, '1', '1', '2018-01-25 20:24:40');
INSERT INTO `htuser` VALUES ('10', '111111111111', '11111111111', '经理', null, '1', '1', '2018-01-25 20:29:44');
INSERT INTO `htuser` VALUES ('11', 'ccc', 'cccccc', '经理', null, '1', '1', '2018-01-25 20:30:26');
INSERT INTO `htuser` VALUES ('12', 'AAAAA', 'AAAAA', '经理', null, '1', '1', '2018-01-25 20:32:34');
INSERT INTO `htuser` VALUES ('13', 'SSSSS', 'SSSSS', '经理', null, '1', '1', '2018-01-25 21:43:29');
INSERT INTO `htuser` VALUES ('14', '你好', '11111', '经理', null, '1', '1', '2018-01-26 09:47:43');
INSERT INTO `htuser` VALUES ('15', '得得得得得', '11111', '经理', null, '1', '1', '2018-01-26 14:06:41');
INSERT INTO `htuser` VALUES ('16', '11111111', '11111111', '经理', null, '1', '1', '2018-01-26 15:32:52');
INSERT INTO `htuser` VALUES ('17', '123456', '123456', '经理', null, '1', '1', '2018-01-26 18:00:39');
INSERT INTO `htuser` VALUES ('18', 'xingye', '199336', '经理', null, '1', '1', '2018-01-26 18:00:54');
INSERT INTO `htuser` VALUES ('19', '123', '12345', '经理', null, '1', '1', '2018-01-26 18:01:09');
INSERT INTO `htuser` VALUES ('20', '132', '111111', '员工', null, '0', '0', '2018-01-26 18:01:20');
INSERT INTO `htuser` VALUES ('21', '111111', '111111', '员工', null, '0', '0', '2018-01-26 18:01:28');
INSERT INTO `htuser` VALUES ('22', 'zxc', 'zxczxc', '经理', null, '1', '1', '2018-01-26 18:01:46');
INSERT INTO `htuser` VALUES ('23', 'abc', '132456', '经理', null, '1', '1', '2018-01-26 18:02:07');
INSERT INTO `htuser` VALUES ('24', 'jdfls', '11111', '经理', null, '1', '1', '2018-01-26 18:02:16');
INSERT INTO `htuser` VALUES ('25', 'wzl', '11111', '员工', null, '0', '0', '2018-01-26 18:02:34');
INSERT INTO `htuser` VALUES ('26', '1234', '12345', '员工', null, '0', '0', '2018-01-26 18:02:35');
INSERT INTO `htuser` VALUES ('27', 'asd', '213456', '员工', null, '0', '0', '2018-01-26 18:03:05');
INSERT INTO `htuser` VALUES ('28', 'admin', 'admin', '经理', null, '1', '1', '2018-01-26 18:03:33');
INSERT INTO `htuser` VALUES ('29', '133', '111111', '经理', null, '1', '1', '2018-01-26 18:04:33');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `status` varchar(11) DEFAULT NULL COMMENT '商品订单状态 0 未付，1已付',
  `total` varchar(20) DEFAULT NULL COMMENT '总价',
  `goodsid` varchar(255) DEFAULT NULL COMMENT '订单内商品id',
  `date` varchar(255) DEFAULT NULL COMMENT '提交订单的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('101', '33', '0', '199', '[{\"gid\":6,\"qty\":1}]', '2018-1-30 19:19:32');
INSERT INTO `orders` VALUES ('3', '3', '0', '3000', '[{\"gid\":12,\"qty\":5},{\"gid\":88,\"qty\":1}]', '2018/1/22 下午10:35:43');
INSERT INTO `orders` VALUES ('4', '4', '0', '3000', '[{\"gid\":8,\"qty\":5},{\"gid\":46,\"qty\":1}]', '2018/1/22 下午10:36:45');
INSERT INTO `orders` VALUES ('5', '4', '0', '3000', '[{\"gid\":8,\"qty\":5},{\"gid\":46,\"qty\":1}]', '2018/1/22 下午10:39:11');
INSERT INTO `orders` VALUES ('6', '5', '0', '3000', '[{\"gid\":8,\"qty\":5},{\"gid\":46,\"qty\":1}]', '2018/1/22 下午10:41:21');
INSERT INTO `orders` VALUES ('7', '5', '0', '998', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:42:19');
INSERT INTO `orders` VALUES ('11', '5', '0', '1998', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:45:31');
INSERT INTO `orders` VALUES ('10', '5', '0', '1998', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:45:55');
INSERT INTO `orders` VALUES ('12', '5', '0', '1998', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:46:34');
INSERT INTO `orders` VALUES ('13', '5', '0', '1998', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:49:03');
INSERT INTO `orders` VALUES ('14', '5', '0', '1998', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:50:02');
INSERT INTO `orders` VALUES ('15', '8', '0', '1998', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:51:43');
INSERT INTO `orders` VALUES ('16', '8', '0', '1998', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:51:57');
INSERT INTO `orders` VALUES ('17', '8', '0', '668', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:52:01');
INSERT INTO `orders` VALUES ('18', '8', '0', '668', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:53:25');
INSERT INTO `orders` VALUES ('19', '7', '0', '99', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:54:51');
INSERT INTO `orders` VALUES ('1', '1', '0', '3000', '[{\"gid\":12,\"qty\":5},{\"gid\":88,\"qty\":1}]', '2018/1/22 下午10:35:32');
INSERT INTO `orders` VALUES ('103', '37', '0', '448', '[{\"gid\":6,\"qty\":1},{\"gid\":8,\"qty\":1}]', '2018-1-31 16:10:46');
INSERT INTO `orders` VALUES ('102', '142', '0', '199', '[{\"gid\":6,\"qty\":1}]', '2018-1-31 16:06:38');
INSERT INTO `orders` VALUES ('100', '33', '0', '249', '[{\"gid\":8,\"qty\":1}]', '2018-1-30 19:19:32');
INSERT INTO `orders` VALUES ('98', '33', '0', '199', '[{\"gid\":67,\"qty\":5},{\"gid\":66,\"qty\":1}]', '2018/1/22 下午10:35:32');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户',
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `phone` int(11) DEFAULT NULL COMMENT '电话',
  `gender` varchar(255) DEFAULT NULL COMMENT '性别',
  `email` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `vip` int(10) DEFAULT NULL COMMENT '1是会员 0为非会员',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zhiwei', '123456', '志伟', '1888888888', '女', null, null, '1', null, '2018-01-19 21:45:30');
INSERT INTO `user` VALUES ('2', '123', '123', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('4', 'feifei', '654321', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('35', '13100000006', '111111', null, null, null, null, null, null, null, '2018-01-24 17:34:30');
INSERT INTO `user` VALUES ('6', 'sam', '000000', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('17', '11', '11', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('18', '1133', '113', null, null, null, null, null, null, null, '2018-01-24 15:09:46');
INSERT INTO `user` VALUES ('19', '1122', '1122', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('20', '你哈', '1111', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('21', '你好', '11', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('22', '111', '11111', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('23', '111111', '11111', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('24', '123444', '111111', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('25', 'ewewew', '11111', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('26', '而为我', '111111', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('27', 'zzz', 'zzzzz', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('28', 'longye', '888888', null, null, null, null, null, null, null, '2018-01-22 15:00:46');
INSERT INTO `user` VALUES ('29', 'xiaoyu', '888888', null, null, null, null, null, null, null, '2018-01-22 15:03:54');
INSERT INTO `user` VALUES ('30', 'xiao', '888888', null, null, null, null, null, null, null, '2018-01-22 15:05:51');
INSERT INTO `user` VALUES ('31', 'qingxuan', '888888', null, null, null, null, null, null, null, '2018-01-22 15:12:35');
INSERT INTO `user` VALUES ('33', '13100000000', '111111', null, null, null, null, null, null, null, '2018-01-24 10:59:27');
INSERT INTO `user` VALUES ('34', '13100000001', '111111', null, null, null, null, null, null, null, '2018-01-24 10:59:41');
INSERT INTO `user` VALUES ('36', '13100001234', '111111', null, null, null, null, null, null, null, '2018-01-24 20:02:45');
INSERT INTO `user` VALUES ('37', '13100003456', '111111', null, null, null, null, null, null, null, '2018-01-24 20:06:26');
INSERT INTO `user` VALUES ('38', '13100002222', '111111', null, null, null, null, null, null, null, '2018-01-24 20:09:31');
INSERT INTO `user` VALUES ('39', '18878551785', '18878551785', null, null, null, null, null, null, null, '2018-01-25 11:13:36');
INSERT INTO `user` VALUES ('40', '13100000088', '111111', null, null, null, null, null, null, null, '2018-01-25 11:43:37');
INSERT INTO `user` VALUES ('41', '13100000089', '111111', null, null, null, null, null, null, null, '2018-01-25 11:43:45');
INSERT INTO `user` VALUES ('42', '1111', '11111', null, null, null, null, null, null, null, '2018-01-25 16:52:58');
INSERT INTO `user` VALUES ('43', '2222', '11111', null, null, null, null, null, null, null, '2018-01-25 17:26:19');
INSERT INTO `user` VALUES ('44', '11111111', '11111111', null, null, null, null, null, null, null, '2018-01-25 20:19:51');
INSERT INTO `user` VALUES ('45', '17665119545', '111111', null, null, null, null, null, null, null, '2018-01-26 12:47:30');
INSERT INTO `user` VALUES ('46', '17722864831', 'zzz123456', null, null, null, null, null, null, null, '2018-01-26 17:54:32');
INSERT INTO `user` VALUES ('47', '13800138000', '123456', null, null, null, null, null, null, null, '2018-01-26 17:55:26');
INSERT INTO `user` VALUES ('48', '13476788765', '111111', null, null, null, null, null, null, null, '2018-01-26 17:55:27');
INSERT INTO `user` VALUES ('49', '18177297437', '12345678', null, null, null, null, null, null, null, '2018-01-26 18:48:36');
SET FOREIGN_KEY_CHECKS=1;

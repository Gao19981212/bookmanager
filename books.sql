/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : books

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2022-03-11 15:54:01
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
  `book_pic` varchar(255) DEFAULT NULL,
  `count_visit` int DEFAULT NULL,
  `book_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of booklist
-- ----------------------------
INSERT INTO `booklist` VALUES ('3', '0003', 'B/21', '形影不离', '[法]西蒙娜·德·波伏瓦', '浙江教育出版社', '重庆', '33', '一层C架', '9787572225420', '2022-2-10', '4', '0', '1', 'http://localhost:9090/files/5e728f85-01e9-42f6-9705-cd980489bc7a', '0', '《形影不离》收录于磨铁经典第一辑“发光的女性”。本辑所选5部作品（《小妇人》《简爱》《一间自己的房间》《形影不离》）在女性文学史上具有重要意义。它们呈现出一条关于女性自我发现、丰富和创造的历史脉络');
INSERT INTO `booklist` VALUES ('4', '000023', 'P29/3', '斗罗大陆', '唐家三少（原作）', '重庆新华社', '重庆', '38', 'A层一架', '987-125-698', '2018', '2', '0', '1', 'http://localhost:9090/files/1668cc4e-050b-4e76-9b8f-b4ee7741f9ad', '0', '他很倒霉。前世唐门子弟，英俊潇洒美青年唐三，偷学秘籍被追杀，纵身一跃，跳崖穿越了。\n他接着倒霉。再世重生，竟是一个婴儿？别人能穿越成王侯将相，富家公子，他却悲催地穿越在一个小村里，洗衣做饭，酒鬼爸爸，貌似还有许多不可告人的隐秘……\n他很幸运。六岁武魂测试，他体内却有两个 武魂，一个是路边杂草，一个是令人垂涎的昊天锤，一个废柴，一个却能逆天……\n他有点纠结了。进入武魂学院修炼，正逢男女群殴，腹黑小萝莉成为校园大姐大，他被钦点为萝莉的贴身保镖。\n他很无辜。虽然外表是正太，可他内心是大叔啊，他不是个萝莉控');
INSERT INTO `booklist` VALUES ('5', '00002', 'A21/3', '盗墓笔记', '南派三叔', '北京新华社', '北京', '49', 'A一层三架', ' 9787549203895', '2009', '3', '16', '2', 'http://localhost:9090/files/8406ad0e-b590-4a82-9d97-727573f0f803', '0', '五十年前，一群长沙土夫子（盗墓贼）挖到一部战国帛书，残篇中记载了一座奇特的战国古墓的位置，但那群土夫子在地下碰上了诡异事件，几乎全部身亡。');
INSERT INTO `booklist` VALUES ('6', '00000014', '1', '风犬少年的天空', '里则林', '测试社区', '1', '1', '1', '1', '1', '4', '0', '1', 'http://localhost:9090/files/8af2fe47-f4f0-407c-a4a2-4ddb21e37242', '0', '废柴少年马田成绩又烂，又爱调皮捣蛋，父母无奈，只能将他送到一座海岛的封闭学校中，作为一个大陆仔，马田在新环境中显得格格不入，意料之中的成了老师的“眼中钉”、同学们排挤的对象……');
INSERT INTO `booklist` VALUES ('7', '00000012', '2', '三体', '刘慈欣', '11', '2', '2', '2', '2', '2', '6', '0', '1', 'http://localhost:9090/files/13a02441-2700-478f-b34b-1d60471eb716', '0', '文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……');
INSERT INTO `booklist` VALUES ('8', '00000015', '3', '神们自己', '[美] 艾萨克·阿西莫夫', null, '3', '3', '3', '3', '3', '5', '0', '1', 'http://localhost:9090/files/39c6d2d3-2e8d-4e9e-935e-d577cca0114e', '0', '探究平行宇宙的一切！\n22世纪，地球可以和平行宇宙进行物质交换，从此拥有了源源不绝的能源。但是，只有几个人才知道危险的真相：地球上的一个无人信任的科学家、能源渐渐枯竭的星球上的一个外星人、');
INSERT INTO `booklist` VALUES ('10', '诗人的意大利之旅', '5', '我们', '[日] 安野光雅', null, '5', '5', '5', '5', '5', '4', '0', '1', 'http://localhost:9090/files/0600bdde-b459-4cc6-bb23-2a5386d0e1fe', '0', '《即兴诗人》是安徒生一生仅有的一部自传性长篇小说，被绘本大师安野光雅赞誉为“如果流落荒岛，我希望可以带在身边的书”。');
INSERT INTO `booklist` VALUES ('12', '00009', 'P32/1', '鲁滨孙飘流记', '(英)笛福 / 徐霞村', null, '重庆市', '38', '3层B架', '978-657-36', '2022', '6', '0', '1', 'http://localhost:9090/files/42a0e166-eadd-4831-905e-575e0726613e', '0', '笛福是英国18世纪启蒙文学的重要作家，他的代表作《鲁滨孙飘流记》是一部流传很广、影响很大的文学名著，它表现了强烈的资产阶级进取精神和启蒙意识。');
INSERT INTO `booklist` VALUES ('13', '0022', '1', '人性的弱点', '戴尔·卡耐基', '1', '1', '1', '1', '1', '1', '1', '0', '1', 'http://localhost:9090/files/fee64632-deaa-46c0-ae07-3168e970061d', '0', '本书译自美国西蒙与舒斯特出版公司1937年第一版，正是该公司出版了世界上第一本《人性的弱点》。本书忠实还原戴尔•卡耐基的38篇初始手稿：摒弃后人所有过度解读；特别收录长期湮没的《创造奇迹的信》及《幸福家庭生活的七个法则》篇。');
INSERT INTO `booklist` VALUES ('14', '0003', 'I21/3', '简・爱', '夏・勃朗特 / 祝庆英', '上海译文出版社', '英国', '28', '三层A架', '9787532725038', '2000-12', '1', '0', '1', 'http://localhost:9090/files/9db6defa-b144-4b8f-82f2-1994b8f8f34c', '0', '本书是作者的自传体小说。书中的女主人公是一个孤儿，从慈善学校毕业以后，到地主罗切斯特府上任家庭教师。不久，主人爱上了这位聪慧的女教师。就在结婚的当天早晨，简・爱发现罗切斯特已有妻室――她就是被藏在阁楼里的疯子！于是，简・爱决然出走，经历了辛酸的流浪生活。后来，当简・爱得悉这个疯子放火烧屋，罗切斯特救她未成反被烧伤，眼睛失明时，却跑来与其成婚。');
INSERT INTO `booklist` VALUES ('15', '000001', 'P21/3', '无尽长河的尽头', '果しなき流れの果に', '人民文学出版社', '日本', '36', '三层2架', '9787020159383', '2022-1-1', '2', '0', '1', 'http://localhost:9090/files/21f37233-a2f6-4243-bdb1-12a3b5fba183', '0', '一个永远在流动的沙钟，一次疑团重重的探险。失踪、死亡、遇难、原因不明的重伤……卷入这件事的人无一幸免。而在另一个宇宙维度里，一场穿梭于时间的生存之战正在进行。人类短暂的生命，将如何超越时空，超越星辰岁月，向着虚无与永远、谜团与秘密前进？');
INSERT INTO `booklist` VALUES ('17', '0000056', 'C23/2', '接触', '[美] 卡尔·萨根', '上海科学技术文献出版社', '美国', '68', '一层3架', '9787543984851', '2022-02', '6', '0', '1', 'http://localhost:9090/files/b0b69c6f-129d-4e12-bb3d-15aa535ac28e', '0', '女科学家艾莉·艾罗维幼年丧父，凭借自己的聪敏坚毅在男性主导的射电天文学界闯出一席之地。她在系统地探测地外无线电信息时突然从织女星方向收到具有严格数学意义的信息。经过艰难破译，艾莉发现那是一种神秘交通工具的制造图纸。经历了一番科学家与政客的激烈交锋之');
INSERT INTO `booklist` VALUES ('20', '000025', 'M21/3', '海神的后裔', '曹逸冰', '出版', '日本', '33', '一层6架', '9787553524429', '2022-01', '2', '13', '2', 'http://localhost:9090/files/b159c30e-66e2-4d15-85b5-d99891aeb0da', '0', '《告别的仪式》：没有人比技师更清楚，机器人只是一堆冰冷的零件。可一个女孩的到来却让他内心崩塌，只因为她的机器人说了一句：“让我死吧。”为什么？明明我才是真人啊！可为什么反而我的生活里毫无感情？');
INSERT INTO `booklist` VALUES ('21', '000026', 'J32/1', '桶川跟踪狂杀人事件', ' 清水洁', '四川人民出版社', '日本', '32', '2层3架', ' 9787220118906', '2021-2', '2', '0', '1', 'http://localhost:9090/files/4556aba0-1158-4cdb-87e1-6268c4a41f77', '0', '一九九九年十月二十六日，年轻女子猪野诗织在日本埼玉县JR桶川站前遭人持刀刺死。');
INSERT INTO `booklist` VALUES ('22', '000056', 'K32/2', '白夜行', '东野圭吾', '南海出版公司', '日本', '39.5', '2层1架', '9787544258609', '2013-1-1', '4', '0', '1', 'http://localhost:9090/files/f6a01cd9-43de-4a68-8670-9eba5af20b08', '0', '《白夜行》是东野圭吾迄今口碑最好的长篇杰作，具备经典名著的一切要素：\n\n一宗离奇命案牵出跨度近20年步步惊心的故事：悲凉的爱情、吊诡的命运、令人发指的犯罪、复杂人性的对决与救赎……');

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
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lend_time` datetime DEFAULT NULL,
  `back_time` datetime DEFAULT NULL,
  `record_state` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('3', '20187751', '读者1', '男', null, '斗罗大陆', '天蚕土豆', '000023', '2022-03-08 22:11:05', '2022-03-10 23:49:38', '2');
INSERT INTO `record` VALUES ('4', '20187751', '读者1', '男', null, '盗墓笔记', '南派三叔', '00002', '2022-03-08 22:11:36', '2022-03-08 22:11:52', '2');
INSERT INTO `record` VALUES ('5', '20173318', '佟丽娅', '女', null, '风犬少年的天空', '1', '00000014', '2022-03-08 23:44:30', '2022-03-08 23:47:05', '2');
INSERT INTO `record` VALUES ('6', '20216978', '小橙', '女', '15320545532', '鲁滨孙飘流记', 'gy', '00009', '2022-03-10 20:11:51', '2022-03-10 23:49:17', '2');
INSERT INTO `record` VALUES ('7', '20216978', '小橙', '女', '15320545532', '盗墓笔记', '南派三叔', '00002', '2022-03-10 23:46:57', null, '1');
INSERT INTO `record` VALUES ('8', '20187751', '读者1', '男', '13359864521', '风犬少年的天空', '1', '00000014', '2022-03-10 23:48:16', '2022-03-11 00:00:54', '2');
INSERT INTO `record` VALUES ('9', '20187751', '读者1', '男', '13359864521', '海神的后裔', '曹逸冰', '000025', '2022-03-10 23:48:27', null, '1');
INSERT INTO `record` VALUES ('10', '20181142', '彭大伟', '男', '11547889651', '神们自己', '3', '00000015', '2022-03-10 23:49:00', '2022-03-11 00:01:55', '2');
INSERT INTO `record` VALUES ('11', '20181142', '彭大伟', '男', '11547889651', '斗罗大陆', '唐家三少（原作）', '000023', '2022-03-10 23:50:25', '2022-03-11 00:01:30', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('13', '20187751', '123456', '读者1', '22', '13359864521', '男', '2');
INSERT INTO `user` VALUES ('14', '20181142', '123456', '彭大伟', '23', '11547889651', '男', '2');
INSERT INTO `user` VALUES ('15', '20173318', '123456', '佟丽娅', '18', '15805696511', '女', '2');
INSERT INTO `user` VALUES ('16', '20216978', '123456', '小橙', '22', '15320545532', '女', '2');
INSERT INTO `user` VALUES ('17', '20311421', '123456', '高渝', '23', '18696542231', '男', '1');
INSERT INTO `user` VALUES ('18', '20361252', '123456', '多多', '12', '15945963321', '女', '2');

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

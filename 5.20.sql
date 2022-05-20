/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80028
Source Host           : localhost:3306
Source Database       : books

Target Server Type    : MYSQL
Target Server Version : 80028
File Encoding         : 65001

Date: 2022-05-20 15:05:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bindinfo
-- ----------------------------
DROP TABLE IF EXISTS `bindinfo`;
CREATE TABLE `bindinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_rate` double DEFAULT NULL,
  `is_bind` int DEFAULT NULL,
  `access_count` int DEFAULT NULL,
  `access_time` datetime DEFAULT NULL,
  `book_typeid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='\r\n';

-- ----------------------------
-- Records of bindinfo
-- ----------------------------
INSERT INTO `bindinfo` VALUES ('79', '20216978', '小橙子', '000088', '傲慢与偏见', '[英] 奥斯丁', '生活', '/files/s4250062.jpg', '4', '2', '1', '2022-05-10 22:26:07', '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of booklist
-- ----------------------------
INSERT INTO `booklist` VALUES ('3', '000005', 'B/21', '形影不离', '[法]西蒙娜·德·波伏瓦', '浙江教育出版社', '重庆', '33', '一层C架', '9787572225420', '2022-2-10', '4', '13', '2', '/files/5e728f85-01e9-42f6-9705-cd980489bc7a_s34077981 (3).jpg', '0', '《形影不离》收录于磨铁经典第一辑“发光的女性”。本辑所选5部作品（《小妇人》《简爱》《一间自己的房间》《形影不离》）在女性文学史上具有重要意义。它们呈现出一条关于女性自我发现、丰富和创造的历史脉络');
INSERT INTO `booklist` VALUES ('4', '0000025', 'P29/3', '斗罗大陆', '唐家三少（原作）', '重庆新华社', '重庆', '38', 'A层一架', '987-125-698', '2018', '2', '0', '1', '/files/1668cc4e-050b-4e76-9b8f-b4ee7741f9ad_s6772237 (1).jpg', '0', '他很倒霉。前世唐门子弟，英俊潇洒美青年唐三，偷学秘籍被追杀，纵身一跃，跳崖穿越了。\n他接着倒霉。再世重生，竟是一个婴儿？别人能穿越成王侯将相，富家公子，他却悲催地穿越在一个小村里，洗衣做饭，酒鬼爸爸，貌似还有许多不可告人的隐秘……\n他很幸运。六岁武魂测试，他体内却有两个 武魂，一个是路边杂草，一个是令人垂涎的昊天锤，一个废柴，一个却能逆天……\n他有点纠结了。进入武魂学院修炼，正逢男女群殴，腹黑小萝莉成为校园大姐大，他被钦点为萝莉的贴身保镖。\n他很无辜。虽然外表是正太，可他内心是大叔啊，他不是个萝莉控');
INSERT INTO `booklist` VALUES ('5', '000002', 'A21/3', '盗墓笔记', '南派三叔', '北京新华社', '北京', '49', 'A一层三架', ' 9787549203895', '2009', '3', '0', '1', '/files/s4442295.jpg', '0', '五十年前，一群长沙土夫子（盗墓贼）挖到一部战国帛书，残篇中记载了一座奇特的战国古墓的位置，但那群土夫子在地下碰上了诡异事件，几乎全部身亡。');
INSERT INTO `booklist` VALUES ('6', '0000014', '1', '风犬少年的天空', '里则林', '测试社区', '1', '1', '1', '1', '1', '4', '13', '2', '/files/s29491472.jpg', '0', '废柴少年马田成绩又烂，又爱调皮捣蛋，父母无奈，只能将他送到一座海岛的封闭学校中，作为一个大陆仔，马田在新环境中显得格格不入，意料之中的成了老师的“眼中钉”、同学们排挤的对象……');
INSERT INTO `booklist` VALUES ('7', '0000012', '2', '三体', '刘慈欣', '11', '2', '2', '2', '2', '2', '6', '0', '1', 'http://192.168.32.1:9090/files/13a02441-2700-478f-b34b-1d60471eb716', '0', '文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……');
INSERT INTO `booklist` VALUES ('8', '0000015', '3', '神们自己', '[美] 艾萨克·阿西莫夫', null, '3', '3', '3', '3', '3', '5', '21', '2', 'http://192.168.32.1:9090/files/39c6d2d3-2e8d-4e9e-935e-d577cca0114e', '0', '探究平行宇宙的一切！\n22世纪，地球可以和平行宇宙进行物质交换，从此拥有了源源不绝的能源。但是，只有几个人才知道危险的真相：地球上的一个无人信任的科学家、能源渐渐枯竭的星球上的一个外星人、');
INSERT INTO `booklist` VALUES ('10', '0003366', '5', '诗人的意大利之旅', '[日] 安野光雅', null, '5', '5', '5', '5', '5', '4', '21', '2', 'http://192.168.32.1:9090/files/0600bdde-b459-4cc6-bb23-2a5386d0e1fe', '0', '《即兴诗人》是安徒生一生仅有的一部自传性长篇小说，被绘本大师安野光雅赞誉为“如果流落荒岛，我希望可以带在身边的书”。');
INSERT INTO `booklist` VALUES ('12', '000009', 'P32/1', '鲁滨孙飘流记', '(英)笛福 / 徐霞村', null, '重庆市', '38', '3层B架', '978-657-36', '2022', '6', '21', '2', 'http://192.168.32.1:9090/files/42a0e166-eadd-4831-905e-575e0726613e', '0', '笛福是英国18世纪启蒙文学的重要作家，他的代表作《鲁滨孙飘流记》是一部流传很广、影响很大的文学名著，它表现了强烈的资产阶级进取精神和启蒙意识。');
INSERT INTO `booklist` VALUES ('13', '000022', '1', '人性的弱点', '戴尔·卡耐基', '1', '1', '1', '1', '1', '1', '1', '0', '1', 'http://192.168.32.1:9090/files/fee64632-deaa-46c0-ae07-3168e970061d', '0', '本书译自美国西蒙与舒斯特出版公司1937年第一版，正是该公司出版了世界上第一本《人性的弱点》。本书忠实还原戴尔•卡耐基的38篇初始手稿：摒弃后人所有过度解读；特别收录长期湮没的《创造奇迹的信》及《幸福家庭生活的七个法则》篇。');
INSERT INTO `booklist` VALUES ('14', '000004', 'I21/3', '简・爱', '夏・勃朗特 / 祝庆英', '上海译文出版社', '英国', '28', '三层A架', '9787532725038', '2000-12', '1', '17', '2', 'http://192.168.32.1:9090/files/9db6defa-b144-4b8f-82f2-1994b8f8f34c', '0', '本书是作者的自传体小说。书中的女主人公是一个孤儿，从慈善学校毕业以后，到地主罗切斯特府上任家庭教师。不久，主人爱上了这位聪慧的女教师。就在结婚的当天早晨，简・爱发现罗切斯特已有妻室――她就是被藏在阁楼里的疯子！于是，简・爱决然出走，经历了辛酸的流浪生活。后来，当简・爱得悉这个疯子放火烧屋，罗切斯特救她未成反被烧伤，眼睛失明时，却跑来与其成婚。');
INSERT INTO `booklist` VALUES ('15', '000001', 'P21/3', '无尽长河的尽头', '果しなき流れの果に', '人民文学出版社', '日本', '36', '三层2架', '9787020159383', '2022-1-1', '2', '0', '1', 'http://192.168.32.1:9090/files/21f37233-a2f6-4243-bdb1-12a3b5fba183', '0', '一个永远在流动的沙钟，一次疑团重重的探险。失踪、死亡、遇难、原因不明的重伤……卷入这件事的人无一幸免。而在另一个宇宙维度里，一场穿梭于时间的生存之战正在进行。人类短暂的生命，将如何超越时空，超越星辰岁月，向着虚无与永远、谜团与秘密前进？');
INSERT INTO `booklist` VALUES ('17', '0000056', 'C23/2', '接触', '[美] 卡尔·萨根', '上海科学技术文献出版社', '美国', '68', '一层3架', '9787543984851', '2022-02', '6', '13', '2', 'http://192.168.32.1:9090/files/b0b69c6f-129d-4e12-bb3d-15aa535ac28e', '0', '女科学家艾莉·艾罗维幼年丧父，凭借自己的聪敏坚毅在男性主导的射电天文学界闯出一席之地。她在系统地探测地外无线电信息时突然从织女星方向收到具有严格数学意义的信息。经过艰难破译，艾莉发现那是一种神秘交通工具的制造图纸。经历了一番科学家与政客的激烈交锋之');
INSERT INTO `booklist` VALUES ('20', '000025', 'M21/3', '海神的后裔', '曹逸冰', '出版', '日本', '33', '一层6架', '9787553524429', '2022-01', '2', '0', '1', 'http://192.168.32.1:9090/files/b159c30e-66e2-4d15-85b5-d99891aeb0da', '0', '《告别的仪式》：没有人比技师更清楚，机器人只是一堆冰冷的零件。可一个女孩的到来却让他内心崩塌，只因为她的机器人说了一句：“让我死吧。”为什么？明明我才是真人啊！可为什么反而我的生活里毫无感情？');
INSERT INTO `booklist` VALUES ('21', '0000026', 'J32/1', '桶川跟踪狂杀人事件', ' 清水洁', '四川人民出版社', '日本', '32', '2层3架', ' 9787220118906', '2021-2', '2', '14', '2', 'http://192.168.32.1:9090/files/4556aba0-1158-4cdb-87e1-6268c4a41f77', '0', '一九九九年十月二十六日，年轻女子猪野诗织在日本埼玉县JR桶川站前遭人持刀刺死。');
INSERT INTO `booklist` VALUES ('22', '0000057', 'K32/2', '白夜行', '东野圭吾', '南海出版公司', '日本', '39.5', '2层1架', '9787544258609', '2013-1-1', '4', '0', '1', 'http://192.168.32.1:9090/files/f6a01cd9-43de-4a68-8670-9eba5af20b08', '0', '《白夜行》是东野圭吾迄今口碑最好的长篇杰作，具备经典名著的一切要素：\n\n一宗离奇命案牵出跨度近20年步步惊心的故事：悲凉的爱情、吊诡的命运、令人发指的犯罪、复杂人性的对决与救赎……');
INSERT INTO `booklist` VALUES ('26', '0000027', 'C23/6', '活着', '余华', '作家出版社', '浙江', '36', 'B层4架', '968-532-452', '2012', '1', '15', '2', '/files/s27279654.jpg', '0', '《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。');
INSERT INTO `booklist` VALUES ('27', '0000028', 'C27/8', '百年孤独', '[哥伦比亚] 加西亚·马尔克斯', '南海出版公司', '英国', '28', 'C层4架', '856-623-752-4', '2011', '1', '0', '1', '/files/s27237850.jpg', '0', '《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。作品融入神话传说、民间故事、宗教典故等神秘因素，巧妙地糅合了现实与虚幻，展现出一个瑰丽的想象世界，成为20世纪最重要的经典文学巨著之一。1982年加西亚•马尔克斯获得诺贝尔文学奖，奠定世界级文学大师的地位，很大程度上乃是凭借《百年孤独》的巨大影响。');
INSERT INTO `booklist` VALUES ('28', '0000029', 'C28/1', '人世间', '梁晓声', '中国青年出版社', '北京', '69', 'C层2架', '9787515350264', '2017', '1', '0', '1', '/files/s29681174.jpg', '0', '《人世间》（三卷本）是著名作家梁晓声的*新长篇小说。全书一百一十五万字，历经数年创作完成。作品以北方省会城市一位周姓平民子弟的生活轨迹为线索，从二十世纪七十年代写到改革开放后的今天，多角度、多方位、多层次地描写了中国社会的巨大变迁和百姓生活的跌宕起伏，艺术而雄辩地展现了平民百姓向往美好生活的人生努力和社会发展的历史进步，堪称一部“五十年中国百姓生活史”。');
INSERT INTO `booklist` VALUES ('29', '0000036', 'A21/1', '消失的13级台阶', '[日] 高野和明', '上海文艺出版社', '上海', '33', 'A层10架', '9787532175512', '2020', '2', '0', '1', '/files/s34070178.jpg', '0', '一对老夫妇惨遭杀害。一切证据都指向树原亮，他却因车祸，恰好丧失了案发前后数小时的记忆……\n死刑执行官南乡携手刚假释出狱的纯一调查，希望替这位丧失记忆的死刑犯洗清冤屈。但他们查到的唯一线索，就是树原亮记得自己曾“走在台阶上”。');
INSERT INTO `booklist` VALUES ('30', '0000013', 'D21/2', '人类简史', '[以色列] 尤瓦尔·赫拉利', '中信出版社', '美国', '35', 'B层2架', '9787508647357', '2014', '3', '15', '2', '/files/s27814883.jpg', '0', '十万年前，地球上至少有六种不同的人\n但今日，世界舞台为什么只剩下了我们自己？\n从只能啃食虎狼吃剩的残骨的猿人，到跃居食物链顶端的智人，\n从雪维洞穴壁上的原始人手印，到阿姆斯壮踩上月球的脚印，\n从认知革命、农业革命，到科学革命、生物科技革命，\n我们如何登上世界舞台成为万物之灵的？\n从公元前1776年的《汉摩拉比法典》，到1776年的美国独立宣言，\n从帝国主义、资本主义，到自由主义、消费主义，\n从兽欲，到物欲，从兽性、人性，到神性，\n我们了解自己吗？我们过得更快乐吗？\n我们究竟希望自己得到什么、变成什么？');
INSERT INTO `booklist` VALUES ('31', '0000016', 'A23/1', '魏晋南北朝', '[日] 川胜义雄', ' 九州出版社', '日本', '88', 'F层3架', ' 9787510889981', '2022', '3', '0', '1', '/files/s34101100.jpg', '0', '从秦汉到隋唐帝国之间的魏晋南北朝，经历了三百多年的大分裂时期。这是群雄割据的混乱时代，也是文学艺术、思想文化波澜壮阔的时代。本书宏观地聚焦于这三百多年乱世的种种因素和历史发展脉络，以超越政权、超越时代的广阔视..');
INSERT INTO `booklist` VALUES ('32', '0000024', 'D/12', '情绪的毒 身体知道', '[日]自凝心平', '北京日报出版社', '日本', '63', 'D层1架', '9787547739310', '2021', '3', '0', '1', '/files/s33939364.jpg', '0', '肚子上的脂肪是心烦气躁的集合体；皮肤问题跟想太多有关；小腿出问题，通常意味着对人生迷茫；便秘其实是爱拖延的体现；尿频是焦虑的体现……作者从22000个病例中得到实证，负面情绪会给带来身体“毒害”，并利用20年工作经验教授如何改变身体的习惯，去除生气、焦虑、悲伤、孤独、忧郁、恐惧等情绪，启动身体自愈力，如：放松双手，可以改善脖子僵硬，释放忌妒和压力，还能保养双手；伸直手臂向前看，紧实上臂肌肉并摆脱犹豫不决；抬头挺胸走路，姿势变端正，还能防堵忧柔寡断的想法等。');
INSERT INTO `booklist` VALUES ('33', '0000033', 'C25/3', '也许你该找个人聊聊', '[美]洛莉·戈特利布 / 洛莉·戈特利布', '果麦文化/上海文化出版社', '美国', '25', 'A层1架', '9787553522838', '2021', '3', '15', '2', '/files/s33944153.jpg', '0', '这是一位心理治疗师的回忆录，讲述了发生在诊室中的故事。在这个小小的密闭空间里，人们会展现出最真实、最脆弱的一面；也是在这里，人们获得了陪伴和倾听，也获得了宝贵的觉察、成长与改变。');
INSERT INTO `booklist` VALUES ('34', '000088', 'H21', '傲慢与偏见', '[英] 奥斯丁', '人民文学出版社', '英国', '52', 'A层4架', '9787020040179', '1993', '4', '0', '1', '/files/s4250062.jpg', '0', '傲慢与偏见》是简·奥斯汀的代表作，是一部描写爱情与婚姻的经典小说。作品以男女主人公达西和伊丽莎白由于傲慢和偏见而产生的爱情纠葛为线索，共写了四起姻缘：伊丽莎白与达西、简与宾利、莉迪亚与威克姆、夏洛蒂与柯林斯。伊丽莎白、简和莉迪亚是贝内特家五个女儿中的三个姐妹，而夏洛蒂则是她们的邻居，也是伊丽莎白的朋友。男主人公达西与宾利是好友，且与威克姆一起长大，而柯林斯则是贝内特家的远房亲戚。');
INSERT INTO `booklist` VALUES ('35', '0000042', 'K21/3', '中国经济（第2版）', '[美] 巴里·诺顿', '上海人民出版社', '美国', '158', 'D层5架', '9787208159402', '2019', '5', '14', '2', '/files/s33912010.jpg', '0', '本书是著名中国经济问题专家巴里·诺顿对当代中国经济的综合性论述，覆盖面之广、研究之透辟，其他同类英语论著罕有其匹。诺顿纵论1949年以来的中国经济，基于多年的研究提出了自己的独到见解。第二版经过全面修订，反映了十几年来，尤其是“奇迹增长”期结束后中国经济的发展，以及当前在人口、技术、宏观经济和体制诸方面面临的多重转型。关于宏观经济政策和金融政策的讨论也大幅扩展。');
INSERT INTO `booklist` VALUES ('36', '0000044', 'H21/3', '经济学', '[美] 保罗·萨缪尔森 / [美] 威廉·诺德豪斯', '商务印书馆', '美国', '65', 'A层4架', '9787100096393', '2021', '5', '0', '1', '/files/s25495877.jpg', '0', '萨缪尔森《经济学》19版在前18版的基础上进行了精心的修订，并融入了时代变革的元素和最新的经济数据，在保持“把注意力始终放在经济学的基本概念和核心理论”这一风格的前提下，对货币政策、货币与国际金融体系、经济增长、通货膨胀与经济政策做了重点论述或重写，对前沿的实践及理论成果，如经济发展模式选择、混合经济、政府债务、稳定经济、经济增长与居民福利等也给出了最新介绍。');
INSERT INTO `booklist` VALUES ('37', '0000052', null, '定位', null, null, null, '0', null, null, null, '5', '16', '2', '/files/s4578724.jpg', '0', null);
INSERT INTO `booklist` VALUES ('38', '0000037', 'J2/1', '影响力', '[美] 罗伯特·西奥迪尼', '中国人民大学出版社', '美国', '35', 'D层2架', '9787300072487', '2006', '5', '16', '2', '/files/s1657785.jpg', '0', '政治家运用影响力来赢得选举，商人运用影响力来兜售商品，推销员运用影响力诱惑你乖乖地把金钱捧上。即使你的朋友和家人，不知不觉之间，也会把影响力用到你的身上。但到底是为什么，当一个要求用不同的方式提出来时，你的反应就会从负面抵抗变成积极合作呢？');
INSERT INTO `booklist` VALUES ('39', '0000020', 'L21/3', '沸腾新十年（上）', '林军 / 胡喆', '电子工业出版社', '上海', '25', 'A层2架', ' 9787121416873', '2021', '6', '16', '2', '/files/s34019848.jpg', '0', '中国互联网的发展，呈现出了清晰的时间线。2010年之前，是中国PC互联网崛起和百度、阿里巴巴、腾讯三巨头的发家史；2010年之后，中国移动互联网呼啸而来，业界以为的既定局面开始涌现无限可能，美团、快手、抖音、今日头条、拼多多……许多新鲜面孔开始挑战三巨头的权威，催逼这个行业进行更多的技术变革。');
INSERT INTO `booklist` VALUES ('40', '0000038', 'O21/3', '黑客与画家', ' [美] Paul Graham', '人民邮电出版社', '美国', '88', 'G层3架', '9787115249494', '2022', '6', '14', '2', '/files/s4669554.jpg', '0', '本书是硅谷创业之父Paul Graham 的文集，主要介绍黑客即优秀程序员的爱好和动机，讨论黑客成长、黑客对世界的贡献以及编程语言和黑客工作方法等所有对计算机时代感兴趣的人的一些话题。书中的内容不但有助于了解计算机编程的本质、互联网行业的规则，还会帮助读者了解我们这个时代，迫使读者独立思考。');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('3', '20187751', '读者1', '男', null, '斗罗大陆', '天蚕土豆', '000023', '2022-03-08 22:11:05', '2022-03-10 23:49:38', '2');
INSERT INTO `record` VALUES ('4', '20187751', '读者1', '男', null, '盗墓笔记', '南派三叔', '00002', '2022-03-08 22:11:36', '2022-03-08 22:11:52', '2');
INSERT INTO `record` VALUES ('5', '20173318', '佟丽娅', '女', null, '风犬少年的天空', '1', '00000014', '2022-03-08 23:44:30', '2022-03-08 23:47:05', '2');
INSERT INTO `record` VALUES ('6', '20216978', '小橙', '女', '15320545532', '鲁滨孙飘流记', 'gy', '00009', '2022-03-10 20:11:51', '2022-03-10 23:49:17', '2');
INSERT INTO `record` VALUES ('7', '20216978', '小橙', '女', '15320545532', '盗墓笔记', '南派三叔', '00002', '2022-03-10 23:46:57', '2022-05-09 11:18:09', '2');
INSERT INTO `record` VALUES ('8', '20187751', '读者1', '男', '13359864521', '风犬少年的天空', '1', '00000014', '2022-03-10 23:48:16', '2022-03-11 00:00:54', '2');
INSERT INTO `record` VALUES ('9', '20187751', '读者1', '男', '13359864521', '海神的后裔', '曹逸冰', '000025', '2022-03-10 23:48:27', '2022-05-10 21:57:06', '2');
INSERT INTO `record` VALUES ('10', '20181142', '彭大伟', '男', '11547889651', '神们自己', '3', '00000015', '2022-03-10 23:49:00', '2022-03-11 00:01:55', '2');
INSERT INTO `record` VALUES ('11', '20181142', '彭大伟', '男', '11547889651', '斗罗大陆', '唐家三少（原作）', '000023', '2022-03-10 23:50:25', '2022-03-11 00:01:30', '2');
INSERT INTO `record` VALUES ('12', '20181142', '彭大伟', '男', '11547889651', '人性的弱点', '戴尔·卡耐基', '0022', '2022-03-22 18:15:25', '2022-03-22 18:16:10', '2');
INSERT INTO `record` VALUES ('15', '20216978', '小橙子', '男', '15320545532', '傲慢与偏见', '[英] 奥斯丁', '000088', '2022-05-09 11:23:38', '2022-05-10 21:56:47', '2');
INSERT INTO `record` VALUES ('16', '20173318', '佟丽娅', '女', '15805696511', '定位', null, '000052', '2022-05-09 16:17:35', '2022-05-09 16:40:22', '2');
INSERT INTO `record` VALUES ('17', '20187751', '小红', '女', '13359864523', '形影不离', '[法]西蒙娜·德·波伏瓦', '000005', '2022-05-10 21:58:58', null, '1');
INSERT INTO `record` VALUES ('18', '20187751', '小红', '女', '13359864523', '风犬少年的天空', '里则林', '0000014', '2022-05-10 21:59:09', null, '1');
INSERT INTO `record` VALUES ('19', '20187751', '小红', '女', '13359864523', '接触', '[美] 卡尔·萨根', '0000056', '2022-05-10 21:59:19', null, '1');
INSERT INTO `record` VALUES ('20', '20181142', '彭大伟', '男', '11547889651', '桶川跟踪狂杀人事件', ' 清水洁', '0000026', '2022-05-10 21:59:43', null, '1');
INSERT INTO `record` VALUES ('21', '20181142', '彭大伟', '男', '11547889651', '中国经济（第2版）', '[美] 巴里·诺顿', '0000042', '2022-05-10 21:59:50', null, '1');
INSERT INTO `record` VALUES ('22', '20181142', '彭大伟', '男', '11547889651', '黑客与画家', ' [美] Paul Graham', '0000038', '2022-05-10 21:59:56', null, '1');
INSERT INTO `record` VALUES ('23', '20173318', '佟丽娅', '女', '15805696511', '活着', '余华', '0000027', '2022-05-10 22:00:13', null, '1');
INSERT INTO `record` VALUES ('24', '20173318', '佟丽娅', '女', '15805696511', '人类简史', '[以色列] 尤瓦尔·赫拉利', '0000013', '2022-05-10 22:00:18', null, '1');
INSERT INTO `record` VALUES ('25', '20173318', '佟丽娅', '女', '15805696511', '也许你该找个人聊聊', '[美]洛莉·戈特利布 / 洛莉·戈特利布', '0000033', '2022-05-10 22:00:25', null, '1');
INSERT INTO `record` VALUES ('26', '20216978', '小橙子', '男', '15320545532', '沸腾新十年（上）', '林军 / 胡喆', '0000020', '2022-05-10 22:00:39', null, '1');
INSERT INTO `record` VALUES ('27', '20216978', '小橙子', '男', '15320545532', '影响力', '[美] 罗伯特·西奥迪尼', '0000037', '2022-05-10 22:00:52', null, '1');
INSERT INTO `record` VALUES ('28', '20216978', '小橙子', '男', '15320545532', '定位', null, '0000052', '2022-05-10 22:00:58', null, '1');
INSERT INTO `record` VALUES ('29', '20311421', '人上人', '男', '18696542231', '简・爱', '夏・勃朗特 / 祝庆英', '000004', '2022-05-10 22:01:17', null, '1');
INSERT INTO `record` VALUES ('30', '10011002', '测试管理员', '男', '15896412252', '神们自己', '[美] 艾萨克·阿西莫夫', '0000015', '2022-05-10 22:01:33', null, '1');
INSERT INTO `record` VALUES ('31', '10011002', '测试管理员', '男', '15896412252', '诗人的意大利之旅', '[日] 安野光雅', '0003366', '2022-05-10 22:01:39', null, '1');
INSERT INTO `record` VALUES ('32', '10011002', '测试管理员', '男', '15896412252', '鲁滨孙飘流记', '(英)笛福 / 徐霞村', '000009', '2022-05-10 22:01:46', null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('13', '20187751', '1234567', '小红', '23', '13359864523', '女', '2');
INSERT INTO `user` VALUES ('14', '20181142', '123456', '彭大伟', '23', '11547889651', '男', '2');
INSERT INTO `user` VALUES ('15', '20173318', '123456', '佟丽娅', '18', '15805696511', '女', '2');
INSERT INTO `user` VALUES ('16', '20216978', '123456', '小橙子', '19', '15320545532', '男', '2');
INSERT INTO `user` VALUES ('17', '20311421', '123456', '人上人', '18', '18696542231', '男', '1');
INSERT INTO `user` VALUES ('21', '10011002', '123456', '测试管理员', '25', '15896412252', '男', '1');

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

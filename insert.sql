USE `mydb`;
INSERT INTO `user`(FIO,phone,birthdate)
VALUES('Некрестьянов Яков Тихонович',74951436391,19520825),
('Карамышев Эммануил Пахомович',74950221160,20060303),
('Сагадиева Лариса Афанасиевна',74955691712,19551222),
('Яблокова Влада Антониновна',74954031824,20000928),
('Терехова Елена Всеволодовна',74957760785,19570930),
('Низовцева Татьяна Леонидовна',74950782498,19600620),
('Ломоносова Оксана Всеволодовна',74955702932,19630113),
('Машуков Марк Олегович',74954662802,19841202),
('Качурина Инесса Фомевна',74958965712,20030222),
('Куняев Вацлав Прохорович',74959114093,20090701);

INSERT INTO doctor(FIO,specialty,fk_optical_shop_id)
VALUES('Цызырева Эмилия Данииловна','медицинская сестра',1),
('Терехова Вероника Александровна','врач-офтальмолог',1),
('Эскина Варвара Брониславовна','медицинская сестра',2),
('Дубинина Светлана Игоревна','врач-офтальмолог',2),
('Халипова Кристина Тимофеевна','медицинская сестра',2),
('Винтухов Валерий Евграфович','врач-офтальмолог',2),
('Кунаев Игорь Эрнестович','медицинский брат',3),
('Морозова Екатерина Евгениевна','врач-офтальмолог',3),
('Косомова Евдокия Георгиевна','медицинская сестра',4),
('Канкия Адриан Фомевич','врач-офтальмолог',4);

INSERT INTO optical_shop(address,timetable)
VALUES('Академика Богомольца, 16','пн-пт 9:00-20:00 сб-вс 10:00-19:00'),
('Ополченская, 48','пн-пт 9:00-20:00 сб-вс 10:00-19:00'),
('Маршала Еременко, 35','пн-пт 9:00-19:00 сб-вс 10:00-18:00'),
('Металлургов проспект, 29','пн-пт 9:00-20:00 сб-вс 10:00-19:00'),
('Репина, 13','пн-пт 9:00-20:00 сб-вс 10:00-19:00'),
('Хиросимы, 7','пн-пт 9:00-20:00 сб-вс 10:00-19:00'),
('Кузнецкая, 83','пн-пт 9:00-20:00 сб-вс 10:00-19:00'),
('Калининградская, 3','пн-пт 9:00-20:00 сб-вс 10:00-19:00'),
('Елисеева, 17','пн-пт 9:00-20:00 сб-вс 10:00-19:00'),
('Комсомольская, 14','пн-пт 9:00-20:30 сб-вс 10:00-19:30');

INSERT INTO goods(photo_url,title,description)
VALUES('www.example.com /media/photo/1.png','оправа','тонкая металлическая оправа'),
('www.example.com /media/photo/2.png','солнцезащитные очки','очки в черной оправе с линзами, поглащающими уф лучи'),
('www.example.com /media/photo/3.png','контактные лизы','гидрогелевые контактные линзы для ношения в течении 14 дней'),
('www.example.com /media/photo/4.png','очковая линза','органическа утонченная линза с антибликовым покрытием'),
('www.example.com /media/photo/1.png','раствор для контактных линз','универсальный раствор для линз'),
('www.example.com /media/photo/5.png','глазные капли','глазные капли с эффектом натуральной слезы'),
('www.example.com /media/photo/6.png','набор для ухода за контактными линзами','коробочка для линз, пинцет, кейс'),
('www.example.com /media/photo/7.png','набор для ухода за очками','салфетка для очков, раствор защитный от царапин'),
('www.example.com /media/photo/8.png','футляр для очков','футляр для очков с магнитом'),
('www.example.com /media/photo/9.png','витамины ','витамины для зрения с черникой');

INSERT INTO service(title)
VALUES ('Скрининг'),
('Селективная лазерная трабекулопластика'),
('Оптическая когерентная томография'),
('Лазерная коагуляция сетчатки'),
('Консультация врача-офтальмолога с линзой Гольдмана'),
('Консультация по подбору очков'),
('Подбор контактных линз'),
('Детский осмотр'),
('Лазерное лечение глаукомы');

INSERT INTO attribute(title)
VALUES('Цвет'),
('Диоприя'),
('Фокусное растояние '),
('Тип переносицы'),
('Форма'),
('Материал '),
('Страна производитель'),
('Индекс линз'),
('Радиус кривизны'),
('Диаметр '),
('Дизайн'),
('Толщина в центре'),
('Кислородопроницаемость'),
('Влагосодержание'),
('Режим ношения'),
('Режим замены'),
('Тип ');

INSERT INTO `value`(`numeric`,`string`,`fk_attribute_id`)
VALUES(46,NULL,1),
(4646,NULL,17),
(797,NULL,11),
(NULL,'гппгом',2),
(263,NULL,3),
(NULL,'ккщ',15),
(NULL,'уфощ',14),
(93870,NULL,7),
(NULL,'чпрпор',5),
(NULL,'ещукпрйа',6);

INSERT INTO  prescription(number,detail,duration,fk_reception_id)
VALUES(14,'астигматические контактрые линзы -5,5 левый -5 правый','3 мес',1),
(25,'очки +3 оба глаза','1 год',2),
(13,'одновременная миопия и гиперметропия очки +4 левый -2,75 правый','3 года',3),
(17,'бифокальные линзы -4,25 левый +5, 25 правый','1 год',4),
(34,'контактные линзы +2 левый +1,25 правый','6 мес',5),
(78,'контактные линзы миопия -4 левый -3,25 правый','3 мес',6),
(45,'очки дальнозорксть +2 левый +2,25 правый','3 года',7),
(21,'контактные линзы -1,75 левый -1 правый','1 год',8),
(9,'контактные линзы близорукость -3 левый -4,25 правый','6 мес',9),
(28,'астигматические очковые линзы','3 года',10);

INSERT INTO reception(`datetime`,fk_doctor_id,fk_user_id)
VALUES(20200826113000,1,2),
(20201023180000,3,9),
(20201111090000,1,7),
(20201111091000,2,5),
(20201104105000,3,3),
(20201118154500,3,8),
(20201120160000,2,10),
(20201201132000,1,1),
(20201208155000,1,4),
(20201210143000,2,6);


INSERT INTO provide
VALUES(1,2),
(3,2),
(2,4),
(4,6),
(5,6),
(4,4),
(6,8),
(8,9),
(7,9),
(7,8);

INSERT INTO goods_has_value
VALUES(2,1),
(2,3),
(4,2),
(6,4),
(6,5),
(4,4),
(8,6),
(10,8),
(10,7),
(1,6);
	
INSERT INTO there_is
VALUES(3,1,1),
(5,3,3),
(6,2,4),
(3,4,6),
(9,5,7),
(7,4,9),
(1,6,10),
(8,8,12),
(3,7,13),
(2,6,15);
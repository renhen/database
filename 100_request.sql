-- 1.
INSERT INTO reception(`datetime`,fk_doctor_id,fk_user_id)
VALUE(20200826113000,1,2);

-- 2.
DELETE FROM reception WHERE (`date` = 20200826 and `time` = 113000 and fk_doctor_id = 1 and fk_user_id = 2);

-- 3. 
UPDATE `user` SET `FIO` = `Ямакаси Хинкаль Пельменевич`, `phone` = 78005553535, birthdate = 19800502 WHERE (`id` = 1);

-- 4.
DELETE FROM `user` WHERE (id = 11);

-- 5.
INSERT INTO `user`(FIO,phone,birthdate) VALUES ("Тихомиров Аркадий Степанович",79275527770, 20001025);

-- 6.
SELECT `date`,`time`,title  FROM reception
JOIN doctor on reception.fk_doctor_id = doctor.id
JOIN PROVIDE on provide.doctor_id = doctor.id
JOIN service on provide.service_id = service.id
WHERE (FIO = "Цызырева Эмилия Данииловна" and `date` > 20201111)
ORDER BY `date`,`time`;

-- 7.
SELECT timetable FROM optical_shop
WHERE (address = 'Академика Богомольца, 16');

-- 8.
SELECT description FROM goods
WHERE id = 5;

-- 9.
SELECT number as number_reception, detail, duration FROM prescription
JOIN reception on fk_reception_id = reception.id
WHERE(fk_user_id = 5);

-- 10.
SELECT address, sum(`count`) as summ FROM mydb.optical_shop
LEFT JOIN there_is on id = fk_optical_shop_id
WHERE (count is NOT NULL) 
GROUP BY address 
UNION ALL 
SELECT address, 0 FROM mydb.optical_shop 
LEFT JOIN there_is on id = fk_optical_shop_id 
WHERE (count is NULL) 
GROUP BY address 
ORDER BY address;

-- 11.
SELECT count(`date`) as count from reception
JOIN doctor on fk_doctor_id = doctor.id
WHERE (FIO = 'Цызырева Эмилия Данииловна' and `date` between 20201201 and 20201201 + interval 1 week );

-- 12.
select count(`date` ),avg(count) from 
(
select date,count(`date`) as count from reception
group by `date`) as _table;

-- 13.
SELECT AVG(summ) from (SELECT address, sum(`count`) as summ FROM mydb.optical_shop
LEFT JOIN there_is on id = fk_optical_shop_id
WHERE (count is NOT NULL) 
GROUP BY address 
UNION ALL 
SELECT address, 0 FROM mydb.optical_shop 
LEFT JOIN there_is on id = fk_optical_shop_id 
WHERE (count is NULL) 
GROUP BY address 
ORDER BY address) as count_in_one;

-- 14.
SELECT count(*) as count FROM mydb.doctor
WHERE(specialty = 'врач-офтальмолог');

-- 15.
SELECT (SELECT count(*) from prescription) / (SELECT count(*) from reception);


-- UPDATE

-- 1.
UPDATE `mydb`.`reception` SET `date` = 20201207, `time` = '15:50:00' WHERE (`id` = '9');

-- 2.
update `attribute` set title = "Индекс линзы" where (id = 8);

-- 3.
UPDATE doctor
	SET FIO='Кунаев Игорь Вячеславович'
	WHERE id=7;

-- 4.
UPDATE goods
	SET `photo_url`='www.example.com/media/photo/1.png',`description`='тонкая роскошная металлическая оправа'
	WHERE id=1;

-- 5.
UPDATE optical_shop
	SET address='Репина, 15'
	WHERE id=5;

-- 6.
UPDATE prescription
	SET `number`=15,duration='6 мес'
	WHERE id=1;

-- 7.
UPDATE service
	SET title='Консультация по подбору носимых очков'
	WHERE id=6;


-- 8.
UPDATE value
	SET `numeric`=50.0
	WHERE id=1;

-- 9.
UPDATE value
	SET string='овальная'
	WHERE id=9;

-- 10.
UPDATE value
	SET string='сталь'
	WHERE id=10;

-- DELETE 

-- 1.
DELETE FROM `goods_has_value`  WHERE fk_value_id=1;

-- 2.
DELETE FROM `value`  WHERE id=1;


-- 3.
DELETE FROM `attribute`  WHERE title="Цвет";

-- 4.
DELETE FROM `prescription` WHERE (`id` = '2');

-- 5.
DELETE FROM `reception` WHERE (`id` = '2');

-- 6.
DELETE FROM `user` WHERE (`id` = '9');

-- 7.
DELETE FROM service WHERE (title = "Тестовая запись");

-- 8.
DELETE FROM there_is WHERE ( count = 0);

-- 9.
DELETE FROM provide WHERE ( service_id = 2);

-- 10.
DELETE FROM service WHERE (id <= 2);

-- SELECT, DISTINCT, WHERE, AND/OR/NOT, IN, BETWEEN, IS NULL, AS 

-- 1.
SELECT * FROM mydb.user;

-- 2.
SELECT * FROM mydb.doctor;

-- 3.
SELECT * FROM mydb.user WHERE (birthdate >= 20000101);

-- 4.
SELECT * FROM mydb.doctor WHERE (fk_optical_shop_id = 2);

-- 5.
SELECT * FROM mydb.user WHERE (phone between 74951000000 and 74951999999);

-- 6.
SELECT * FROM mydb.reception WHERE (`date` between 20201110 and 20201117);

-- 7.
SELECT * FROM mydb.doctor WHERE (specialty = "врач-офтальмолог" or FIO = "Эскина Варвара Брониславовна");

-- 8.
SELECT * FROM mydb.service WHERE (title = "Детский осмотр" or title = "Детское обследование");

-- 9.
SELECT * FROM mydb.doctor WHERE (not fk_optical_shop_id = 2);

-- 10.
SELECT * FROM mydb.optical_shop WHERE (not address = "Ополченская, 48");

-- 11.
SELECT * FROM mydb.optical_shop WHERE (address in ("Ополченская, 48", "Ленина, 13", "Репина, 15"));

-- 12.
SELECT * FROM mydb.reception WHERE (`date` = 20201111 and time in (090000,093000,100000,150000,170000));

-- 13.
SELECT * FROM mydb.value WHERE (`numeric` is null and `string` is null);

-- 14.
SELECT * FROM mydb.value WHERE (`numeric` is null);

-- 15.
SELECT * FROM mydb.value WHERE (`string` is null);

-- 16.
SELECT * FROM mydb.there_is WHERE (fk_optical_shop_id = 3 and count > 2);

-- 17.
SELECT * FROM mydb.doctor WHERE (fk_optical_shop_id = 4 and specialty = "медицинская сестра");

-- 18.
SELECT number as NumPresciption, detail, duration FROM mydb.prescription;

-- 19.
SELECT title as name_service FROM mydb.service;

-- 20.
SELECT title as nameTitle FROM mydb.attribute;

-- LIKE

-- 1.
SELECT * FROM mydb.service where (title like "%линз%");

-- 2.
SELECT * FROM mydb.doctor where FIO like "%игор%";

-- 3.
SELECT * FROM mydb.doctor where FIO like '%вна';

-- 4.
SELECT * FROM mydb.attribute where title like "Тип_";

-- 5.
SELECT * FROM mydb.prescription where duration like "%год%";

-- 6.
SELECT * FROM mydb.optical_shop WHERE timetable like "%18:00%";


-- COUNT, MAX, MIN, SUM, AVG 

-- 1.
SELECT count(*) as count FROM mydb.user;

-- 2.
SELECT FIO, phone, max(birthdate) as youngest FROM mydb.user;

-- 3.
SELECT `date`,min(`time`) as first_reception FROM mydb.reception WHERE (`date` = 20201111 and fk_doctor_id = 1);

-- 4.
SELECT sum(`count`) as count_in_shop FROM mydb.there_is WHERE (fk_optical_shop_id = 3);

-- 5.
select avg(count_in_shop) from (SELECT sum(`count`) as count_in_shop FROM mydb.there_is group by fk_optical_shop_id) as tb_count;

-- GROUP BY

-- 1.
SELECT * FROM mydb.there_is group by fk_optical_shop_id having min(count);

-- 2.
SELECT * FROM mydb.value group by fk_attribute_id having max(`numeric`);

-- ORDER BY

-- 1.
SELECT * FROM mydb.user order by birthdate DESC;

-- 2.
SELECT * FROM mydb.user order by FIO;

-- 3.
SELECT * FROM mydb.doctor ORDER BY specialty;

-- 4.
SELECT * FROM mydb.attribute order by title;


-- Вложенные SELECT

-- 1.
SELECT * FROM mydb.reception WHERE fk_doctor_id in (SELECT id from doctor where fk_optical_shop_id = 1);


-- SELECT INTO

-- 1.
create table newtable select * from user where 1=0;


-- INSERT SELECT

-- 1.
insert into newtable select * from user where birthdate>=20000101;


-- UNION

-- 1.
SELECT `address`,`timetable`, sum(count) as count_goods FROM mydb.optical_shop
LEFT JOIN there_is on there_is.fk_optical_shop_id = id
WHERE count is not null
GROUP BY id
UNION ALL
SELECT `address`,`timetable`, 0 FROM mydb.optical_shop
LEFT JOIN there_is on there_is.fk_optical_shop_id = id
WHERE count is null
GROUP BY id
ORDER BY address;

-- JOIN


-- 1.
SELECT `date`,`time`, user.FIO as FIO_client, doctor.FIO as FIO_doctor from reception
JOIN doctor on fk_doctor_id = doctor.id
JOIN user on fk_user_id = user.id
ORDER BY date;

-- 2.
SELECT `date`,`time`,`number`,`detail`,duration FROM mydb.reception
LEFT JOIN prescription on prescription.fk_reception_id = reception.id;

-- 3.
SELECT FIO, specialty, title FROM mydb.provide
JOIN doctor on doctor_id = doctor.id
JOIN service on service_id = service.id;

-- 4.
SELECT photo_url, goods.title as title, description, attribute.title as attribute, 
IF (value.`numeric` is null, value.`string`,value.`numeric`) as value 
FROM mydb.goods_has_value
JOIN goods on fk_goods_id = goods.id
JOIN value on fk_value_id = value.id
JOIN attribute on fk_attribute_id = attribute.id;

-- 5.
SELECT FIO, `number` as num_presciption FROM mydb.user
JOIN reception on reception.fk_user_id = user.id
JOIN prescription on reception.id = prescription.fk_reception_id;

-- 6.
SELECT FIO,specialty,title as service FROM mydb.doctor
CROSS JOIN service;

-- 7.
SELECT `date`,`time`,FIO,specialty FROM mydb.reception
JOIN doctor on fk_doctor_id = doctor.id
JOIN optical_shop on optical_shop.id = fk_optical_shop_id
WHERE (address = 'Академика Богомольца, 16');

-- 8.
SELECT FIO,specialty,address as service FROM mydb.doctor
JOIN optical_shop on fk_optical_shop_id = optical_shop.id;

-- 9.
SELECT `number`,detail,duration,address FROM mydb.prescription
JOIN reception on reception.id = fk_reception_id
JOIN doctor on fk_doctor_id = doctor.id
JOIN optical_shop on optical_shop.id = fk_optical_shop_id;


-- LIMIT

-- 1.
SELECT * FROM user LIMIT 3;

-- 2.
SELECT * FROM optical_shop LIMIT 5;

-- 3.
SELECT * FROM service LIMIT 2;

-- 4.
SELECT * FROM prescription
ORDER BY number LIMIT 8;

-- 5.
SELECT * FROM goods 
ORDER BY title LIMIT 5;

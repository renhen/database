CREATE SCHEMA IF NOT EXISTS `rpg_db` DEFAULT CHARACTER SET utf8 ;
USE `rpg_db` ;

CREATE TABLE `rpg_db`.`stack_sizes` (
  `value` INT NOT NULL,
PRIMARY KEY (`value`));

CREATE TABLE `rpg_db`.`item_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `rpg_db`.`rarities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `color` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `rpg_db`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `path` VARCHAR(225) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `rpg_db`.`defense_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `rpg_db`.`character_classes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `rpg_db`.`effect_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `rpg_db`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT(1000) NOT NULL,
  `base_price` INT NOT NULL,
  `image_id` INT NULL,
  `rarity_id` INT NOT NULL,
  `item_type_id` INT NOT NULL,
  `stack_size` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_stacksize1`
    FOREIGN KEY (`stack_size`)   REFERENCES `rpg_db`.`stack_sizes` (`value`),
  CONSTRAINT `fk_itemtype1`
    FOREIGN KEY (`item_type_id`) REFERENCES `rpg_db`.`item_types` (`id`),
  CONSTRAINT `fk_rarityid1`
    FOREIGN KEY (`rarity_id`)    REFERENCES `rpg_db`.`rarities` (`id`),
  CONSTRAINT `fk_imageid1`
    FOREIGN KEY (`image_id`)     REFERENCES `rpg_db`.`images` (`id`)
);

CREATE TABLE `rpg_db`.`damage_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `defense_type_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_defense_type_id1`
    FOREIGN KEY (`defense_type_id`)  REFERENCES `rpg_db`.`defense_types` (`id`)
);

CREATE TABLE `rpg_db`.`item_to_damage_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` INT NOT NULL,
  `item_id` INT NOT NULL,
  `damage_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_items_id1`
    FOREIGN KEY (`item_id`)        REFERENCES `rpg_db`.`items` (`id`),
  CONSTRAINT `fk_damage_type_id1`
    FOREIGN KEY (`damage_type_id`) REFERENCES `rpg_db`.`damage_types` (`id`)
);

CREATE TABLE `rpg_db`.`item_to_defense_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` INT NOT NULL,
  `item_id` INT NOT NULL,
  `defense_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_items_id2`
    FOREIGN KEY (`item_id`)        REFERENCES `rpg_db`.`items` (`id`),
  CONSTRAINT `fk_defense_type_id2`
    FOREIGN KEY (`defense_type_id`) REFERENCES `rpg_db`.`defense_types` (`id`)
);

CREATE TABLE `rpg_db`.`item_to_character_classes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_item_id3`
    FOREIGN KEY (`item_id`)    REFERENCES `rpg_db`.`items` (`id`),
  CONSTRAINT `fk_class_id1`
    FOREIGN KEY (`class_id`)   REFERENCES `rpg_db`.`character_classes` (`id`)
);

CREATE TABLE `rpg_db`.`effects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT(1000) NOT NULL,
  `image_id` INT NULL,
  `effect_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_image_id2`
    FOREIGN KEY (`image_id`)          REFERENCES `rpg_db`.`images` (`id`),
  CONSTRAINT `fk_effect_type_id1`
    FOREIGN KEY (`effect_type_id`)    REFERENCES `rpg_db`.`effect_types` (`id`)
);

CREATE TABLE `rpg_db`.`items_to_effects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `duration` INT NOT NULL,
  `item_id` INT NOT NULL,
  `effect_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_item_id4`
    FOREIGN KEY (`item_id`)      REFERENCES `rpg_db`.`items` (`id`),
  CONSTRAINT `fk_effects_id1`
    FOREIGN KEY (`effect_id`)    REFERENCES `rpg_db`.`effects` (`id`)
);
	
CREATE TABLE `rpg_db`.`recipes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `product_amount` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_item_id5`
    FOREIGN KEY (`product_id`)    REFERENCES `rpg_db`.`items` (`id`)
);

CREATE TABLE `rpg_db`.`recipes_to_ingredients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_item_id6`
    FOREIGN KEY (`item_id`)      REFERENCES `rpg_db`.`items` (`id`),
  CONSTRAINT `fk_recipe_id1`
    FOREIGN KEY (`recipe_id`)    REFERENCES `rpg_db`.`recipes` (`id`)
);

CREATE TABLE `rpg_db`.`workbenches` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `image_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_image_id3`
    FOREIGN KEY (`image_id`)    REFERENCES `rpg_db`.`images` (`id`));

CREATE TABLE `rpg_db`.`workbenches_to_items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `workbench_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_workbench_id1`
    FOREIGN KEY (`workbench_id`)    REFERENCES `rpg_db`.`workbenches` (`id`),
  CONSTRAINT `fk_item_id7`
    FOREIGN KEY (`item_id`)    REFERENCES `rpg_db`.`items` (`id`)
);

CREATE TABLE `rpg_db`.`recipes_to_workbenches` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `workbench_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_workbench_id2`
    FOREIGN KEY (`workbench_id`)    REFERENCES `rpg_db`.`workbenches` (`id`),
  CONSTRAINT `fk_recipe_id2`
    FOREIGN KEY (`recipe_id`)    REFERENCES `rpg_db`.`recipes` (`id`)
);

/*
ALTER
*/

ALTER TABLE item_types
MODIFY name VARCHAR(255) NOT NULL,
MODIFY description VARCHAR(1000) NOT NULL;

ALTER TABLE rarities
RENAME COLUMN color TO fresh;

ALTER TABLE rarities
RENAME COLUMN fresh TO color;

ALTER TABLE images
ADD temp INT UNSIGNED NULL AFTER `id`,
ADD wows VARCHAR(10) NULL AFTER `temp`;

ALTER TABLE images
MODIFY temp TINYINT NOT NULL DEFAULT 0,
CHANGE wows auf datetime NOT NULL DEFAULT 20000101060000;

ALTER TABLE images
DROP temp,
DROP auf;

/*
INSERT
*/

INSERT INTO images(path)
VALUES('www.example.com/img/sa.png'),
('/home/user/Pictures/logo.png');

INSERT INTO stack_sizes
VALUES(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

/*
RENAME
*/
RENAME TABLE images to pictures;
RENAME TABLE effects to wow_magic;

RENAME TABLE pictures to images;
RENAME TABLE wow_magic to effects;

/*
DROP
*/

DROP TABLE workbenches_to_items;
DROP TABLE items_to_effects;
DROP TABLE recipes_to_workbenches;
DROP TABLE recipes_to_ingredients;
DROP TABLE item_to_defense_types;
DROP TABLE item_to_damage_types;
DROP TABLE item_to_character_classes;
DROP TABLE recipes;
DROP TABLE items;
DROP TABLE workbenches;
DROP TABLE stack_sizes;
DROP TABLE item_types;
DROP TABLE effects;
DROP TABLE effect_types;
DROP TABLE damage_types;
DROP TABLE defense_types;
DROP TABLE character_classes;
DROP TABLE rarities;
DROP TABLE images;
DROP DATABASE rpg_db;
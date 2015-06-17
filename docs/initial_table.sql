-- Create Table: menu_items
--------------------------------------------------------------------------------
CREATE TABLE menu_items
(
	`id` INT NOT NULL 
	,PRIMARY KEY (id)
	,`name` VARCHAR(250)  NULL 
	,PRIMARY KEY (name)
	,`description` VARCHAR(250)  NULL 
	,`menu_item_type_id` INT  NULL 
	,PRIMARY KEY (menu_item_type_id)
)
ENGINE=INNODB



-- Create Table: menu_item_types
--------------------------------------------------------------------------------
CREATE TABLE menu_item_types
(
	`id` INT  NULL 
	,`name` VARCHAR(250)  NULL 
	,`description` VARCHAR(250)  NULL 
)
ENGINE=INNODB



-- Create Table: ingredient_types
--------------------------------------------------------------------------------
CREATE TABLE ingredient_types
(
	`id` INT NOT NULL 
	,`name` VARCHAR(250)  NULL 
	,PRIMARY KEY (name)
)
ENGINE=INNODB



-- Create Table: ingredient_prices
--------------------------------------------------------------------------------
CREATE TABLE ingredient_prices
(
	`id` INT  NULL 
	,`ingredient_id` INT  NULL 
	,`date` DATETIME  NULL 
	,`price` BIGINT  NULL 
	,`unit` VARCHAR(250)  NULL 
)
ENGINE=INNODB



-- Create Table: seasons_to_ingredients
--------------------------------------------------------------------------------
CREATE TABLE seasons_to_ingredients
(
	`id` INT NOT NULL 
	,`ingredient_id` VARCHAR(250) NOT NULL 
	,`season_id` VARCHAR(250) NOT NULL 
)
ENGINE=INNODB



-- Create Table: seasons
--------------------------------------------------------------------------------
CREATE TABLE seasons
(
	`id` INT  NULL 
	,`name` VARCHAR(250)  NULL 
	,`start_date` DATETIME  NULL 
	,`end_date` DATETIME  NULL 
	,`description` VARCHAR(250)  NULL 
	,PRIMARY KEY (description)
)
ENGINE=INNODB



-- Create Table: ingredients
--------------------------------------------------------------------------------
CREATE TABLE ingredients
(
	`id` INT NOT NULL 
	,PRIMARY KEY (id)
	,`name` VARCHAR(250)  NULL 
	,PRIMARY KEY (name)
	,`ingredient_type_id` INT  NULL 
	,PRIMARY KEY (ingredient_type_id)
)
ENGINE=INNODB



-- Create Table: menu_items_to_ingredients
--------------------------------------------------------------------------------
CREATE TABLE menu_items_to_ingredients
(
	`id` INT NOT NULL 
	,PRIMARY KEY (id)
	,`menu_item_id` INT NOT NULL 
	,`ingredient_id` INT NOT NULL 
)
ENGINE=INNODB



-- Create Foreign Key: menu_items_to_ingredients.ingredient_id -> ingredients.id
ALTER TABLE menu_items_to_ingredients ADD FOREIGN KEY (ingredient_id) REFERENCES ingredients(id);


-- Create Foreign Key: ingredients.ingredient_type_id -> ingredient_types.id
ALTER TABLE ingredients ADD FOREIGN KEY (ingredient_type_id) REFERENCES ingredient_types(id);


-- Create Foreign Key: seasons_to_ingredients.ingredient_id -> ingredients.id
ALTER TABLE seasons_to_ingredients ADD FOREIGN KEY (ingredient_id) REFERENCES ingredients(id);


-- Create Foreign Key: seasons.id -> seasons_to_ingredients.season_id
ALTER TABLE seasons ADD FOREIGN KEY (id) REFERENCES seasons_to_ingredients(season_id);


-- Create Foreign Key: menu_item_types.id -> menu_items.menu_item_type_id
ALTER TABLE menu_item_types ADD FOREIGN KEY (id) REFERENCES menu_items(menu_item_type_id);


-- Create Foreign Key: ingredients.id -> ingredient_prices.ingredient_id
ALTER TABLE ingredients ADD FOREIGN KEY (id) REFERENCES ingredient_prices(ingredient_id);


-- Create Foreign Key: menu_items.id -> menu_items_to_ingredients.menu_item_id
ALTER TABLE menu_items ADD FOREIGN KEY (id) REFERENCES menu_items_to_ingredients(menu_item_id);



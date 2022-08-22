-- -----------------------------------------------
-- Schema music_store_db
-- -----------------------------------------------------
DROP DATABASE IF EXISTS music_store_db;


-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema music_store_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema music_store_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS music_store_db DEFAULT CHARACTER SET utf8 ;
USE music_store_db;

-- -----------------------------------------------------
-- Table music_store_db.Stores
-- -----------------------------------------------------
/*
CREATE TABLE IF NOT EXISTS Stores (
  store_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  open_time TIME NOT NULL,
  close_time TIME NOT NULL,
  contact_id INT NOT NULL,
  address_id INT NOT NULL,
  PRIMARY KEY (store_id),
  CONSTRAINT fk_Locations_Contacts1
    FOREIGN KEY (contact_id)
    REFERENCES music_store_db.Contacts (contact_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Stores_Address1
    FOREIGN KEY (address_id)
    REFERENCES music_store_db.Address (address_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
*/

-- -----------------------------------------------------
-- Table music_store_db.Location
-- -----------------------------------------------------
/*
CREATE TABLE IF NOT EXISTS Location (
  location_id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (location_id))
ENGINE = InnoDB;
*/

-- -----------------------------------------------------
-- Table music_store_db.Clients
-- -----------------------------------------------------
/*
CREATE TABLE IF NOT EXISTS music_store_db.Clients (
  client_id INT NOT NULL AUTO_INCREMENT,
  contact_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (client_id),
  CONSTRAINT fk_Clients_Contacts1
    FOREIGN KEY (contact_id)
    REFERENCES music_store_db.Contacts (contact_id),
  CONSTRAINT fk_Clients_UserAuthentication1
    FOREIGN KEY (user_id)
    REFERENCES music_store_db.UserAuthentication (user_id))
ENGINE = InnoDB;
*/

-- -----------------------------------------------------
-- Table music_store_db.Orders
-- -----------------------------------------------------
/*
CREATE TABLE IF NOT EXISTS music_store_db.Orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  client_id INT NOT NULL,
  order_date DATETIME NOT NULL,
  store_id INT NOT NULL,
  employee_id INT NOT NULL,
  order_payment_id INT NOT NULL,
  PRIMARY KEY (order_id),
  INDEX fk_Orders_Clients1_idx (client_id ASC) VISIBLE,
  INDEX fk_Orders_Locations1_idx (store_id ASC) VISIBLE,
  INDEX fk_Orders_Employees1_idx (employee_id ASC) VISIBLE,
  INDEX fk_Orders_OrdersPayment1_idx (order_payment_id ASC) VISIBLE,
  CONSTRAINT fk_Orders_Clients1
    FOREIGN KEY (client_id)
    REFERENCES music_store_db.Clients (client_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Orders_Locations1
    FOREIGN KEY (store_id)
    REFERENCES music_store_db.Stores (store_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Orders_Employees1
    FOREIGN KEY (employee_id)
    REFERENCES music_store_db.Employees (employee_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Orders_OrdersPayment1
    FOREIGN KEY (order_payment_id)
    REFERENCES music_store_db.OrdersPayment (order_payment_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
*/

-- -----------------------------------------------------
-- Table music_store_db.OrdersHistory
-- -----------------------------------------------------
/*
CREATE TABLE IF NOT EXISTS music_store_db.OrdersHistory (
  order_history_id INT NOT NULL,
  store_name INT NOT NULL,
  location_name VARCHAR(100) NOT NULL,
  article_type VARCHAR(100) NOT NULL,
  article_name VARCHAR(100) NOT NULL,
  status_name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  discount DECIMAL(10,2) NOT NULL,
  customer_first_name VARCHAR(45) NULL,
  customer_last_name VARCHAR(45) NULL,
  order_date DATETIME NULL,
  order_history_date DATETIME NULL,
  PRIMARY KEY (order_history_id))
ENGINE = InnoDB;
*/

-- -----------------------------------------------------
-- Table music_store_db.Albums
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Albums (
  album_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  artist VARCHAR(45) NOT NULL,
  PRIMARY KEY (album_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Tracks
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tracks (
  track_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(45) NULL,
  genre VARCHAR(45) NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (track_id),
  CONSTRAINT fk_Tracks_Albums1
    FOREIGN KEY (album_id)
    REFERENCES Albums (album_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Instruments
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Instruments (
  instrument_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  PRIMARY KEY (instrument_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Contacts
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Contacts (
  contact_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NULL,
  email VARCHAR(45) NOT NULL,
  phone_no VARCHAR(20) NOT NULL,
  PRIMARY KEY (contact_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Provinces
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Provinces (
  province_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (province_id)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Cities
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cities (
  city_id INT NOT NULL AUTO_INCREMENT,
  city_name VARCHAR(100) NOT NULL,
  province_id INT NOT NULL,
  PRIMARY KEY (city_id),
  CONSTRAINT fk_Cities_Provinces1
    FOREIGN KEY (province_id)
    REFERENCES Provinces (province_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Address
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Address (
  address_id INT NOT NULL AUTO_INCREMENT,
  address_1 VARCHAR(45) NOT NULL,
  address_2 VARCHAR(45) NULL,
  zip_code VARCHAR(45) NOT NULL,
  city_id INT NOT NULL,
  PRIMARY KEY (address_id),
  CONSTRAINT fk_Address_Cities1
    FOREIGN KEY (city_id)
    REFERENCES Cities (city_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Stores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Stores (
  store_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  open_time TIME NOT NULL,
  close_time TIME NOT NULL,
  contact_id INT NOT NULL,
  address_id INT NOT NULL,
  PRIMARY KEY (store_id),
  CONSTRAINT fk_Stores_Contacts1
    FOREIGN KEY (contact_id)
    REFERENCES Contacts (contact_id),
  CONSTRAINT fk_Stores_Address1
    FOREIGN KEY (address_id)
    REFERENCES Address (address_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Inventory
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Inventory (
  inventory_id INT NOT NULL AUTO_INCREMENT,
  store_id INT NOT NULL,
  instrument_id INT NULL,
  track_id INT NULL,
  price DECIMAL(10,2) NOT NULL,
  discount DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (inventory_id),
  CONSTRAINT fk_Inventory_Stores1
    FOREIGN KEY (store_id)
    REFERENCES Stores (store_id),
  CONSTRAINT fk_Inventory_Articles1
    FOREIGN KEY (track_id)
    REFERENCES Tracks (track_id),
  CONSTRAINT fk_Inventory_Instruments1
    FOREIGN KEY (instrument_id)
    REFERENCES Instruments (instrument_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Combos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Combos (
  combo_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (combo_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Albums
-- -----------------------------------------------------
/*
CREATE TABLE IF NOT EXISTS music_store_db.Albums (
  album_id INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  artist VARCHAR(45) NOT NULL,
  PRIMARY KEY (album_id))
ENGINE = InnoDB;
*/

-- -----------------------------------------------------
-- Table music_store_db.UserAuthentication
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS UserAuthentication (
  user_id INT NOT NULL AUTO_INCREMENT,
  password VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Clients
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Clients (
  client_id INT NOT NULL AUTO_INCREMENT,
  contact_id INT NOT NULL,
  user_id INT NOT NULL,
  address_id INT NOT NULL,
  PRIMARY KEY (client_id),
  CONSTRAINT fk_Clients_Contacts1
    FOREIGN KEY (contact_id)
    REFERENCES Contacts (contact_id),
  CONSTRAINT fk_Clients_UserAuthentication1
    FOREIGN KEY (user_id)
    REFERENCES UserAuthentication (user_id),
  CONSTRAINT fk_Clients_Address1
    FOREIGN KEY (address_id)
    REFERENCES Address (address_id)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Employees
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Employees (
  employee_id INT NOT NULL AUTO_INCREMENT,
  store_id INT NOT NULL,
  contact_id INT NOT NULL,
  address_id INT NOT NULL,
  PRIMARY KEY (employee_id),
  CONSTRAINT fk_Employees_stores1
    FOREIGN KEY (store_id)
    REFERENCES Stores (store_id),
  CONSTRAINT fk_Employees_Contacts1
    FOREIGN KEY (contact_id)
    REFERENCES Contacts (contact_id),
  CONSTRAINT fk_Employees_Address1
    FOREIGN KEY (address_id)
    REFERENCES Address (address_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.OrdersPaymentType
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS OrdersPaymentType (
  order_payment_type_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  PRIMARY KEY (order_payment_type_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.OrdersPayment
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS OrdersPayment (
  order_payment_id INT NOT NULL AUTO_INCREMENT,
  order_payment_type_id INT NOT NULL,
  card_last_four_digits VARCHAR(4) NULL,
  card_authorization_no VARCHAR(45) NULL,
  PRIMARY KEY (order_payment_id),
  CONSTRAINT fk_OrdersPayment_OrdersPaymentType1
    FOREIGN KEY (order_payment_type_id)
    REFERENCES OrdersPaymentType (order_payment_type_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Orders
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  client_id INT NOT NULL,
  order_date DATETIME NOT NULL,
  store_id INT NOT NULL,
  employee_id INT NOT NULL,
  order_payment_id INT NOT NULL,
  PRIMARY KEY (order_id),
  CONSTRAINT fk_Orders_Clients1
    FOREIGN KEY (client_id)
    REFERENCES Clients (client_id),
  CONSTRAINT fk_Orders_Locations1
    FOREIGN KEY (store_id)
    REFERENCES Stores (store_id),
  CONSTRAINT fk_Orders_Employees1
    FOREIGN KEY (employee_id)
    REFERENCES Employees (employee_id),
  CONSTRAINT fk_Orders_OrdersPayment1
    FOREIGN KEY (order_payment_id)
    REFERENCES OrdersPayment (order_payment_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.OrdersDetail
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS OrdersDetail (
  order_detail_id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  quantity INT NULL,
  discount DECIMAL(10,2) NULL,
  price DECIMAL(10,2) NULL,
  track_id INT NULL,
  combo_id INT NULL,
  instrument_id INT NULL,
  PRIMARY KEY (order_detail_id),
  CONSTRAINT fk_OrdersDetail_Orders1
    FOREIGN KEY (order_id)
    REFERENCES Orders (order_id),
  CONSTRAINT fk_OrdersDetail_Articles1
    FOREIGN KEY (track_id)
    REFERENCES Tracks (track_id),
  CONSTRAINT fk_OrdersDetail_Combos1
    FOREIGN KEY (combo_id)
    REFERENCES Combos (combo_id),
  CONSTRAINT fk_OrdersDetail_Instruments1
    FOREIGN KEY (instrument_id)
    REFERENCES Instruments (instrument_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.OrdersAudit
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS OrdersAudit (
  order_audit_id INT NOT NULL AUTO_INCREMENT,
  order_audit_date DATETIME NOT NULL,
  order_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  employee_id INT NOT NULL,
  client_id INT NOT NULL,
  PRIMARY KEY (order_audit_id),
  CONSTRAINT fk_OrdersHistory_Orders1
    FOREIGN KEY (order_id)
    REFERENCES Orders (order_id),
  CONSTRAINT fk_OrdersAudit_Employees1
    FOREIGN KEY (employee_id)
    REFERENCES Employees (employee_id),
  CONSTRAINT fk_OrdersAudit_Clients1
    FOREIGN KEY (client_id)
    REFERENCES Clients (client_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.OrdersDetailAudit
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS OrdersDetailAudit (
  order_detail_history_id INT NOT NULL AUTO_INCREMENT,
  order_detail_id INT NOT NULL,
  combo_id INT NULL,
  track_id INT NULL,
  instrument_id INT NULL,
  price DECIMAL(10,2) NULL,
  discount DECIMAL(10,2) NULL,
  PRIMARY KEY (order_detail_history_id),
  CONSTRAINT fk_OrdersDetailHistory_OrdersDetail1
    FOREIGN KEY (order_detail_id)
    REFERENCES OrdersDetail (order_detail_id),
  CONSTRAINT fk_OrdersDetailHistory_Combos1
    FOREIGN KEY (combo_id)
    REFERENCES Combos (combo_id),
  CONSTRAINT fk_OrdersDetailHistory_Articles1
    FOREIGN KEY (track_id)
    REFERENCES Tracks (track_id),
  CONSTRAINT fk_OrdersDetailHistory_Instruments1
    FOREIGN KEY (instrument_id)
    REFERENCES Instruments (instrument_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Clients_has_Address
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ClientsHasAddress (
  client_id INT NOT NULL,
  address_id INT NOT NULL,
  PRIMARY KEY (address_id, client_id),
  CONSTRAINT fk_Clients_has_Address_Clients1
    FOREIGN KEY (client_id)
    REFERENCES music_store_db.Clients (client_id),
  CONSTRAINT fk_Clients_has_Address_Address1
    FOREIGN KEY (address_id)
    REFERENCES music_store_db.Address (address_id)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.ClientPaymentDetails
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ClientPaymentDetails (
  client_payment_details_id INT NOT NULL AUTO_INCREMENT,
  card_last_four_digits VARCHAR(4) NOT NULL,
  card_expiry_year VARCHAR(4) NOT NULL,
  card_expiry_month VARCHAR(2) NOT NULL,
  card_cvv VARCHAR(40) NOT NULL,
  client_id INT NOT NULL,
  PRIMARY KEY (client_payment_details_id),
  CONSTRAINT fk_ClientPaymentDetails_Clients1
    FOREIGN KEY (client_id)
    REFERENCES Clients (client_id)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Combos_has_Tracks
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CombosHasTracks (
  combo_id INT NOT NULL,
  track_id INT NOT NULL,
  PRIMARY KEY (combo_id, track_id),
  CONSTRAINT fk_Combos_has_Articles_Combos1
    FOREIGN KEY (combo_id)
    REFERENCES Combos (combo_id),
  CONSTRAINT fk_Combos_has_Articles_Articles1
    FOREIGN KEY (track_id)
    REFERENCES Tracks (track_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table music_store_db.Combos_has_Instruments
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CombosHasInstruments (
  combo_id INT NOT NULL,
  instrument_id INT NOT NULL,
  PRIMARY KEY (combo_id, instrument_id),
  CONSTRAINT fk_Combos_has_Instruments_Combos1
    FOREIGN KEY (combo_id)
    REFERENCES Combos (combo_id),
  CONSTRAINT fk_Combos_has_Instruments_Instruments1
    FOREIGN KEY (instrument_id)
    REFERENCES Instruments (instrument_id))
ENGINE = InnoDB;



-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;








USE music_store_db;

DELIMITER //

    INSERT INTO music_store_db.Albums VALUES (1, 'Fourth dimension', 'Stratovarious');
    INSERT INTO music_store_db.Albums VALUES (2, 'Kamikaze', 'Eminem');
    INSERT INTO music_store_db.Albums VALUES (3, 'Recovery', 'Eminem');
    INSERT INTO music_store_db.Albums VALUES (4, 'Music To Be Murdered By', 'Eminem');
//    
	INSERT INTO music_store_db.Tracks VALUES (1, 'Winter', 'Power Metal', '1');
	INSERT INTO music_store_db.Tracks VALUES (2, 'Lord of the Wasteland', 'Power Metal', '1');
	INSERT INTO music_store_db.Tracks VALUES (3, 'Twilight Symphony', 'Power Metal', '1');
	INSERT INTO music_store_db.Tracks VALUES (4, 'We hold the key', 'Power Metal', '1');
	INSERT INTO music_store_db.Tracks VALUES (5, 'Distant Skies', 'Power Metal', '1');
	INSERT INTO music_store_db.Tracks VALUES (6, 'Galaxies', 'Power Metal', '1');
	INSERT INTO music_store_db.Tracks VALUES (7, 'Call the Wilderness', 'Power Metal', '1');
	INSERT INTO music_store_db.Tracks VALUES (8, 'Dreamspace', 'Power Metal', '1');
	INSERT INTO music_store_db.Tracks VALUES (9, 'Nightfall', 'Power Metal', '1');
    INSERT INTO music_store_db.Tracks VALUES (10, 'The Ringer', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (11, 'Greatest', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (12, 'Lucky You', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (13, 'Normal', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (14, 'Stepping Stones', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (15, 'Kamikaze', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (16, 'Not Alike', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (17, 'Fall', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (18, 'Nice Guy', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (19, 'Good Guy', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (20, 'Venom', 'Hip-Hop', '2');
    INSERT INTO music_store_db.Tracks VALUES (21, 'Cold Wind Blows', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (22, 'Talkin 2 Myself', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (23, 'On Fire', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (24, 'Wont Back Down', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (25, 'Going Through Changes', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (26, 'Not Afraid', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (27, 'Seduction', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (28, 'No Love', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (29, 'Love the Way You Lie', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (30, '25 to Life', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (31, 'Space Bound', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (32, 'Almost Famous', 'Hip-Hop', '3');
    INSERT INTO music_store_db.Tracks VALUES (33, 'Premonition', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (34, 'Unaccommodating', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (35, 'Alfred', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (36, 'Little Engine', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (37, 'Darkness', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (38, 'In Too Deep', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (39, 'Leaving Heaven', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (40, 'Yah Yah', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (41, 'Step Dad', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (42, 'Marsh', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (43, 'Never Love Again', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (44, 'Lock it up', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (45, 'No Regrets', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (46, 'Farewell', 'Rap', '4');
    INSERT INTO music_store_db.Tracks VALUES (47, 'Godzilla', 'Rap', '4');    
//
	INSERT INTO music_store_db.Combos VALUES (1, 'PROMO-ALL-AT-ONCE');
	INSERT INTO music_store_db.Combos VALUES (2, 'PROMO-TAKE-IT-ALL');  
//
	INSERT INTO music_store_db.CombosHasTracks VALUES (1, 1);
    INSERT INTO music_store_db.CombosHasTracks VALUES (1, 2);
    INSERT INTO music_store_db.CombosHasTracks VALUES (1, 3);
	INSERT INTO music_store_db.CombosHasTracks VALUES (2, 1);
    INSERT INTO music_store_db.CombosHasTracks VALUES (2, 2);
    INSERT INTO music_store_db.CombosHasTracks VALUES (2, 3);
    INSERT INTO music_store_db.CombosHasTracks VALUES (2, 4);
    INSERT INTO music_store_db.CombosHasTracks VALUES (2, 5);
    INSERT INTO music_store_db.CombosHasTracks VALUES (2, 6);
//
	INSERT INTO music_store_db.Instruments VALUES (1, 'Guitar');
	INSERT INTO music_store_db.Instruments VALUES (2, 'Bass');
	INSERT INTO music_store_db.Instruments VALUES (3, 'Drums');
	INSERT INTO music_store_db.Instruments VALUES (4, 'trumpet');
	INSERT INTO music_store_db.Instruments VALUES (5, 'Piano');
	INSERT INTO music_store_db.Instruments VALUES (6, 'Timpani');
	INSERT INTO music_store_db.Instruments VALUES (7, 'Xylophone');
	INSERT INTO music_store_db.Instruments VALUES (8, 'Cello');
	INSERT INTO music_store_db.Instruments VALUES (9, 'Violin');
	INSERT INTO music_store_db.Instruments VALUES (10, 'Harp');
//
	INSERT INTO music_store_db.CombosHasInstruments VALUES (1, 1);
    INSERT INTO music_store_db.CombosHasInstruments VALUES (1, 2);
    INSERT INTO music_store_db.CombosHasInstruments VALUES (1, 3);
    INSERT INTO music_store_db.CombosHasInstruments VALUES (2, 2);
    INSERT INTO music_store_db.CombosHasInstruments VALUES (2, 3);
    INSERT INTO music_store_db.CombosHasInstruments VALUES (2, 4);
    INSERT INTO music_store_db.CombosHasInstruments VALUES (2, 5);
    INSERT INTO music_store_db.CombosHasInstruments VALUES (2, 6);
    INSERT INTO music_store_db.CombosHasInstruments VALUES (2, 10);
//
	INSERT INTO music_store_db.Provinces VALUES (1,'ON');
    INSERT INTO music_store_db.Provinces VALUES (2,'NL');
	INSERT INTO music_store_db.Provinces VALUES (3,'QC');
	INSERT INTO music_store_db.Provinces VALUES (4,'MB');
	INSERT INTO music_store_db.Provinces VALUES (5,'SK');
	INSERT INTO music_store_db.Provinces VALUES (6,'AB');
	INSERT INTO music_store_db.Provinces VALUES (7,'BC');
	INSERT INTO music_store_db.Provinces VALUES (8,'YT');
	INSERT INTO music_store_db.Provinces VALUES (9,'NT');
	INSERT INTO music_store_db.Provinces VALUES (10,'NU');
//
	INSERT INTO music_store_db.Cities VALUES ('1', 'Waterloo', '1');
	INSERT INTO music_store_db.Cities VALUES ('2', 'Kitchener', '1');
	INSERT INTO music_store_db.Cities VALUES ('3', 'Toronto', '1');
    INSERT INTO music_store_db.Cities VALUES ('4', 'Vancouver', '7');
	INSERT INTO music_store_db.Cities VALUES ('5', 'Montreal', '3');
	INSERT INTO music_store_db.Cities VALUES ('6', 'Victoria', '7');
	INSERT INTO music_store_db.Cities VALUES ('7', 'Halifax', '9');
	INSERT INTO music_store_db.Cities VALUES ('8', 'Quebec City', '3');
	INSERT INTO music_store_db.Cities VALUES ('9', 'Calgary', '6');
	INSERT INTO music_store_db.Cities VALUES ('10', 'Ottawa', '1');
//
	INSERT INTO music_store_db.Address VALUES ('1', '580 King St N', 'Bldg. B', 'N2L 6L3', '1');
	INSERT INTO music_store_db.Address VALUES ('2', '530 Columbia St N', 'Tower 1', 'N2H 7K5', '1');
	INSERT INTO music_store_db.Address VALUES ('3', '200 University Ave W', 'Unit 2', 'N2A 3T6', '1');
	INSERT INTO music_store_db.Address VALUES ('4', '145 Brybeck Crescent', 'Bldg. A', 'N2M 2C5', '2');
	INSERT INTO music_store_db.Address VALUES ('5', '24 Shaw Street', 'Tower 3', 'M6J 3W1', '3');
	INSERT INTO music_store_db.Address VALUES ('6', '20 Saint Patrick Street', 'Unit 1', 'M5T 2Y4', '3');
	INSERT INTO music_store_db.Address VALUES ('7', '74 Southwood Dr', 'Tower 1', 'M4E 2T9', '3');
	INSERT INTO music_store_db.Address VALUES ('8', '31 Eden Oak Trail', 'Unit 3', 'N2A 0G2', '2');
	INSERT INTO music_store_db.Address VALUES ('9', '127 Cedarwoods Cres', 'Unit 1', 'N2C 2K1', '2');
	INSERT INTO music_store_db.Address VALUES ('10', '875 University Ave', 'Unit 3', 'N2K 0A1', '1');
	INSERT INTO music_store_db.Address VALUES ('11', '140 Brybeck Crescent', 'Apartment 106', 'N2M 2C5', '2');
	INSERT INTO music_store_db.Address VALUES ('12', '150 Brybeck Crescent', 'Apartment 204', 'N2M 2C5', '2');
	INSERT INTO music_store_db.Address VALUES ('13', '165 Brybeck Crescent', 'Apartment 301', 'N2M 2C5', '2');
	INSERT INTO music_store_db.Address VALUES ('14', '75 Brybeck Crescent', 'Apartment 316', 'N2M 2C5', '2');
	INSERT INTO music_store_db.Address VALUES ('15', '100 Brybeck Crescent', 'Apartment 114', 'N2M 2C5', '2');
	INSERT INTO music_store_db.Address VALUES ('16', '871 University Ave', 'Unit 1', 'N2K 0A1', '1');
	INSERT INTO music_store_db.Address VALUES ('17', '872 University Ave', 'Unit 2', 'N2K 0A1', '1');
	INSERT INTO music_store_db.Address VALUES ('18', '873 University Ave', 'Unit 4', 'N2K 0A1', '1');
	INSERT INTO music_store_db.Address VALUES ('19', '874 University Ave', 'Unit 5', 'N2K 0A1', '1');
//
	INSERT INTO music_store_db.Contacts VALUES ('1', 'Best Buy', NULL, 'mail@bestbuy.com', '1-866-237-8289');
	INSERT INTO music_store_db.Contacts VALUES ('2', 'Charles', 'Smith', 'charles@hotmail.com', '510-114-3575');
	INSERT INTO music_store_db.Contacts VALUES ('3', 'Danny', 'McGrade', 'dann@gmail.com', '200-123-4455');
    INSERT INTO music_store_db.Contacts VALUES ('4', 'John', 'Snow', 'JS123@gmail.com', '200-423-6595');
    INSERT INTO music_store_db.Contacts VALUES ('5', 'Peter', 'Quill', 'PQ123@gmail.com', '510-425-6591');
    INSERT INTO music_store_db.Contacts VALUES ('6', 'Mark', 'Twain', 'MT123@gmail.com', '511-525-4592');
	INSERT INTO music_store_db.Contacts VALUES ('7', 'Diego', 'Maradona', 'DM123@gmail.com', '200-124-6523');
    INSERT INTO music_store_db.Contacts VALUES ('8', 'Sam', 'Billings', 'SB69@gmail.com', '510-121-4591');  
    INSERT INTO music_store_db.Contacts VALUES ('9', 'Kane', 'Williams', 'KW123@gmail.com', '512-411-5041');    
    INSERT INTO music_store_db.Contacts VALUES ('10', 'James', 'Porter', 'JP1123@gmail.com', '510-526-6795');
    INSERT INTO music_store_db.Contacts VALUES ('11', 'Harry', 'Styles', 'HS1232@gmail.com', '510-345-7651');
    INSERT INTO music_store_db.Contacts VALUES ('12', 'Ravi', 'Jadeja', 'RJ123@gmail.com', '201-425-6591');
    INSERT INTO music_store_db.Contacts VALUES ('13', 'Virat', 'Kohli', 'VK1123@gmail.com', '511-649-7891');
    INSERT INTO music_store_db.Contacts VALUES ('14', 'Jon', 'Jones', 'jonbonejones@gmail.com', '201-658-1234');
    INSERT INTO music_store_db.Contacts VALUES ('15', 'Khabib', 'Nurmagomedov', 'Khabib111@gmail.com', '212-293-5342');
    INSERT INTO music_store_db.Contacts VALUES ('16', 'Robin', 'VanPersie', 'RVP99@gmail.com', '210-425-8674');
    INSERT INTO music_store_db.Contacts VALUES ('17', 'Diego', 'Costa', 'DCosta99@gmail.com', '513-250-9748');
    INSERT INTO music_store_db.Contacts VALUES ('18', 'Lionel', 'Messi', 'LM10@gmail.com', '512-119-8671');
    INSERT INTO music_store_db.Contacts VALUES ('19', 'Cristiano', 'Ronaldo', 'CR7@gmail.com', '201-911-9673');
    INSERT INTO music_store_db.Contacts VALUES ('20', 'George', 'StPierre', 'GSP123@gmail.com', '202-685-3827');
    INSERT INTO music_store_db.Contacts VALUES ('21', 'Conor', 'Mcgregor', 'CMac444@gmail.com', '865-654-5039');
    INSERT INTO music_store_db.Contacts VALUES ('22', 'Ray', 'Hopper', 'Rhopper1@gmail.com', '866-425-7890');
    INSERT INTO music_store_db.Contacts VALUES ('23', 'Peter', 'Stark', 'PSTARK@gmail.com', '200-425-9898');
//    
    INSERT INTO music_store_db.STORES VALUES (1, 'Best buy', '10:00', '18:00', 1, 1);
//
	INSERT INTO music_store_db.UserAuthentication VALUES (1,md5('charly1234'));
	INSERT INTO music_store_db.UserAuthentication VALUES (2,md5('xcv98716'));
	INSERT INTO music_store_db.UserAuthentication VALUES (3,md5('san12569'));
	INSERT INTO music_store_db.UserAuthentication VALUES (4,md5('die69694'));
	INSERT INTO music_store_db.UserAuthentication VALUES (5,md5('arm787865'));
	INSERT INTO music_store_db.UserAuthentication VALUES (6,md5('rman98987'));
	INSERT INTO music_store_db.UserAuthentication VALUES (7,md5('jayy42069'));
	INSERT INTO music_store_db.UserAuthentication VALUES (8,md5('khu54151ngh'));
	INSERT INTO music_store_db.UserAuthentication VALUES (9,md5('M36h4143'));
	INSERT INTO music_store_db.UserAuthentication VALUES (10,md5('b4b3143sm'));
//
    INSERT INTO music_store_db.Clients VALUES  (1,2,1,8);
	INSERT INTO music_store_db.Clients VALUES  (2,23,2,9);
	INSERT INTO music_store_db.Clients VALUES  (3,22,3,10);
	INSERT INTO music_store_db.Clients VALUES  (4,21,4,11);
	INSERT INTO music_store_db.Clients VALUES  (5,20,5,11);
	INSERT INTO music_store_db.Clients VALUES  (6,19,6,12);
	INSERT INTO music_store_db.Clients VALUES  (7,18,7,12);
	INSERT INTO music_store_db.Clients VALUES  (8,17,8,13);
	INSERT INTO music_store_db.Clients VALUES  (9,16,9,14);
	INSERT INTO music_store_db.Clients VALUES  (10,15,10,15);
//
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (1,8);
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (2,9);
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (3,10);
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (4,11);
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (5,11);
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (6,12);
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (7,12);
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (8,13);
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (9,14);
	INSERT INTO music_store_db.ClientsHasAddress VALUES   (10,15);
//
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (1,4567,2025,8,md5('454'),1);
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (2,5200,2026,12,md5('897'),2);
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (3,5044,2023,10,md5('341'),3);    
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (4,9033,2024,11,md5('345'),4);    
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (5,8091,2025,5,md5('908'),5);    
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (6,8900,2026,8,md5('907'),6);    
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (7,7822,2027,9,md5('403'),7);
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (8,6566,2025,8,md5('648'),8);    
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (9,9800,2027,1,md5('102'),9);    
	INSERT INTO music_store_db.clientpaymentdetails VALUES   (10,9008,2028,3,md5('107'),10);    
//
	INSERT INTO music_store_db.Employees VALUES (1,1,4,2);
    INSERT INTO music_store_db.Employees VALUES (2,1,5,3);
    INSERT INTO music_store_db.Employees VALUES (3,1,6,4);
    INSERT INTO music_store_db.Employees VALUES (4,1,7,5);
    INSERT INTO music_store_db.Employees VALUES (5,1,8,6);
    INSERT INTO music_store_db.Employees VALUES (6,1,9,7);
    INSERT INTO music_store_db.Employees VALUES (7,1,10,16);
    INSERT INTO music_store_db.Employees VALUES (8,1,11,17);
    INSERT INTO music_store_db.Employees VALUES (9,1,12,18);
    INSERT INTO music_store_db.Employees VALUES (10,1,13,19);

// 
	INSERT INTO music_store_db.OrdersPaymentType VALUES (1, 'CREDIT CARD VISA');
	INSERT INTO music_store_db.OrdersPaymentType VALUES (2, 'CREDIT CARD MASTER CARD');
	INSERT INTO music_store_db.OrdersPaymentType VALUES (3, 'CREDIT CARD AMEX');
    INSERT INTO music_store_db.OrdersPaymentType VALUES (4, 'DEBIT CARD VISA');
    INSERT INTO music_store_db.OrdersPaymentType VALUES (5, 'DEBIT CARD MASTERCARD');
    INSERT INTO music_store_db.OrdersPaymentType VALUES (6, 'FOREX CARD VISA');
    INSERT INTO music_store_db.OrdersPaymentType VALUES (7, 'FOREX CARD MASTERCARD');
    INSERT INTO music_store_db.OrdersPaymentType VALUES (8, 'PREPAID CARD VISA');
    INSERT INTO music_store_db.OrdersPaymentType VALUES (9, 'PREPAID CARD MASTERCARD');
    INSERT INTO music_store_db.OrdersPaymentType VALUES (10, 'STORE CREDITS');
    
//    
INSERT INTO music_store_db.inventory VALUES (1,1,1,NULL,100,0,100);
INSERT INTO music_store_db.inventory VALUES (2,1,2,NULL,100,10,150);
INSERT INTO music_store_db.inventory VALUES (3,1,3,NULL,50,10,100);
INSERT INTO music_store_db.inventory VALUES (4,1,4,NULL,100,0,50);
INSERT INTO music_store_db.inventory VALUES (5,1,5,NULL,50,5,100);
INSERT INTO music_store_db.inventory VALUES (6,1,6,NULL,50,5,80);
INSERT INTO music_store_db.inventory VALUES (7,1,7,NULL,80,10,70);
INSERT INTO music_store_db.inventory VALUES (8,1,8,NULL,100,10,80);
INSERT INTO music_store_db.inventory VALUES (9,1,9,NULL,50,5,90);
INSERT INTO music_store_db.inventory VALUES (10,1,10,NULL,60,2.5,80);
INSERT INTO music_store_db.inventory VALUES (11,1,NULL,1,2,1,80);
INSERT INTO music_store_db.inventory VALUES (12,1,NULL,2,2,1,90);
INSERT INTO music_store_db.inventory VALUES (13,1,NULL,3,2,1,80);
INSERT INTO music_store_db.inventory VALUES (14,1,NULL,4,2,1,80);
INSERT INTO music_store_db.inventory VALUES (15,1,NULL,5,2,1,80);
INSERT INTO music_store_db.inventory VALUES (16,1,NULL,6,2,1,80);
INSERT INTO music_store_db.inventory VALUES (17,1,NULL,7,2,1,80);
INSERT INTO music_store_db.inventory VALUES (18,1,NULL,8,2,1,80);
INSERT INTO music_store_db.inventory VALUES (19,1,NULL,9,2,1,80);
INSERT INTO music_store_db.inventory VALUES (20,1,NULL,10,3,1,150);
INSERT INTO music_store_db.inventory VALUES (21,1,NULL,11,3,1,150);
INSERT INTO music_store_db.inventory VALUES (22,1,NULL,12,3,1,150);
INSERT INTO music_store_db.inventory VALUES (23,1,NULL,13,3,1,150);
INSERT INTO music_store_db.inventory VALUES (24,1,NULL,14,3,1,150);
INSERT INTO music_store_db.inventory VALUES (25,1,NULL,15,3,1,150);
INSERT INTO music_store_db.inventory VALUES (26,1,NULL,16,3,1,150);
INSERT INTO music_store_db.inventory VALUES (27,1,NULL,17,3,1,150);
INSERT INTO music_store_db.inventory VALUES (28,1,NULL,18,3,1,150);
INSERT INTO music_store_db.inventory VALUES (29,1,NULL,19,3,1,150);
INSERT INTO music_store_db.inventory VALUES (30,1,NULL,20,3,1,150);
INSERT INTO music_store_db.inventory VALUES (31,1,NULL,21,3,0,250);
INSERT INTO music_store_db.inventory VALUES (32,1,NULL,22,3,0,250);
INSERT INTO music_store_db.inventory VALUES (33,1,NULL,23,3,0,250);
INSERT INTO music_store_db.inventory VALUES (34,1,NULL,24,3,0,250);
INSERT INTO music_store_db.inventory VALUES (35,1,NULL,25,3,0,250);
INSERT INTO music_store_db.inventory VALUES (36,1,NULL,26,3,0,250);
INSERT INTO music_store_db.inventory VALUES (37,1,NULL,27,3,0,250);
INSERT INTO music_store_db.inventory VALUES (38,1,NULL,28,3,0,250);
INSERT INTO music_store_db.inventory VALUES (39,1,NULL,29,3,0,250);
INSERT INTO music_store_db.inventory VALUES (40,1,NULL,30,3,0,250);
INSERT INTO music_store_db.inventory VALUES (41,1,NULL,31,3,0,250);
INSERT INTO music_store_db.inventory VALUES (42,1,NULL,32,3,0,250);
INSERT INTO music_store_db.inventory VALUES (43,1,NULL,33,3,0,200);
INSERT INTO music_store_db.inventory VALUES (44,1,NULL,34,3,0,200);
INSERT INTO music_store_db.inventory VALUES (45,1,NULL,35,3,0,200);
INSERT INTO music_store_db.inventory VALUES (46,1,NULL,36,3,0,200);
INSERT INTO music_store_db.inventory VALUES (47,1,NULL,37,3,0,200);
INSERT INTO music_store_db.inventory VALUES (48,1,NULL,38,3,0,200);
INSERT INTO music_store_db.inventory VALUES (49,1,NULL,39,3,0,200);
INSERT INTO music_store_db.inventory VALUES (50,1,NULL,40,3,0,200);
INSERT INTO music_store_db.inventory VALUES (51,1,NULL,41,3,0,200);
INSERT INTO music_store_db.inventory VALUES (52,1,NULL,42,3,0,200);
INSERT INTO music_store_db.inventory VALUES (53,1,NULL,43,3,0,200);
INSERT INTO music_store_db.inventory VALUES (54,1,NULL,44,3,0,200);
INSERT INTO music_store_db.inventory VALUES (55,1,NULL,45,3,0,200);
INSERT INTO music_store_db.inventory VALUES (56,1,NULL,46,3,0,200);
INSERT INTO music_store_db.inventory VALUES (57,1,NULL,47,3,0,200);

//
	INSERT INTO music_store_db.OrdersPayment VALUES (1, 1,'1090','14123123');
	INSERT INTO music_store_db.OrdersPayment VALUES (2, 1,'8060','12331233');
	INSERT INTO music_store_db.OrdersPayment VALUES (3, 1,'4060','32131223');
	INSERT INTO music_store_db.OrdersPayment VALUES (4, 1,'1910','56456456');
	INSERT INTO music_store_db.OrdersPayment VALUES (5, 2,'8019','75675675');
	INSERT INTO music_store_db.OrdersPayment VALUES (6, 2,'9102','47474747');
	INSERT INTO music_store_db.OrdersPayment VALUES (7, 2,'1152','70707070');
	INSERT INTO music_store_db.OrdersPayment VALUES (8, 2,'9977','23456532');
	INSERT INTO music_store_db.OrdersPayment VALUES (9, 3,'3346','98762345');
	INSERT INTO music_store_db.OrdersPayment VALUES (10, 3,'2255','24509874');
// 
//
	INSERT INTO music_store_db.Orders VALUES (1, 1, DATE_ADD(SYSDATE(),INTERVAL -90 DAY), 1, 1, 1);
    INSERT INTO music_store_db.Orders VALUES (2, 1, DATE_ADD(SYSDATE(),INTERVAL -25 DAY), 1, 1, 2);
    INSERT INTO music_store_db.Orders VALUES (3, 1, DATE_ADD(SYSDATE(),INTERVAL -10 DAY), 1, 1, 3);
	INSERT INTO music_store_db.Orders VALUES (4, 2, DATE_ADD(SYSDATE(),INTERVAL -20 DAY), 1, 2, 4);
	INSERT INTO music_store_db.Orders VALUES (5, 2, DATE_ADD(SYSDATE(),INTERVAL -2 DAY), 1, 3, 5);
	INSERT INTO music_store_db.Orders VALUES (6, 2, DATE_ADD(SYSDATE(),INTERVAL -5 DAY), 1, 2, 6);
	INSERT INTO music_store_db.Orders VALUES (7, 3, DATE_ADD(SYSDATE(),INTERVAL -7 DAY), 1, 4, 7);
	INSERT INTO music_store_db.Orders VALUES (8, 4, DATE_ADD(SYSDATE(),INTERVAL -15 DAY), 1, 5, 8);
	INSERT INTO music_store_db.Orders VALUES (9, 7, DATE_ADD(SYSDATE(),INTERVAL -20 DAY), 1, 9, 9);    
	INSERT INTO music_store_db.Orders VALUES (10, 10, DATE_ADD(SYSDATE(),INTERVAL -20 DAY), 1, 2, 10);
//   

    INSERT INTO music_store_db.OrdersDetail VALUES (1, 1, 5, 5, 10, 1, NULL, NULL);
	INSERT INTO music_store_db.OrdersDetail VALUES (2, 1, 2, 46, 512, NULL, 1, NULL);
	INSERT INTO music_store_db.OrdersDetail VALUES (3, 1, 1, 0, 100, NULL, NULL, 1);
    INSERT INTO music_store_db.OrdersDetail VALUES (4, 1, 10, 10, 20, 2, NULL, NULL);
	INSERT INTO music_store_db.OrdersDetail VALUES (5, 1, 3, 30, 300, NULL, NULL, 2);
    
	INSERT INTO music_store_db.OrdersDetail VALUES (6, 2, 8, 8, 16, 1, NULL, NULL);
	INSERT INTO music_store_db.OrdersDetail VALUES (7, 2, 1, 23, 256, NULL, 1, NULL);
	INSERT INTO music_store_db.OrdersDetail VALUES (8, 2, 4, 0, 400, NULL, NULL, 1);
	INSERT INTO music_store_db.OrdersDetail VALUES (9, 2, 1, 1, 2, 2, NULL, NULL);
	INSERT INTO music_store_db.OrdersDetail VALUES (10, 2, 3, 30, 300, NULL, NULL, 2);

    INSERT INTO music_store_db.OrdersDetail VALUES (11, 3, 1, 1, 2, 1, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (12, 3, 1, 1, 2, 2, NULL, NULL); 
    INSERT INTO music_store_db.OrdersDetail VALUES (13, 3, 1, 1, 2, 3, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (14, 3, 1, 1, 2, 4, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (15, 3, 1, 1, 2, 5, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (16, 3, 1, 1, 2, 6, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (17, 3, 1, 1, 2, 7, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (18, 3, 1, 1, 2, 8, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (19, 3, 1, 1, 2, 9, NULL, NULL);
    
    INSERT INTO music_store_db.OrdersDetail VALUES (20, 4, 5, 0, 500, NULL, NULL, 1);
    INSERT INTO music_store_db.OrdersDetail VALUES (21, 4, 5, 50, 500, NULL, NULL, 2);
    
    INSERT INTO music_store_db.OrdersDetail VALUES (22, 5, 10, 50, 500, NULL, NULL, 5);
    
    INSERT INTO music_store_db.OrdersDetail VALUES (23, 6, 10, 0, 30, 33, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (24, 6, 10, 0, 30, 34, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (25, 6, 10, 0, 30, 35, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (26, 6, 10, 0, 30, 36, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (27, 6, 10, 0, 30, 37, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (28, 6, 10, 0, 30, 38, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (29, 6, 10, 0, 30, 39, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (30, 6, 10, 0, 30, 40, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (31, 6, 10, 0, 30, 41, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (32, 6, 10, 0, 30, 42, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (33, 6, 10, 0, 30, 43, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (34, 6, 10, 0, 30, 44, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (35, 6, 10, 0, 30, 45, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (36, 6, 10, 0, 30, 46, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (37, 6, 10, 0, 30, 47, NULL, NULL);

    INSERT INTO music_store_db.OrdersDetail VALUES (38, 7, 5, 0, 15, 33, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (39, 7, 5, 0, 15, 34, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (40, 7, 5, 0, 15, 35, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (41, 7, 5, 0, 15, 36, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (42, 7, 5, 0, 15, 37, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (43, 7, 5, 0, 15, 38, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (44, 7, 5, 0, 15, 39, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (45, 7, 5, 0, 15, 40, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (46, 7, 5, 0, 15, 41, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (47, 7, 5, 0, 15, 42, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (48, 7, 5, 0, 15, 43, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (49, 7, 5, 0, 15, 44, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (50, 7, 5, 0, 15, 45, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (51, 7, 5, 0, 15, 46, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (52, 7, 5, 0, 15, 47, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (53, 7, 2, 0, 200, NULL, NULL, 1);
    
	INSERT INTO music_store_db.OrdersDetail VALUES (54, 8, 1, 0, 100, NULL, NULL, 1);
	INSERT INTO music_store_db.OrdersDetail VALUES (55, 8, 1, 10, 100, NULL, NULL, 2);
	INSERT INTO music_store_db.OrdersDetail VALUES (56, 8, 1, 10, 50, NULL, NULL, 3);
	INSERT INTO music_store_db.OrdersDetail VALUES (57, 8, 1, 0, 100, NULL, NULL, 4);
	INSERT INTO music_store_db.OrdersDetail VALUES (58, 8, 1, 5, 50, NULL, NULL, 5);
	INSERT INTO music_store_db.OrdersDetail VALUES (59, 8, 1, 5, 50, NULL, NULL, 6);
	INSERT INTO music_store_db.OrdersDetail VALUES (60, 8, 1, 10, 80, NULL, NULL, 7);
	INSERT INTO music_store_db.OrdersDetail VALUES (61, 8, 1, 10, 100, NULL, NULL, 8);
	INSERT INTO music_store_db.OrdersDetail VALUES (62, 8, 1, 5, 50, NULL, NULL, 9);
	INSERT INTO music_store_db.OrdersDetail VALUES (63, 8, 1, 2.5, 60, NULL, NULL, 10);
    
	INSERT INTO music_store_db.OrdersDetail VALUES (64, 9, 1, 0, 100, NULL, NULL, 1);
	INSERT INTO music_store_db.OrdersDetail VALUES (65, 9, 1, 10, 100, NULL, NULL, 2);
	INSERT INTO music_store_db.OrdersDetail VALUES (66, 9, 1, 10, 50, NULL, NULL, 3);
	INSERT INTO music_store_db.OrdersDetail VALUES (67, 9, 1, 0, 100, NULL, NULL, 4);
	INSERT INTO music_store_db.OrdersDetail VALUES (68, 9, 1, 5, 50, NULL, NULL, 5);
	INSERT INTO music_store_db.OrdersDetail VALUES (69, 9, 1, 5, 50, NULL, NULL, 6);
	INSERT INTO music_store_db.OrdersDetail VALUES (70, 9, 1, 10, 80, NULL, NULL, 7);
	INSERT INTO music_store_db.OrdersDetail VALUES (71, 9, 1, 10, 100, NULL, NULL, 8);
	INSERT INTO music_store_db.OrdersDetail VALUES (72, 9, 1, 5, 50, NULL, NULL, 9);
	INSERT INTO music_store_db.OrdersDetail VALUES (73, 9, 1, 2.5, 60, NULL, NULL, 10);
    INSERT INTO music_store_db.OrdersDetail VALUES (74, 9, 1, 1, 2, 1, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (75, 9, 1, 1, 2, 2, NULL, NULL); 
    INSERT INTO music_store_db.OrdersDetail VALUES (76, 9, 1, 1, 2, 3, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (77, 9, 1, 1, 2, 4, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (78, 9, 1, 1, 2, 5, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (79, 9, 1, 1, 2, 6, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (80, 9, 1, 1, 2, 7, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (81, 9, 1, 1, 2, 8, NULL, NULL);    
    INSERT INTO music_store_db.OrdersDetail VALUES (82, 9, 1, 1, 2, 9, NULL, NULL);
	INSERT INTO music_store_db.OrdersDetail VALUES (83, 9, 2, 46, 512, NULL, 1, NULL);

    INSERT INTO music_store_db.OrdersDetail VALUES (84, 10, 2, 0, 6, 21, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (85, 10, 2, 0, 6, 22, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (86, 10, 2, 0, 6, 23, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (87, 10, 2, 0, 6, 24, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (88, 10, 2, 0, 6, 25, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (89, 10, 2, 0, 6, 26, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (90, 10, 2, 0, 6, 27, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (91, 10, 2, 0, 6, 28, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (92, 10, 2, 0, 6, 29, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (93, 10, 2, 0, 6, 30, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (94, 10, 2, 0, 6, 31, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (95, 10, 2, 0, 6, 32, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (96, 10, 4, 4, 12, 10, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (97, 10, 4, 4, 12, 11, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (98, 10, 4, 4, 12, 12, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (99, 10, 4, 4, 12, 13, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (100, 10, 4, 4, 12, 14, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (101, 10, 4, 4, 12, 15, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (102, 10, 4, 4, 12, 16, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (103, 10, 4, 4, 12, 17, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (104, 10, 4, 4, 12, 18, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (105, 10, 4, 4, 12, 19, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (106, 10, 4, 4, 12, 20, NULL, NULL);
    INSERT INTO music_store_db.OrdersDetail VALUES (107, 10, 5, 0, 500, NULL, NULL, 1);

//


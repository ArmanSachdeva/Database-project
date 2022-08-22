-- DIEGO 3 STORED PROCEDURES
-- -------------------------
-- 1
USE music_store_db;

DELIMITER //

DROP TRIGGER IF EXISTS OrderDetail_ValidateUniqueIdBeforeInsert;
//

CREATE TRIGGER OrderDetail_ValidateUniqueIdBeforeInsert
BEFORE INSERT ON OrdersDetail
FOR EACH ROW
BEGIN

	DECLARE result INT;

    SELECT
		IF(NEW.track_id IS NOT NULL, 1, 0) + IF(NEW.combo_id IS NOT NULL, 1, 0) + IF(NEW.instrument_id IS NOT NULL, 1, 0)
    INTO result;

	IF (result <> 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only one foreign key can be set between track_id, combo_id or instrument_id';
    END IF;
  
END
//


-- 2
DROP TRIGGER IF EXISTS Inventory_ValidateUniqueIdBeforeInsert;
//

CREATE TRIGGER Inventory_ValidateUniqueIdBeforeInsert
BEFORE INSERT ON Inventory
FOR EACH ROW
BEGIN

	DECLARE result INT;

    SELECT
		IF(NEW.track_id IS NOT NULL, 1, 0) + IF(NEW.instrument_id IS NOT NULL, 1, 0)
    INTO result;

	IF (result <> 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only one foreign key can be set between track_id or instrument_id';
    END IF;
  
END
//



-- 3

DROP TRIGGER IF EXISTS Orders_UpdateAuditAfterInsert;
//

CREATE TRIGGER Orders_UpdateAuditAfterInsert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN

INSERT INTO OrdersAudit
	(order_audit_date, order_id, amount, employee_id, client_id)
SELECT 
	NOW(), NEW.order_id, 0, NEW.employee_id, NEW.client_id;
  
END
//

DROP TRIGGER IF EXISTS OrdersDetail_UpdateAuditAfterInsert;
//

CREATE TRIGGER OrdersDetail_UpdateAuditAfterInsert
AFTER INSERT ON OrdersDetail
FOR EACH ROW
BEGIN

INSERT INTO OrdersDetailAudit
	(order_detail_history_id, order_detail_id, combo_id, track_id, instrument_id, price, discount)
SELECT
	order_detail_id, combo_id, track_id, instrument_id, price * quantity, discount
FROM OrdersDetail;

  
END
//

-- SANJAY 3 STORED PROCEDURES
-- --------------------------
-- 1. Procedure to get order details based on Year and Month provided

DELIMITER //

CREATE PROCEDURE order_details_proc(date_in varchar(40))
BEGIN 

select store_id,a.order_id,order_detail_id,quantity,price,discount,track_id,combo_id,instrument_id from orders a, ordersdetail b
        where a.order_id = b.order_id
        AND  date_format(order_date,'%Y-%m')=date_in;

END//


call order_details_proc('2021-11');


-- 2. Function to count total orders for a customer based on phone number
DELIMITER //
CREATE FUNCTION Calculate_orders(phone_no_in varchar(20)) RETURNS INT
BEGIN
    DECLARE order_count FLOAT;
    select count(distinct a.order_id) INTO order_count from orders a, ordersdetail b,clients c,contacts d
        where a.order_id = b.order_id
        AND a.client_id = c.client_id
        AND c.contact_id = d.contact_id
        AND phone_no=phone_no_in;
	RETURN order_count;
END//

select  Calculate_orders('510-114-3575');


-- 3. Procedure to calculate purchase_history for a customer based on email

   DELIMITER //

        CREATE PROCEDURE customer_purchase_history(email_in varchar(40))
        BEGIN 
        
        select email,sum(quantity),sum(price)
         from orders ord, ordersdetail ordl,clients a, contacts co, address b , cities c, provinces d
       where  ord.order_id = ordl.order_id
       AND ord.client_id = a.client_id
       AND a.contact_id = co.contact_id
       AND a.address_id = b.address_id
       AND b.city_id = c.city_id
       AND c.province_id = d.province_id
       AND email=email_in;
        
        END  //
		
		 call customer_purchase_history('charles@hotmail.com');






-- ARMAN 3 stored procedures
-- -------------------------
-- 1. Trigger to verify if price is > 0 for new inserts 

  DELIMITER //
	CREATE TRIGGER price_inventory_before_INSERT 
	BEFORE INSERT ON inventory
	FOR EACH ROW
	BEGIN
		IF NEW.price < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid invoice amount';
		END IF;
	END//
	

-- 2. Trigger to verify if price is > 0 for updates

	DELIMITER //
	CREATE TRIGGER price_inventory_before_update 
	BEFORE UPDATE ON inventory
	FOR EACH ROW
	BEGIN
		IF NEW.price < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid invoice amount';
		END IF;
	END//
	
-- 3. Procedure to get customer details based on email provided

DELIMITER //

CREATE PROCEDURE customer_details_proc(email_in varchar(40))
BEGIN 

select first_name,last_name,email,phone_no,address_1,address_2,zip_code,name,city_name from clients a, contacts co, address b , cities c, provinces d
       where a.contact_id = co.contact_id
       AND a.address_id = b.address_id
       AND b.city_id = c.city_id
       AND c.province_id = d.province_id
       AND email= email_in
       ORDER by name,city_name;

END//


call customer_details_proc('Rhopper1@gmail.com');


-- 1. Display a list of clients that spent more than the average spent by clients in the past month.

	   SELECT DISTINCT first_name,last_name,email FROM clients a, contacts co,orders c,ordersdetail d
       WHERE a.contact_id = co.contact_id
       AND a.client_id = c.client_id
       AND c.order_id = d.order_id
       AND price > (    
       SELECT AVG(price) FROM ordersdetail a, orders b
       WHERE a.order_id = b.order_id
       AND date_format(order_date,'%Y-%M')= '2021-November');
		
		
-- 2. The top sold and least sold instruments over a month.

		SELECT name AS instrument_name,quantity AS "most quantities sold" FROM orders a, ordersdetail b, instruments c
        WHERE a.order_id = b.order_id
        AND b.instrument_id = c.instrument_id
        AND c.instrument_id IS NOT NULL
        AND date_format(order_date,'%Y-%M')= '2021-October'
		ORDER BY quantity DESC
        LIMIT 1;
        
		SELECT name AS instrument_name,quantity AS "least quantities sold" FROM orders a, ordersdetail b, instruments c
        WHERE a.order_id = b.order_id
        AND b.instrument_id = c.instrument_id
        AND c.instrument_id is not null
        AND date_format(order_date,'%Y-%M')= '2021-October'
		ORDER BY quantity ASC
        LIMIT 1;
		
		
	

-- 3. The maximum price of products in the same genre (for example, rock, pop, country, hip-hop). Use GROUP BY to list all the genres AND their maximum price.

	    SELECT genre,max(price) FROM tracks a, inventory b
        WHERE a.track_id = b.track_id
        GROUP BY genre;

-- 4. List how many customers the system has by location (Country, Province, AND City), AND then sort them.

	   SELECT first_name,last_name,email,name as province_name,city_name FROM clients a, contacts co, address b , cities c, provinces d
       WHERE a.contact_id = co.contact_id
       AND a.address_id = b.address_id
       AND b.city_id = c.city_id
       AND c.province_id = d.province_id
       ORDER BY name,city_name;


-- 5. List how many quantities the store has sold for a particular month.
		
		SELECT sum(quantity) FROM orders a, ordersdetail b
        WHERE a.order_id = b.order_id
        AND date_format(order_date,'%Y-%M')= '2021-October';
		

-- 6. List how many DISTINCT albums each singer has.

		SELECT artist,count(DISTINCT title) FROM albums a, tracks b
        WHERE a.album_id = b.album_id
        GROUP BY artist;
		
		
-- 7. List how many copies of an album are available of a particular singer.
		
		SELECT artist,name as album_name,title,quantity FROM albums a
        INNER JOIN tracks b
        ON a.album_id = b.album_id
        INNER JOIN inventory c
        ON b.track_id = c.track_id;
        
        
        
--  QUERY 1 : User wishes to view ranking of items in terms of most items sold after a specific date
-- Instruments sold the most after October 27, 2021
-- Tracks sold the most after October 27, 2021
-- Tracks and Instruments sold the most after October 27, 2021 within Combos

USE music_store_db;

-- PARTITION BY B.Type, B.overall_quantity 

SELECT *,DENSE_RANK() OVER(ORDER BY B.overall_quantity DESC) as TheRank
FROM (
SELECT A.Type,A.Item_Name,SUM(quantity) overall_quantity
FROM
(
SELECT o.order_id, o.order_date, o.store_id, od.quantity,
IF (od.track_id IS NOT NULL, t.title, i.name) as 'Item_Name', 
IF (od.track_id IS NOT NULL, 'TRACK', 'INSTRUMENT') as 'Type'
FROM Orders o
	INNER JOIN OrdersDetail od ON o.order_id = od.order_id
     LEFT JOIN Tracks t ON od.track_id = t.track_id
     LEFT JOIN Instruments i ON od.instrument_id = i.instrument_id
WHERE od.combo_id IS NULL
UNION
SELECT o.order_id, o.order_date, o.store_id,od.quantity,
	i.name as 'Item_Name',
    'INSTRUMENT' as 'Type'
FROM Orders o
	INNER JOIN OrdersDetail od ON o.order_id = od.order_id
    LEFT JOIN CombosHasInstruments chi ON od.combo_id = chi.combo_id
    LEFT JOIN Instruments i ON chi.instrument_id = i.instrument_id
WHERE od.combo_id IS NOT NULL
UNION
SELECT o.order_id, o.order_date, o.store_id,od.quantity, 
	t.title as 'Item_Name',
    'TRACK' as 'Type'
FROM Orders o
	INNER JOIN OrdersDetail od ON o.order_id = od.order_id
    LEFT JOIN CombosHasTracks cht ON od.combo_id = cht.combo_id
    LEFT JOIN Tracks t ON cht.track_id = t.track_id
WHERE od.combo_id IS NOT NULL
) A
WHERE order_date >= '2021-10-27'
GROUP BY A.Type,A.Item_Name
ORDER BY A.Type,A.Item_Name
) B
ORDER BY B.Type,TheRank
;





--  Query 2 : Customer details along with last purchase date for specific email :
SELECT first_name,last_name,email,phone_no,address_1,address_2,zip_code,city_name,name as province_name,city_name,MAX(order_date) as last_purchase_on
 FROM clients a, contacts co, address b , cities c, provinces d, orders e
       WHERE a.contact_id = co.contact_id
       AND a.address_id = b.address_id
       AND b.city_id = c.city_id
       AND c.province_id = d.province_id
       AND a.client_id=e.client_id
       AND email='PSTARK@gmail.com';
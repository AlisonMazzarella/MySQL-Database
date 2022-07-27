INSERT INTO artist (artist_id, fname, mname, lname, dob, dod, country, local) VALUES (9, ‘Johannes’, ‘’, ‘Vermeer’, 1632, 1674, ‘Netherlands’, ‘n’);

SELECT * FROM v_art.artist ORDER BY lname ASC;

UPDATE v_art.artist SET dod = 1675 WHERE artist_id = 9;

DELETE FROM v_art.artist WHERE artist_id = 9; 

SELECT first_name, last_name, phone, city FROM bike.customer WHERE city = 'Houston';

SELECT product_name, list_price FROM bike.product ORDER BY list_price DESC;

SELECT first_name, last_name, email FROM bike.staff WHERE store_id != 1;

SELECT product_name, model_year, list_price FROM bike.product WHERE product_name like '%SPIDER%';

SELECT product_name, list_price FROM bike.product WHERE list_price BETWEEN '500' AND '550' ORDER BY list_price ASC;

SELECT first_name, last_name, phone, street, city, state, zip_code FROM bike.customer WHERE phone IS NOT NULL AND city like '%ach%' OR last_name = 'William' LIMIT 5;
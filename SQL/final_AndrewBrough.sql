/*
Name: Andrew Brough
Date: March 9, 2018
*/

DROP DATABASE IF EXISTS db_premiere_products;
CREATE DATABASE db_premiere_products;
USE db_premiere_products;


DROP TABLE IF EXISTS tbl_rep;
CREATE TABLE tbl_rep
(
	rep_num     	CHAR(2) PRIMARY KEY,
	last_name   	CHAR(15) NOT NULL,
	first_name  	CHAR(15)  NOT NULL,
	street      	CHAR(15)  NOT NULL,
	city        	CHAR(15)  NOT NULL,
	state       	CHAR(2)  NOT NULL,
	zip         	CHAR(5)  NOT NULL,
	commission  	DECIMAL(7,2) UNSIGNED  NOT NULL,
	rate        	DECIMAL(3,2) UNSIGNED  NOT NULL
);

DROP TABLE IF EXISTS tbl_customer;
CREATE TABLE tbl_customer
(
	customer_num 	CHAR(3) PRIMARY KEY,
	customer_name 	CHAR(35) NOT NULL,
	street 		CHAR(15)  NOT NULL,
	city 		CHAR(15)  NOT NULL,
	state 		CHAR(2)  NOT NULL,
	zip 		CHAR(5)  NOT NULL,
	balance 	DECIMAL(8,2) UNSIGNED  NOT NULL,
	credit_limit 	DECIMAL(8,2) UNSIGNED  NOT NULL,
	rep_num 	CHAR(2)  NOT NULL,
        FOREIGN KEY(rep_num) REFERENCES tbl_rep(rep_num)
 );


DROP TABLE IF EXISTS tbl_orders;
CREATE TABLE tbl_orders
(
	order_num 	CHAR(5) PRIMARY KEY,
	order_date 	DATE  NOT NULL,
	customer_num 	CHAR(3)  NOT NULL,
	FOREIGN KEY(customer_num) REFERENCES tbl_customer(customer_num) 
);

DROP TABLE IF EXISTS tbl_part;
CREATE TABLE tbl_part
(
	part_num 	CHAR(4) PRIMARY KEY,
	description CHAR(15)  NOT NULL,
	on_hand 	DECIMAL(4,0)  NOT NULL,
	class 		CHAR(2)  NOT NULL,
	warehouse 	CHAR(1)  NOT NULL,
	price 		DECIMAL(6,2) UNSIGNED  NOT NULL
    );

DROP TABLE IF EXISTS tbl_order_line;
CREATE TABLE tbl_order_line
(
	order_num 	CHAR(5)  ,
	part_num 	CHAR(4)  ,
	num_ordered 	TINYINT UNSIGNED  NOT NULL,
	quoted_price 	DECIMAL(6,2) UNSIGNED  NOT NULL,
	PRIMARY KEY(order_num, part_num),
	FOREIGN KEY(order_num) REFERENCES tbl_orders(order_num),
	FOREIGN KEY(part_num)  REFERENCES tbl_part(part_num)
);

INSERT INTO tbl_rep
VALUES
('20','Kaiser','Valerie','624 Randall','Grove','FL','33321',20542.50,0.05),
('25','Smith','Greg','124 Jackson','Grove','FL','33321',10042.50,0.05),
('30','Burke','Mark','624 Capilano','Grove','FL','33321',30542.50,0.06),
('35','Hull','Richard','532 Jackson','Sheldon','FL','33553',39216.00,0.07),
('40','jackson','Joanne','124 Jackson','Sheldon','FL','33553',40000.00,0.08),
('65','Perez','Juan','1626 Taylor','Fillmore','FL','33336',23487.00,0.05);

INSERT INTO tbl_customer
VALUES
('148','Al''s Appliance and Sport','2837 Greenway','Fillmore','FL','33336',6550.00,7500.00,'20'),
('282','Brookings Direct','3827 Devon','Grove','FL','33321',431.50,10000.00,'35'),
('356','Ferguson''s','382 Wildwood','Northfield','FL','33146',5785.00,7500.00,'65'),
('408','The Everything Shop','1828 Raven','Crystal','FL','33503',5285.25,5000.00,'35'),
('462','Bargains Galore','3829 Central','Fillmore','FL','33321',3412.00,10000.00,'65'),
('524','Kline''s','838 Ridgeland','Fillmore','FL','33336',12762.00,15000.00,'20'),
('608','Johnson''s Department Store','372 Oxford','Sheldon','FL','33553',2106.00,10000.00,'65'),
('687','Lee''s Sport and Appliance','282 Evergreen','Altonville','FL','32543',2851.00,5000.00,'35'),
('725','Deerfield''s Four Seasons','282 Columbia','Sheldon','FL','33553',248.00,7500.00,'35'),
('842','All Season','28 Lakeview','Grove','FL','33321',8221.00,7500.00,'20');

INSERT INTO tbl_orders
VALUES
('21608','2010-10-20','148'),
('21610','2010-11-20','356'),
('21613','2010-10-21','408'),
('21614','2010-10-21','282'),
('21617','2010-11-23','608'),
('21619','2010-10-23','148'),
('21623','2010-11-25','608');


INSERT INTO tbl_part
VALUES
('AT94','Iron',50,'HW','3',24.95),
('BV06','Home Gym',45,'SG','2',794.95),
('CD52','Microwave Oven',32,'AP','1',165.00),
('DL71','Cordless Drill',21,'HW','3',129.95),
('DR93','Gas Range',8,'AP','2',495.00),
('DW11','Washer',12,'AP','3',399.99),
('FD21','Stand Mixer',22,'HW','3',159.95),
('KL62','Dryer',12,'AP','1',349.95),
('KT03','Dishwasher',8,'AP','3',595.00),
('KV29','Treadmill',9,'SG','2',1390.00);

INSERT INTO tbl_order_line
VALUES
('21608','AT94',11,21.95),
('21610','DR93',1,495.00),
('21610','DW11',1,399.99),
('21613','KL62',4,329.95),
('21614','KT03',2,595.00),
('21617','BV06',2,794.95),
('21617','CD52',4,150.00),
('21619','DR93',1,495.00),
('21623','KT03',2,1290.00);

SELECT * FROM tbl_rep;
SELECT * FROM tbl_customer;
SELECT * FROM tbl_orders;
SELECT * FROM tbl_part;
SELECT * FROM tbl_order_line;

# 1.)  Using only an Inner Join, display the customer number, name of the customer and the number of 
# orders that the customer placed in the month of October. Order the result by customer number.

SELECT DISTINCT tbl_customer.customer_num, customer_name, (SELECT COUNT(DISTINCT (order_num)) FROM tbl_orders WHERE tbl_customer.customer_num = tbl_orders.customer_num) AS 'Number of orders'
FROM tbl_customer INNER JOIN tbl_orders 
WHERE tbl_customer.customer_num = tbl_orders.customer_num
AND MONTH(order_date) = 10
ORDER BY tbl_customer.customer_num;

# 2.) Use only a sub query to find the rep number and rep name (first name and last name concatenated) 
# of each sales rep who represents at least one customer living in the  city Fillmore. Order the result by rep number.

SELECT rep_num, CONCAT(first_name, ' ', last_name) AS 'rep_name'
FROM tbl_rep
WHERE rep_num IN
(SELECT rep_num FROM tbl_customer
WHERE city = 'Fillmore')
ORDER BY rep_num;

# 3.) Use only a join to list the two part numbers, two part descriptions and one class for each pair of parts that are in 
# the same class. Give appropriate column names to duplicate named columns. For example, one such pair would be AT94 and FD21 because 
# both belong to class HW. Show such a pair  only once, that is don't show it as FD21 and AT94 again. Also do not include the pair with the same part numbers though, for example AT94 and AT94. 

SELECT DISTINCT P1.part_num 'Part One Number', P1.description 'Part One Description', P2.part_num 'Part Two Number', P2.description 'Part Two Description', P1.class
FROM tbl_part AS P1 INNER JOIN tbl_part AS P2
WHERE P1.class = P2.class
AND P1.part_num < P2.part_num
ORDER BY P1.part_num, P2.part_num;

# 4.) Use only a subquery and the ANY keyword (No inbuilt function allowed) to list the part number, part description, unit price and
#  class for each part that has a unit price greater than the unit price of every part in class HW.
SELECT part_num, description, price, class
FROM tbl_part 
WHERE price >= ANY
(SELECT price FROM tbl_part WHERE class != 'HW');


# 5.) Use only an outer join to list the part number, description and units on hand for each part that are not 
# on any order. Order the results by part number in descending order. 

SELECT tbl_part.part_num, description, on_hand
FROM tbl_part LEFT OUTER JOIN tbl_order_line
ON tbl_part.part_num = tbl_order_line.part_num
WHERE order_num IS NULL
ORDER BY tbl_part.part_num DESC;

# 6.) Find the number and name of each customer that currently has an order on file for a Home Gym (description of the part). 
# No other information is available so code the solution only based on information given.

SELECT customer_num, customer_name
FROM tbl_customer
WHERE customer_num IN
(SELECT customer_num FROM tbl_orders
WHERE order_num IN
(SELECT order_num FROM tbl_order_line
WHERE part_num IN
(SELECT part_num FROM tbl_part
WHERE description = 'Home Gym')));

# 7.) Display the customer city and the number of customers living in that city, only if there are at least two customers in the same city. Order the result by city. 

SELECT city, (SELECT SUM(city) FROM tbl_customer WHERE customer_num != customer_num)
FROM tbl_customer
ORDER BY city;

# 8.) List the order number, part number, part description and the difference between the price and its quoted price(price –quoted_price) 
# for those parts that are on order. Order the result by part number.

SELECT order_num, tbl_order_line.part_num, description, price, quoted_price, (SELECT (tbl_part.price - tbl_order_line.quoted_price)) AS 'Price Difference'
FROM tbl_part INNER JOIN tbl_order_line
WHERE tbl_part.part_num = tbl_order_line.part_num
ORDER BY part_num;



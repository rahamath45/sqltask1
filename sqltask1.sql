show databases ;

create database if not exists ecommerce ;
 use ecommerce ;
 create table if not exists customer(
    id INT AUTO_INCREMENT PRIMARY key ,
   name VARCHAR(100) ,
   email varchar(100),
   address varchar(80)
   ); 
   
   insert into customer (id,name,email,address) values
   (1,'nisha','nisha@gmail.com','pondy'),
   (2,'ansari','ansari@gmail.com','chennai'),
   (3,'imran','imran@gmail.com','madurai'),
   (4,'basha','basha@gmail.com','kovai'); 
 show tables ;
 select * from customer ;
 select * from products ;
select * from orders ;
select * from order_items;
 create table if not exists products(
    id INT AUTO_INCREMENT PRIMARY key ,
    name VARCHAR(100) ,
   price  decimal(10,2),
   description varchar(80)
   ); 
   
insert into products (id,name,price,description) values
   (1,'mobile',1000,'oppo mobile'),
   (2,'charger',500,'fast charger'),
   (3,'headset',400,'wired'),
   (4,'back cover',300,'mobile cover'),
   (5,'screen guard',200,'tempered guard');
   
   drop table products ;
create table if not exists orders(
    id INT AUTO_INCREMENT PRIMARY key ,
   customer_id int ,
   order_date date,
   total_amount decimal(10,2)
   ); 
   
 insert into orders (id,customer_id,order_date,total_amount) values
   (1,1,'2025-05-07',1600),
   (2,2,'2025-06-14',1200),
   (3,3,'2025-07-09',2100),
   (4,4,'2025-08-01',500);  
   
update orders set order_date = '2025-8-27' where id=3 ;
update orders set order_date = '2025-8-30' where id=4 ;

-- 1.Retrieve all customers who have placed an order in the last 30 days.
select distinct customer_id from orders where order_date > curdate() - interval 30 day;
-- 2.Get the total amount of all orders placed by each customer.
SELECT customer_id, SUM(total_amount) AS total_order_amount
FROM orders
GROUP BY customer_id;
-- 3.Update the price of Product C to 45.00.
update products set price = 45.00 where name = 'headset';
-- 4.Add a new column discount to the products table.
alter table products add column discount decimal(10,2);
-- 5. Retrieve the top 3 products with the highest price.
select id , name , price 
from products
order by price desc
limit 3 ;
-- 6.Join the orders and customers tables to retrieve the customer's name and 
  -- order date for each order. 
SELECT  name ,order_date 
from customer join orders on customer.id = orders.customer_id ;
-- 7.Retrieve the orders with a total amount greater than 150.00
select distinct id from orders where total_amount > 150 ;
-- 8.Normalize the database by creating a separate table for order items and
-- updating the orders table to reference the order_items table.
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT
);
insert into order_items(order_id,product_id,quantity) values
(1,1,1),(1,3,1),(1,5,1),(2,2,1),(2,3,1),(2,4,1),(3,1,1),
(3,2,1),(3,3,1),(3,5,1),(4,4,1),(4,5,1);
-- 9.Get the names of customers who have ordered Product A.
select distinct c.name
from customer c
join orders o on c.id = o.customer_id
join order_items oi on o.id = oi.order_id
join products p on oi.product_id = p.id 
where p.name = 'mobile' ;
-- 10.Retrieve the average total of all orders.
SELECT AVG(total_amount) AS avg_order_total
FROM orders;

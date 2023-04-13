create table Order1( customerid int auto_increment primary key, OrderName varchar(100),CustomerNo varchar(225), Price INT(10),DeliveryTimeDays INT(10),CustomerAdd VARCHAR(20));

insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Watch',767134529 ,2000,3,'Nashik');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Phone',9404204833 ,1000,2,'Pune');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Tshirt',9087654321,500,4,'Chennai'),('Clothes',8907654321,4500,2,'Chennai'),('Furniture',6768989991,890,8,'Kolkata');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Laptop',9673524012,65000,2,'Thane'),('Charger',971204980,300,12,'Kalyan'),('Keyboard',8882712345,3000,10,'Pimpri Chinchwad');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Mouse',8807034567,2000,20,'Jammu'),('Printer',7718349012,5000,12,'Panji'),('Frames',90129901211,1000,10,'Bhopal');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Phonecover',7917230918,100,3,'Jaipur');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Bottle',888066060,150,7,'Amravati');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Grocery',9373284091,2500,4,'Kolhapur');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Chairs',9919802301,3600,8,'Nagpur');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Sack',9919802201,909,8,'Pune');
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values  ('Fan',7867857890,1000,2,'Chennai'),('Headphones',8907909877,5000,8,'Amravati'),('Television',9080808909,20000,2,'Banglore');

UPDATE Order1 SET price=10000 WHERE OrderName='Phone';

SELECT * FROM Order1 ORDER BY CustomerAdd;

Alter table Order1 add CustomerAdd Varchar(20);

select OrderName from Order1 where CustomerAdd="Nashik";

select OrderName from Order1 where OrderName<>ALL(SELECT customerid from Payment);

select * from Order1  where exists (select * from Payment where Order1.CustomerAdd=Payment.Paymentid);

SELECT * FROM customer join Order1 on customer.customer_id=Order1.customerid join Payment on customer.customer_id=Payment.customerid;

SELECT customer.email_id,Order1.customerid,Order1.OrderName, Payment.Paymentid,Payment.method,Order1.Price,Payment.paymentdate,Order1.CustomerNo , Order1.CustomerAdd,Order1.DeliveryTimeDays 
From Order1
 INNER JOIN Payment ON Order1.customerid=Payment.customerid
 INNER JOIN customer ON Payment.customerid=customer.customer_id;

//Inner join of all tabbles;//
SELECT customer.email_id,order1.customerid,order1.OrderName, Payment.Paymentid,Payment.method,order1.Price,Payment.paymentdate,order1.CustomerNo , order1.CustomerAdd,order1.DeliveryTimeDays,product.product_id,product.product_description,product.category,product.quantity,product.price,product.thumbnail
   From order1
    INNER JOIN Payment ON order1.customerid=Payment.customerid
    INNER JOIN customer ON Payment.customerid=customer.customer_id
     INNER JOIN product ON customer.customer_id=product.product_id;
     
     
//THETA JOIN://

select order1.customerid,order1.OrderName,order1.price,payment.paymentid,payment.method
    from order1 join payment
    on order1.price > 500 and order1.customerid=payment.customerid


// Prodecure on display1()//
delimiter $$
 drop procedure if exists display1 $$

 create procedure display1()
     begin
    select "Thank you for placing order with us." as "output";
   end $$
 delimiter;
 call display1() ;



//Prodecure on city//
 delimiter $$
 drop procedure if exists city $$
create procedure city(out cnt int)
   begin
   select CustomerAdd as no_of_cities from order1;
    end $$
 delimiter ;
 call city(@a);


// Insert TRigger//
DELIMITER @@
CREATE TABLE MESSAGE (MSG VARCHAR(150));
create trigger ins_trgr before insert
on order1 for each row
begin
insert into message values ('values added into order1');
 end @@
insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values ('Sack',9090808070,800,6,'Sinnar');
   @@


//delete trigger//
DELIMITER $$
CREATE TABLE MESSAGE2 (MSG VARCHAR(150));
CREATE TRIGGER INS_MSG AFTER DELETE
 on order1 for each row
  begin
insert into message2 values ('order is cancelled');
 end $$
delete from order1 where customerid = 20;




///sorting on entire table
SELECT customer.email_id,Order1.customerid,Order1.OrderName, Payment.Paymentid,Payment.method,Order1.Price,Payment.paymentdate,Order1.CustomerNo , Order1.CustomerAdd,Order1.DeliveryTimeDays,product.product_id,product.product_description,product.category,product.quantity,product.price,product.thumbnail
     From Order1
         INNER JOIN Payment ON Order1.customerid=Payment.customerid
        INNER JOIN customer ON Payment.customerid=customer.customer_id
        INNER JOIN product ON customer.customer_id=product.product_id
         INNER JOIN Cart ON customer.customer_id=Cart.customerid
       order by order1.CustomerAdd ASC , order1.customerid desc;


///sorting on entire table
SELECT customer.email_id,Order1.customerid,Order1.OrderName, Payment.Paymentid,Payment.method,Order1.Price,Payment.paymentdate,Order1.CustomerNo , Order1.CustomerAdd,Order1.DeliveryTimeDays,product.product_id,product.product_description,product.category,product.quantity,product.price,product.thumbnail
     From Order1
         INNER JOIN Payment ON Order1.customerid=Payment.customerid
        INNER JOIN customer ON Payment.customerid=customer.customer_id
        INNER JOIN product ON customer.customer_id=product.product_id
         INNER JOIN Cart ON customer.customer_id=Cart.customerid
       order by order1.CustomerAdd ASC , order1.customerid desc;

// Insert trigger1..//
create table log (customer_id int, time timestamp);
 drop trigger order_log;
 delimiter @@
create trigger order_log after insert
     on Order1 for each row
          begin
          insert into log(customer_id,time) values(new.customerid,current_timestamp);
     end @@
  insert into Order1(OrderName, CustomerNo,Price,DeliveryTimeDays,CustomerAdd) values ('Bottles',9090808345,1000,5,'Dombivali');
     @@
 select * from log;
     @@


DELIMITER;
call insertOrder(27, "OrderName",1234567890, 1000, 10, "afvdv");

drop Procedure `insertOrder`;

DELIMITER %

CREATE PROCEDURE `insertOrder`(IN customerid INT,IN orderName VARCHAR(100), IN customerNumber VARCHAR(225), IN price INT, IN deliveryTime INT, IN address VARCHAR(20))
BEGIN
        INSERT INTO Order1 VALUES(customerid, orderName, customerNumber,  price , deliveryTime , address );
    END %


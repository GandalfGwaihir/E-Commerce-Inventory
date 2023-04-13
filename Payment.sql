create table Payment( paymentid int, customerid int auto_increment primary key, method varchar(100),paymentdate date, Amount INT(10));
insert into Payment(paymentid,method,paymentdate,Amount) values  (50,'COD','2023-02-01',10000);
insert into Payment(paymentid,method,paymentdate,Amount) values  (51,'UPI','2023-02-02',2000),
(52,'UPI','2023-02-03',1200),(53,'COD','2023-02-04',1500);
insert into Payment(paymentid,method,paymentdate,Amount) values  (54,'UPI','2023-02-05',5000);
insert into Payment(paymentid,method,paymentdate,Amount) values  (55,'UPI','2023-02-06',1000),(56,'COD','2023-02-07',20000),
(57,'UPI','2023-02-08',500);
insert into Payment(paymentid,method,paymentdate,Amount) values  (58,'UPI','2023-02-09',4500),(59,'UPI','2023-02-10',890),
    (60,'UPI','2023-02-11',65000),(61,'COD','2023-02-12',300);
insert into Payment(paymentid,method,paymentdate,Amount) values  (62,'CreditCard','2023-02-13',3000),(63,'CreditCard','2023-02-14',2000),(64,'COD','2023-02-17','5000'),(65,'UPI','2023-02-18',1000);
insert into Payment(paymentid,method,paymentdate,Amount) values  (66,'CreditCard','2023-02-20',3600),(67,'UPI','2023-02-21',2500),(68,'COD','2023-02-22','150'),(69,'CreditCard','2023-02-23',100);

//SELECT queries
 SELECT DISTINCT method from Payment;
 SELECT * FROM Payment ORDER BY Price;
 SELECT * FROM Payment ORDER BY Price desc;
 SELECT * FROM Payment WHERE method='COD' AND Price=2000;
 SELECT * FROM Payment WHERE method LIKE 'C%';

//Procedures
//Procedure to retrieve a particular payment
CREATE PROCEDURE `get_payment` (
    IN `p_paymentid` INT
)
BEGIN
    SELECT * FROM Payment
    WHERE paymentid = p_paymentid;
END

//Procedure to get all payment
CREATE PROCEDURE get_payments()
BEGIN
    SELECT * FROM Payment;
END

DELIMITER $$
CREATE PROCEDURE insertPayment(IN paymentid int, IN customerid int ,IN  method varchar(100), IN paymentdate date, IN Price INT(10))
    BEGIN
        INSERT INTO Payment VALUES( paymentid,method, paymentdate  , Price);
    END $$
DELIMITER ;


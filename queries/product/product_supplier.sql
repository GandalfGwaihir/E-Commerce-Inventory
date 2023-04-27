-- Active: 1682526204001@@127.0.0.1@3306@DBMS
CREATE TABLE product(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_description VARCHAR(1000),
    category VARCHAR(20),
    quantity INT,
    price INT,
    thumbnail VARCHAR(100),
    product_name VARCHAR(30),
    supplier_id INT NOT NULL);

 CREATE TABLE supplier(
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    rating INT,
    company_name VARCHAR(20),
    contact_number INT);

 ALTER TABLE supplier
    ADD FOREIGN KEY(supplier_id)
    REFERENCES product(product_id);
  
  
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "Shirt", 2);
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "Sweat Shirt", 1);
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "Tshirt", 6);
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "Jeans", 4);
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "Trousers", 8);
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "Jordans", 5);
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "Nike air", 1);
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "Puma One8", 3);
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "socks", 2);
INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "watches", 4);

SELECT * from product;
SELECT product_description from product;

/* equijoin */

SELECT * FROM product INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;


/* non equijoin */

SELECT * FROM product INNER JOIN supplier ON product.supplier_id = supplier.supplier_id AND product.price > 400;

/* self join */

SELECT * FROM product INNER JOIN product AS p2 ON product.supplier_id = p2.supplier_id;

/* outer join */

SELECT * FROM product LEFT JOIN supplier ON product.supplier_id = supplier.supplier_id;

/* use cursor on above tables  */

-- Path: product/product_supplier_cursor.sql

CREATE PROCEDURE product_supplier_cursor()

BEGIN

DECLARE product_id INT;

DECLARE product_description VARCHAR(1000);

DECLARE category VARCHAR(20);

DECLARE quantity INT;

DECLARE price INT;

DECLARE thumbnail VARCHAR(100);

DECLARE product_name VARCHAR(30);

DECLARE supplier_id INT;

DECLARE rating INT;

DECLARE company_name VARCHAR(20);

DECLARE contact_number INT;

DECLARE done INT DEFAULT FALSE;

DECLARE product_cursor CURSOR FOR SELECT * FROM product;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN product_cursor;

read_loop: LOOP

FETCH product_cursor INTO product_id, product_description, category, quantity, price, thumbnail, product_name, supplier_id;

IF done THEN

LEAVE read_loop;

END IF;

SELECT * FROM supplier WHERE supplier_id = supplier_id;

END LOOP;

CLOSE product_cursor;

END;

CALL product_supplier_cursor();

/* use trigger on above tables  */

-- Path: product/product_supplier_trigger.sql

CREATE TRIGGER product_supplier_trigger BEFORE INSERT ON product

FOR EACH ROW

BEGIN

INSERT INTO supplier(rating, company_name, contact_number) VALUES (5, "Nike", 1234567890);

END;

INSERT INTO product(product_description, category, quantity, price, thumbnail, product_name,supplier_id) VALUES ("Best product you'll find", "Clothes", 12, 450, "Image spave", "Shirt", 2);

SELECT * FROM supplier;

/* use stored procedure on above tables  */

-- Path: product/product_supplier_procedure.sql

CREATE PROCEDURE product_supplier_procedure()

BEGIN

SELECT * FROM product INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;

END;

CALL product_supplier_procedure();

/* use view on above tables  */

-- Path: product/product_supplier_view.sql

CREATE VIEW product_supplier_view AS SELECT * FROM product INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;

SELECT * FROM product_supplier_view;




/* use function on above tables  */

-- Path: product/product_supplier_function.sql

CREATE FUNCTION product_supplier_function() RETURNS INT

BEGIN

DECLARE product_id INT;

DECLARE product_description VARCHAR(1000);

DECLARE category VARCHAR(20);

DECLARE quantity INT;

DECLARE price INT;

DECLARE thumbnail VARCHAR(100);

DECLARE product_name VARCHAR(30);

DECLARE supplier_id INT;

DECLARE rating INT;

DECLARE company_name VARCHAR(20);

DECLARE contact_number INT;

DECLARE done INT DEFAULT FALSE;

DECLARE product_cursor CURSOR FOR SELECT * FROM product;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN product_cursor;

read_loop: LOOP

FETCH product_cursor INTO product_id, product_description, category, quantity, price, thumbnail, product_name, supplier_id;

IF done THEN

LEAVE read_loop;

END IF;

SELECT * FROM supplier WHERE supplier_id = supplier_id;

END LOOP;

CLOSE product_cursor;

RETURN 1;

END;

SELECT product_supplier_function();



/* procedure for insertProduct and table */
DELIMITER $$
CREATE PROCEDURE insertProduct(IN product_id BIGINT, IN product_description VARCHAR(100) , IN category VARCHAR(20), IN quantity INT, IN price INT, IN product_name VARCHAR(20), IN supplier_id INT)
    BEGIN
        SET @lastProductId = (SELECT product_id FROM product ORDER BY product_id DESC LIMIT 1);
        SET @newProductId = @lastCustomerId + 1;
        INSERT INTO product VALUES (@newProductId, product_description, category, quantity, price, product_name, supplier_id);
   END $$
DELIMITER;



/*Table */

CREATE TABLE product(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_description VARCHAR(1000),
    category VARCHAR(20),
    quantity INT,
    price INT,
    
    product_name VARCHAR(30),
    supplier_id INT NOT NULL);


ALTER TABLE product ADD customer_email_id varchar(50) 

DELIMITER $$
CREATE PROCEDURE getProductByEmail(IN customerEmailId varchar(50) )
    BEGIN
        SELECT * FROM `productBuyers`
        INNER JOIN product ON product.product_id = productBuyers.product_id 
        where productBuyers.customer_email_id = customerEmailId;
    END $$
DELIMITER;

DROP PROCEDURE getProductByEmail;

DELIMITER $$
CREATE PROCEDURE buyProduct(IN productId INT, IN customerEmailId varchar(50) )
    BEGIN
        if (SELECT COUNT(customer_id) from customer where customer.email_id = customerEmailId) = 0
        then 
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer does not exist';
        END IF;          

        if (SELECT quantity FROM product where product.product_id = productId) > 0 then
            UPDATE product
            SET product.quantity = product.quantity - 1
            where product.product_id = productId;
        INSERT INTO `productBuyers` VALUES (productId, customerEmailId);
        end if;
    END $$
DELIMITER;

call `buyProduct`(1, 'tejas.rokade21@vit.edu');


DROP PROCEDURE `buyProduct`;

DELIMITER $$    
CREATE PROCEDURE getAvailableProductById(IN productId INT)
    BEGIN
        SELECT * FROM product where product.product_id = productId ;
    END $$
DELIMITER;


UPDATE product
SET product.customer_email_id = 'soham.ratnaparkh@gmail.com'
where product.product_id = 2;

CALL getProductByEmail('soham.ratnaparkh@gmail.com');
CALL getProductByEmail('soham.ratnaparkh@gmail.com');

CALL buyProduct(1, 'tejas.rokade21@vit.edu');
CALL buyProduct(3, 'tejas.rokade21@vit.edu');
CALL buyProduct(1, 'soham.ratnaparkh@gmail.com');


CALL getProductByEmail('tejas.rokade21@vit.edu'); 
CALL getProductByEmail('abcd.efg@g.c'); 

DELIMITER $$
CREATE PROCEDURE getEmailByProductId(IN productId INT)
    BEGIN
        SELECT productBuyers.customer_email_id FROM `productBuyers` where productBuyers .product_id = productId;
    END $$
DELIMITER;

CALL getEmailByProductId(1);

CREATE TABLE productBuyers (
    product_id INT,
    customer_email_id varchar(50)
);

DELIMITER $$


CREATE PROCEDURE updateProduct(IN product_id BIGINT, IN product_description VARCHAR(100) , IN category VARCHAR(20), IN quantity INT, IN price INT, IN product_name VARCHAR(20), IN supplier_id INT)
    BEGIN
    UPDATE product 
    SET product.product_description = product_description, product.category = category, product.quantity = quantity, product.price = price, product.product_name = product_name, product.supplier_id = supplier_id
    WHERE product.product_id = product_id;
    END $$
DELIMITER

drop Procedure `updateProduct`
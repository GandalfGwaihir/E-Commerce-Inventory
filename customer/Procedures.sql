
DELIMITER $$

CREATE PROCEDURE getCustomerByLastName(IN lastName VARCHAR(20)) 
BEGIN 
	SELECT * FROM names WHERE last_name = lastName;
END$$ 

DELIMITER ;

CALL getCustomerByLastName('Messi');

DELIMITER $$

CREATE PROCEDURE getCustomerByLocation(IN searchLocation VARCHAR(20)) 
BEGIN 
	SELECT * FROM addresses
    INNER JOIN customer 
        ON addresses.address_id = customer.customer_id
    WHERE addresses.city = searchLocation; 
END$$ 

DELIMITER ;

CALL getCustomerByLocation ('Chennai');

DELIMITER $$
CREATE Procedure getTotalCustomers(OUT totalCount int)
BEGIN
    SELECT COUNT(customer_id) INTO totalCount FROM customer;
END$$
DELIMITER ;

CALL getTotalCustomers(@totalCount);
SELECT @totalCount;

DELIMITER $$
CREATE PROCEDURE getCustomerByFirstName(IN firstName VARCHAR(20))
BEGIN
    SELECT * FROM names 
    INNER JOIN customer 
        ON names.name_id = customer.customer_id
    WHERE first_name = firstName;
END$$

DELIMITER ;
CALL getCustomerByFirstName('Lionel');

DELIMITER $$
CREATE PROCEDURE customerFullBackup()
    BEGIN
        CALL `customerTableBackup`;
        CALL `addressesTableBackup`;
        CALL `namesTableBackup`;
    END $$
DELIMITER;

call `customerFullBackup`;

DELIMITER $$
CREATE PROCEDURE getLastCustomerId()
    BEGIN
        SELECT customer_id FROM customer ORDER BY customer_id DESC LIMIT 1;
    END $$
DELIMITER;

call `getLastCustomerId`;

DELIMITER $$
CREATE PROCEDURE insertCustomer(IN email_id VARCHAR(100), IN phone_no BIGINT, IN firstName VARCHAR(20), IN lastName VARCHAR(20), IN country VARCHAR(20), IN state VARCHAR(20), IN city VARCHAR(20), IN flat VARCHAR(20), IN pincode INT)
    BEGIN
        SET @lastCustomerId = (SELECT customer_id FROM customer ORDER BY customer_id DESC LIMIT 1);
        SET @newCustomerId = @lastCustomerId + 1;
        INSERT INTO customer VALUES (@newCustomerId, email_id, phone_no);
        INSERT INTO names (name_id, first_name, last_name) VALUES (@newCustomerId, firstName, lastName);
        INSERT INTO addresses VALUES (@newCustomerId, country, state, city, flat, pincode);
    END $$
DELIMITER;

call `insertCustomer`('email3.id@gmail.com', 1234567890, 'firstName', 'lastName', 'country', 'state', 'city', 'flat', 123456);

DELIMITER $$
CREATE PROCEDURE updateCustomer(IN customerId INT, IN email_id VARCHAR(100), IN phone_no BIGINT, IN firstName VARCHAR(20), IN lastName VARCHAR(20), IN country VARCHAR(20), IN state VARCHAR(20), IN city VARCHAR(20), IN flat VARCHAR(20), IN pincode INT)
    BEGIN
        UPDATE customer SET email_id = email_id, phone_no = phone_no WHERE customer_id = customerId;
        UPDATE names SET first_name = firstName, last_name = lastName WHERE name_id = customerId;
        UPDATE addresses SET country = country, state = state, city = city, flat = flat, pincode = pincode WHERE address_id = customerId;
    END $$
DELIMITER;

call updateCustomer(15, 'ema.il3@gmail.com', 1234567890, 'firstName', 'lastName', 'country', 'state', 'city', 'flat', 123456);

DELIMITER $$
CREATE PROCEDURE getCustomersWithBounds(IN lowerBound INT, IN upperBound INT)
    BEGIN 
        SELECT * FROM customer
        INNER JOIN names
        ON names.name_id = customer.customer_id 
        INNER JOIN addresses
        ON addresses.address_id = customer.customer_id
        WHERE customer.customer_id >= lowerBound AND customer.customer_id <= upperBound;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS getCustomersWithBounds;

call getCustomersWithBounds(10, 20);

DELIMITER $$
CREATE PROCEDURE insertOrder(IN orderName VARCHAR(100), IN customerNumber VARCHAR(225), IN price INT, IN deliveryTime INT, IN address VARCHAR(20))
    BEGIN
        INSERT INTO Order1 VALUES( orderName, customerNumber,  price , deliveryTime , address );
    END $$
DELIMITER;

drop PROCEDURE insertOrder ;

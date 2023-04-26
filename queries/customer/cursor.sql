DELIMITER $
CREATE PROCEDURE customerTableBackup() 
    BEGIN
        DECLARE done INT DEFAULT 0;
        DECLARE customer_id INT; 
        DECLARE phone_no BIGINT;
        DECLARE email_id VARCHAR(50);
        DECLARE cur CURSOR FOR SELECT * FROM customer;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
        OPEN cur;
        read_loop: LOOP
            FETCH cur INTO customer_id, email_id, phone_no;
            IF done = 1 THEN
                LEAVE read_loop;
            END IF;
            INSERT INTO customer_backup VALUES(customer_id, email_id, phone_no);
        END LOOP;
        CLOSE cur;
    END$
DELIMITER ;

CALL `customerTableBackup`();

CREATE TABLE address_backup(
    address_id INT,
    country VARCHAR(20),
    state VARCHAR(20),
    city VARCHAR(20),
    flat VARCHAR(20),
    pincode INT
);

DELIMITER $$
CREATE PROCEDURE addressesTableBackup() 
    BEGIN
        DECLARE done INT DEFAULT 0;
        DECLARE address_id INT; 
        DECLARE country VARCHAR(20);
        DECLARE state VARCHAR(20);
        DECLARE city VARCHAR(20);
        DECLARE flat VARCHAR(20);
        DECLARE pincode INT;
        DECLARE cur CURSOR FOR SELECT * FROM addresses;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
        OPEN cur;
        read_loop: LOOP
            FETCH cur INTO address_id, country, state, city, flat, pincode;
            IF done = 1 THEN
                LEAVE read_loop;
            END IF;
            INSERT INTO address_backup VALUES(address_id, country, state, city, flat, pincode);
        END LOOP;
        CLOSE cur;
    END$$
DELIMITER ;

CALL `addressesTableBackup`();

CREATE TABLE names_backup (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    name_id INT
);

DELIMITER $$
CREATE PROCEDURE namesTableBackup()
    BEGIN
        DECLARE done INT DEFAULT 0;
        DECLARE first_name VARCHAR(20);
        DECLARE last_name VARCHAR(20);
        DECLARE name_id INT;
        DECLARE cur CURSOR FOR SELECT * FROM names;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; 
        OPEN cur;
        read_loop: LOOP
            FETCH cur INTO first_name, last_name, name_id;
            IF done = 1 THEN
                LEAVE read_loop;
            END IF;
            INSERT INTO names_backup VALUES(first_name, last_name, name_id);
        END LOOP;
        CLOSE cur;
    END $$
DELIMITER ;

CALL namesTableBackup ;

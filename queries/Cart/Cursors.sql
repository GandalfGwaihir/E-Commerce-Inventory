CREATE TABLE CartBackup (
   customerid INT,
   ProductName VARCHAR(255),
   TotalPrice INT
);

DELIMITER $
CREATE PROCEDURE CartTableBackup() 
    BEGIN
        DECLARE done INT DEFAULT 0;
        DECLARE customerid INT; 
        DECLARE TotalPrice BIGINT;
        DECLARE ProductName VARCHAR(50);
        DECLARE cur CURSOR FOR SELECT * FROM Cart;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
        OPEN cur;
        read_loop: LOOP
            FETCH cur INTO customerid, ProductName, TotalPrice;
            IF done = 1 THEN
                LEAVE read_loop;
            END IF;
            INSERT INTO CartBackup VALUES(customerid, ProductName, TotalPrice);
        END LOOP;
        CLOSE cur;
    END$
DELIMITER ;

CALL CartTableBackup;

select * from CartBackup;

DELIMITER $$
CREATE TRIGGER CheckTotalPrice
    BEFORE INSERT ON cart
    FOR EACH ROW
    BEGIN
        IF NEW.TotalPrice < 0
            THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Total price cannot be negative';
        END IF;
    END$$
DELIMITER ;

-- This will give error
INSERT INTO cart(
    ProductName,
    TotalPrice
)
VALUES(
    "Oven",
    -22000
);

-- This will work
INSERT INTO cart(
    ProductName,
    TotalPrice
)
VALUES(
    "Oven",
    22000
);



CREATE TABLE cart_backup(
    customerid INT,
    ProductName VARCHAR(50),
    TotalPrice BIGINT
);

DELIMITER $$
CREATE TRIGGER CartDeleteBackupTrigger
    BEFORE DELETE ON cart
    FOR EACH ROW
    BEGIN
        INSERT INTO cart_backup VALUES(OLD.customerid, OLD.ProductName, OLD.TotalPrice);
    END$$
DELIMITER ;

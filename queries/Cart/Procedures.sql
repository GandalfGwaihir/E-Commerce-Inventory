DELIMITER $$

CREATE PROCEDURE getCustomerByCustomerID(IN CustomerID VARCHAR(20)) 
BEGIN 
	SELECT * FROM names WHERE name_id = CustomerID;
END$$ 

DELIMITER ;

CALL getCustomerByCustomerID('3');

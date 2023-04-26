CREATE VIEW expensive_products AS
SELECT ProductName, TotalPrice
FROM cart
WHERE TotalPrice > 5000;

-- To query the view and display the results, you can use the following command:

SELECT * FROM expensive_products;




CREATE VIEW cheap_products AS
SELECT ProductName, TotalPrice
FROM cart
WHERE TotalPrice < 10000;

-- To query the view and display the results, you can use the following command:

SELECT * FROM cheap_products;

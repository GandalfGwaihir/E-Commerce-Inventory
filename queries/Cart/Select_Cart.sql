SELECT *FROM Cart
    JOIN customer
    ON Cart.customerid = customer.customer_id
    ;

SELECT * FROM customer
    JOIN Cart
    ON customer.customer_id = Cart.customerid;

SELECT * FROM customer
    LEFT JOIN Cart
    ON customer.customer_id = Cart.customerid;

SELECT * FROM customer
    RIGHT JOIN Cart
    ON customer.customer_id = Cart.customerid;

SELECT * FROM customer
    CROSS JOIN Cart
    ON customer.customer_id = Cart.customerid;
    
SELECT *from cart order by customerid;

SELECT DISTINCT ProductName from Cart;

SELECT sum(TotalPrice) from cart;

SELECT * FROM CART WHERE TotalPrice='5000' or TotalPrice= '500';

SELECT customerid,ProductName
     From Cart
     WHERE TotalPrice is not NULL;

SELECT CURRENT_TIMESTAMP AS CurrentServerDateTime;

SELECT ASCII('A');
   


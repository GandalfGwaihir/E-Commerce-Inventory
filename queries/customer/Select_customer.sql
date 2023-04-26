SELECT DISTINCT city FROM addresses;

SELECT * FROM customer
    JOIN addresses
    ON customer.customer_id = addresses.address_id
    JOIN names
    ON customer.customer_id = names.name_id;


SELECT COUNT(address_id), city 
    FROM addresses
    GROUP BY city;


 SELECT * FROM addresses
    WHERE city = 'Pune' OR city = 'Mumbai';

SELECT * FROM addresses
    ORDER BY addresses.pincode;

SELECT COUNT(address_id), city FROM addresses
    GROUP BY city;

SELECT COUNT(address_id) as 'city_count', city FROM addresses 
    WHERE city is NOT NULL
    GROUP BY city 
    ORDER BY COUNT(address_id) DESC;

SELECT COUNT(address_id) as 'city_count', city FROM addresses 
    WHERE city is NOT NULL
    GROUP BY city 
    HAVING COUNT(address_id) > 1
    ORDER BY COUNT(address_id) DESC;

SELECT CURRENT_TIMESTAMP();

-- JOINS 

SELECT * FROM addresses
    JOIN customer
    ON addresses.address_id = customer.customer_id;

SELECT * FROM addresses
    INNER JOIN customer
    ON addresses.address_id = customer.customer_id;

SELECT * FROM customer
    JOIN names
    ON customer.customer_id = names.name_id
    JOIN addresses
    ON customer.customer_id = addresses.address_id;

SELECT * FROM customer
    JOIN names
    ON customer.customer_id = names.name_id
    JOIN addresses
    ON customer.customer_id = addresses.address_id
    WHERE customer.customer_id IN (SELECT address_id FROM addresses WHERE addresses.city IS NOT NULL);

SELECT * FROM customer
    JOIN addresses
    ON customer.customer_id = addresses.address_id
    JOIN names
    ON customer.customer_id = names.name_id
    JOIN Cart
    ON customer.customer_id = Cart.customerid
    JOIN Payment
    ON customer.customer_id = Payment.customerid;

SELECT * FROM customer
    INNER JOIN addresses
    ON customer.customer_id = addresses.address_id
    INNER JOIN names
    ON customer.customer_id = names.name_id
    INNER JOIN Cart
    ON customer.customer_id = Cart.customerid
    INNER JOIN Payment
    ON customer.customer_id = Payment.customerid;    

SELECT customer.email_id,Order1.customerid,Order1.OrderName, Payment.Paymentid,Payment.method,Order1.Price,Payment.paymentdate,Order1.CustomerNo , Order1.CustomerAdd,Order1.DeliveryTimeDays,product.product_id,product.product_description,product.category,product.quantity,product.price,product.thumbnail
   From Order1
    INNER JOIN Payment ON Order1.customerid=Payment.customerid
    INNER JOIN customer ON Payment.customerid=customer.customer_id
    INNER JOIN product ON customer.customer_id=product.product_id
    INNER JOIN Cart ON customer.customer_id=Cart.customerid;

SELECT *
FROM names
    JOIN customer ON names.name_id = customer.customer_id;

SELECT *
FROM customer
    JOIN addresses ON customer.customer_id = addresses.address_id;

SELECT *
FROM customer
    LEFT JOIN Cart ON customer.customer_id = Cart.customerid;

SELECT *
FROM customer
    RIGHT JOIN addresses ON customer.customer_id = addresses.address_id;

SELECT *
FROM names
    RIGHT JOIN customer ON names.name_id = customer.customer_id;

SELECT *
FROM customer
    CROSS JOIN names ON customer.customer_id = names.name_id;
CREATE VIEW Indian_Customers AS
SELECT * FROM addresses
INNER JOIN customer
ON addresses.address_id = customer.customer_id
WHERE addresses.country = 'India';

SELECT * FROM `Indian_Customers`;

CREATE VIEW Customers_with_city_given AS
SELECT * FROM addresses
JOIN customer
ON addresses.address_id = customer.customer_id
WHERE addresses.city IS NOT NULL;

SELECT * FROM `Customers_with_city_given`;

CREATE VIEW CitiesWithMoreThanOneCustomer AS
SELECT COUNT(address_id) as 'city_count', city FROM  addresses
WHERE addresses.city IS NOT NULL 
GROUP BY city
HAVING COUNT(address_id) > 1;

SELECT * FROM `CitiesWithMoreThanOneCustomer`;
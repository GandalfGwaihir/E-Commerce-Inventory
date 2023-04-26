
CREATE TABLE customer(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    email_id VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE customer
    ADD COLUMN
    phone_no INT;

CREATE TABLE addresses(
    address_id INT PRIMARY KEY,
    country VARCHAR(20) NOT NULL DEFAULT 'India',
    state VARCHAR(20),
    city VARCHAR(20),
    flat VARCHAR(100),
    pincode INT
);

ALTER TABLE customer
    MODIFY phone_no BIGINT;


ALTER TABLE addresses
    ADD FOREIGN KEY(address_id)
    REFERENCES customer(customer_id)
    ON DELETE CASCADE;

CREATE TABLE names(
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    name_id INT
);
ALTER TABLE names
    ADD FOREIGN KEY(name_id)
    REFERENCES customer(customer_id)
    ON DELETE CASCADE;
    
ALTER TABLE names ADD PRIMARY KEY(name_id);

DESC customer;
DESC addresses;
DESC names;


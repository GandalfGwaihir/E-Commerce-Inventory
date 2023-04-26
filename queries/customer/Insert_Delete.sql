INSERT INTO customer VALUES(1, 'a.a@gmail.com', 9404204833);
INSERT INTO addresses(address_id) VALUES(1);
INSERT INTO names VALUES('Rushikesh', 'Chandak', 1);

INSERT INTO customer VALUES(2, 'soham.ratnaparkh@gmail.com', 9767134529);
INSERT INTO addresses(address_id, city) VALUES(2, 'Pune');
INSERT INTO names VALUES('Soham', 'Ratnaparkhi', 2);

INSERT INTO customer VALUES(3, 'tejas.rokade21@vit.edu', 9404204567);
INSERT INTO addresses(address_id, city) VALUES(3, 'Mumbai');
INSERT INTO names VALUES('Tejas', 'Rokade', 3);

INSERT INTO customer VALUES(4, 'rohan.sasne@vit.edu', 8087702989);
INSERT INTO addresses(address_id, city) VALUES(4, 'Kolhapur');
INSERT INTO names VALUES('Rohan', 'Sasne', 4);

INSERT INTO customer VALUES(5, 'riya.loya@vit.edu', 8907909877);
INSERT INTO addresses(address_id, city) VALUES(5, 'Amravati');
INSERT INTO names VALUES('Riya', 'Loya', 5);

INSERT INTO customer VALUES(6, 'Lionel.messi@gmail.com', 7867857890);
INSERT INTO addresses(address_id, city) VALUES(6, 'Chennai');
INSERT INTO names VALUES('Lionel', 'Messi', 6);

INSERT INTO customer VALUES(7, 'Neymar.Santos@gmail.com', 9080808909);
INSERT INTO addresses(address_id, city) VALUES(7, 'Benglore');
INSERT INTO names VALUES('Neymar', 'Santos', 7);

INSERT INTO customer VALUES(8, 'Mahindrasingh.Dhoni@gmail.com', 9087654321);
INSERT INTO addresses(address_id, city) VALUES(8, 'Chennai');
INSERT INTO names VALUES('Mahindrasingh', 'Dhoni', 8);

INSERT INTO customer VALUES(9, 'Virat.Kohli@gmail.com', 8907654321);
INSERT INTO addresses(address_id, city) VALUES(9, 'Banglore');
INSERT INTO names VALUES('Virat', 'Kohli', 9);

INSERT INTO customer VALUES(10, 'Cristiano.Ronaldo@gmail.com', 6768989991);
INSERT INTO addresses(address_id, city) VALUES(10, 'Kolkata');
INSERT INTO names VALUES('Cristiano', 'Ronaldo', 10);

INSERT INTO customer(email_id, phone_no) VALUES('temp.temp@gmail.com', 6768989991);








UPDATE addresses SET city = 'Nashik' WHERE address_id = 1;

DELETE FROM customer WHERE customer_id = 1;

INSERT INTO customer VALUES(1, 'a.a@gmail.com', 9404204833);
INSERT INTO addresses(address_id) VALUES(1);
INSERT INTO names VALUES('Rushikesh', 'Chandak', 1); 
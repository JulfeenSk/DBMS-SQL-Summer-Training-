
CREATE DATABASE Pharmacy;

use pharmacy;
 
CREATE TABLE `company` (
 `COMPANY_NAME` varchar(50) NOT NULL,
 `ADDRESS` varchar(50) NOT NULL,
 `PHONE` varchar(20) NOT NULL
);

INSERT INTO `company` (`COMPANY_NAME`, `ADDRESS`, `PHONE`) VALUES
('Cipla', 'Mumbai', '12903'),
('Sun Pharma', 'Mysore', '01289078443'),
('Med_City', 'Nellore', '010114367832'),
('Pfizer', 'New York', '2125551234'),
('Johnson & Johnson', 'New Brunswick', '7325555555'),
('Roche', 'Basel', '4112345678'),
('GlaxoSmithKline', 'London', '2071234567'),
('AstraZeneca', 'Cambridge', '6175555555'),
('Novartis', 'Basel', '4112345678'),
('Merck', 'Darmstadt', '6151555555');

CREATE TABLE `drugs` (
 `DRUG_NAME` varchar(50) NOT NULL,
 `TYPE` varchar(20) NOT NULL,
 `BARCODE` varchar(20) NOT NULL,
 `DOSE` varchar(10) NOT NULL,
 `CODE` varchar(15) NOT NULL,
 `COST_PRICE` double NOT NULL,
 `SELLING_PRICE` double NOT NULL,
 `EXPIRY` varchar(20) NOT NULL,
 `COMPANY_NAME` varchar(50) NOT NULL,
 `PRODUCTION_DATE` date NOT NULL,
 `EXPIRATION_DATE` date NOT NULL,
 `PLACE` varchar(20) NOT NULL,
 `QUANTITY` int(11) NOT NULL
);

INSERT INTO `drugs` (`DRUG_NAME`, `TYPE`, `BARCODE`, `DOSE`, `CODE`, `COST_PRICE`, `SELLING_PRICE`, `EXPIRY`, `COMPANY_NAME`, `PRODUCTION_DATE`, `EXPIRATION_DATE`, `PLACE`, `QUANTITY`)
VALUES
('Novalo', 'Bills', 'fsdgjfihjorodsf', 'normal', '3d00', 2.0, 3.0, 'Available for use', 'Med_City', '2017-03-03', '2023-02-28', 'N-Right', 40),
('novafol', 'Bills', 'ftrkl432432md', 'normal', '2xaa', 33.0, 40.0, 'Available for use', 'Med_City', '2016-01-01', '2023-06-15', 'N-Left', 27),
('Breofin', 'Bills', 'sgnfsjkfnsdjfkb', 'Free used', '4r3x', 10.5, 12.0, 'Available for use', 'Med_City', '2018-05-10', '2023-08-20', 'S-West', 50),
('Morfin', 'Injection', 'nbhdl4978549', '1 (Day)', 'abcd1234', 15.0, 20.0, 'Available for use', 'Med_City', '2020-08-15', '2023-04-10', 'E-North', 30),
('Paracetamol', 'Tablet', 'qwertyuiop12345', '500mg', 'xyz9876', 1.5, 2.0, 'Available for use', 'Cipla', '2022-01-15', '2023-12-31', 'W-East', 100),
('Aspirin', 'Tablet', 'asdfghjkl67890', '200mg', 'mnopqrst12', 0.8, 1.0, 'Available for use', 'Pfizer', '2021-11-30', '2023-10-05', 'S-Central', 75),
('Amoxicillin', 'Capsule', 'zxcvbnm54321', '250mg', 'qwertyui789', 2.0, 2.5, 'Available for use', 'GlaxoSmithKline', '2019-07-20', '2023-09-15', 'N-West', 45),
('Lisinopril', 'Tablet', 'poiuytrewq09876', '10mg', 'asdfghjk789', 3.5, 4.0, 'Available for use', 'Novartis', '2020-04-05', '2023-07-25', 'E-South', 60),
('Atorvastatin', 'Tablet', 'mnbvcxzlkjhgfdsa', '20mg', 'zxcvbnm654', 2.2, 2.8, 'Available for use', 'Sun Pharma', '2021-06-12', '2023-11-20', 'W-West', 55),
('Omeprazole', 'Capsule', 'qwerty1234asdfg', '40mg', '12345abcde', 2.8, 3.5, 'Available for use', 'AstraZeneca', '2021-10-25', '2023-12-15', 'S-North', 70);

CREATE TABLE `expiry` (
 `PRODUCT_NAME` varchar(50) NOT NULL,
 `PRODUCT_CODE` varchar(20) NOT NULL,
 `DATE_OF_EXPIRY` date NOT NULL,
 `QUANTITY_REMAIN` int(11) NOT NULL
);

INSERT INTO `expiry` (`PRODUCT_NAME`, `PRODUCT_CODE`, `DATE_OF_EXPIRY`, `QUANTITY_REMAIN`)
VALUES
('Novalo', 'fsdgjfihjorodsf', '2023-02-28', 20),
('novafol', 'ftrkl432432md', '2023-06-15', 10),
('Breofin', 'sgnfsjkfnsdjfkb', '2023-08-20', 30),
('Morfin', 'nbhdl4978549', '2023-04-10', 15),
('Paracetamol', 'qwertyuiop12345', '2023-12-31', 50),
('Aspirin', 'asdfghjkl67890', '2023-10-05', 40),
('Amoxicillin', 'zxcvbnm54321', '2023-09-15', 25),
('Lisinopril', 'poiuytrewq09876', '2023-07-25', 35),
('Atorvastatin', 'mnbvcxzlkjhgfdsa', '2023-11-20', 42),
('Omeprazole', 'qwerty1234asdfg', '2023-12-15', 48);

CREATE TABLE `history_sales` (
 `USER_NAME` varchar(50) NOT NULL,
 `BARCODE` varchar(20) NOT NULL,
 `NAME` varchar(50) NOT NULL,
 `TYPE` varchar(10) NOT NULL,
 `DOSE` varchar(10) NOT NULL,
 `QUANTITY` int(11) NOT NULL,
 `PRICE` double NOT NULL,
 `AMOUNT` double NOT NULL,
 `DATE` varchar(15) NOT NULL,
 `TIME` varchar(20) NOT NULL
);
INSERT INTO `history_sales` (`USER_NAME`, `BARCODE`, `NAME`, `TYPE`, `DOSE`, `QUANTITY`, `PRICE`, `AMOUNT`, `DATE`, `TIME`)
VALUES
  ('John', 'fsdgjfihjorodsf', 'Novalo', 'Type A', 'Dose 1', 5, 10.99, 54.95, '2023-09-16', '10:00 AM'),
  ('Alice', 'ftrkl432432md', 'novafol', 'Type B', 'Dose 2', 3, 7.49, 22.47, '2023-09-16', '11:30 AM'),
  ('Bob', 'sgnfsjkfnsdjfkb', 'Breofin', 'Type A', 'Dose 1', 2, 14.99, 29.98, '2023-09-16', '01:15 PM'),
  ('Sarah', 'nbhdl4978549', 'Morfin', 'Type C', 'Dose 3', 1, 25.99, 25.99, '2023-09-16', '02:45 PM'),
  ('Michael', 'qwertyuiop12345', 'Paracetamol', 'Type A', 'Dose 2', 4, 6.25, 25.00, '2023-09-16', '03:30 PM'),
  ('Emily', 'asdfghjkl67890', 'Aspirin', 'Type B', 'Dose 1', 7, 11.49, 80.43, '2023-09-16', '04:20 PM'),
  ('David', 'zxcvbnm54321', 'Amoxicillin', 'Type C', 'Dose 3', 2, 19.99, 39.98, '2023-09-16', '05:10 PM'),
  ('Olivia', 'poiuytrewq09876', 'Lisinopril', 'Type D', 'Dose 2', 6, 8.75, 52.50, '2023-09-16', '06:00 PM'),
  ('James', 'mnbvcxzlkjhgfdsa', 'Atorvastatin', 'Type E', 'Dose 1', 3, 12.99, 38.97, '2023-09-16', '06:45 PM'),
  ('Emma', 'qwerty1234asdfg', 'Omeprazole', 'Type F', 'Dose 3', 1, 29.99, 29.99, '2023-09-16', '07:30 PM');
 
 CREATE TABLE `inbox` (
 `MESSAGE_FROM` varchar(20) NOT NULL,
 `MESSAGE_TO` varchar(20) NOT NULL,
 `MESSAGE_TEXT` varchar(200) NOT NULL
);
INSERT INTO `inbox` (`MESSAGE_FROM`, `MESSAGE_TO`, `MESSAGE_TEXT`)
VALUES
  ('John', 'Alice', 'Hi Alice, how are you?'),
  ('Alice', 'John', 'I am doing well, John. How about you?'),
  ('Bob', 'Sarah', 'Hey Sarah, did you see that movie last night?'),
  ('Sarah', 'Bob', 'Yes, I did! It was amazing!'),
  ('Michael', 'Emily', 'Hi Emily, do you want to grab coffee later?'),
  ('Emily', 'Michael', 'Sure, I would love to!'),
  ('David', 'Olivia', 'Hello Olivia, can you help me with that project?'),
  ('Olivia', 'David', 'Of course, David. Lets discuss it tomorrow.'),
  ('James', 'Emma', 'Hi Emma, how wass your day going?'),
  ('Emma', 'James', 'Its been good, James. Thanks for asking!');

CREATE TABLE `login` (
 `NAME` varchar(50) NOT NULL,
 `TYPE` varchar(20) NOT NULL,
 `DATE` varchar(20) NOT NULL,
 `TIME` varchar(20) NOT NULL
);

INSERT INTO `login` (`NAME`, `TYPE`, `DATE`, `TIME`)
VALUES
  ('John', 'Login', '2023-09-16', '08:30 AM'),
  ('Alice', 'Logout', '2023-09-16', '01:45 PM'),
  ('Bob', 'Login', '2023-09-16', '09:15 AM'),
  ('Sarah', 'Login', '2023-09-16', '10:00 AM'),
  ('Michael', 'Logout', '2023-09-16', '03:20 PM'),
  ('Emily', 'Login', '2023-09-16', '11:30 AM'),
  ('David', 'Login', '2023-09-16', '12:15 PM'),
  ('Olivia', 'Logout', '2023-09-16', '02:00 PM'),
  ('James', 'Login', '2023-09-16', '04:45 PM'),
  ('Emma', 'Logout', '2023-09-16', '05:30 PM');
  
CREATE TABLE `message_history` (
 `MESSAGE_FROM` varchar(20) NOT NULL,
 `MESSAGE_TO` varchar(20) NOT NULL,
 `MESSAGE_TEXT` varchar(200) NOT NULL
) ;

INSERT INTO `message_history` (`MESSAGE_FROM`, `MESSAGE_TO`, `MESSAGE_TEXT`)
VALUES
  ('John', 'Alice', 'Hi Alice, how are you?'),
  ('Alice', 'John', 'I am doing well, John. How about you?'),
  ('Bob', 'Sarah', 'Hey Sarah, did you see that movie last night?'),
  ('Sarah', 'Bob', 'Yes, I did! It was amazing!'),
  ('Michael', 'Emily', 'Hi Emily, do you want to grab coffee later?'),
  ('Emily', 'Michael', 'Sure, I would love to!'),
  ('David', 'Olivia', 'Hello Olivia, can you help me with that project?'),
  ('Olivia', 'David', 'Of course, David. Lets discuss it tomorrow.'),
  ('James', 'Emma', 'Hi Emma, how wass your day going?'),
  ('Emma', 'James', 'Its been good, James. Thanks for asking!'),
  ('Bob', 'John', 'Not too bad, John. How about you?'),
  ('Alice', 'Sarah', 'Sarah, have you tried that new restaurant?'),
  ('Sarah', 'Alice', 'Not yet, Alice. Is it good?'),
  ('Michael', 'David', 'David, we need to talk about the project.'),
  ('David', 'Michael', 'Sure, lets schedule a meeting.');



CREATE TABLE `purchase` (
 `BARCODE` varchar(20) NOT NULL,
 `NAME` varchar(50) NOT NULL,
 `TYPE` varchar(20) NOT NULL,
 `COMPANY_NAME` varchar(50) NOT NULL,
 `QUANTITY` int(11) NOT NULL,
 `PRICE` double NOT NULL,
 `AMOUNT` double NOT NULL
);



INSERT INTO `purchase` (`BARCODE`, `NAME`, `TYPE`, `COMPANY_NAME`, `QUANTITY`, `PRICE`, `AMOUNT`)
VALUES
  ('fsdgjfihjorodsf', 'Novalo', 'Type X', 'Company X', 5, 9.99, 49.95),
  ('ftrkl432432md', 'novafol', 'Type Y', 'Company Y', 3, 12.49, 37.47),
  ('sgnfsjkfnsdjfkb', 'Breofin', 'Type X', 'Company X', 2, 19.99, 39.98),
  ('nbhdl4978549', 'Morfin', 'Type Z', 'Company Z', 4, 15.25, 61.00),
  ('qwertyuiop12345', 'Paracetamol', 'Type A', 'Company A', 6, 5.99, 35.94),
  ('asdfghjkl67890', 'Aspirin', 'Type B', 'Company B', 7, 8.99, 62.93),
  ('zxcvbnm54321', 'Amoxicillin', 'Type C', 'Company C', 3, 24.99, 74.97),
  ('poiuytrewq09876', 'Lisinopril', 'Type D', 'Company D', 8, 14.75, 118.00),
  ('mnbvcxzlkjhgfdsa', 'Atorvastatin', 'Type E', 'Company E', 10, 11.49, 114.90),
  ('qwerty1234asdfg', 'Omeprazole', 'Type F', 'Company F', 5, 7.99, 39.95);

CREATE TABLE `sales` (
 `BARCODE` varchar(20) NOT NULL,
 `NAME` varchar(50) NOT NULL,
 `TYPE` varchar(10) NOT NULL,
 `DOSE` varchar(10) NOT NULL,
 `QUANTITY` int(11) NOT NULL,
 `PRICE` double NOT NULL,
 `AMOUNT` double NOT NULL,
 `DATE` varchar(15) NOT NULL
);

INSERT INTO `sales` (`BARCODE`, `NAME`, `TYPE`, `DOSE`, `QUANTITY`, `PRICE`, `AMOUNT`, `DATE`)
VALUES
  ('fsdgjfihjorodsf', 'Novalo', 'Type X', 'Dose A', 2, 9.99, 19.98, '2023-09-16'),
  ('ftrkl432432md', 'novafol', 'Type Y', 'Dose B', 3, 12.49, 37.47, '2023-09-16'),
  ('sgnfsjkfnsdjfkb', 'Breofin', 'Type X', 'Dose A', 1, 19.99, 19.99, '2023-09-16'),
  ('nbhdl4978549', 'Morfin', 'Type Z', 'Dose C', 4, 15.25, 61.00, '2023-09-16'),
  ('qwertyuiop12345', 'Paracetamol', 'Type A', 'Dose D', 5, 5.99, 29.95, '2023-09-16'),
  ('asdfghjkl67890', 'Aspirin', 'Type B', 'Dose E', 2, 8.99, 17.98, '2023-09-16'),
  ('zxcvbnm54321', 'Amoxicillin', 'Type C', 'Dose F', 3, 24.99, 74.97, '2023-09-16'),
  ('poiuytrewq09876', 'Lisinopril', 'Type D', 'Dose G', 1, 14.75, 14.75, '2023-09-16'),
  ('mnbvcxzlkjhgfdsa', 'Atorvastatin', 'Type E', 'Dose H', 6, 11.49, 68.94, '2023-09-16'),
  ('qwerty1234asdfg', 'Omeprazole', 'Type F', 'Dose I', 4, 7.99, 31.96, '2023-09-16');

CREATE TABLE `users` (
 `ID` int(11) NOT NULL,
 `USER_NAME` varchar(50) NOT NULL,
 `DOB` varchar(20) NOT NULL,
 `ADDRESS` varchar(100) NOT NULL,
 `PHONE` varchar(20) NOT NULL,
 `SALARY` double NOT NULL,
 `PASSWORD` varchar(20) NOT NULL
);

INSERT INTO `users` (`ID`, `USER_NAME`, `DOB`, `ADDRESS`, `PHONE`, `SALARY`, `PASSWORD`)
VALUES
  (1, 'John', '1985-03-15', '123 Main St, City, Country', '123-456-7890', 55000.00, 'password1'),
  (2, 'Alice', '1990-07-20', '456 Elm St, Town, Country', '987-654-3210', 60000.00, 'password2'),
  (3, 'Bob', '1988-12-10', '789 Oak St, Village, Country', '555-123-4567', 60000.00, 'password3'),
  (4, 'Sarah', '1995-05-25', '101 Pine St, Town, Country', '777-888-9999', 70000.00, 'password4'),
  (5, 'Michael', '1980-02-08', '222 Cedar St, City, Country', '111-222-3333', 75000.00, 'password5'),
  (6, 'Emily', '1992-11-30', '333 Maple St, Village, Country', '999-888-7777', 55000.00, 'password6'),
  (7, 'David', '1987-09-05', '444 Birch St, Town, Country', '444-555-6666', 80000.00, 'password7'),
  (8, 'Olivia', '1998-04-18', '555 Walnut St, City, Country', '666-777-8888', 70000.00, 'password8'),
  (9, 'James', '1986-06-22', '666 Spruce St, Village, Country', '222-111-4444', 65000.00, 'password9'),
  (10, 'Emma', '1993-08-12', '777 Oak St, City, Country', '555-666-7777', 72000.00, 'password10');

ALTER TABLE `company`
ADD PRIMARY KEY (`COMPANY_NAME`); -- COMPANY NAME

ALTER TABLE `users`
ADD PRIMARY KEY (`USER_NAME`); -- USER NAME

ALTER TABLE `drugs`
ADD PRIMARY KEY (`DRUG_NAME`); -- DRUG NAME

ALTER TABLE `purchase`
ADD PRIMARY KEY (`BARCODE`);

ALTER TABLE `expiry`
ADD PRIMARY KEY (`DATE_OF_EXPIRY`);



ALTER TABLE `history_sales`
ADD CONSTRAINT `fk_history_sales_users`
FOREIGN KEY (USER_NAME)
REFERENCES users(USER_NAME)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE `drugs`
ADD CONSTRAINT `fk_drugs_company`
FOREIGN KEY (COMPANY_NAME)
REFERENCES company(COMPANY_NAME)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE `login`
ADD CONSTRAINT `fk_login_users`
FOREIGN KEY (NAME)
REFERENCES users(USER_NAME)
ON UPDATE CASCADE
ON DELETE CASCADE;


ALTER TABLE `history_sales`
ADD CONSTRAINT `fk_history_sales_purchase`
FOREIGN KEY (BARCODE)
REFERENCES purchase(BARCODE)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE `expiry`
ADD CONSTRAINT `fk_expiry_purchase`
FOREIGN KEY (PRODUCT_CODE)
REFERENCES purchase(BARCODE)
ON UPDATE CASCADE
ON DELETE CASCADE;


ALTER TABLE `sales`
ADD CONSTRAINT `fk_sales_drugs`
FOREIGN KEY (NAME)
REFERENCES drugs(DRUG_NAME)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE `drugs`
ADD CONSTRAINT `fk_drugs_expiry`
FOREIGN KEY (EXPIRATION_DATE)
REFERENCES expiry(DATE_OF_EXPIRY)
ON UPDATE CASCADE
ON DELETE CASCADE;


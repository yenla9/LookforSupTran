DROP TABLE IF EXISTS cardholder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_catgory CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;
DROP TABLE IF EXISTS credit_holder CASCADE;
DROP TABLE IF EXISTS credit_trans CASCADE;
DROP TABLE IF EXISTS merchant_trans CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS card_holder CASCADE;

--Create card_holder Table------------------------
CREATE TABLE card_holder(
id integer NOT NULL PRIMARY KEY,
name VARCHAR(255) NOT NULL);

--Create credit_card Table------------------------
CREATE TABLE credit_card(
card VARCHAR(20) NOT NULL PRIMARY KEY,
cardholder_id integer NOT NULL,
FOREIGN KEY (cardholder_id) REFERENCES card_holder(id));

--Create merchant_catgory Table------------------------
CREATE TABLE merchant_catgory(
id integer NOT NULL PRIMARY KEY,
name VARCHAR(255) NOT NULL);

--Create merchant Table------------------------
CREATE TABLE merchant(
id integer NOT NULL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
id_merchant_category integer NOT NULL,
FOREIGN KEY (id_merchant_category) REFERENCES merchant_catgory(id));

--Create transaction Table------------------------
CREATE TABLE transaction (
id integer NOT NULL PRIMARY KEY,
date timestamp without time zone NOT NULL,
amount money,
card VARCHAR(20) NOT NULL,
FOREIGN KEY (card) REFERENCES credit_card(card),
id_merchant integer NOT NULL,
FOREIGN KEY (id_merchant) REFERENCES merchant(id));

--create a new table, credit_holder, after joing credit card and credit holder
CREATE TABLE credit_holder AS
SELECT * FROM credit_card as a JOIN card_holder as b ON(a.cardholder_id = b.id);

--Rename COLUMN to credit_holder_card for joining with other tables
ALTER TABLE credit_holder
RENAME COLUMN card TO credit_holder_card;

--Add Primary Key and drop duplicate column
ALTER TABLE credit_holder
ADD PRIMARY KEY (credit_holder_card),
ADD FOREIGN KEY (cardholder_id) REFERENCES card_holder(id),
ADD FOREIGN KEY (credit_holder_card) REFERENCES credit_card(card),
DROP COLUMN id;

--create a new table after joining credit holder and transaction
CREATE TABLE credit_trans AS
SELECT * FROM transaction as a JOIN credit_holder as b ON(a.card = b.credit_holder_card);

--Rename COLUMN to tran_id for joining with other tables
ALTER TABLE credit_trans
RENAME COLUMN id TO tran_id;

--Rename COLUMN to credit_name for joining with other tables
ALTER TABLE credit_trans
RENAME COLUMN name TO credit_name;

-- Add PRIMARY KEY for credit_trans table and Remove card_holder_card column
ALTER TABLE credit_trans
ADD PRIMARY KEY (tran_id),
ADD FOREIGN KEY (id_merchant) REFERENCES merchant(id),
DROP COLUMN credit_holder_card;

--create a new table after joining credit_trans and merchant
CREATE TABLE merchant_trans AS
SELECT * FROM credit_trans as a JOIN merchant as b ON(a.id_merchant = b.id);

-- Remove merchant_id column
ALTER TABLE merchant_trans
ADD PRIMARY KEY (tran_id),
ADD FOREIGN KEY (id_merchant) REFERENCES merchant(id),
DROP COLUMN id;


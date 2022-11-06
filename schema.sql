CREATE TABLE card_holder(
 id integer NOT NULL,
 name VARCHAR(255) NOT NULL);
 
 CREATE TABLE credit_card(
 card VARCHAR(20) NOT NULL,
 cardholder_id integer NOT NULL);
 
 CREATE TABLE merchant_catgory(
 id integer NOT NULL,
 name VARCHAR(255) NOT NULL);
 
 CREATE TABLE merchant(
 id integer NOT NULL,
 name VARCHAR(255) NOT NULL,
 id_merchant_category integer NOT NULL);
 
 CREATE TABLE transaction (
 id integer NOT NULL,
 date timestamp without time zone NOT NULL,
 amount money,
 card VARCHAR(20) NOT NULL,
 id_merchant integer NOT NULL);

--create a new table after joing credit card and credit holder
CREATE TABLE credit_holder AS
SELECT * FROM credit_card as a JOIN card_holder as b ON(a.cardholder_id = b.id);

--Remove id column 
ALTER TABLE credit_holder
DROP COLUMN id;

--create a new table after joining credit holder and transaction
CREATE TABLE credit_trans AS
SELECT * FROM transaction as a JOIN credit_holder as b ON(a.card = b.card_holder);

-- Remove card_holder column
ALTER TABLE credit_trans
DROP COLUMN card_holder;

--create a new table after joining credit_trans and merchant
CREATE TABLE merchant_trans AS
SELECT * FROM credit_trans as a JOIN merchant as b ON(a.id_merchant = b.merchant_id);

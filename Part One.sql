-- Isolate (or group) the transactions of each cardholder
-- Count the transactions that are less than $2.00 per cardholder.
--View the credit_holder table
SELECT*
FROM credit_holder;

--View the credit_trans table
SELECT*
FROM credit_trans;

-- Show count the transactions that are less than $2.00 per cardholder.
SELECT cardholder_id, count(*) AS transaction_count
FROM credit_trans
WHERE amount < Money(2.00)
GROUP by cardholder_id
ORDER BY (count(*))DESC;

--Validate name and transaction with merchant purchase
SELECT *
FROM credit_trans as a
INNER JOIN merchant as b ON a.id_merchant = b.merchant_id
WHERE CAST (a.name AS text) = 'Stephanie Dalton' AND amount < Money(2.00)

-- Show count the transactions that are less than $2.00 per card.
SELECT card, count(*) AS transaction_count
FROM transaction
WHERE(transaction.card IN 
	   ( SELECT credit_card.card
         FROM credit_card
         WHERE (credit_card.cardholder_id IN ( 
			 SELECT card_holder.id
             FROM card_holder
		 	 ))))
 AND amount < Money(2.00)
 GROUP BY card
 ORDER BY (count(*)) DESC;

 -- Top 3 validations for card after joining with merchant
 SELECT *
 FROM transaction as a
 INNER JOIN merchant as b ON a.id_merchant = b.merchant_id
 WHERE CAST (card AS bigInt)= 376027549341849 AND amount < Money(2.00)
 ORDER BY id_merchant;

 SELECT *
 FROM transaction as a
 INNER JOIN merchant as b ON a.id_merchant = b.merchant_id
 WHERE CAST (card AS bigInt)= 584226564303 AND amount < Money(2.00)
 ORDER BY id_merchant;
 
 SELECT *
 FROM transaction as a
 INNER JOIN merchant as b ON a.id_merchant = b.merchant_id
 WHERE CAST (card AS bigInt)= 344119623920892 AND amount < Money(2.00)
 ORDER BY id_merchant;
 
-- Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
-- No I didn't see any evidence to suggest that a credit card has been hacked. It didnt have repeated
-- charges from a merchant that would raise a red flag. 
 
 
-- What are the top 100 highest transactions made between 7:00 am and 9:00 am?
Select *
FROM credit_trans
WHERE CAST(date as TIME) >='07:00:00' and CAST(date as TIME) <= '9:00:00'
ORDER BY (amount) DESC
LIMIT 100;

--Do you see any anomalous transactions that could be fraudulent?
--No I don't see any transaction that could be fraudulent. 

--Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?
SELECT amount, COUNT(*) AS transaction_count
FROM credit_trans
WHERE CAST(date as TIME) >='21:00:00' and CAST(date as TIME) <= '24:00:00'
GROUP BY amount
ORDER BY (amount) DESC;

--There are much more transactions from 21:00 to 24:00 compared to other time interval. 
--In addition, 1:00 to 3:00 and 3:00 to 5:00 most people are asleep and there are still transactions.
--I would look more closely to these timeframes.

--What are the top 5 merchants prone to being hacked using small transactions?
SELECT merchant_name, Count(*) as transaction_count
FROM merchant_trans
WHERE amount <Money(2.00)
GROUP BY merchant_name
ORDER BY (count(*)) DESC
LIMIT 5;


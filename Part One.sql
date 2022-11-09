-- Isolate (or group) the transactions of each cardholder
SELECT cardholder_id, count(*) AS transaction_count
FROM credit_trans
GROUP by cardholder_id
ORDER BY (count(*))DESC;

-- Show count the transactions that are less than $2.00 per cardholder.
SELECT cardholder_id, count(*) AS transaction_count
FROM credit_trans
WHERE amount < Money(2.00)
GROUP by cardholder_id
ORDER BY (count(*))DESC;

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
SELECT amount,  COUNT(*) AS transaction_count
FROM credit_trans
WHERE CAST(date as TIME) >='21:00:00' and CAST(date as TIME) <= '24:00:00'
GROUP BY amount
ORDER BY (amount) DESC;

--There are much more transactions from 21:00 to 24:00 compared to other time interval. 
--In addition, 1:00am to 3:00am and 3:00am to 5:00am most people are asleep and there are still transactions.
--I would look into these timeframes.

--What are the top 5 merchants prone to being hacked using small transactions?
SELECT name, Count(*) as transaction_count
FROM merchant_trans
WHERE amount <Money(2.00)
GROUP BY name
ORDER BY (count(*)) DESC
LIMIT 5;


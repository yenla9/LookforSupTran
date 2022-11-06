select *
FROM card_holder
Where id = 2;

select*
FROM credit_card;

select*
FROM merchant;

select *
FROM merchant_catgory;

select *
FROM transaction;
-- Find the transaction date for purchases from card_holder id = 2
SELECT date
FROM transaction
WHERE card IN
  (
  SELECT card
  FROM credit_card
  WHERE cardholder_id IN
    (
    SELECT id
    FROM card_holder
    WHERE id = 2));

-- Find the transaction date for purchases from card_holder id = 18
SELECT date
FROM transaction
WHERE card IN
  (
  SELECT card
  FROM credit_card
  WHERE cardholder_id IN
    (
    SELECT id
    FROM card_holder
    WHERE id = 18));

      
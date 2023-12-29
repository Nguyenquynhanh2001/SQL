
--ex1:
WITH newtable AS (SELECT EXTRACT(YEAR FROM transaction_date),product_id, spend AS curr_year_spend,
                  LAG(spend) OVER(PARTITION BY product_id
                                  ORDER BY EXTRACT(YEAR FROM transaction_date)) AS prev_year_spend
FROM user_transactions)
SELECT *, ROUND((curr_year_spend - prev_year_spend)*100/prev_year_spend,2) AS yoy_rate FROM newtable

--ex2:
SELECT DISTINCT card_name, 
    FIRST_VALUE(issued_amount) OVER(PARTITION BY card_name 
                                    ORDER BY issue_year, issue_month) AS issued_amount
FROM monthly_cards_issued 
ORDER BY FIRST_VALUE(issued_amount) OVER(PARTITION BY card_name ORDER BY issue_year,issue_month) DESC

--ex3: 
WITH newtable AS( SELECT user_id, spend, RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) AS ranking, transaction_date FROM transactions )
SELECT user_id, spend, transaction_date FROM newtable
WHERE ranking = 3

--ex4:
WITH newtable AS(SELECT DATE(transaction_date) AS transaction_date	, user_id, product_id,
       FIRST_VALUE(transaction_date) OVER
       (PARTITION BY user_id ORDER BY DATE(transaction_date) DESC) AS date
FROM user_transactions)
SELECT transaction_date	, user_id, COUNT(*) AS purchase_count  FROM newtable
WHERE DATE(transaction_date) = DATE(date)
GROUP BY DATE(transaction_date), user_id
ORDER BY transaction_date

--ex5:






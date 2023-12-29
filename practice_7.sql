
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
WITH newtable AS
(SELECT user_id,
        tweet_date,
        tweet_count,
        LAG(tweet_count) OVER(PARTITION BY user_id ORDER BY tweet_date) AS pre_day,
        LAG(tweet_count,2) OVER(PARTITION BY user_id ORDER BY tweet_date) AS pre_2day
FROM tweets)
SELECT user_id, tweet_date, ROUND(CAST((tweet_count + pre_day + pre_2day) AS DECIMAL)/3,2)   AS rolling_avg_3d 
FROM newtable 

--ex6:
SELECT user_id,
        tweet_date,
        tweet_count,
        ROUND(AVG(tweet_count) OVER(
              PARTITION BY user_id 
              ORDER BY tweet_date
              ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_avg_3d
  FROM tweets

--ex7:
WITH rank AS (SELECT category,
       product,
       SUM(spend) total_spend,
       RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS ranking 
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = '2022'
GROUP BY category, product)
SELECT category, product, total_spend
FROM rank 
WHERE ranking <=2

--ex8:
WITH song_top10 AS (SELECT global_song_rank.song_id, global_song_rank.rank  
FROM global_song_rank WHERE rank <= 10 ) 

SELECT artists.artist_name, DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS artist_rank
FROM song_top10 
JOIN songs ON song_top10.song_id = songs.song_id 
JOIN artists ON songs.artist_id = artists.artist_id
GROUP BY artists.artist_name 







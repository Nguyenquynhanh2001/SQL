
--ex1:
SELECT COUNT(DISTINCT big.company_id) FROM job_listings big
JOIN (SELECT company_id,job_id,title, description FROM job_listings small 
)AS big2 ON big.company_id=big2.company_id 
WHERE big.title = big2.title AND big.description = big2.description 
AND big.job_id != big2.job_id  

--ex2:
 WITH ranking_table AS (SELECT category, product, SUM(spend) AS total_spend, 
  RANK() OVER(
    PARTITION BY category
    ORDER BY SUM(spend) DESC) AS ranking 
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = '2022'
  GROUP BY category, product)
  
SELECT category, product, total_spend
FROM ranking_table
WHERE ranking <=2

--ex3:
SELECT COUNT(*) FROM (SELECT policy_holder_id FROM callers
GROUP BY policy_holder_id HAVING COUNT(*)>=3) AS member_count

--ex4:
SELECT pages.page_id  FROM pages
LEFT JOIN page_likes ON pages.page_id = page_likes.page_id
WHERE page_likes.user_id IS NULL
ORDER BY pages.page_id ASC

--ex5
WITH  month_actions AS(SELECT DISTINCT user_id,
CASE 
WHEN EXTRACT(MONTH FROM event_date)='07' then 7
WHEN EXTRACT(MONTH FROM event_date)='06' then 6 
ELSE '0000'
END AS month_action
FROM user_actions
WHERE EXTRACT(YEAR FROM event_date) ='2022' )

SELECT '7' AS month,COUNT(*) FROM (SELECT DISTINCT user_id FROM month_actions
WHERE month_action IN (6,7)
GROUP BY user_id HAVING COUNT(user_id)=2) AS user_idid

--ex6:
SELECT TO_CHAR(trans_date, 'YYYY-MM')
 AS month, country, 
COUNT(amount) AS trans_count, SUM(approved_total.approved_count) AS approved_count, SUM(trans_total.amount) AS trans_total_amount, SUM(approved_amount) AS approved_total_amount FROM Transactions trans_total
LEFT JOIN (SELECT id,
CASE WHEN state = 'approved' then 1 ELSE 0 END AS approved_count, amount AS approved_amount
FROM Transactions WHERE state='approved') AS approved_total
ON trans_total.id = approved_total.id 
GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country

--ex7:
SELECT sl1.product_id,first_year, sl1.quantity, sl1.price
FROM Sales sl1
JOIN (SELECT product_id, MIN(year) as first_year FROM Sales GROUP BY product_id ) AS sl2
ON sl1.product_id = sl2.product_id
WHERE sl1.year= sl2.first_year 

--ex8:
WITH cus2 AS (SELECT customer_id, COUNT(product_key) AS count FROM Customer 
GROUP BY customer_id)

SELECT customer_id FROM cus2
WHERE count = (SELECT COUNT(*) FROM Product)

--ex9
SELECT emp.employee_id FROM Employees emp 
LEFT JOIN (SELECT employee_id AS manager_id FROM Employees) AS mng ON emp.manager_id=mng.manager_id 
WHERE  salary < 30000 AND mng.manager_id IS NULL
ORDER BY emp.employee_id 

--ex10:
 SELECT COUNT(DISTINCT big.company_id) FROM job_listings big
JOIN (SELECT company_id,job_id,title, description FROM job_listings small 
GROUP BY big.company_id)AS big2 ON big.company_id=big2.company_id 
WHERE big.title = big2.title AND big.description = big2.description 
AND big.job_id != big2.job_id 

--ex11
WITH 
rated_user AS (SELECT user_id, COUNT(*) AS count FROM MovieRating
GROUP BY user_id),
rated_movie AS(SELECT movie_id, AVG(rating) AS avg FROM MovieRating 
WHERE EXTRACT(YEAR FROM created_at)='2020' AND EXTRACT(MONTH FROM created_at)='02' GROUP BY movie_id)

(SELECT Users.name AS results FROM rated_user, Users
WHERE rated_user.user_id = Users.user_id
ORDER BY count DESC, name ASC LIMIT 1)
UNION ALL 
(SELECT Movies.title AS results FROM rated_movie,Movies
WHERE rated_movie.movie_id =Movies.movie_id
ORDER BY avg DESC, title ASC LIMIT 1)

--ex12:
SELECT id, COUNT(DISTINCT friends) AS num  FROM (
    SELECT requester_id AS id, accepter_id AS friends FROM RequestAccepted
    UNION
    SELECT accepter_id AS id , requester_id AS friends FROM RequestAccepted) AS new
GROUP BY id ORDER BY COUNT(DISTINCT friends) DESC limit 1








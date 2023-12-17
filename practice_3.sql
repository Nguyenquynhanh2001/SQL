--ex1:
SELECT Name FROM STUDENTS
WHERE Marks >75 
ORDER BY RIGHT(Name,3), ID ASC 

--ex2: 
SELECT user_id, CONCAT(UPPER(LEFT(name,1)),LOWER(SUBSTRING(name FROM 2 FOR (LENGTH(name)-1)))) AS name FROM Users
ORDER BY user_id

--ex3:
SELECT manufacturer, '$'||ROUND(SUM(total_sales)/1000000) || ' million' FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer 

--ex4:
SELECT EXTRACT(MONTH FROM submit_date) AS mth, product_id, ROUND(AVG(stars), 2) AS avg_stars 
FROM reviews 
GROUP BY product_id, EXTRACT(MONTH FROM submit_date)
ORDER BY EXTRACT(MONTH FROM submit_date), product_id 

--ex5
SELECT sender_id, COUNT(message_id) FROM messages 

WHERE EXTRACT(YEAR FROM sent_date) ='2022'
AND EXTRACT(MONTH FROM sent_date) ='08'
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC 
LIMIT 2 

--ex6:
SELECT tweet_id FROM Tweets
WHERE LENGTH(content) > 15 

--ex7
SELECT activity_date, user_id FROM Activity 
WHERE activity_date BETWEEN DATE_SUB('2019-07-27',INTERVAL 29 DAY) AND '2019-07-27'
  
--ex8
SELECT COUNT(id) AS count_id from employees
WHERE EXTRACT(MONTH FROM joining_date) IN (1,2,3,4,5,6,7)
AND EXTRACT(YEAR FROM joining_date)=2022

--ex9
SELECT POSITION('a' IN 'first_name') AS position FROM worker
WHERE first_name ='Amitah'

--ex10
SELECT t SUBSTRING(title FROM LENGTH(winery)+2 FOR 4) FROM winemag_p2
WHERE country ='Macedonia'




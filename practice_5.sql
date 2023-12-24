--ex1: 
--1: input: COUNTRY.continent, CITY.population, COUNTRYCODE
-- output: COUNTRY.continent, AVG(population)/continent
SELECT CONTINENT, FLOOR(AVG(CITY.POPULATION)) AS avg_country  FROM COUNTRY
JOIN CITY ON COUNTRY.Code = CITY.CountryCode
GROUP BY COUNTRY.CONTINENT

--ex2:
SELECT ROUND(CAST(
COUNT(CASE WHEN signup_action = 'Confirmed' THEN 1 END)/COUNT(emails.email_id)
AS DECIMAL),2) FROM emails
FULL JOIN texts ON emails.email_id = texts.email_id

--ex3
SELECT ROUND(
CAST(COUNT(CASE WHEN signup_action = 'Confirmed' THEN 1 END) AS DECIMAL)
/CAST(COUNT(DISTINCT emails.email_id) AS DECIMAL)
,2) 
FROM emails
FULL JOIN texts ON emails.email_id = texts.email_id

--ex4
SELECT customer_id FROM customer_contracts AS cus
LEFT JOIN products AS p ON cus.product_id = p.product_id 
GROUP BY customer_id 
HAVING COUNT(DISTINCT products.product_category)>= COUNT(SELECT COUNT(DISTINCT product_category) FROM products);

--ex5
SELECT mng.employee_id,mng.name, COUNT(emp.employee_id) AS reports_count , ROUND(AVG(CAST(emp.age AS DECIMAL)),0) AS average_age 
FROM Employees emp
RIGHT JOIN Employees mng ON emp.reports_to = mng.employee_id 
WHERE emp.reports_to IS NOT NULL
GROUP BY mng.employee_id,mng.name
ORDER BY employee_id

--ex6
SELECT product_name, SUM(O.unit) AS unit
FROM Products P, Orders O
WHERE P.product_id = O.product_id AND EXTRACT(MONTH FROM order_date) = '02'
AND EXTRACT(YEAR FROM order_date) = '2020'
GROUP BY P.product_id,product_name HAVING SUM(O.unit)>=100

--ex7 
SELECT pages.page_id  FROM pages
LEFT JOIN page_likes ON pages.page_id = page_likes.page_id
WHERE page_likes.user_id IS NULL
ORDER BY pages.page_id ASC

-- Mid-course test

--ex1:
SELECT DISTINCT replacement_cost FROM film

SELECT MIN(replacement_cost) FROM film

--ex2:
SELECT 
COUNT(CASE WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
END) AS low,
COUNT(CASE WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
END) AS medium, 
COUNT(CASE WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high'
END )AS high 
FROM film

--ex3:
SELECT title, film.length,category.name
FROM film 
LEFT JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id 
WHERE category.name IN ('Drama','Sports')
ORDER BY film.length DESC 

--ex4:
SELECT category.name, COUNT(title)
FROM film 
LEFT JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id 
GROUP BY category.name
ORDER BY COUNT(title) DESC

--ex5:
SELECT CONCAT(
  actor.first_name
  ,' '
  ,actor.last_name
  ) AS fullname, COUNT(*)
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY fullname
ORDER BY COUNT(*) DESC

--ex6:
SELECT COUNT(*)
FROM address
LEFT JOIN customer ON address.address_id = customer.address_id
WHERE customer_id IS NULL 

--ex7:
SELECT city.city_id, city.city, SUM(amount)
FROM city
JOIN address ON city.city_id = address.city_id
JOIN customer ON address.address_id= customer.address_id
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY city.city_id, city.city 
ORDER BY SUM(amount) DESC

--ex8:
SELECT CONCAT(
  city.city
  ,','
  ,country.country
  ) AS city_country, SUM(amount)
FROM country
JOIN city ON country.country_id = city.country_id
JOIN address ON city.city_id = address.city_id
JOIN customer ON address.address_id= customer.address_id
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY country.country,city.city 
ORDER BY SUM(amount) DESC









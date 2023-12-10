--ex1:
SELECT NAME FROM CITY WHERE COUNTRYCODE ='USA' AND POPULATION > 120000;

--ex2:
SELECT * FROM CITY WHERE JPN;
--ex3:
SELECT CITY,STATE FROM STATION
--ex4:
--  SELECT DISTINCT CITY FROM STATION 
--WHERE CITY LIKE IN ('a%','e%','i%','o%','u%');
C2: SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';

--ex5:
SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '%a'OR CITY LIKE '%e'OR CITY LIKE'%i'OR CITY LIKE '%o'OR CITY LIKE '%u';

--ex6:
SELECT CITY FROM STATION WHERE (CITY NOT IN (SELECT CITY FROM STATION WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%'))

--ex7:	Submissions	Leaderboard	Discussionsiscussions. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name FROM Employee ORDER BY name

--ex8:
SELECT name FROM Employee WHERE salary > 2000 AND months<10 
ORDER BY employee_id 

--ex9:
SELECT product_id FROM Products WHERE low_fats ='Y' AND recyclable='Y';

--ex10:
SELECT name FROM Customer WHERE referee_id != 2 --- ke qua chi ra moi id=1 ma k co null
SELECT name FROM Customer WHERE referee_id != 2 OR referee_id IS NULL

--ex11
SELECT name, population, area FROM World
WHERE area>=3000000 OR population >=25000000

--ex12
SELECT DISTINCT author_id as id FROM Views
WHERE author_id = viewer_id ORDER BY author_id

--ex13
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date IS NULL

--ex14
SELECT *FROM lyft_drivers 
WHERE yearly_salary >=70000 OR yearly_salary <= 30000

--ex15
SELECT * FROM uber_advertising
WHERE year = 2019 AND money_spent > 100000




  

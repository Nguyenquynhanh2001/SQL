/*1. */
SELECT NAME FROM CITY WHERE COUNTRYCODE ='USA' AND POPULATION > 120000;

/*2.	Submissions	Leaderboard	Discussions	Editorial
Query all columns (attributes) for every row in the CITY table.*/
SELECT * FROM CITY;

/*3.Query all columns for a city in CITY with the ID 1661.*/
SELECT * FROM CITY WHERE ID = 1661;

/*4. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.*/
SELECT * FROM CITY WHERE JPN;

--ex2:
SELECT * FROM CITY WHERE JPN;
--ex3:

--ex4:
C1:  SELECT DISTINCT CITY FROM STATION 
WHERE CITY LIKE IN ('i.e.%','a%','e%','i%','o%','u%');-- em thử dùng cách này nhưng không được
C2: SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';

--ex5:
SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '%a'OR CITY LIKE '%e'OR CITY LIKE'%i'OR CITY LIKE '%o'OR CITY LIKE '%u';

--ex6:
SELECT CITY FROM STATION WHERE CITY NOT IN (SELECT CITY FROM STATION WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%');

--ex7:	Submissions	Leaderboard	Discussionsiscussions. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name FROM Employee ORDER BY name

--ex8:
SELECT name FROM Employee WHERE salary > 2000 AND months<10 
ORDER BY employee_id 

--ex9:
SELECT product_id FROM Products WHERE low_fats ='Y' AND recyclable='Y';



  

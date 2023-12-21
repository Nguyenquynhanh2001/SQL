
--ex1:
SELECT 
COUNT (CASE 
WHEN device_type='laptop' THEN 'laptop'
END) AS laptop_views,
COUNT(CASE 
WHEN device_type='phone' OR device_type='tablet'  THEN 'mobile'
END) AS mobile_views
FROM viewership

--ex2:
SELECT x,y,z,
CASE 
WHEN x+y>z AND x+z>y AND y+z>x THEN 'Yes' ELSE 'No'
END AS triangle
FROM Triangle 
--ex3

--ex4

--ex5

--ex6

--ex7

--ex8 

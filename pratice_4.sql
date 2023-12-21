
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
SELECT
CEILING(CAST(
COUNT(CASE WHEN COALESCE(call_category) OR call_category='n/a' THEN 'j' END)
*100/COUNT(call_category)) AS DECIMAL,1) AS call_percentage
FROM callers;

--ex4
SELECT
ROUND(CAST((COUNT(CASE WHEN call_category='n/a' THEN 'j' END) + COUNT(COALESCE(call_category))
)/COUNT(case_id) AS DECIMAL),1) FROM callers

--ex5
SELECT survived,
COUNT(CASE WHEN pclass=1 THEN 'first_class' END) AS first_class,
COUNT(CASE WHEN pclass=2 THEN 'second_class' END) AS second_class,
COUNT(CASE WHEN pclass=3 THEN 'third_class'END) AS third_class
FROM titanic
GROUP BY survived 


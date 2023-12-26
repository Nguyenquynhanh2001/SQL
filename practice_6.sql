--ex1:
SELECT COUNT(DISTINCT big.company_id) FROM job_listings big
JOIN (SELECT company_id,job_id,title, description FROM job_listings small 
)AS big2 ON big.company_id=big2.company_id 
WHERE big.title = big2.title AND big.description = big2.description 
AND big.job_id != big2.job_id  

--ex2:

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





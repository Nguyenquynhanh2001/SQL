--ex5
SELECT DISTINCT candidate_id FROM candidates
WHERE skill IN ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id HAVING COUNT(skill) = 3
ORDER BY candidate_id
--ex6

--ex7

--ex8

--ex9

--ex10

--ex11

--ex12


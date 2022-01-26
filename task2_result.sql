SELECT COUNT("DataID"), "UserName" 
FROM
(SELECT DISTINCT "c"."DataID", "UserName", "DataConfidLevel" FROM 
(SELECT "common"."UserID", "DataConfidLevel", "common"."DataID" 
FROM "common"
RIGHT JOIN "doc"
ON "common"."DataID" = "doc"."DataID") AS c 
LEFT JOIN "user"
ON "c"."UserID" = "user"."UserID"
WHERE "DataConfidLevel" = 'Коммерческая тайна') AS end_res GROUP BY "end_res"."UserName";

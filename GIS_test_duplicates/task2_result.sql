DROP TABLE IF EXISTS res;

CREATE TEMP TABLE res AS

(SELECT DISTINCT "c"."DataID", "UserName", "DataConfidLevel" FROM 
(SELECT "common"."UserID", "DataConfidLevel", "common"."DataID" 
FROM "common"
INNER JOIN "doc"
ON "common"."DataID" = "doc"."DataID") AS c 
INNER JOIN "user"
ON "c"."UserID" = "user"."UserID" AND "DataConfidLevel" = 'Коммерческая тайна');

SELECT * FROM

(SELECT "UserName",  COUNT("DataID") AS "ConfidDocsNum" 
FROM res 
GROUP BY "res"."UserName", "res"."DataConfidLevel") AS foo1

UNION

SELECT "UserName", '0' AS "ConfidDocsNum"
FROM
(SELECT "user"."UserName"
FROM "user"
	EXCEPT
SELECT "res"."UserName"
FROM "res") as foo;

--Q: How to extract first name from Contact Name?

--A: Well, here is your problem..
--CustomerName = Alejandra Camino -> Alejandra
-- Google search "how to extract first name from combined name tsql stack overflow"
-- 
WITH s1

AS (SELECT t.ContactName
	, LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS first_name
	,dbo.udf_parse_first_name(t.ContactName) AS first_name2
	FROM dbo.v_w3_schools_customers AS t)
	SELECT s1.*
	FROM s1
	WHERE s1.first_name <> s1.first_name2;
	
--Q: How to extract last name from Contact Name?

--A: Well, here is your problem..
--CustomerName = Alejandra Camino -> Alejandra
-- Google search "how to extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/52348556/charindex-and-len
-- https://stackoverflow.com/questions/2025585/len-function-not-including-trailing-spaces-in-sql-server

SELECT t.ContactName
    , RIGHT(t.ContactName, LEN(t.ContactName) - CHARINDEX(' ', t.ContactName)) AS last_name
    ,dbo.udf_parse_first_name(t.ContactName) AS first_name2
	FROM dbo.v_w3_schools_customers AS t
	ORDER BY 1;
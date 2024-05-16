--- Q: What is the total amount both Homer and Marge have spent from the debit column?
/***
step 1: seperate the money spent between homer and marge
step 2: sum the money they've spent and create a table with these values
step 3: format to dollar sign
**/

SELECT
    ROUND(SUM(CASE WHEN member_name = 'Marge Simpson' THEN debit ELSE 0 END), 2) AS Marge_Total,
    ROUND(SUM(CASE WHEN member_name = 'Homer Simpson' THEN debit ELSE 0 END), 2) AS Homer_Total
FROM dbo.FBS_Viza_Costmo
WHERE member_name IN ('Marge Simpson', 'Homer Simpson');

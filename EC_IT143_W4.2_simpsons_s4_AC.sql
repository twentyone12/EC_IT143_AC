/*****************************************************************************************************************
NAME:    Step 4 VIEW
PURPOSE: Create a view that can be easily used

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/15/2024  ACARTER       1. Built this script for EC IT143


RUNTIME: 
1 second

NOTES: 
This is going to do the following
1. create a view called Debit Totals
2. sum the debit totals only when the member_name is Marge Simpson, if not collect nothing. round that number to 2 decimals and place in column called Marg_Total
3. same for homer
4. we'll only gather info where the member_name is Marge Simpson or Homer Simpson
 
******************************************************************************************************************/

--- Q: What is the total amount both Homer and Marge have spent from the debit column?
---A: Ask and find out **/


CREATE VIEW [Debit Totals] AS
SELECT
    ROUND(SUM(CASE WHEN member_name = 'Marge Simpson' THEN debit ELSE 0 END), 2) AS Marge_Total,
    ROUND(SUM(CASE WHEN member_name = 'Homer Simpson' THEN debit ELSE 0 END), 2) AS Homer_Total
FROM dbo.FBS_Viza_Costmo
WHERE member_name IN ('Marge Simpson', 'Homer Simpson');

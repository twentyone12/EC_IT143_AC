
/*****************************************************************************************************************
NAME:    Step 7 procedure
PURPOSE: Create a procedure that can be easily executed in the future

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/15/2024  ACARTER       1. Built this script for EC IT143


RUNTIME: 
1 second

NOTES: 
Creating a procedure from the query we made earlier to calculate the debit sums for Marge/Homer
 
******************************************************************************************************************/

--- Q: What is the total amount both Homer and Marge have spent from the debit column?
---A: Ask and find out **/


CREATE PROCEDURE DebitTotals
AS
SELECT*FROM dbo.Debit_Totals
GO;
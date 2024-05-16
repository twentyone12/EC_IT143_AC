
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
All this is going to do is create a procedure with a name from all the data we collect from the PlayerPositions table. It can be run as often as we want, kind of like a macro in excel
 
******************************************************************************************************************/

-- Q1: What postion does each player play?
-- A1: Execute the query and find out...

CREATE PROCEDURE PlayerPositionReset
AS
SELECT*FROM dbo.PlayerPositions
GO;
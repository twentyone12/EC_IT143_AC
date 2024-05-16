/*****************************************************************************************************************
NAME:    Step 4 view
PURPOSE: Create a view to query against in the future for the next steps

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   JJAUSSI       1. Built this script for EC IT143


RUNTIME: 
1 second

NOTES: 
Had to remove the Order By section since it's not allowed in the view, for the next part I'll add it back in so it gets ordered correctly
 
******************************************************************************************************************/

-- Q1: What postion does each player play?
-- A1: Execute the query and find out...

CREATE VIEW [PlayerPositions] AS
SELECT tblPositionDim.p_name, dbo.tblPlayerDim.pl_name
FROM dbo.tblPositionDim
LEFT JOIN dbo.tblPlayerDim ON dbo.tblPositionDim.p_id = dbo.tblPlayerDim.p_id



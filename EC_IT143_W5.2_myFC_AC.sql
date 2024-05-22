/*****************************************************************************************************************
NAME:    MyFC 
PURPOSE: MyFC Answers

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2024   ACarter       1. Built for IT143, answering questions from last week about databases


RUNTIME: 
1s

NOTES: 
I had to rewrite most of the questions because there just isn't enough info (at least that I can see here) to answer some of them involving PPG, where players are from etc. So some of them are simplified
 
******************************************************************************************************************/

-- Q1: What position do we have the most players at? We're looking at filling in some of the holes we have on the team.
-- A1: This will just give out the positions and the count of each of them. With this data we could figure out where we need to start our search for signing

SELECT p_name, COUNT(p_name) AS Position
FROM PlayerPosition
GROUP BY p_name;

-- Q2: We need to adjust the salaries of our highest players so we can sign Neymar Jr. As it will be a big signing, who are the top 10 highest paid players?
-- A2: This is going to get the top 10 highest paid players sorted by salary, with player id, name, and salary amount

SELECT DISTINCT TOP 10 dbo.tblPlayerFact.pl_id, dbo.tblPlayerDim.pl_name, dbo.tblPlayerFact.mtd_salary
FROM dbo.tblPlayerFact
INNER JOIN dbo.tblPlayerDim ON dbo.tblPlayerFact.pl_id = dbo.tblPlayerDim.pl_id
ORDER BY mtd_salary DESC

--Q3: What is the toal amount we are paying out in salary each year? We may have to make some cuts in the future to allow bigger name players to join the team and I need to know how close to our budget we are.
--A3: Select Into statement to create a table with the previous code I wrote, then a simple sum function

SELECT dbo.tblPlayerFact.pl_id, dbo.tblPlayerDim.pl_name, dbo.tblPlayerFact.mtd_salary
INTO PlayerSalaries
FROM dbo.tblPlayerFact
INNER JOIN dbo.tblPlayerDim ON dbo.tblPlayerFact.pl_id = dbo.tblPlayerDim.pl_id
ORDER BY mtd_salary DESC

SELECT sum([mtd_salary]) as SalaryTotal
  FROM [MyFC].[dbo].[PlayerSalaries]

--Q4: What conclusions may be drawn from the myFC dataset regarding the impact of player positions on overall team performance? Examine the relationship between various positions and team success indicators.
--A4: This will join the playerdim table and the teamdim table giving the players on each team and their postiions. Assuming the teams are ranking best to worst on team id this is accurate data of which positions help a team to the top

SELECT dbo.tblTeamDim.t_id, dbo.tblPlayerDim.pl_name, dbo.tblPlayerDim.t_id, dbo.tblTeamDim.t_code
FROM dbo.tblPlayerDim
LEFT JOIN dbo.tblTeamDim ON dbo.tblTeamDim.t_id = dbo.tblPlayerDim.t_id
ORDER BY dbo.tblPlayerDim.t_id ASC

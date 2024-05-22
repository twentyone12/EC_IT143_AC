/*****************************************************************************************************************
NAME:    Simpsons 
PURPOSE: Simpsons Answers

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/22/2024   ACarter       1. Built for IT143, answering questions from last week about databases


RUNTIME: 
1s

NOTES: 
I had to rewrite most of the questions because there just isn't enough info (at least that I can see here) to answer some of them involving PPG, where players are from etc. So some of them are simplified
 
******************************************************************************************************************/

-- Q1: We're launching a simpsons reboot based in realism, the amount Marge and Homer spent seemed too unrealistic. How much off the national average amount of debt are we off? What would be a more realistic amount per month for them to spend?
-- A1: select the date as month and then sort it in order of month. This will give you the monthly total they spent on debit, which you can compare to the monthly real world total from google of 6,081$ for one person

SELECT MONTH(date) AS Month,
	SUM(Debit_totals.debit) AS Total
FROM Debit_totals
GROUP BY MONTH(date) 
ORDER BY Month;

-- Q2: I'd like to send the Simpson family a prank phone call, what day would they least be expecting a delivery call from Planet Express? Would like to catch them at the most unexpected time
-- A2: We'll get the dates of all the orders and sort them to see which dates had the least amount of deliveries. based on the data the best day would be March 24th, or any of the other dates that have only been used once

SELECT date, COUNT(date) AS Dates
FROM Planet_Express
GROUP BY date
ORDER BY Dates;


--Q3: I'd like to fire Homer Simpson and make him pay back all the hours wasted at work since he was hired. How many hours has he clocked in to work since he's been hired? How much will this increase the Simpsons credit card debt?
--A3: This took a little bit of research, we're going to only select homer's row from teh Family_data table, then figuring there were 8571 working days between the date of the first episode (12.17.1989 his hire date) and May 1, 2024, working 8 hours a day for 15$an hour
--     we get that homer owes more than a million dollars to mr burns!

SELECT First_name, Middle_name, Last_Name, Job_Title, Hire_date, SUM(8*15*8571) AS TotalOwedToMrBurns
FROM Family_data
WHERE First_name = 'Homer' 
GROUP BY First_name, Middle_name, Last_Name, Job_Title, Hire_date;

--Q4: How can the Simpson family expenses dataset be utilized to develop a budget forecasting model? Describe the methodologies and measurements that would be required for accurate prediction.
--A4: 

SELECT MONTH(date) AS Month,
	SUM(Debit_totals.debit) AS Total
FROM Debit_totals
GROUP BY MONTH(date) 
ORDER BY Month;

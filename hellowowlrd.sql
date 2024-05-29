--Q1: How to keep track of when a record was last modified?
--A1: This works for the inital INSER...

--ALTER TABLE dbo.t_hello_world
--ADD last_modified_date DATETIME DEFAULT GETDATE():

--Q2: How to keep track of when a record was least modified?
--A2: mayb use an after update trigger?

CREATE TRIGGER trg_hello_world_last_mod ON dbo.AWBuildVersion
AFTER UPDATE
AS

/******
NAME: dbo.trg_hello_world_alst_mod
PURPOSE: hellow world - last modified by trigger

MODIFICATION LOG:

RUNTIME

NOTES:
Keep track of the alst modified date for each row in the table 

*************/

	UPDATE Person
		SET 
			last_modified_date = GETDATE()
		WHERE my_message IN
		(
			SELECT DISTINCT
				my_message
			FROM Inserted

		);
SELECT pa.*
FROM Person.Address AS pa
WHERE pa.city = 'Bothell';

/*
Missing Index Details from SQLQuery1.sql - (local).ADV
The Query Processor estimates that implementing the following Nonclustered index will be beneficial
*/

USE [AdventureWorks2019]
GO
CREATE NONCLUSTERED INDEX IX_my_index
ON [Person].[Address]([City])

GO
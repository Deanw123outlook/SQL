Use EmployeeCaseTrackerData
/***SELECT-STATEMENT***/
SELECT * FROM dbo.Table_1

/***RENAME-COLUMN-SQL-STORED-PROCEDURE-SP_RENAME***/
EXEC SP_RENAME 'Table_1.CaseStatus2', 'CaseStatus', 'COLUMN';
/***Check-Execution***/
SELECT * FROM Table_1;

/***Add IDENTITY column to table***/
ALTER TABLE dbo.Table_1 ADD CaseID INT IDENTITY

/*
/***Add primary key Constraint***/
ALTER TABLE Table_1 ADD PRIMARY KEY (CaseIdentification);
*/

/***check updates***/
SELECT * FROM dbo.Table_1




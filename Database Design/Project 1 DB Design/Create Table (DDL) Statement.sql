CREATE TABLE EmployeeCaseTrackerData.CaseData (
CaseType char (50) NOT Null,
CaseID int NOT Null,
Date datetime,
CaseStartTime datetimeoffset,
CaseEndTime datetimeoffset,
CaseDescription text,
CaseStatus char (10) NOT Null,
);
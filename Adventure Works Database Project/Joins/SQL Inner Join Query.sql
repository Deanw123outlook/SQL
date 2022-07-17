Use AdventureWorksLT2008R2;
SELECT * FROM SalesLT.Customer;
SELECT * FROM SalesLT.CustomerAddress;

/***COUNT-FUNCTION***/
SELECT COUNT(*) FROM SalesLT.Customer;
SELECT COUNT(*) FROM SalesLT.CustomerAddress;

/***INNER-JOIN***/
SELECT t1.CustomerID AS [T1-CustomerID], t2.CustomerID AS [T2-CustomerID],t1.LastName AS [TABLE-1-LAST_NAME],
t1.CompanyName AS [TABLE-1-Company_Name] FROM SalesLT.Customer AS t1 INNER JOIN SalesLT.CUstomerAddress AS t2 
ON t1.CustomerID = t2.CustomerID;
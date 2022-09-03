USE AdventureWorksLT2008R2;
/***SELECT-STATEMENT***/
SELECT * FROM SalesLT.Address;
SELECT * FROM SalesLT.Customer;
SELECT * FROM SalesLT.CustomerAddress;

/***Customer-Location-Analysis***/
/***AGGREGATE-FUNCTIONS***/
SELECT City, COUNT(City) AS [Total Count] FROM SalesLT.Address GROUP BY City ORDER BY [Total Count] DESC;
SELECT StateProvince, COUNT(StateProvince) AS [Total Count] FROM SalesLT.Address GROUP BY StateProvince ORDER BY [Total Count] DESC;
SELECT CountryRegion, COUNT(CountryRegion) AS [Total Count] FROM SalesLT.Address GROUP BY CountryRegion ORDER BY [Total Count] DESC;

/***Customer-Company-Analysis***/
/***AGGREGATE-FUNCTIONS***/
SELECT CompanyName, COUNT(CompanyName) AS [Total Customer Company Count] FROM SalesLT.Customer GROUP BY CompanyName ORDER BY CompanyName ASC;
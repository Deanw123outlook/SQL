Use AdventureWorksLT2008R2;
/***Select-Statement***/
SELECT * FROM SalesLT.Address;
/***Count-Function***/
SELECT COUNT(StateProvince) AS [State Province Count] FROM SalesLT.Address;

/***Count-Function/AS ALIASING (Aliasing)/Group-By-Function***/
SELECT StateProvince,COUNT(StateProvince) AS [State/Province Count] FROM SalesLT.Address GROUP BY StateProvince;
SELECT CountryRegion,COUNT(CountryRegion) AS [Country/Region Count] FROM SalesLT.Address GROUP BY CountryRegion;

/***Table-Null-Value-Analysis***/
SELECT COUNT(*) AS [Column(AddressLine2)-Table-Null-Value-Count] FROM SalesLT.Address WHERE AddressLine2 is NULL;
SELECT COUNT(*) AS [Column(AddressLine2)-Table-Non-Null-Value-Count] FROM SalesLT.Address WHERE AddressLine2 is NOT NULL;
SELECT * FROM SalesLT.Address WHERE AddressLine2 is NOT NULL;

/***Checking for user specific data***/
/***Like/Not-Like***/
SELECT * FROM SalesLt.Address WHERE AddressLine1 LIKE 'Burgess%';
SELECT * FROM SalesLt.Address WHERE AddressLine1 LIKE '25%';

SELECT COUNT(*) AS [USER-DATA-M4B 1V5] FROM SalesLt.Address WHERE PostalCode LIKE 'M4B 1V5';
SELECT * FROM SalesLt.Address WHERE PostalCode LIKE 'M4B 1V5';

/***WHERE/AND-Cluas**/
SELECT * FROM SalesLt.Address WHERE City LIKE 'Toronto' AND PostalCode LIKE 'M4B 1V5';
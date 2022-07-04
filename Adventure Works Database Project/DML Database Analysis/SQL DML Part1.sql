/***Access-Databse***/
Use AdventureWorksLT2008R2

/***SELECT-STATEMENT***/
SELECT * FROM SalesLT.Address

/*
/***SELECT-MULTIPLE-COLUMNS***/
SELECT AddressID, AddressLine1, AddressLine2  FROM SalesLT.Address
*/

/***SELECT-UNIQUE-VALUUES-FROM-COLUMN-use-DISTINCT-KEYWORD**/
SELECT DISTINCT City FROM SalesLT.Address;
SELECT DISTINCT StateProvince FROM SalesLT.Address

/***COUNT-FUNCTION***/
SELECT COUNT(City) FROM SalesLT.Address;
/***Count-number-distinct-values-from-column***/
SELECT COUNT(DISTINCT City) FROM SalesLT.Address;

/***Group-By***/
SELECT City FROM SalesLT.Address GROUP BY City;
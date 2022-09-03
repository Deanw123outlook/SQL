Use AdventureWorksLT2008R2;
/***SELECT-STATEMENTS***/
SELECT * FROM SalesLT.Address;
SELECT * FROM SalesLT.Customer;
SELECT * FROM SalesLT.CustomerAddress;

/***Customer Data Queries***/
/***INNER-JOIN-x3-Database-Tables***/
SELECT * FROM SalesLT.Customer AS c INNER JOIN SalesLT.CustomerAddress AS d
ON c.CustomerID = d.CustomerID INNER JOIN SalesLT.Address AS x ON x.AddressID = d.AddressID
ORDER BY c.LastName ASC;

/***-RIGHT-JOIN***/
SELECT * FROM SalesLT.Customer AS c INNER JOIN SalesLT.CustomerAddress AS d
ON c.CustomerID = d.CustomerID RIGHT JOIN SalesLT.Address AS x ON x.AddressID = d.AddressID;

/***LEFT-JOIN***/
SELECT * FROM SalesLT.Customer AS c INNER JOIN SalesLT.CustomerAddress AS d
ON c.CustomerID = d.CustomerID LEFT JOIN SalesLT.Address AS x ON x.AddressID = d.AddressID;
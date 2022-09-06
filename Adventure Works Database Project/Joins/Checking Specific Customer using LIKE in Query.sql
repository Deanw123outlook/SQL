USE AdventureWorksLT2008R2
/***SELECT QUERY***/
SELECT * FROM SalesLT.Customer;
SELECT * FROM SalesLT.CustomerAddress;

/***CHECK FOR SPECIFIC CUSTOMER DATA***/
SELECT * FROM SalesLT.Customer WHERE FirstName LIKE 'Orlando%' AND LastName LIKE 'Gee%'

/***LEFT-JOIN-COMBINED-LIKE***/
SELECT t1.CustomerID, t1.Title, t1.FirstName, t1.LastName,t1.Phone, t1.CompanyName, t1.SalesPerson, t2.AddressID, t1.EmailAddress
FROM SalesLT.Customer  AS t1 LEFT JOIN SalesLt.CustomerAddress AS t2 ON t1.CustomerID = t2.CustomerID 
WHERE t1.FirstName LIKE 'Pat%' AND t1.LastName LIKE 'Chambers%';
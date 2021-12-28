Use AdventureWorksLT2008R2;
SELECT * FROM SalesLT.Customer;
SELECT COUNT(*) AS TableObservationCount FROM SalesLT.Customer;
SELECT Title, FirstName, LastName, CompanyName FROM SalesLT.Customer WHERE Title = 'Mr.';
SELECT Title, FirstName, LastName, CompanyName FROM SalesLT.Customer WHERE Title = 'Ms.';
SELECT Count(Title) as MaleCount FROM SalesLT.Customer WHERE Title = 'Mr.';
SELECT Count(Title) as FemaleCount FROM SalesLT.Customer WHERE Title = 'Ms.';
SELECT DISTINCT CompanyName FROM SalesLT.Customer;

SELECT Title, COUNT(*) FROM SalesLT.Customer GROUP BY Title;

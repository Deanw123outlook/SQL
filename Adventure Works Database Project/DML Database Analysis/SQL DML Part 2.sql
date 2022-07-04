Use AdventureWorksLT2008R2;
SELECT * FROM SalesLT.Product;

/***WHERE-CLAUSE-AND-CONDITION***/
SELECT * FROM SalesLT.Product 
WHERE Color = 'Black' AND Size = 'M';

SELECT * FROM SalesLT.Product 
WHERE Color = 'Black' AND Size IS NULL;

/***WHERE-CLAUSE-OR-KEYWORD***/
SELECT * FROM SalesLT.Product 
WHERE SellStartDate = '1998-06-01 00:00:00.000' OR SellStartDate = '2001-07-01 00:00:00.000';
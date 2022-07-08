Use AdventureWorksLT2008R2;
/**SELECT-STATEMENT***/
SELECT * FROM SalesLT.Product;

/***Aggregate-Function-SUM***/
SELECT SUM(StandardCost) FROM SalesLT.Product;
SELECT SUM(StandardCost) AS [Color Black Total Standard Cost] FROM SalesLT.Product WHERE Color = 'Black';
SELECT SUM(StandardCost) AS [Color Red Total Standard Cost] FROM SalesLT.Product WHERE Color = 'Red';
SELECT SUM(StandardCost) AS [Color White Total Standard Cost] FROM SalesLT.Product WHERE Color = 'White';

/***Aggregate-Function-AVERAGE***/
SELECT AVG(StandardCost) AS [Average Standard Cost], AVG(ListPrice) AS [Average List Price] FROM SalesLT.Product;

/***Return-Column-Count-Null-Values***/
SELECT * FROM SalesLT.Product WHERE Weight IS NULL;
SELECT COUNT(*) FROM SalesLT.Product WHERE Weight IS NULL; 

/***Group-By-Clause***/
SELECT Color,MAX(ListPrice)AS [MAX List Price],MAX(StandardCost) AS [MAX Standard Cost],MAX(Weight) AS [MAX Weight] FROM SalesLT.Product GROUP BY Color;
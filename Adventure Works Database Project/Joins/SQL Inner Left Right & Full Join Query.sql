Use AdventureWorksLT2008R2;
SELECT * FROM SalesLT.Product;
SELECT * FROM SalesLT.ProductCategory;

/***INNER-JOIN***/
SELECT t1.rowguid AS [T1-Rowguid], t2.rowguid AS [T2-Rowguid], t1.ProductNumber AS [T1-Product-Number], 
t1.StandardCost AS [T1-Standard-Cost], t2.Name AS [T2-Name] 
FROM SalesLT.Product AS t1 INNER JOIN SalesLT.ProductCategory AS t2 ON t1.rowguid = t2.rowguid;

/***LEFT-JOIN***/
SELECT t1.rowguid AS [T1-Rowguid], t2.rowguid AS [T2-Rowguid], t1.ProductNumber AS [T1-Product-Number], 
t1.StandardCost AS [T1-Standard-Cost], t2.Name AS [T2-Name] 
FROM SalesLT.Product AS t1 LEFT JOIN SalesLT.ProductCategory AS t2 ON t1.rowguid = t2.rowguid;

/***RIGHT-JOIN***/
SELECT t1.rowguid AS [T1-Rowguid], t2.rowguid AS [T2-Rowguid], t1.ProductNumber AS [T1-Product-Number], 
t1.StandardCost AS [T1-Standard-Cost], t2.Name AS [T2-Name] 
FROM SalesLT.Product AS t1 RIGHT JOIN SalesLT.ProductCategory AS t2 ON t1.rowguid = t2.rowguid;

/***FULL-JOIN***/
SELECT t1.rowguid AS [T1-Rowguid], t2.rowguid AS [T2-Rowguid], t1.ProductNumber AS [T1-Product-Number], 
t1.StandardCost AS [T1-Standard-Cost], t2.Name AS [T2-Name] 
FROM SalesLT.Product AS t1 FULL JOIN SalesLT.ProductCategory AS t2 ON t1.rowguid = t2.rowguid; 

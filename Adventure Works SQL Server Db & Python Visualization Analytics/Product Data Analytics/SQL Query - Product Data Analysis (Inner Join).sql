USE AdventureWorksLT2008R2;
SELECT * FROM SalesLt.Product;
SELECT * FROM SalesLT.ProductCategory;

/***JOINING-DATA-SQL***/
SELECT c.ProductID, c.NAME, c.ProductNumber, c.Color, c.StandardCost, c.ListPrice, c.Size, c.ProductCategoryID
FROM SalesLT.Product AS c LEFT JOIN SalesLT.ProductCategory AS d ON c.ProductCategoryID = d.ParentProductCategoryID;
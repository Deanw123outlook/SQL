Use AdventureWorksLT2008R2;
/***SELECT-STATEMENT***/
SELECT * FROM SalesLT.ProductCategory;
SELECT * FROM SalesLT.ProductModel;

/***COUNT-FUNCTION***/
SELECT COUNT(*) FROM SalesLT.ProductCategory;
SELECT COUNT(*) FROM SalesLT.ProductModel;

/***INNER-JOIN(MATCHING-RECORDS-FROM-BOTH-TABLES)***/
SELECT t1.Name AS [t1-NAME],t2.Name AS [t2-NAME], t1.rowguid AS [t1-ROWGUID], t1.ModifiedDate AS [t1-DATE-MODIFIED] 
FROM SalesLt.ProductCategory AS t1 INNER JOIN SalesLT.ProductModel AS t2
ON t1.Name = t2.Name;

/***LEFT-JOIN(ALL_RECORDS-FROM-LEFT-TABLE-AND-ONLY-matching-from-RIGHT-TABLE)***/
SELECT t1.Name AS [t1-NAME],t2.Name AS [t2-NAME], t1.rowguid AS [t1-ROWGUID], t1.ModifiedDate AS [t1-DATE-MODIFIED] 
FROM SalesLt.ProductCategory AS t1 LEFT JOIN SalesLT.ProductModel AS t2
ON t1.Name = t2.Name;

/***RIGHT-JOIN(ALL_RECORDS-FROM-RIGHT-TABLE-AND-ONLY-matching-from-LEFT-TABLE)***/
SELECT t1.Name AS [t1-NAME],t2.Name AS [t2-NAME], t1.rowguid AS [t1-ROWGUID], t1.ModifiedDate AS [t1-DATE-MODIFIED] 
FROM SalesLt.ProductCategory AS t1 RIGHT JOIN SalesLT.ProductModel AS t2
ON t1.Name = t2.Name;
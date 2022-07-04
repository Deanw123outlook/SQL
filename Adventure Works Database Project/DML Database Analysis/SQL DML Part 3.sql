Use AdventureWorksLT2008R2;
/***SELECT-STATEMENT***/
SELECT * FROM SalesLT.SalesOrderDetail;

/***SELECT-statement-BETWEEN-Keyword***/
SELECT * FROM SalesLT.SalesOrderDetail WHERE OrderQty BETWEEN '2' AND '4' ORDER BY OrderQty DESC;
SELECT * FROM SalesLT.SalesOrderDetail WHERE (OrderQty BETWEEN '2' AND '4' OR OrderQty > '2') AND (UnitPrice >= '300') 
ORDER BY UnitPrice ASC;

/***SELECT-IN-OPERATOR***/
SELECT * FROM SalesLt.SalesOrderDetail WHERE OrderQty IN (2,3,4);
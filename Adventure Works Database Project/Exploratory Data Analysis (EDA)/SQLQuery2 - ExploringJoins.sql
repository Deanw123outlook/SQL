Use AdventureWorksLT2008R2
SELECT x.AddressID, City, StateProvince, CountryRegion
FROM SalesLT.Address AS x
LEFT JOIN SalesLT.CustomerAddress AS y
ON x.AddressID = y.AddressID;

SELECT x.AddressID, City, StateProvince, CountryRegion
FROM SalesLT.CustomerAddress AS x
RIGHT JOIN SalesLT.Address AS y
ON x.AddressID = y.AddressID;
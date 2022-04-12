Use AdventureWorksLT2008R2;
SELECT COUNT(DISTINCT City) AS TotalCityCount, COUNT (DISTINCT CountryRegion) AS TotalCountryRegionCount
FROM SalesLT.Address;

SELECT COUNT(DISTINCT SalesPerson) AS TotalSalesPersonCount, COUNT(DISTINCT CompanyName) AS TotalCompanyNameCount
FROM SalesLT.Customer;


DROP PROCEDURE IF EXISTS [dbo].[CustomerList]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc dbo.CustomerList

@customerID varchar(100)

as

/*
SQL Test

exec dbo.CustomerList
	@customerID = 'BERGS'

*/

if DB_NAME() = 'AppReportingDatabase_Prod'
begin
	select 
		   c.[CustomerID]
		  ,c.[CompanyName]
		  ,c.[ContactName]
		  ,c.[ContactTitle]
		  ,c.[Address]
		  ,c.[City]
		  ,c.[Region]
		  ,c.[PostalCode]
		  ,c.[Country]
		  ,c.[Phone]
		  ,'Prod' as DevLane
	from  [AppDatabase_Prod].[dbo].[Customers] c
	where c.CustomerID = @customerID
end
else if DB_NAME() = 'AppReportingDatabase_Test'
begin
	select 
		   c.[CustomerID]
		  ,c.[CompanyName]
		  ,c.[ContactName]
		  ,c.[ContactTitle]
		  ,c.[Address]
		  ,c.[City]
		  ,c.[Region]
		  ,c.[PostalCode]
		  ,c.[Country]
		  ,c.[Phone]
		  ,'Test' as DevLane
	from  [AppDatabase_Test].[dbo].[Customers] c
	where c.CustomerID = @customerID
end
GO

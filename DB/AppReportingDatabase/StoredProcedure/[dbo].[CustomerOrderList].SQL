DROP PROCEDURE IF EXISTS [dbo].[CustomerOrderList]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CustomerOrderList]

@customerID varchar(100)

as

/*
SQL Test

exec dbo.CustomerOrderList
	@customerID = 'BERGS'

*/

select 
   o.[OrderID]     as [Order ID]
  ,o.[CustomerID]  as [Customer ID]
  ,c.[CompanyName] as [Company Name]
  ,o.[OrderDate]   as [Order Date]
  ,o.[shipCity]    as [Ship City]
  ,o.[Freight]     as [Freight] 
  ,'Test'		   as DevLane
from  [AppDatabase_Test].[dbo].[Orders] o
  inner join [AppDatabase_Test].[dbo].[Customers] c
    on o.[CustomerID] = c.[CustomerID]    
where c.CustomerID = @customerID
GO

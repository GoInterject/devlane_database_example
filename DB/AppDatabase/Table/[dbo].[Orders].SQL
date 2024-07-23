DROP TABLE IF EXISTS [dbo].[Orders]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [varchar](40) NULL,
	[OrderDate] [date] NULL,
	[Freight] [decimal](18, 4) NULL,
	[ShipName] [varchar](40) NULL,
	[ShipAddress] [varchar](60) NULL,
	[ShipCity] [varchar](15) NULL,
	[ShipRegion] [varchar](25) NULL,
	[ShipPostalCode] [varchar](20) NULL,
	[ShipCountry] [varchar](15) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

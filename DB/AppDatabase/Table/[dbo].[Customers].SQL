DROP TABLE IF EXISTS [dbo].[Customers]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [varchar](40) NOT NULL,
	[CompanyName] [varchar](40) NULL,
	[ContactName] [varchar](30) NULL,
	[ContactTitle] [varchar](30) NULL,
	[Address] [varchar](60) NULL,
	[City] [varchar](15) NULL,
	[Region] [varchar](25) NULL,
	[PostalCode] [varchar](20) NULL,
	[Country] [varchar](15) NULL,
	[Phone] [varchar](24) NULL,
	[Latitude] [decimal](14, 10) NULL,
	[Longitude] [decimal](14, 10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

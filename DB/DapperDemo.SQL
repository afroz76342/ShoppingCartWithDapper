USE [DapperDemo]
GO
/****** Object:  Schema [Exception]    Script Date: 12/05/2024 3:39:12 pm ******/
CREATE SCHEMA [Exception]
GO
/****** Object:  Schema [Master]    Script Date: 12/05/2024 3:39:12 pm ******/
CREATE SCHEMA [Master]
GO
/****** Object:  Table [Exception].[ErrorLog]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exception].[ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Service] [nvarchar](100) NULL,
	[Method] [nvarchar](100) NULL,
	[Parameters] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[ExceptionOn] [datetime] NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Master].[Currency]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Currency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[Products]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Currency] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Exception].[ErrorLog] ON 
GO
INSERT [Exception].[ErrorLog] ([ID], [Service], [Method], [Parameters], [Exception], [ExceptionOn]) VALUES (1, N'ProductService', N'GetAllProducts', N'', N'Could not find stored procedure ''Master.GetCurrency''.', CAST(N'2024-05-11T23:46:32.463' AS DateTime))
GO
INSERT [Exception].[ErrorLog] ([ID], [Service], [Method], [Parameters], [Exception], [ExceptionOn]) VALUES (2, N'ProductService', N'GetAllProducts', N'', N'Could not find stored procedure ''Master.GetCurrency''.', CAST(N'2024-05-11T23:46:43.857' AS DateTime))
GO
INSERT [Exception].[ErrorLog] ([ID], [Service], [Method], [Parameters], [Exception], [ExceptionOn]) VALUES (3, N'ProductService', N'DeleteProduct', N'productId=10', N'Procedure DeleteProduct has no parameters and arguments were supplied.', CAST(N'2024-05-12T01:51:33.273' AS DateTime))
GO
INSERT [Exception].[ErrorLog] ([ID], [Service], [Method], [Parameters], [Exception], [ExceptionOn]) VALUES (4, N'ProductService', N'DeleteProduct', N'productId=10', N'Procedure DeleteProduct has no parameters and arguments were supplied.', CAST(N'2024-05-12T01:53:50.840' AS DateTime))
GO
INSERT [Exception].[ErrorLog] ([ID], [Service], [Method], [Parameters], [Exception], [ExceptionOn]) VALUES (5, N'ProductService', N'GetCurrencies', N'', N'Unable to cast object of type ''System.Data.ProviderBase.DbConnectionClosedConnecting'' to type ''System.Data.SqlClient.SqlInternalConnectionTds''.', CAST(N'2024-05-12T03:43:44.967' AS DateTime))
GO
INSERT [Exception].[ErrorLog] ([ID], [Service], [Method], [Parameters], [Exception], [ExceptionOn]) VALUES (6, N'ProductService', N'GetAllProducts', N'', N'Invalid attempt to call MetaData when reader is closed.', CAST(N'2024-05-12T03:43:45.013' AS DateTime))
GO
SET IDENTITY_INSERT [Exception].[ErrorLog] OFF
GO
SET IDENTITY_INSERT [Master].[Currency] ON 
GO
INSERT [Master].[Currency] ([ID], [Name], [Code], [IsDeleted]) VALUES (1, N'Indian (Rupess)', N'INR', 0)
GO
INSERT [Master].[Currency] ([ID], [Name], [Code], [IsDeleted]) VALUES (2, N'United States Dollar (USD)', N'USD', 0)
GO
INSERT [Master].[Currency] ([ID], [Name], [Code], [IsDeleted]) VALUES (4, N'Chine (Yuan)', N'Yuan', 0)
GO
INSERT [Master].[Currency] ([ID], [Name], [Code], [IsDeleted]) VALUES (5, N'Kuwaiti Dinar (KWD)', N'KWD', 0)
GO
SET IDENTITY_INSERT [Master].[Currency] OFF
GO
SET IDENTITY_INSERT [Master].[Products] ON 
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (1, N'I Phone ', CAST(200.00 AS Decimal(18, 2)), N'INR', 1, CAST(N'2024-05-12T02:06:29.487' AS DateTime))
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (2, N'Samsung 23', CAST(100.00 AS Decimal(18, 2)), N'INR', 0, NULL)
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (3, N'Samsung 23 Ultra', CAST(150.00 AS Decimal(18, 2)), N'INR', 0, NULL)
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (4, N'Samsung 24', CAST(160.00 AS Decimal(18, 2)), N'INR', 0, NULL)
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (5, N'Samsung 24 Ultra', CAST(170.00 AS Decimal(18, 2)), N'INR', 1, CAST(N'2024-05-12T02:06:26.140' AS DateTime))
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (6, N'I Phone X', CAST(175.00 AS Decimal(18, 2)), N'USD', 1, CAST(N'2024-05-12T02:06:06.747' AS DateTime))
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (7, N'I Phone X Pro', CAST(180.00 AS Decimal(18, 2)), N'USD', 1, CAST(N'2024-05-12T02:05:50.437' AS DateTime))
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (8, N'DELL', CAST(110.00 AS Decimal(18, 2)), N'USD', 1, CAST(N'2024-05-12T02:01:00.960' AS DateTime))
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (9, N'HP', CAST(120.00 AS Decimal(18, 2)), N'USD', 1, CAST(N'2024-05-12T01:55:40.757' AS DateTime))
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (10, N'ACER', CAST(135.00 AS Decimal(18, 2)), N'USD', 1, CAST(N'2024-05-12T01:54:03.500' AS DateTime))
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (11, N'Xiaomi', CAST(15000.00 AS Decimal(18, 2)), N'KWD', 0, NULL)
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (12, N'Asus', CAST(45.00 AS Decimal(18, 2)), N'KWD', 1, CAST(N'2024-05-12T03:53:52.490' AS DateTime))
GO
INSERT [Master].[Products] ([ID], [Name], [Price], [Currency], [IsDeleted], [DeletedOn]) VALUES (13, N'Realme', CAST(100.00 AS Decimal(18, 2)), N'USD', 0, NULL)
GO
SET IDENTITY_INSERT [Master].[Products] OFF
GO
ALTER TABLE [Exception].[ErrorLog] ADD  CONSTRAINT [DF_ErrorLog_ExceptionOn]  DEFAULT (getdate()) FOR [ExceptionOn]
GO
ALTER TABLE [Master].[Currency] ADD  CONSTRAINT [DF_Currency_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [Master].[Products] ADD  CONSTRAINT [DF_Products_IsDeleted]  DEFAULT ('0') FOR [IsDeleted]
GO
ALTER TABLE [Master].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Currency] FOREIGN KEY([Currency])
REFERENCES [Master].[Currency] ([Code])
GO
ALTER TABLE [Master].[Products] CHECK CONSTRAINT [FK_Products_Currency]
GO
/****** Object:  StoredProcedure [Exception].[LogException]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author		: Afroz Khan
-- Create date	: 12 May 2024
-- Description	: Add Product
-- =============================================
CREATE PROCEDURE [Exception].[LogException]
(
	@Service NVARCHAR(100),
	@Method NVARCHAR(100),
	@Parameters NVARCHAR(max),
	@Exception	NVARCHAR(max)
)
AS
BEGIN


	DECLARE @P_Service		NVARCHAR(100)=@Service
	DECLARE @P_Method		NVARCHAR(100)=@Method
	DECLARE @P_Parameters	NVARCHAR(max)=@Parameters
	DECLARE @P_Exception	NVARCHAR(max)=@Exception
	
	INSERT INTO [Exception].[ErrorLog] ([Service],[Method],[Parameters],[Exception])
	VALUES(@P_Service, @P_Method, @P_Parameters, @P_Exception)

END
GO
/****** Object:  StoredProcedure [Master].[AddProducts]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author		: Afroz Khan
-- Create date	: 12 May 2024
-- Description	: Deleted Prduct By Id
-- =============================================
CREATE PROCEDURE [Master].[AddProducts]
(
	@Name NVARCHAR(100),
	@Currency NVARCHAR(50),
	@Price DECIMAL(18,2)
)
AS
BEGIN


	DECLARE @P_Name NVARCHAR(100)=@Name
	DECLARE @P_Price DECIMAL(18,2)= @Price
	DECLARE @P_Currency NVARCHAR(50)=@Currency
	

	INSERT INTO Master.Products (Name,Price,Currency )  
	values(@P_Name,@P_Price,@P_Currency)

END
GO
/****** Object:  StoredProcedure [Master].[DeleteProduct]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- =============================================  
-- Author  : Afroz Khan  
-- Create date : 12 May 2024  
-- Description : Deleted Prduct By Id  
-- =============================================  
CREATE PROCEDURE [Master].[DeleteProduct]  
@ID INT
AS  
BEGIN  
		DECLARE @P_ID INT= @ID

		Update	Master.Products  
		SET		IsDeleted=1,  
				DeletedOn= GetDate() 
		WHERE	ID=@P_ID
END  
GO
/****** Object:  StoredProcedure [Master].[GetAllProducts]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author		: Afroz Khan
-- Create date	: 12 May 2024
-- Description	: Get All Products
-- =============================================
CREATE PROCEDURE [Master].[GetAllProducts]
AS
BEGIN
	SELECT TOP (1000)	ID, 
						Name,
						Price,
						Currency
	FROM [Master].[Products]
	WHERE IsDeleted=0

END
GO
/****** Object:  StoredProcedure [Master].[GetCurrencies]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- =============================================  
-- Author		: Afroz Khan  
-- Create date	: 12 May 2024  
-- Description	: Get Currency
-- =============================================  
CREATE PROCEDURE [Master].[GetCurrencies]
AS  
BEGIN  

		SELECT TOP 100 
					ID,
					Name,
					Code  AS Value
		FROM Master.Currency
		WHERE IsDeleted=0
  
END  
GO
/****** Object:  StoredProcedure [Master].[GetProductDetailById]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- =============================================  
-- Author  : Afroz Khan  
-- Create date : 12 May 2024  
-- Description : Get  Product Detail By ID
-- =============================================  
CREATE PROCEDURE [Master].[GetProductDetailById] (
@ID INT 
) 
AS  
BEGIN  

DECLARE @P_ID INT =@ID
 SELECT TOP (1000) ID,   
      Name,  
      Price  ,
	  Currency
 FROM [Master].[Products]  
 WHERE IsDeleted=0   AND ID=@P_ID
  
END  
GO
/****** Object:  StoredProcedure [Master].[UpdateProducts]    Script Date: 12/05/2024 3:39:12 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author		: Afroz Khan
-- Create date	: 12 May 2024
-- Description	: Update Product details
-- =============================================
CREATE PROCEDURE [Master].[UpdateProducts]
(
	@Name NVARCHAR(100),
	@Price DECIMAL(18,2),
	@Currency NVARCHAR(50),
	@ID INT
)
AS
BEGIN


	DECLARE @P_Name NVARCHAR(100)=@Name
	DECLARE @P_Currency NVARCHAR(50)=@Currency
	DECLARE @P_Price DECIMAL(18,2)= @Price
	DECLARE @P_ID INT= @ID

	Update Master.Products
	SET Name= @P_Name,
		Price=@P_Price,
		Currency=@P_Currency
	Where ID=@P_ID
END
GO

USE [master]
GO
/****** Object:  Database [WebBazer]    Script Date: 7/29/2019 9:37:12 AM ******/
CREATE DATABASE [WebBazer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebBazer', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WebBazer.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebBazer_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WebBazer_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebBazer] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebBazer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebBazer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebBazer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebBazer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebBazer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebBazer] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebBazer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebBazer] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WebBazer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebBazer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebBazer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebBazer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebBazer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebBazer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebBazer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebBazer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebBazer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebBazer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebBazer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebBazer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebBazer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebBazer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebBazer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebBazer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebBazer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebBazer] SET  MULTI_USER 
GO
ALTER DATABASE [WebBazer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebBazer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebBazer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebBazer] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WebBazer]
GO
/****** Object:  StoredProcedure [dbo].[dbo.AdminLogin]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dbo.AdminLogin]
	@Email varchar(50),
	@Password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Email,Password From [dbo.Admin] where Email=@Email and Password=@Password;
END

GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](max) NULL,
	[Email] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[ImageUrl] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[admin_Employee]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin_Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NULL,
	[Age] [int] NULL,
	[DateofBirth] [date] NULL,
	[Gender] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Mobile] [varchar](15) NOT NULL,
	[ImageUrl] [varchar](500) NULL,
 CONSTRAINT [PK_admin_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CName] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Chart]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalCost] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Chart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[MobileNo] [varchar](50) NULL,
	[Country] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[PostalCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CoustomerRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[genMainSlider]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[genMainSlider](
	[MainSliderID] [int] IDENTITY(1,1) NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](255) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[BtnText] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genMainSlider] PRIMARY KEY CLUSTERED 
(
	[MainSliderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[genPromoRight]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[genPromoRight](
	[PromoRightID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](500) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genPromoRight] PRIMARY KEY CLUSTERED 
(
	[PromoRightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[ShippingID] [int] NULL,
	[Discount] [int] NULL,
	[Taxes] [int] NULL,
	[TotalAmount] [int] NULL,
	[isCompleted] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[DIspatched] [bit] NULL,
	[DispatchedDate] [datetime] NULL,
	[Shipped] [bit] NULL,
	[ShippingDate] [datetime] NULL,
	[Deliver] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[Notes] [varchar](500) NULL,
	[CancelOrder] [bit] NULL,
 CONSTRAINT [PK_Oder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[PaymentTypeId] [int] NOT NULL,
	[PaymentDate] [date] NULL,
	[CusomerId] [int] NULL,
	[OrderComplete] [bit] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NULL,
	[PName] [varchar](50) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[ReorderLevel] [int] NULL,
	[Description] [varchar](max) NULL,
	[ImageUrl] [varchar](max) NULL,
	[OldPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[ProductAvailable] [bit] NULL,
	[AvailableQuantity] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecentlyViews]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecentlyViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ViewDate] [datetime] NOT NULL,
	[Note] [varchar](255) NULL,
	[OrderDetailsId] [int] NULL,
 CONSTRAINT [PK_RecentlyViews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Review]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Review](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Review] [varchar](500) NULL,
	[Rate] [int] NULL,
	[DateTime] [datetime] NULL,
	[isDelete] [bit] NULL,
	[Email] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ID] [int] NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Province] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[PostCode] [varchar](10) NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[SName] [varchar](50) NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[ImageUrl] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[isActive] [bit] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[AllCategorisView]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AllCategorisView]
AS
SELECT        C.Id AS CategoryId, C.CName AS Category, SC.Id AS SubCategoryId, SC.SName AS SubCategory, C.CName, SC.SName
FROM            dbo.Category AS C INNER JOIN
                         dbo.SubCategory AS SC ON C.Id = SC.CategoryId

GO
/****** Object:  View [dbo].[ProductDetails]    Script Date: 7/29/2019 9:37:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProductDetails]
AS
SELECT        P.Id, P.PName AS ProductName, C.CName AS Category, SC.SName AS SubCategory, P.ReorderLevel, P.AvailableQuantity, P.Price, P.ProductAvailable, P.ImageUrl, P.Description, P.Discount, C.Id AS Expr1, P.SubCategoryId, 
                         P.CategoryId, SC.Id AS Expr2
FROM            dbo.Products AS P FULL OUTER JOIN
                         dbo.Category AS C ON P.CategoryId = C.Id FULL OUTER JOIN
                         dbo.SubCategory AS SC ON P.SubCategoryId = SC.Id

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Password], [Email], [Gender], [ImageUrl]) VALUES (1, N'12345', N'tanveer05@hotmail.com', N'Male', N'C:\Users\Tanveer\documents\visual studio 2013\Projects\WebBazzer\WebBazzer\Design\img\contact\57045366_2069108933158466_6192815955718963200_o.jpg')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CName]) VALUES (1, N'Men''s Wear')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (2, N'Women''S Wear')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (3, N'Electronic Devices')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (4, N'Electronic Accessories')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (5, N'Home Appliance')
INSERT [dbo].[Category] ([Id], [CName]) VALUES (6, N'Health & Beauty')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Country]) VALUES (1, N'Bangladesh')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (2, N'India')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (3, N'Pakistan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (4, N'Sri Lanka')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (5, N'Afghanistan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (6, N'United State')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (7, N'United Kingdom')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (8, N'Brazil')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (9, N'Iran')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (10, N'Canada')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (11, N'Parise')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (12, N'Albania')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (13, N'Argentina')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (14, N'Armania')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (15, N'Australia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (16, N'Austria')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (17, N'Bahrain')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (18, N'Belgium')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (19, N'Bhutan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (20, N'Bolivia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (21, N'Bosnia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (22, N'Cameroon')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (23, N'China')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (24, N'Chile')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (25, N'Colombia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (26, N'Costa Rica')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (27, N'Cuba')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (28, N'Denmark')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (29, N'Eqypt')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (30, N'Estonia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (31, N'Eritrea')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (32, N'Eswatini')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (33, N'Ethiopia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (34, N'Ecuador')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (35, N'Djibouti')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (36, N'Dominica')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (37, N'Dominican Republic')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (38, N'Finland')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (39, N'France')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (40, N'Fiji')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (41, N'Gabon')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (42, N'The Gambia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (43, N'Georgia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (44, N'Germany')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (45, N'Ghana')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (46, N'Greece')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (47, N'Guyana')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (48, N'Grenada')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (49, N'Hungary')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (50, N'Honduras')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (51, N'Haiti')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (52, N'Iceland')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (53, N'Indonesia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (54, N'Iraq')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (55, N'Ireland')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (56, N'Israel')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (57, N'Italy')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (58, N'Jamaica')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (59, N'Japan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (60, N'Jordan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (61, N'Kazakhstan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (62, N'Kenya')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (63, N'North Korea')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (64, N'South Korea')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (65, N'Kiribati')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (66, N'Kuwait')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (67, N'Kosovo')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (68, N'Laos')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (69, N'Latvia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (70, N'Lebanon')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (71, N'Lesotho')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (72, N'Liberia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (73, N'Libya')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (74, N'Malaysia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (75, N'Maldives')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (76, N'Madagascar')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (77, N'Malawi')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (78, N'Mali')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (79, N'Malta')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (80, N'Mexico')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (81, N'Moldova')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (82, N'Monaco')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (83, N'Mongolia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (84, N'Montenegro')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (85, N'Morocco')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (86, N'Myanmar (Burma)')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (87, N'Namibia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (88, N'Nauru')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (89, N'Nepal')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (90, N'Netherlands')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (91, N'New Zealand')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (92, N'Nicaragua')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (93, N'Niger')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (94, N'Nigeria')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (95, N'Norway')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (96, N'Oman')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (97, N'Palau')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (98, N'Panama')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (99, N'Papua New Guinea')
GO
INSERT [dbo].[Country] ([Id], [Country]) VALUES (100, N'Paraguay')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (101, N'Peru')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (102, N'Philippines')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (103, N'Poland')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (104, N'Portugal')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (105, N'Qatar')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (106, N'Romania')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (107, N'Russia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (108, N'Rwanda')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (109, N'Saint Lucia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (110, N'Samoa')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (111, N'San Marino')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (112, N'Saudi Arabia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (113, N'Senegal')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (114, N'Serbia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (115, N'Singapore')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (116, N'Slovakia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (117, N'Slovenia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (118, N'Somalia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (119, N'South Africa')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (120, N'Spain')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (121, N'Sudan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (122, N'South Sudan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (123, N'Suriname')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (124, N'Sweden')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (125, N'Switzerland')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (126, N'Syria')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (127, N'Taiwan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (128, N'Tajikistan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (129, N'Tanzania')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (130, N'Thailand')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (131, N'Togo')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (132, N'Tonga')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (133, N'Tunisia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (134, N'Trinidad and Tobago')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (135, N'Turkey')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (136, N'Tuvalu')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (137, N'Turkmenistan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (138, N'Uganda')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (139, N'Ukraine')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (140, N'United Arab Emirates')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (141, N'Uruguay')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (142, N'Uzbekistan')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (143, N'Vanuatu')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (144, N'Vatican City')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (145, N'Venezuela')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (146, N'Vietnam')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (147, N'Yemen')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (148, N'Zambia')
INSERT [dbo].[Country] ([Id], [Country]) VALUES (149, N'Zimbabwe')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [UserName], [Email], [Password], [Gender], [MobileNo], [Country], [City], [Address], [PostalCode]) VALUES (1, N'Anondo Mohon', N'Paul', N'mohon420', N'mohon420@gmail.com', N'1234567890', N'Male', N'01923384325', N'Bangladesh', N'Chittagong', N'Muradpur', N'4212')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [UserName], [Email], [Password], [Gender], [MobileNo], [Country], [City], [Address], [PostalCode]) VALUES (2, N'Tanveer', N'Alam', N'tanveer05', N'tanveer05@hotmail.com', N'0987654321', N'Male', N'01800000009', N'Bangladesh', N'Chittahong', N'Muradpur', N'4212')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [UserName], [Email], [Password], [Gender], [MobileNo], [Country], [City], [Address], [PostalCode]) VALUES (3, N'Tanveer', N'Aam', N'tanveer0544', N'ad22f@gmail.com', N'12345678', N'Male', N'0196756889', N'Bd', N'Chittagong', N'murad', N'4212')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[genMainSlider] ON 

INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (1, N'/Content/img/slider/1.jpg', N'Men slide img', N'Save Up to 75% Off', N'Men Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (2, N'/Content/img/slider/2.jpg', N'Wristwatch slide img', N'Save Up to 40% Off', N'Wristwatch Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (3, N'/Content/img/slider/3.jpg', N'Women Jeans slide img', N'Save Up to 75% Off', N'Jeans Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (4, N'/Content/img/slider/4.jpg', N'Shoes slide img', N'Save Up to 75% Off', N'Exclusive Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (5, N'/Content/img/slider/5.jpg', N'Male Female slide img', N'Save Up to 50% Off', N'Best Collection', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus, illum.', N'SHOP NOW', 0)
SET IDENTITY_INSERT [dbo].[genMainSlider] OFF
SET IDENTITY_INSERT [dbo].[genPromoRight] ON 

INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (1, 1, N'/Content/img/promo-banner-mens.jpg', N'img', N'Exclusive Item', N'For Men', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (2, 5, N'/Content/img/promo-banner-phones.jpg', N'img', N'Sales off', N'On Phones', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (3, 3, N'/Content/img/promo-banner-kids.jpg', N'img', N'New Arrivals', N'For Kids', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (4, 4, N'/Content/img/promo-banner-sports.jpg', N'img', N'25% off', N'On Sports', 0)
SET IDENTITY_INSERT [dbo].[genPromoRight] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (1, 2, 1, 1, 0, NULL, 900, 1, CAST(0x0000AA5C00BD1089 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (2, 2, 2, 2, 0, NULL, 1455, 1, CAST(0x0000AA5C01654649 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (3, 2, 3, 3, 0, NULL, 300, 1, CAST(0x0000AA5C017BA957 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (1002, 2, 6, 6, 0, NULL, 40000, 1, CAST(0x0000AA6500A5DA48 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (2002, 2, 1003, 7, 0, NULL, 10200, 1, CAST(0x0000AA6600B4A738 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [CustomerID], [PaymentID], [ShippingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (2003, 2, 2003, 8, 0, NULL, 10200, 1, CAST(0x0000AA6600B514F1 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1, 1, 1, CAST(900 AS Decimal(18, 0)), 1, NULL, CAST(900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (2, 2, 1, CAST(900 AS Decimal(18, 0)), 1, NULL, CAST(900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (3, 2, 4, CAST(555 AS Decimal(18, 0)), 1, NULL, CAST(555 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (4, 3, 24, CAST(300 AS Decimal(18, 0)), 1, NULL, CAST(300 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1003, 2003, 1, CAST(900 AS Decimal(18, 0)), 1, NULL, CAST(900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1004, 2003, 1, CAST(900 AS Decimal(18, 0)), 1, NULL, CAST(900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1005, 2003, 2, CAST(7500 AS Decimal(18, 0)), 1, NULL, CAST(7500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1006, 2003, 1, CAST(900 AS Decimal(18, 0)), 1, NULL, CAST(900 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [Amount], [PaymentTypeId], [PaymentDate], [CusomerId], [OrderComplete]) VALUES (1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [PaymentTypeId], [PaymentDate], [CusomerId], [OrderComplete]) VALUES (2, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [PaymentTypeId], [PaymentDate], [CusomerId], [OrderComplete]) VALUES (3, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [PaymentTypeId], [PaymentDate], [CusomerId], [OrderComplete]) VALUES (4, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [PaymentTypeId], [PaymentDate], [CusomerId], [OrderComplete]) VALUES (5, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [PaymentTypeId], [PaymentDate], [CusomerId], [OrderComplete]) VALUES (1002, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [PaymentTypeId], [PaymentDate], [CusomerId], [OrderComplete]) VALUES (2002, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([Id], [Amount], [PaymentTypeId], [PaymentDate], [CusomerId], [OrderComplete]) VALUES (2003, NULL, 5, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([Id], [TypeName]) VALUES (1, N'Cash on Delivery')
INSERT [dbo].[PaymentType] ([Id], [TypeName]) VALUES (2, N'Paypal')
INSERT [dbo].[PaymentType] ([Id], [TypeName]) VALUES (3, N'Master Card')
INSERT [dbo].[PaymentType] ([Id], [TypeName]) VALUES (4, N'Cradit Card')
INSERT [dbo].[PaymentType] ([Id], [TypeName]) VALUES (5, N'BiKash')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1, 1, 2, N'Full Black Slim Shirt', CAST(900.00 AS Decimal(18, 2)), 12, N'Full Coton ', N'/ProductImageFile/S_7.jpg', CAST(900.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 100)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (2, 1, 2, N'Shirt With Flower', CAST(7500.00 AS Decimal(18, 2)), 11, N'Nice', N'/ProductImageFile/S_1.jpg', CAST(750.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 150)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (3, 1, 2, N'Shirt', CAST(500.00 AS Decimal(18, 2)), 1, N'Made In India', N'/ProductImageFile/S_2.jpg', CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 200)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (4, 1, 2, N'Two Color Shirt', CAST(555.00 AS Decimal(18, 2)), 12, N'It  is So Cool', N'/ProductImageFile/S_3.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (5, 1, 2, N'White Shirt', CAST(400.00 AS Decimal(18, 2)), 7, N'Great', N'/ProductImageFile/S_4.jpg', CAST(400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 170)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (6, 1, 2, N'Party Shirt', CAST(788.00 AS Decimal(18, 2)), 12, N'For All Kind Of Party', N'/ProductImageFile/S_5.jpg', CAST(788.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 160)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (7, 1, 2, N'Office Shirt', CAST(555.00 AS Decimal(18, 2)), 22, N'For Office Men', N'/ProductImageFile/S_6.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 200)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (8, 1, 2, N'Shirt', CAST(790.00 AS Decimal(18, 2)), 1, N'Cool', N'/ProductImageFile/S_8.jpg', CAST(790.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 220)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (9, 1, 2, N'Slim Shirt', CAST(1200.00 AS Decimal(18, 2)), 4, N'Raymond', N'/ProductImageFile/m1.jpg', CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 500)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (10, 1, 2, N'Formal Shirt', CAST(2000.00 AS Decimal(18, 2)), 123, N'Raymond', N'/ProductImageFile/S_10.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (11, 1, 6, N'Slim-T-shirt', CAST(300.00 AS Decimal(18, 2)), 1, N'Nice', N'/ProductImageFile/shirt_1.png', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (12, 1, 6, N'Baby Boy T-Shirt', CAST(200.00 AS Decimal(18, 2)), 4, N'good', N'/ProductImageFile/shirt_2.png', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (13, 1, 6, N'Nice T-Shirt', CAST(555.00 AS Decimal(18, 2)), 4, N'Awesome', N'/ProductImageFile/shirt_3.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (14, 1, 6, N'T-shirt Bangladesh', CAST(200.00 AS Decimal(18, 2)), 12, N'Fine', N'/ProductImageFile/shirt_4.png', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (15, 1, 6, N'Black T-Shirt', CAST(555.00 AS Decimal(18, 2)), 12, N'Great', N'/ProductImageFile/shirt_5.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (16, 1, 6, N'House T-Shirt', CAST(300.00 AS Decimal(18, 2)), 34, N'What!', N'/ProductImageFile/shirt_6.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (17, 1, 6, N'Toy T-Shirt', CAST(555.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/shirt_7.jpeg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (18, 1, 6, N'LiFo T-shirt', CAST(555.00 AS Decimal(18, 2)), 2, N'good', N'/ProductImageFile/shirt_8.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (19, 1, 6, N'Cool-Boy T-Shirt', CAST(555.00 AS Decimal(18, 2)), 2, N'nice', N'/ProductImageFile/shirt_10.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (20, 1, 6, N'Roman Reings T-Shirt', CAST(555.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/shirt_9.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (24, 1, 8, N'Baby Watch', CAST(300.00 AS Decimal(18, 2)), 2, N'nice', N'/ProductImageFile/Wa_1.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1021, 5, 46, N'Cooler-1', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Co_1.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1022, 5, 46, N'Cooler-2', CAST(340.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Co_2.jpg', CAST(340.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1023, 5, 46, N'Cooler-3', CAST(500.00 AS Decimal(18, 2)), 11, N'nice', N'/ProductImageFile/Co_3.jpg', CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1024, 5, 46, N'Cooler-4', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Co_4.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1025, 5, 46, N'Heater-5', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Co_5.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1026, 5, 46, N'Heater-1', CAST(300.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/Co_7.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1027, 5, 46, N'Cooler-5', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Co_6.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1028, 5, 46, N'Heater-2', CAST(568.00 AS Decimal(18, 2)), 44, N'good', N'/ProductImageFile/Co_8.jpg', CAST(568.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1029, 5, 46, N'Heater-3', CAST(457.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Co_9.jpg', CAST(457.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1030, 5, 46, N'Cooler-6', CAST(567.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Co_10.jpg', CAST(567.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1031, 5, 45, N'K-1', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/KA_1.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1032, 5, 45, N'K-2', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/KA_2.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1033, 5, 45, N'K-3', CAST(200.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/KA_3.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1034, 5, 45, N'K-4', CAST(778.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/KA_4.jpg', CAST(778.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1035, 5, 45, N'K-5', CAST(230.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/KA_5.jpg', CAST(230.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1036, 5, 45, N'K-6', CAST(666.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/KA_6.jpg', CAST(666.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1037, 5, 45, N'K-7', CAST(700.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/KA_7.jpg', CAST(700.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1038, 5, 45, N'K-8', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/KA_8.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 7777)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1039, 5, 45, N'K-9', CAST(555.00 AS Decimal(18, 2)), 7, N'good', N'/ProductImageFile/KA_9.png', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1040, 5, 45, N'K-10', CAST(200.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/KA_10.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1041, 5, 47, N'DN-1', CAST(300.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/Dn_1.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1042, 5, 47, N'DN-2', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Dn_2.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1043, 5, 47, N'DN-3', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Dn_3.png', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1044, 5, 47, N'DN-4', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Dn_4.png', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1045, 5, 47, N'DN-5', CAST(300.00 AS Decimal(18, 2)), 7, N'good', N'/ProductImageFile/Dn_5.png', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1046, 5, 47, N'DN-6', CAST(300.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/Dn_6.JPG', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1047, 5, 47, N'DN-7', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Dn_7.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1048, 5, 47, N'DN-8', CAST(455.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/Dn_8.jpg', CAST(455.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1049, 5, 47, N'DN-9', CAST(600.00 AS Decimal(18, 2)), 4, N'good', N'/ProductImageFile/Dn_9.jpg', CAST(600.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1050, 5, 47, N'DN-10', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Dn_10.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1051, 5, 48, N'Filter-1', CAST(1200.00 AS Decimal(18, 2)), 3, N'Good', N'/ProductImageFile/Fil_1.jpg', CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1052, 5, 48, N'Filter-2', CAST(1500.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/Fil_2.jpg', CAST(1500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1053, 5, 48, N'Filter-3', CAST(1400.00 AS Decimal(18, 2)), 3, N'nice', N'/ProductImageFile/Fil_3.png', CAST(1400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1054, 5, 48, N'Filter-4', CAST(1600.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Fil_4.jpg', CAST(1600.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1055, 5, 48, N'Filter-5', CAST(1200.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Fil_5.jpeg', CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1056, 5, 48, N'Filter-6', CAST(1100.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Fil_6.jpg', CAST(1100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1057, 5, 48, N'Filter-7', CAST(1000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Fil_7.jpg', CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1058, 5, 48, N'Filter-8', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Fil_8.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1059, 5, 48, N'Filter-9', CAST(2300.00 AS Decimal(18, 2)), 4, N'good', N'/ProductImageFile/Fil_9.jpg', CAST(2300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1060, 5, 48, N'Filter-10', CAST(4000.00 AS Decimal(18, 2)), 6, N'nice', N'/ProductImageFile/Fil_10.jpg', CAST(4000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1061, 6, 52, N'Ec-1', CAST(1000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Ec_1.jpg', CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1062, 6, 52, N'Ec-2', CAST(1200.00 AS Decimal(18, 2)), 7, N'nice', N'/ProductImageFile/Ec_2.jpg', CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1063, 6, 52, N'Ec-3', CAST(3000.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/Ec_3.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1064, 6, 52, N'Ec-4', CAST(2000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Ec_4.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1065, 6, 52, N'Ec-5', CAST(2300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Ec_5.jpg', CAST(2300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1066, 6, 52, N'Ec-6', CAST(5000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Ec_6.jpg', CAST(5000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1067, 6, 52, N'Ec-7', CAST(4000.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/Ec_7.jpg', CAST(4000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1068, 6, 52, N'Ec-8', CAST(3000.00 AS Decimal(18, 2)), 8, N'good', N'/ProductImageFile/Ec_8.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1069, 6, 52, N'Ec-9', CAST(3050.00 AS Decimal(18, 2)), 1, N'nice', N'/ProductImageFile/Ec_9.jpg', CAST(3050.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1070, 6, 52, N'Ec-10', CAST(5550.00 AS Decimal(18, 2)), 7, N'nice', N'/ProductImageFile/Ec_10.jpg', CAST(5550.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1071, 6, 49, N'Face Wash-1 For Man', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/MaC_1.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1072, 6, 49, N'Face Wash-2 For Man', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/MaC_2.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1073, 6, 49, N'FaceWash For Man', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/MaC_3.png', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1074, 6, 49, N'FareHandsome Cream', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/MaC_4.png', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1075, 6, 49, N'Shampo For Man', CAST(300.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/MaC_5.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1076, 6, 49, N'Cream-1', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/MaC_6.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1077, 6, 49, N'Cream-2', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/MaC_7.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1078, 6, 49, N'Shampo-1 For Man', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/MaC_8.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1079, 6, 49, N'Hair Cream For Man', CAST(700.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/MaC_9.jpg', CAST(700.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1080, 6, 49, N'Hair Cream 2 For Man', CAST(500.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/MaC_10.jpg', CAST(500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1081, 6, 50, N'Face Beauty  Women', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/WO_C_1.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1082, 6, 50, N'Oil Women', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/WO_C_2.png', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1083, 6, 50, N'Massage Oil', CAST(555.00 AS Decimal(18, 2)), 1, N'nice', N'/ProductImageFile/WO_C_3.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1084, 6, 50, N'Cream', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/WO_C_4.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1085, 6, 50, N'Wc-3', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/WO_C_5.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1086, 6, 50, N'Wc-4', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/WO_C_6.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1087, 6, 50, N'Wc-5', CAST(700.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/WO_C_7.jpeg', CAST(700.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1088, 6, 50, N'Wc-6', CAST(900.00 AS Decimal(18, 2)), 1, N'nice', N'/ProductImageFile/WO_C_8.jpeg', CAST(900.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1089, 6, 50, N'MakeUp', CAST(600.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/WO_C_9.jpg', CAST(600.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1090, 6, 50, N'Wc-9', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/WO_C_10.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1091, 6, 51, N'Mc-1', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mc_1.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1092, 6, 51, N'Mc-2', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mc_2.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1093, 6, 51, N'Mc-3', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mc_3.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1094, 6, 51, N'Mc-4', CAST(123.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mc_4.jpg', CAST(123.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1095, 6, 51, N'Mc-5', CAST(150.00 AS Decimal(18, 2)), 4, N'good', N'/ProductImageFile/Mc_5.png', CAST(150.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1096, 6, 51, N'Mc-6', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mc_6.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1097, 6, 51, N'Mc-7', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mc_7.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1098, 6, 51, N'Mc-8', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mc_8.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1099, 6, 51, N'Mc-9', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mc_9.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1100, 6, 51, N'Mc-10', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mc_10.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1101, 4, 44, N'HeadPhone-1', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Aud_1.png', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1102, 4, 44, N'HeadPhone-2', CAST(6000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Aud_2.png', CAST(6000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1103, 4, 44, N'HeadPhone-3', CAST(1000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Aud_3.jpg', CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1104, 4, 44, N'HeadPhone-4', CAST(800.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/Aud_4.png', CAST(800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1105, 4, 44, N'HeadPhone-5', CAST(900.00 AS Decimal(18, 2)), 2, N'good', N'/ProductImageFile/Aud_5.jpg', CAST(900.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1106, 4, 44, N'HeadPhone-6', CAST(2000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Aud_7.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1107, 4, 44, N'HeadPhone-7', CAST(5550.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Aud_7.jpg', CAST(5550.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1108, 4, 39, N'KeyBoard', CAST(900.00 AS Decimal(18, 2)), 5, N'good', N'/ProductImageFile/Com_1.png', CAST(900.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1109, 4, 39, N'Cooler', CAST(1200.00 AS Decimal(18, 2)), 4, N'good', N'/ProductImageFile/Com_2.jpg', CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1110, 4, 39, N'Cable', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Com_3.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1111, 4, 39, N'CPU', CAST(5000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Com_4.jpg', CAST(5000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1112, 4, 39, N'Sound Box', CAST(1000.00 AS Decimal(18, 2)), 6, N'good', N'/ProductImageFile/Com_6.jpg', CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1113, 4, 39, N'Mouse', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Com_5.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1114, 4, 39, N'Wifi KeyBoard', CAST(5000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Com_9.jpg', CAST(5000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1115, 4, 39, N'Wifi Mouse', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Com_10.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1116, 4, 34, N'Just Cause 4', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Games_1.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1117, 4, 41, N'EVE', CAST(4000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Games_2.jpg', CAST(4000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1118, 4, 41, N'Mortal  Kombite X', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Games_4.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1119, 4, 41, N'Call of Duty', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Games_6.jpeg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1120, 4, 41, N'GTA', CAST(2400.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Games_8.jpg', CAST(2400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1121, 4, 41, N'FiFa-2019', CAST(4000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Games_10.jpg', CAST(4000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1122, 4, 38, N'Stand For Movie ', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mo_2.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1123, 4, 38, N'Bluetooth', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mo_3.jpeg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1124, 4, 38, N'VBox', CAST(900.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mo_4.png', CAST(900.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1125, 4, 38, N'Case-1', CAST(555.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/Mo_7.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1126, 4, 38, N'Mobile Lens', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mo_8.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1127, 4, 38, N'Bluetooth 2', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mo_10.jpeg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1128, 4, 43, N'Lan Port', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Net_1.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1129, 4, 43, N'Usb Hub', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Net_2.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1130, 4, 43, N'NC-8', CAST(5550.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Net_8.png', CAST(5550.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1131, 4, 43, N'Adapter', CAST(700.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Net_4.jpg', CAST(700.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1132, 4, 42, N'Sony Printer', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Print_2.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1133, 4, 42, N'PhotoCopy Machine', CAST(16000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Print_6.jpg', CAST(16000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1134, 4, 42, N'Toshiba Printer', CAST(6000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Print_4.png', CAST(6000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1135, 4, 42, N'Dell Printer', CAST(5000.00 AS Decimal(18, 2)), 5, N'good', N'/ProductImageFile/Print_9.jpg', CAST(5000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1136, 4, 40, N'Windows 10', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Soft_1.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1137, 4, 40, N'WebRoot AntiVirus', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Soft_2.png', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1138, 4, 40, N'Kasparesky', CAST(3500.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Soft_3.jpg', CAST(3500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1139, 4, 40, N'Office 2019', CAST(2000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Soft_4.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1140, 4, 40, N'Internet Security', CAST(4000.00 AS Decimal(18, 2)), 2, N'good', N'/ProductImageFile/Soft_5.png', CAST(4000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1141, 4, 40, N'Norton ', CAST(5000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Soft_7.jpg', CAST(5000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1142, 4, 40, N'Adobe Photoshop 2019', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Soft_10.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1143, 3, 30, N'Lg-GT80', CAST(40000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mobiles_.jpg', CAST(40000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1144, 3, 30, N'Samsung J7', CAST(12000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mobiles_1.jpg', CAST(12000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1145, 3, 30, N'Honor 10', CAST(20000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mobiles_2.jpg', CAST(20000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1146, 3, 30, N'One Plus P10', CAST(50000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mobiles_8.jpg', CAST(50000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1147, 3, 30, N'Lg-U8', CAST(6000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Mobiles_9.jpg', CAST(6000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1148, 3, 35, N'Canon-D50', CAST(40000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Camera_1.jpg', CAST(40000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1149, 3, 35, N'Nicon-T2', CAST(60000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Camera_9.jpg', CAST(60000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1150, 3, 35, N'Sony-HD40', CAST(40000.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/Camera_5.jpg', CAST(40000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1151, 3, 36, N'Zoom Lens 360', CAST(70000.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/Cam_L_9.jpg', CAST(70000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1152, 3, 36, N'Kit Lens', CAST(60000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Cam_L_3.jpg', CAST(60000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1153, 3, 36, N'FIsh Eye Lens', CAST(50000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Cam_L_5.jpg', CAST(50000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1154, 3, 36, N'Telescope Lens', CAST(80000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Cam_L_1.jpg', CAST(80000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1155, 3, 32, N'Sony D30 Corei5 ', CAST(50000.00 AS Decimal(18, 2)), 1, N' good', N'/ProductImageFile/Desk_1.jpg', CAST(50000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1156, 3, 32, N'Dell ST5 Corei5', CAST(45000.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/Desk_2.jpg', CAST(45000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1157, 3, 32, N'Hoshiba Setelite b5', CAST(30000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Desk_5.JPG', CAST(30000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1158, 3, 32, N'Sony-HD40 Corei3', CAST(28000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Desk_4.jpg', CAST(28000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1159, 3, 32, N'Hp HD678', CAST(70000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Desk_8.jpg', CAST(70000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1160, 3, 31, N'Hp-45Td ', CAST(6000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Lap_.jpg', CAST(6000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1161, 3, 31, N'Dell y67', CAST(50999.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Lap_1.jpg', CAST(50999.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1162, 3, 31, N'Toshiba SataliteBd', CAST(45000.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/Lap_2.jpg', CAST(45000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1163, 3, 31, N'Sony 4er5', CAST(30000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Lap_8.jpg', CAST(30000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1164, 3, 34, N'Joystics r5', CAST(700.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Gam_C_1.jpg', CAST(700.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1165, 3, 34, N'Joystick for mobile', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Gam_C_8.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1166, 3, 34, N'GC-6', CAST(555.00 AS Decimal(18, 2)), 12, N'nice', N'/ProductImageFile/Gam_C_4.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1167, 3, 34, N'GC-7', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Gam_C_6.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1168, 3, 34, N'GC-9', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Gam_C_4.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1169, 3, 37, N'SEC-1', CAST(10000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/SEC_C_.jpg', CAST(10000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1170, 3, 37, N'SEC-2', CAST(80000.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/SEC_C_4.jpg', CAST(80000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1171, 3, 37, N'SEC-9', CAST(30000.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/SEC_C_2.jpg', CAST(30000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1172, 3, 37, N'SEC-28', CAST(50000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/SEC_C_9.jpg', CAST(50000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1173, 3, 37, N'SEC-10', CAST(6000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/SEC_C_3.png', CAST(6000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1174, 3, 33, N'Huawei Tab 69', CAST(40000.00 AS Decimal(18, 2)), 7, N'good', N'/ProductImageFile/Tab_1.jpg', CAST(40000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1175, 3, 33, N'Galaxy Tab S12', CAST(60000.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Tab_4.jpg', CAST(60000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1176, 3, 33, N'Sony Tab ft40', CAST(70000.00 AS Decimal(18, 2)), 128, N'good', N'/ProductImageFile/Tab_5.png', CAST(70000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1177, 3, 33, N'Mi Tab T50', CAST(20000.00 AS Decimal(18, 2)), 121, N'good', N'/ProductImageFile/Tab_8.jpg', CAST(20000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1178, 3, 33, N'Symphony  Tab 88TY', CAST(7000.00 AS Decimal(18, 2)), 8, N'good', N'/ProductImageFile/Tab_2.jpg', CAST(7000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1179, 1, 5, N'Sunglass-1', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Su_1.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1180, 1, 5, N'Sunglass-2', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Su_2.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1181, 1, 5, N'Sunglass-3', CAST(200.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/Su_4.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1182, 1, 5, N'Sunglass-4', CAST(555.00 AS Decimal(18, 2)), 7, N'good', N'/ProductImageFile/Su_6.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1183, 1, 5, N'Sunglass-5', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Su_8.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 7777)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1184, 1, 5, N'Sunglass-6', CAST(555.00 AS Decimal(18, 2)), 34, N'nice', N'/ProductImageFile/Su_9.jpeg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1185, 1, 10, N'Fatua-1', CAST(555.00 AS Decimal(18, 2)), 2, N'nice', N'/ProductImageFile/Pan_1.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1186, 1, 10, N'Fatua-2', CAST(300.00 AS Decimal(18, 2)), 1, N'good', N'/ProductImageFile/Pan_2.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1187, 1, 10, N'Panjabi-1', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/Pan_5.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1188, 1, 10, N'Panjabi-2', CAST(300.00 AS Decimal(18, 2)), 1, N'nice', N'/ProductImageFile/Pan_6.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1189, 1, 10, N'Baby', CAST(555.00 AS Decimal(18, 2)), 2, N'nice', N'/ProductImageFile/Pan_3.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1190, 1, 10, N'Panjabi-3', CAST(800.00 AS Decimal(18, 2)), 7, N'good', N'/ProductImageFile/Pan_9.jpg', CAST(800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1191, 1, 10, N'Panjabi-4', CAST(555.00 AS Decimal(18, 2)), 1, N'nice', N'/ProductImageFile/Pan_7.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1192, 1, 15, N' Belt -1', CAST(555.00 AS Decimal(18, 2)), 2, N'good', N'/ProductImageFile/B_1.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1193, 1, 15, N'Belt-2', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/B_2.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1194, 1, 15, N'Belt-3', CAST(300.00 AS Decimal(18, 2)), 7, N'good', N'/ProductImageFile/B_3.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1195, 1, 15, N'Belt-4', CAST(555.00 AS Decimal(18, 2)), 4, N'nice', N'/ProductImageFile/B_10.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1196, 1, 15, N'Belt-5', CAST(300.00 AS Decimal(18, 2)), 34, N'nice', N'/ProductImageFile/B_9.jpeg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1197, 1, 15, N'Belt-6', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/B_6.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1198, 1, 9, N'Wallet-1', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/w_1.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1199, 1, 9, N'Wallet-2', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'/ProductImageFile/w_3.jpeg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1200, 1, 9, N'Wallet-3', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\w_4.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1201, 1, 9, N'Wallet-4', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\w_9.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1202, 1, 9, N'Wallet-5', CAST(800.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\w_2.jpg', CAST(800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1203, 1, 9, N'Wallet-6', CAST(800.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\w_5.jpg', CAST(800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1204, 1, 12, N'Black Polo', CAST(555.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Po_1.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1205, 1, 12, N'Polo-1', CAST(3000.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Po_10.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1206, 1, 12, N'Polo B39', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Po_5.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1207, 1, 12, N'Unique Polo', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Po_9.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1208, 1, 12, N'XXX Polo', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Po_7.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1209, 1, 12, N'Tec Polo', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Po_8.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1210, 1, 13, N'Pant-1', CAST(900.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Pa_1.jpg', CAST(900.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1211, 1, 13, N'Mojo Pant', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Pa_5.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1212, 1, 13, N'Pant-2', CAST(2000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Pa_9.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1213, 1, 13, N'Pant-10', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Pa_4.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1214, 1, 13, N'Slim-Pant', CAST(600.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Pa_8.jpg', CAST(600.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1215, 1, 16, N'Bow Tie', CAST(2000.00 AS Decimal(18, 2)), 4, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\tie_1.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1216, 1, 16, N'Bow Tie Flex', CAST(1000.00 AS Decimal(18, 2)), 1, N'nice', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\tie_4.jpg', CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1217, 1, 16, N'Tie Red', CAST(3000.00 AS Decimal(18, 2)), 12, N'nice', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\tie_6.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1218, 1, 16, N'Tie Green', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\tie_3.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1219, 1, 16, N'Tie ', CAST(2000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\tie_5.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1220, 1, 16, N'Tie hex', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\tie_2.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1221, 1, 11, N'Man in Black', CAST(15000.00 AS Decimal(18, 2)), 7, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Su_2.jpg', CAST(15000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1222, 1, 11, N'Suit Fit Body ', CAST(20000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Su_3.jpg', CAST(20000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1223, 1, 11, N'Suit Lawer', CAST(55500.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Su_1.jpg', CAST(55500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1224, 1, 11, N'Flix Suit', CAST(12000.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Su_6.jpg', CAST(12000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1225, 1, 11, N'Party SUit', CAST(7000.00 AS Decimal(18, 2)), 7, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Su_7.jpg', CAST(7000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1226, 1, 11, N'Office Suit', CAST(5000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Su_8.jpg', CAST(5000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1200)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1227, 1, 8, N'Watch-1', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Wa_3.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1228, 1, 8, N'Watch-2', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Wa_4.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1229, 1, 8, N'Watch-3', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Wa_8.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1230, 1, 8, N'Watch-4', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Wa_10.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1231, 1, 20, N'BalckWhite Jacket', CAST(5000.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Wi_1.jpg', CAST(5000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1232, 1, 20, N'Switer', CAST(900.00 AS Decimal(18, 2)), 7, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Wi_4.jpeg', CAST(900.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1233, 1, 14, N'Jacket-1', CAST(6000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Wi_7.jpg', CAST(6000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1234, 1, 14, N'Warm ', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Wi_10.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1235, 1, 7, N'WoodLand ', CAST(10000.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Fo_1.jpg', CAST(10000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1236, 1, 7, N'Nike', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Fo_5.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1237, 1, 7, N'Converse', CAST(3000.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Fo_4.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1238, 1, 7, N'Party Shoe', CAST(5550.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Fo_10.jpg', CAST(5550.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1239, 1, 7, N'Office Shoe', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Fo_3.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1240, 2, 22, N'Sharee-1', CAST(3000.00 AS Decimal(18, 2)), 12, N'nice', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sr_1.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1241, 2, 22, N'Sharee-2', CAST(5550.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sr_2.jpg', CAST(5550.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1242, 2, 22, N'Sharee-3', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sr_3.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1243, 2, 22, N'Sharee-4', CAST(2000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sr_4.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1244, 2, 22, N'Sharee-5', CAST(1230.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sr_5.jpg', CAST(1230.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1245, 2, 22, N'Sharee-6', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sr_6.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1246, 2, 23, N'WO-Sk -1', CAST(555.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sk_1.jpeg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1247, 2, 23, N'WO-Sk -2', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sk_3.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1248, 2, 23, N'WO-Sk -3', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sk_5.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1249, 2, 23, N'WO-Sk -4', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sk_6.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1250, 2, 23, N'WO-Sk -5', CAST(2000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sk_8.jpeg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1251, 2, 23, N'WO-Sk -6', CAST(1230.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Sk_7.png', CAST(1230.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1200)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1252, 2, 26, N'WO-Jw-1', CAST(6000.00 AS Decimal(18, 2)), 12, N'nice', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Jw_1.jpg', CAST(6000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1253, 2, 26, N'WO-Jw-2', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Jw_5.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1254, 1, 26, N'WO-Jw-3', CAST(1230.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Jw_6.jpg', CAST(1230.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1255, 2, 26, N'WO-Jw-4', CAST(555.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Jw_9.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1256, 1, 27, N'Hijab-1', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Hi_1.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1257, 2, 27, N'Hijab-2', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Hi_3.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1258, 2, 27, N'Hijab-3', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Hi_5.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1259, 2, 27, N'Hijab-4', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Hi_4.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1260, 2, 27, N'Hijab-5', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Hi_7.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1261, 2, 24, N'Kurti-1', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ku_1.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1262, 1, 24, N'Kurti-2', CAST(555.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ku_2.jpeg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1263, 2, 24, N'Kurti-3', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ku_4.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1264, 2, 24, N'Kurti-4', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ku_8.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1265, 2, 24, N'Kurti-5', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ku_7.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1266, 1, 17, N'Hill-1', CAST(900.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Fo_1.jpg', CAST(900.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1267, 2, 17, N'Hill-2', CAST(5550.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Fo_4.jpeg', CAST(5550.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1268, 2, 17, N'Plane ', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Fo_5.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 12)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1269, 2, 17, N'Step', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Fo_9.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1270, 2, 28, N'Beg-1', CAST(3000.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Wac_4.JPG', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1271, 2, 28, N'Beg-2', CAST(555.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Wac_5.JPG', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1272, 2, 28, N'Beg-3', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Wac_1.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1273, 2, 28, N'Beg-5', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Wac_9.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1274, 2, 21, N'Glass-1', CAST(555.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Su_1.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1275, 2, 21, N'Glass-2', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Su_2.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1276, 2, 21, N'Glass-3', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Su_6.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1277, 2, 21, N'Glass-4', CAST(200.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Su_9.jpg', CAST(200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1278, 2, 21, N'Glass-5', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Su_10.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1279, 2, 18, N'Watch-00', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Wa_1.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1280, 2, 18, N'Watch -70', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Wa_2.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1281, 2, 18, N'Watch -700', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Wa_6.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1282, 2, 18, N'Watch -79', CAST(300.00 AS Decimal(18, 2)), 12, N'nice', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Wa_3.jpeg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1283, 2, 8, N'Watch -790', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Wa_10.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1200)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1284, 2, 25, N'WO-WA-1', CAST(6000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_WA_1.jpg', CAST(6000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1285, 2, 25, N'WO-WA-2', CAST(30000.00 AS Decimal(18, 2)), 1, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_WA_9.jpg', CAST(30000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1286, 2, 25, N'WO-WA-3', CAST(2000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_WA_5.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1287, 2, 25, N'WO-WA-4', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_WA_4.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1288, 2, 25, N'WO-WA-5', CAST(1230.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_WA_8.jpg', CAST(1230.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1289, 2, 20, N'WW-1', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ww_1.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1290, 2, 20, N'WW-2', CAST(3000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ww_4.jpg', CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1291, 2, 20, N'WW-3', CAST(2000.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ww_7.jpg', CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1211)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1292, 2, 20, N'WW-4', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ww_5.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1293, 2, 20, N'WW-5', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\WO_Ww_6.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 300)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1294, 6, 49, N'Blue Plus', CAST(1200.00 AS Decimal(18, 2)), 4, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Per_1.jpg', CAST(1200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1295, 6, 49, N'One Man Show', CAST(5550.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Per_9.jpg', CAST(5550.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 600)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1296, 6, 49, N'Fogg', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Per_8.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1200)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1297, 6, 49, N'Nevia', CAST(300.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Per_10.jpg', CAST(300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 3000)
INSERT [dbo].[Products] ([Id], [CategoryId], [SubCategoryId], [PName], [Price], [ReorderLevel], [Description], [ImageUrl], [OldPrice], [Discount], [ProductAvailable], [AvailableQuantity]) VALUES (1298, 6, 49, N'Set Wet', CAST(555.00 AS Decimal(18, 2)), 12, N'good', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\Per_2.jpg', CAST(555.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 120)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[RecentlyViews] ON 

INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (1, 2, 6, CAST(0x0000AA5B0160A7F2 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (2, 2, 6, CAST(0x0000AA5B0160EAEC AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (3, 2, 6, CAST(0x0000AA5B01612914 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (4, 2, 6, CAST(0x0000AA5B0161298D AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (5, 2, 2, CAST(0x0000AA5B0162BA6A AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (6, 2, 2, CAST(0x0000AA5B0162D3F0 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (7, 2, 2, CAST(0x0000AA5B0162D44C AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (8, 2, 1, CAST(0x0000AA5B016EEA72 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (9, 2, 1, CAST(0x0000AA5C00E5CD3F AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (10, 2, 1, CAST(0x0000AA5C016430A8 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (11, 2, 4, CAST(0x0000AA5C0164D202 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (12, 2, 2, CAST(0x0000AA5C0164E146 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (13, 2, 2, CAST(0x0000AA5C0164F76B AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (14, 2, 24, CAST(0x0000AA5C017B252B AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (15, 2, 24, CAST(0x0000AA5C017B44F1 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (16, 2, 24, CAST(0x0000AA5C017B4557 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (17, 2, 1143, CAST(0x0000AA5D000193E2 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (18, 2, 1143, CAST(0x0000AA5D0001B2F5 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (19, 2, 1143, CAST(0x0000AA5D0001BD25 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (20, 2, 1143, CAST(0x0000AA5D0001BDB2 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (21, 2, 1143, CAST(0x0000AA5D0002BCF8 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (22, 2, 1143, CAST(0x0000AA5D0002BD4A AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (1010, 2, 1, CAST(0x0000AA6500A56D94 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (2010, 2, 1, CAST(0x0000AA6600B30898 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (2011, 2, 1, CAST(0x0000AA6600B33FC4 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (2012, 2, 1, CAST(0x0000AA6600B4011E AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (2013, 2, 1, CAST(0x0000AA6600B40C54 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (2014, 2, 2, CAST(0x0000AA6600B417C4 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (2015, 2, 1, CAST(0x0000AA6600B44CAA AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (2016, 2, 1235, CAST(0x0000AA6600B5F7B4 AS DateTime), NULL, NULL)
INSERT [dbo].[RecentlyViews] ([ID], [CustomerID], [ProductID], [ViewDate], [Note], [OrderDetailsId]) VALUES (2017, 2, 1034, CAST(0x0000AA6600B6217E AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[RecentlyViews] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ID], [CustomerID], [ProductID], [Review], [Rate], [DateTime], [isDelete], [Email], [Name]) VALUES (1, 2, 6, N'good', 5, CAST(0x0000AA5B0160E973 AS DateTime), NULL, N'irfanulalamtanvir@gmail.com', N'tanveer')
INSERT [dbo].[Review] ([ID], [CustomerID], [ProductID], [Review], [Rate], [DateTime], [isDelete], [Email], [Name]) VALUES (2, 2, 1, N'good', 5, CAST(0x0000AA6600B33F3D AS DateTime), NULL, N'irfanulalamtanvir@gmail.com', N'Shurjo')
SET IDENTITY_INSERT [dbo].[Review] OFF
INSERT [dbo].[ShippingDetails] ([ID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (1, N'Anondo Mohon', N'Tanveer', N'tanveer05@hotmail.com', N'01900000000', N'muradpur', N'Punjab', N'Chittahong', N'4212')
INSERT [dbo].[ShippingDetails] ([ID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (2, N'Ismail', N'Abdullah', N'adf@gmail.com', N'01900000000', N'muradpur', N'Punjab', N'Chittahong', N'4212')
INSERT [dbo].[ShippingDetails] ([ID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (3, N'Tanveer', N'ALam', N'mohon420@gmail.com', N'01900000000', N'Agrabad', N'Chittagong', N'Chittahong', N'4212')
INSERT [dbo].[ShippingDetails] ([ID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (4, N'Ismail', N'Tanveer', N'mohon420@gmail.com', N'01900000000', N'dse', N'Dhaka', N'Chittahong', N'4212')
INSERT [dbo].[ShippingDetails] ([ID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (5, N'Ismail', N'Tanveer', N'mohon420@gmail.com', N'01900000000', N'dse', N'Dhaka', N'Chittahong', N'4212')
INSERT [dbo].[ShippingDetails] ([ID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (6, N'Anondo Mohon', N'Tanveer', N'tanveer05@hotmail.com', N'01900000000', N'luyd;', N'Chittagong', N'Chittahong', N'4212')
INSERT [dbo].[ShippingDetails] ([ID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (7, N'Anondo Mohon', N'Tanveer', N'tanveer05@hotmail.com', N'01900000000', N'dfjl.', N'Chittagong', N'Chittahong', N'4212')
INSERT [dbo].[ShippingDetails] ([ID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (8, N'Anondo Mohon', N'Tanveer', N'tanveer05@hotmail.com', N'01900000000', N'dfjl.', N'Chittagong', N'Chittahong', N'4212')
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (2, 1, N'Shirts')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (5, 1, N'Sunglasses')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (6, 1, N'T-Shirts')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (7, 1, N'Footwear')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (8, 1, N'Watches')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (9, 1, N'Wallets')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (10, 1, N'Panjabi & Fatua')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (11, 1, N'Suits')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (12, 1, N'Polo Shirts')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (13, 1, N'Pant')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (14, 1, N'Winter Wear')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (15, 1, N'Belt')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (16, 1, N'Tie & Bow Tie')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (17, 2, N'Footwear')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (18, 2, N'Watches')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (20, 2, N'Winter Wear')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (21, 2, N'Sunglasses')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (22, 2, N'Saree')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (23, 2, N'Shalwar Kameez')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (24, 2, N'Kurtis')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (25, 2, N'Wedding Wear')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (26, 2, N'Jewelleries')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (27, 2, N'Hijab ')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (28, 2, N'Ladies Accessories')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (29, 1, N'Jens Accessories')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (30, 3, N'Mobiles')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (31, 3, N'Laptops')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (32, 3, N'Desktops')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (33, 3, N'Tablets')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (34, 3, N'Gameing Consoles')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (35, 3, N'Cameras')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (36, 3, N'Camera Lenses')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (37, 3, N'Security Cameras')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (38, 4, N'Mobile Accessories')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (39, 4, N'Computer Accessories')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (40, 4, N'Software')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (41, 4, N'Game')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (42, 4, N'Printer')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (43, 4, N'Network Components')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (44, 4, N'Audio')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (45, 5, N'Kitchen Accessories')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (46, 5, N'Cooling & Heating')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (47, 5, N'Daily Needs')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (48, 5, N'Filters')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (49, 6, N'Men Care')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (50, 6, N'Women Care')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (51, 6, N'Madical Needs')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (52, 6, N'Electric Cigarrate')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (53, 1, N'aaaa')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (1053, 1, N'ddd')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (1054, 1, N'gfhgj')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (1055, 1, N'nmnbv')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [SName]) VALUES (1056, 1, N'shjhg')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [FirstName], [LastName], [Email], [Age], [Address], [Gender], [MobileNo], [ImageUrl]) VALUES (1, N'Md Irfanul Alam', N'Tanveer', N'tanveer05@hotmail.com', 22, N'Muradpur', N'Male', N'01923384325', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\57045366_2069108933158466_6192815955718963200_o.jpg')
INSERT [dbo].[Supplier] ([Id], [FirstName], [LastName], [Email], [Age], [Address], [Gender], [MobileNo], [ImageUrl]) VALUES (2, N'Ag', N'Sumon', N'agsumon@gmail.com', 22, N'Chandgaon', N'Male', N'0180000000', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\IMG-20190115-WA0005.jpg')
INSERT [dbo].[Supplier] ([Id], [FirstName], [LastName], [Email], [Age], [Address], [Gender], [MobileNo], [ImageUrl]) VALUES (3, N'Anondo Mohon', N'Paul', N'mohon509@gmail.com', 22, N'Bohoddarhat', N'Male', N'0196756889', N'C:\Users\Tanveer\Documents\Visual Studio 2013\Projects\WebBazzer\WebBazzer\ProductImageFile\2017-04-22-17-40-03-976.jpg')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([ID], [CustomerID], [ProductID], [isActive], [OrderId]) VALUES (1003, 2, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Taxes]  DEFAULT ((0)) FOR [Taxes]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_isCompleted]  DEFAULT ((0)) FOR [isCompleted]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DIspatched]  DEFAULT ((0)) FOR [DIspatched]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Shipped]  DEFAULT ((0)) FOR [Shipped]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Deliver]  DEFAULT ((0)) FOR [Deliver]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CancelOrder]  DEFAULT ((0)) FOR [CancelOrder]
GO
ALTER TABLE [dbo].[Wishlist] ADD  CONSTRAINT [DF_Wishlist_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[genPromoRight]  WITH CHECK ADD  CONSTRAINT [FK_genPromoRight_Category1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[genPromoRight] CHECK CONSTRAINT [FK_genPromoRight_Category1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CoustomerRegistration] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CoustomerRegistration]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ShippingDetails] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingDetails] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ShippingDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_CoustomerRegistration] FOREIGN KEY([CusomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_CoustomerRegistration]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategory]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_CoustomerRegistration] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_CoustomerRegistration]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_OrderDetails] FOREIGN KEY([OrderDetailsId])
REFERENCES [dbo].[OrderDetails] ([ID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_OrderDetails]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Products]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_CoustomerRegistration] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_CoustomerRegistration]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Products]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_CoustomerRegistration] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_CoustomerRegistration]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Order]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Products]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SC"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllCategorisView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AllCategorisView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -35
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 102
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SC"
            Begin Extent = 
               Top = 102
               Left = 259
               Bottom = 215
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductDetails'
GO
USE [master]
GO
ALTER DATABASE [WebBazer] SET  READ_WRITE 
GO

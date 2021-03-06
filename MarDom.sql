USE [master]
GO
/****** Object:  Database [MarDom]    Script Date: 2/4/2020 12:55:12 AM ******/
CREATE DATABASE [MarDom]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarDom', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MarDom.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MarDom_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MarDom_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MarDom] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarDom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarDom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarDom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarDom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarDom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarDom] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarDom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MarDom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarDom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarDom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarDom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarDom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarDom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarDom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarDom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarDom] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MarDom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarDom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarDom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarDom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarDom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarDom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarDom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarDom] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MarDom] SET  MULTI_USER 
GO
ALTER DATABASE [MarDom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarDom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarDom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarDom] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MarDom] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MarDom]
GO
/****** Object:  User [wandyrh]    Script Date: 2/4/2020 12:55:12 AM ******/
CREATE USER [wandyrh] FOR LOGIN [wandyrh] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [wandyrh]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [wandyrh]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [wandyrh]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [wandyrh]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [wandyrh]
GO
ALTER ROLE [db_datareader] ADD MEMBER [wandyrh]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [wandyrh]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [wandyrh]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [wandyrh]
GO
/****** Object:  Table [dbo].[GoodsMovements]    Script Date: 2/4/2020 12:55:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsMovements](
	[IDGoodsMovements] [int] IDENTITY(1,1) NOT NULL,
	[IDMovementType] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Quantity] [float] NOT NULL,
	[IDStorageLocationFrom] [int] NOT NULL,
	[IDStorageLocationTo] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_GoodsMovements] PRIMARY KEY CLUSTERED 
(
	[IDGoodsMovements] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MovementTypes]    Script Date: 2/4/2020 12:55:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MovementTypes](
	[IDMovementType] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MovementTypes] PRIMARY KEY CLUSTERED 
(
	[IDMovementType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/4/2020 12:55:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[IDProduct] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[Category] [varchar](50) NULL,
	[UnitOfMeasurement] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Produts] PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 2/4/2020 12:55:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[IDStock] [int] IDENTITY(1,1) NOT NULL,
	[IDProduct] [int] NOT NULL,
	[IDStorageLocation] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[IDStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StorageLocations]    Script Date: 2/4/2020 12:55:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StorageLocations](
	[IDStorageLocation] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[MaxQtty] [float] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_StorageLocations] PRIMARY KEY CLUSTERED 
(
	[IDStorageLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/4/2020 12:55:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MovementTypes] ON 

INSERT [dbo].[MovementTypes] ([IDMovementType], [Description], [IsDeleted]) VALUES (1, N'Entrada por recepción de artículo', 0)
INSERT [dbo].[MovementTypes] ([IDMovementType], [Description], [IsDeleted]) VALUES (2, N'Entrada por devolución', 0)
INSERT [dbo].[MovementTypes] ([IDMovementType], [Description], [IsDeleted]) VALUES (3, N'Entrada por ajuste', 0)
INSERT [dbo].[MovementTypes] ([IDMovementType], [Description], [IsDeleted]) VALUES (4, N'Entrada por movimiento de inventario', 0)
INSERT [dbo].[MovementTypes] ([IDMovementType], [Description], [IsDeleted]) VALUES (5, N'Salida por ajuste', 0)
INSERT [dbo].[MovementTypes] ([IDMovementType], [Description], [IsDeleted]) VALUES (6, N'Salida por venta', 0)
INSERT [dbo].[MovementTypes] ([IDMovementType], [Description], [IsDeleted]) VALUES (7, N'Salida por defectuoso', 0)
INSERT [dbo].[MovementTypes] ([IDMovementType], [Description], [IsDeleted]) VALUES (8, N'Salida por movimiento de inventario', 0)
SET IDENTITY_INSERT [dbo].[MovementTypes] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IDUser], [Name], [LastName], [Email], [Password], [Address], [Phone], [IsDeleted]) VALUES (1, N'Wandy', N'Rodríguez', N'wandyrh@mardom.com', N'fcba8051ec9c89dfa788d2e093b54765629bc153237a2a4d26c0ae959500b4c5', N'Santo Domingo', N'809-123-4567', 0)
INSERT [dbo].[Users] ([IDUser], [Name], [LastName], [Email], [Password], [Address], [Phone], [IsDeleted]) VALUES (2, N'admin', N'Rodríguez', N'admin@mardom.com', N'fcba8051ec9c89dfa788d2e093b54765629bc153237a2a4d26c0ae959500b4c5', N'Santo Domingo', N'809-123-4567', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[GoodsMovements]  WITH CHECK ADD  CONSTRAINT [FK_GoodsMovements_MovementTypes] FOREIGN KEY([IDMovementType])
REFERENCES [dbo].[MovementTypes] ([IDMovementType])
GO
ALTER TABLE [dbo].[GoodsMovements] CHECK CONSTRAINT [FK_GoodsMovements_MovementTypes]
GO
ALTER TABLE [dbo].[GoodsMovements]  WITH CHECK ADD  CONSTRAINT [FK_GoodsMovements_Produts] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([IDProduct])
GO
ALTER TABLE [dbo].[GoodsMovements] CHECK CONSTRAINT [FK_GoodsMovements_Produts]
GO
ALTER TABLE [dbo].[GoodsMovements]  WITH CHECK ADD  CONSTRAINT [FK_GoodsMovements_StorageLocations] FOREIGN KEY([IDStorageLocationFrom])
REFERENCES [dbo].[StorageLocations] ([IDStorageLocation])
GO
ALTER TABLE [dbo].[GoodsMovements] CHECK CONSTRAINT [FK_GoodsMovements_StorageLocations]
GO
ALTER TABLE [dbo].[GoodsMovements]  WITH CHECK ADD  CONSTRAINT [FK_GoodsMovements_StorageLocations1] FOREIGN KEY([IDStorageLocationTo])
REFERENCES [dbo].[StorageLocations] ([IDStorageLocation])
GO
ALTER TABLE [dbo].[GoodsMovements] CHECK CONSTRAINT [FK_GoodsMovements_StorageLocations1]
GO
ALTER TABLE [dbo].[GoodsMovements]  WITH CHECK ADD  CONSTRAINT [FK_GoodsMovements_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([IDUser])
GO
ALTER TABLE [dbo].[GoodsMovements] CHECK CONSTRAINT [FK_GoodsMovements_Users]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Produts] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([IDProduct])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Produts]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_StorageLocations] FOREIGN KEY([IDStorageLocation])
REFERENCES [dbo].[StorageLocations] ([IDStorageLocation])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_StorageLocations]
GO
USE [master]
GO
ALTER DATABASE [MarDom] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Publishing_House]    Script Date: 10.06.2022 12:24:04 ******/
CREATE DATABASE [Publishing_House]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Publishing_House', FILENAME = N'C:\Users\10220004\Publishing_House.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Publishing_House_log', FILENAME = N'C:\Users\10220004\Publishing_House_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Publishing_House] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Publishing_House].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Publishing_House] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Publishing_House] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Publishing_House] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Publishing_House] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Publishing_House] SET ARITHABORT OFF 
GO
ALTER DATABASE [Publishing_House] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Publishing_House] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Publishing_House] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Publishing_House] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Publishing_House] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Publishing_House] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Publishing_House] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Publishing_House] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Publishing_House] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Publishing_House] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Publishing_House] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Publishing_House] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Publishing_House] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Publishing_House] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Publishing_House] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Publishing_House] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Publishing_House] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Publishing_House] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Publishing_House] SET  MULTI_USER 
GO
ALTER DATABASE [Publishing_House] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Publishing_House] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Publishing_House] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Publishing_House] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Publishing_House] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Publishing_House] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Publishing_House] SET QUERY_STORE = OFF
GO
USE [Publishing_House]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 10.06.2022 12:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[idAuthor] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[idAuthor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre_Publication]    Script Date: 10.06.2022 12:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre_Publication](
	[idGenre_Publication] [int] IDENTITY(1,1) NOT NULL,
	[GenreType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genre_Publication] PRIMARY KEY CLUSTERED 
(
	[idGenre_Publication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10.06.2022 12:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[idOrder] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[Cost] [int] NOT NULL,
	[Data_Order] [date] NULL,
	[UserID] [int] NOT NULL,
	[PublicationID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publication]    Script Date: 10.06.2022 12:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publication](
	[idPublication] [int] IDENTITY(1,1) NOT NULL,
	[AuthorID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Genre_TypeID] [int] NOT NULL,
	[ImagePreview] [nchar](10) NULL,
 CONSTRAINT [PK_Publication] PRIMARY KEY CLUSTERED 
(
	[idPublication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publication_Author]    Script Date: 10.06.2022 12:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publication_Author](
	[PublicationID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
 CONSTRAINT [PK_Publication_Author] PRIMARY KEY CLUSTERED 
(
	[PublicationID] ASC,
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10.06.2022 12:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[idRole] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_Publication]    Script Date: 10.06.2022 12:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_Publication](
	[idType_Publication] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type_Publication] PRIMARY KEY CLUSTERED 
(
	[idType_Publication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10.06.2022 12:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Date_of_birth] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([idAuthor], [FIO]) VALUES (1, N'1')
INSERT [dbo].[Author] ([idAuthor], [FIO]) VALUES (2, N'2')
INSERT [dbo].[Author] ([idAuthor], [FIO]) VALUES (3, N'3')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre_Publication] ON 

INSERT [dbo].[Genre_Publication] ([idGenre_Publication], [GenreType]) VALUES (1, N'1')
INSERT [dbo].[Genre_Publication] ([idGenre_Publication], [GenreType]) VALUES (2, N'2')
INSERT [dbo].[Genre_Publication] ([idGenre_Publication], [GenreType]) VALUES (3, N'3')
SET IDENTITY_INSERT [dbo].[Genre_Publication] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([idOrder], [OrderNumber], [Cost], [Data_Order], [UserID], [PublicationID]) VALUES (1, 1, 1, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Publication] ON 

INSERT [dbo].[Publication] ([idPublication], [AuthorID], [TypeID], [Genre_TypeID], [ImagePreview]) VALUES (1, 1, 1, 1, NULL)
INSERT [dbo].[Publication] ([idPublication], [AuthorID], [TypeID], [Genre_TypeID], [ImagePreview]) VALUES (2, 2, 2, 2, NULL)
SET IDENTITY_INSERT [dbo].[Publication] OFF
GO
INSERT [dbo].[Publication_Author] ([PublicationID], [AuthorID]) VALUES (1, 2)
INSERT [dbo].[Publication_Author] ([PublicationID], [AuthorID]) VALUES (2, 1)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([idRole], [Role_Name]) VALUES (1, N'Client')
INSERT [dbo].[Role] ([idRole], [Role_Name]) VALUES (2, N'Admin')
INSERT [dbo].[Role] ([idRole], [Role_Name]) VALUES (3, N'Guest')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Type_Publication] ON 

INSERT [dbo].[Type_Publication] ([idType_Publication], [Type]) VALUES (1, N'1')
INSERT [dbo].[Type_Publication] ([idType_Publication], [Type]) VALUES (2, N'2')
INSERT [dbo].[Type_Publication] ([idType_Publication], [Type]) VALUES (3, N'3')
SET IDENTITY_INSERT [dbo].[Type_Publication] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([idUser], [FIO], [Phone], [email], [login], [password], [RoleID], [Date_of_birth]) VALUES (1, N'1', 1, N'1', N'1', N'11', 1, NULL)
INSERT [dbo].[User] ([idUser], [FIO], [Phone], [email], [login], [password], [RoleID], [Date_of_birth]) VALUES (2, N'2', 2, N'2', N'2', N'2', 2, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Publication] FOREIGN KEY([PublicationID])
REFERENCES [dbo].[Publication] ([idPublication])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Publication]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([idUser])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Publication]  WITH CHECK ADD  CONSTRAINT [FK_Publication_Genre_Publication] FOREIGN KEY([Genre_TypeID])
REFERENCES [dbo].[Genre_Publication] ([idGenre_Publication])
GO
ALTER TABLE [dbo].[Publication] CHECK CONSTRAINT [FK_Publication_Genre_Publication]
GO
ALTER TABLE [dbo].[Publication]  WITH CHECK ADD  CONSTRAINT [FK_Publication_Type_Publication] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type_Publication] ([idType_Publication])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Publication] CHECK CONSTRAINT [FK_Publication_Type_Publication]
GO
ALTER TABLE [dbo].[Publication_Author]  WITH CHECK ADD  CONSTRAINT [FK_Publication_Author_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([idAuthor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Publication_Author] CHECK CONSTRAINT [FK_Publication_Author_Author]
GO
ALTER TABLE [dbo].[Publication_Author]  WITH CHECK ADD  CONSTRAINT [FK_Publication_Author_Publication] FOREIGN KEY([PublicationID])
REFERENCES [dbo].[Publication] ([idPublication])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Publication_Author] CHECK CONSTRAINT [FK_Publication_Author_Publication]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([idRole])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Publishing_House] SET  READ_WRITE 
GO

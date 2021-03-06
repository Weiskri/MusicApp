USE [master]
GO
/****** Object:  Database [MusicDB]    Script Date: 3/15/2018 11:58:15 AM ******/
CREATE DATABASE [MusicDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MusicDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MusicDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MusicDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MusicDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MusicDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MusicDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MusicDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MusicDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MusicDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MusicDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MusicDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MusicDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MusicDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MusicDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MusicDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MusicDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MusicDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MusicDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MusicDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MusicDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MusicDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MusicDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MusicDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MusicDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MusicDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MusicDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MusicDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MusicDB] SET  MULTI_USER 
GO
ALTER DATABASE [MusicDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MusicDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MusicDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MusicDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MusicDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MusicDB]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 3/15/2018 11:58:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Genre] [nvarchar](50) NOT NULL,
	[YearReleased] [datetime] NOT NULL,
	[WonGrammy] [bit] NOT NULL,
	[AlbumPhoto] [nvarchar](200) NOT NULL,
	[ArtistID] [int] NOT NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Artists]    Script Date: 3/15/2018 11:58:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[ArtistPhoto] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Artists] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([AlbumID], [Title], [Genre], [YearReleased], [WonGrammy], [AlbumPhoto], [ArtistID]) VALUES (1, N'Halcyon', N'Pop', CAST(N'2012-10-05 00:00:00.000' AS DateTime), 0, N'/Content/Images/Ellie_Goulding_-_Halcyon.png', 1)
INSERT [dbo].[Albums] ([AlbumID], [Title], [Genre], [YearReleased], [WonGrammy], [AlbumPhoto], [ArtistID]) VALUES (2, N'American Beauty/American Psycho', N'Alternative', CAST(N'2015-01-16 00:00:00.000' AS DateTime), 0, N'/Content/Images/FOB.png', 2)
INSERT [dbo].[Albums] ([AlbumID], [Title], [Genre], [YearReleased], [WonGrammy], [AlbumPhoto], [ArtistID]) VALUES (3, N'Lights', N'Pop', CAST(N'2010-02-26 00:00:00.000' AS DateTime), 0, N'/Content/Images/gouldinglights.jpg', 1)
INSERT [dbo].[Albums] ([AlbumID], [Title], [Genre], [YearReleased], [WonGrammy], [AlbumPhoto], [ArtistID]) VALUES (4, N'Save Rock and Roll', N'Alternative', CAST(N'2013-04-12 00:00:00.000' AS DateTime), 0, N'/Content/Images/save-rock-and-roll.jpg', 2)
SET IDENTITY_INSERT [dbo].[Albums] OFF
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([ArtistID], [Name], [ArtistPhoto]) VALUES (1, N'Ellie Goulding', N'/Content/Images/elliegoulding.jpg')
INSERT [dbo].[Artists] ([ArtistID], [Name], [ArtistPhoto]) VALUES (2, N'Fall Out Boy', N'/Content/Images/falloutboy.jpg')
SET IDENTITY_INSERT [dbo].[Artists] OFF
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_Albums_Artists] FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artists] ([ArtistID])
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_Albums_Artists]
GO
USE [master]
GO
ALTER DATABASE [MusicDB] SET  READ_WRITE 
GO

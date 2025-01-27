USE [master]
GO
/****** Object:  Database [ExamHallMangementSystemDB]    Script Date: 9/17/2018 7:53:51 AM ******/
CREATE DATABASE [ExamHallMangementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamHallMangementSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ExamHallMangementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExamHallMangementSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ExamHallMangementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamHallMangementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ExamHallMangementSystemDB]
GO
/****** Object:  Table [dbo].[AdminInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AdminInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Assign_Teacher]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Assign_Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Building] [int] NOT NULL,
	[Room] [int] NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Assign_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BuildingInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BuildingInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Room] [int] NOT NULL,
 CONSTRAINT [PK_BuildingInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [varchar](50) NOT NULL,
	[CourseName] [varchar](50) NOT NULL,
	[Credit] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DepartmentInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepartmentInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DepartmentInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReserveHall]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReserveHall](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Room] [int] NOT NULL,
	[Building] [int] NOT NULL,
	[AvailableSeat] [int] NOT NULL,
	[Teacher] [int] NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Building] [int] NOT NULL,
	[Seat] [int] NOT NULL,
 CONSTRAINT [PK_RoomInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeatPlan]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeatPlan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student] [int] NOT NULL,
	[Course] [int] NOT NULL,
	[Room] [int] NOT NULL,
	[Building] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Action] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SeatPlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SemisterInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SemisterInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
 CONSTRAINT [PK_SemisterInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StudentInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubjectTaken]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectTaken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student] [int] NOT NULL,
	[Course] [int] NOT NULL,
 CONSTRAINT [PK_SubjectTaken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Departrment] [int] NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_TeacherInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AdminInfo] ON 

INSERT [dbo].[AdminInfo] ([Id], [Code], [Name], [Password]) VALUES (1, N'A101', N'Diderul islam', N'103rt')
SET IDENTITY_INSERT [dbo].[AdminInfo] OFF
SET IDENTITY_INSERT [dbo].[Assign_Teacher] ON 

INSERT [dbo].[Assign_Teacher] ([Id], [TeacherId], [Building], [Room], [Action], [Date]) VALUES (1, 2, 1, 1, N'1', CAST(0x0000A95E00000000 AS DateTime))
INSERT [dbo].[Assign_Teacher] ([Id], [TeacherId], [Building], [Room], [Action], [Date]) VALUES (2, 3, 1, 1, N'1', CAST(0x0000A95E00000000 AS DateTime))
INSERT [dbo].[Assign_Teacher] ([Id], [TeacherId], [Building], [Room], [Action], [Date]) VALUES (3, 4, 1, 2, N'1', CAST(0x0000A95E00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Assign_Teacher] OFF
SET IDENTITY_INSERT [dbo].[BuildingInfo] ON 

INSERT [dbo].[BuildingInfo] ([Id], [Name], [Room]) VALUES (1, N'Science Building', 14)
SET IDENTITY_INSERT [dbo].[BuildingInfo] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [CourseId], [CourseName], [Credit]) VALUES (1, N'CSE101', N'Stucture Programming', 3)
INSERT [dbo].[Course] ([Id], [CourseId], [CourseName], [Credit]) VALUES (2, N'CSE201', N'Object Oriented Programming', 3)
INSERT [dbo].[Course] ([Id], [CourseId], [CourseName], [Credit]) VALUES (3, N'CSE301', N'Web Programming', 3)
INSERT [dbo].[Course] ([Id], [CourseId], [CourseName], [Credit]) VALUES (4, N'CSE401', N'Software Devolopment', 3)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[DepartmentInfo] ON 

INSERT [dbo].[DepartmentInfo] ([Id], [Name], [Code]) VALUES (1, N'Compter Science & Engineering', N'CSE')
INSERT [dbo].[DepartmentInfo] ([Id], [Name], [Code]) VALUES (2, N'Electrical & Electronics Engineering', N'EEE')
SET IDENTITY_INSERT [dbo].[DepartmentInfo] OFF
SET IDENTITY_INSERT [dbo].[ReserveHall] ON 

INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (1, 1, 1, 16, 2, NULL)
INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (2, 1, 1, 0, 2, NULL)
INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (3, 2, 1, 0, NULL, NULL)
INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (1002, 1, 1, 16, 2, NULL)
INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (1003, 1, 1, 16, 1, NULL)
INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (1004, 2, 1, 10, 1, NULL)
INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (1005, 1, 1, 16, 0, CAST(0x0000A95D00000000 AS DateTime))
INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (1006, 2, 1, 10, 1, CAST(0x0000A95D00000000 AS DateTime))
INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (1007, 1, 1, 16, 0, CAST(0x0000A95E00000000 AS DateTime))
INSERT [dbo].[ReserveHall] ([Id], [Room], [Building], [AvailableSeat], [Teacher], [Date]) VALUES (1008, 2, 1, 10, 0, CAST(0x0000A95E00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[ReserveHall] OFF
SET IDENTITY_INSERT [dbo].[RoomInfo] ON 

INSERT [dbo].[RoomInfo] ([Id], [Code], [Building], [Seat]) VALUES (1, N'S101', 1, 16)
INSERT [dbo].[RoomInfo] ([Id], [Code], [Building], [Seat]) VALUES (2, N'S102', 1, 10)
SET IDENTITY_INSERT [dbo].[RoomInfo] OFF
SET IDENTITY_INSERT [dbo].[SeatPlan] ON 

INSERT [dbo].[SeatPlan] ([Id], [Student], [Course], [Room], [Building], [Date], [Action]) VALUES (1, 1, 1, 1, 1, CAST(0x0000A94F00000000 AS DateTime), N'0')
INSERT [dbo].[SeatPlan] ([Id], [Student], [Course], [Room], [Building], [Date], [Action]) VALUES (2, 1, 1, 2, 1, CAST(0x0000A94F00000000 AS DateTime), N'0')
INSERT [dbo].[SeatPlan] ([Id], [Student], [Course], [Room], [Building], [Date], [Action]) VALUES (3, 1, 4, 1, 1, CAST(0x0000A94F00000000 AS DateTime), N'0')
INSERT [dbo].[SeatPlan] ([Id], [Student], [Course], [Room], [Building], [Date], [Action]) VALUES (4, 2, 1, 1, 1, CAST(0x0000A94F00000000 AS DateTime), N'0')
INSERT [dbo].[SeatPlan] ([Id], [Student], [Course], [Room], [Building], [Date], [Action]) VALUES (5, 3, 1, 1, 1, CAST(0x0000A94F00000000 AS DateTime), N'0')
INSERT [dbo].[SeatPlan] ([Id], [Student], [Course], [Room], [Building], [Date], [Action]) VALUES (6, 2, 3, 1, 1, CAST(0x0000A94F00000000 AS DateTime), N'0')
INSERT [dbo].[SeatPlan] ([Id], [Student], [Course], [Room], [Building], [Date], [Action]) VALUES (7, 3, 3, 1, 1, CAST(0x0000A94F00000000 AS DateTime), N'0')
INSERT [dbo].[SeatPlan] ([Id], [Student], [Course], [Room], [Building], [Date], [Action]) VALUES (8, 1, 2, 1, 1, CAST(0x0000A94F00000000 AS DateTime), N'0')
SET IDENTITY_INSERT [dbo].[SeatPlan] OFF
SET IDENTITY_INSERT [dbo].[SemisterInfo] ON 

INSERT [dbo].[SemisterInfo] ([Id], [Name], [Code]) VALUES (1, N'First Semister', N'1st')
INSERT [dbo].[SemisterInfo] ([Id], [Name], [Code]) VALUES (2, N'Second Semister', N'2nd')
INSERT [dbo].[SemisterInfo] ([Id], [Name], [Code]) VALUES (3, N'Third Semister', N'3rd')
INSERT [dbo].[SemisterInfo] ([Id], [Name], [Code]) VALUES (4, N'Fourth Semister', N'4th')
INSERT [dbo].[SemisterInfo] ([Id], [Name], [Code]) VALUES (5, N'Fifth Semister', N'5th')
INSERT [dbo].[SemisterInfo] ([Id], [Name], [Code]) VALUES (6, N'Sixth Semister', N'6th')
INSERT [dbo].[SemisterInfo] ([Id], [Name], [Code]) VALUES (7, N'Seventh Semister', N'7th')
INSERT [dbo].[SemisterInfo] ([Id], [Name], [Code]) VALUES (8, N'Eighth Semister', N'8th')
SET IDENTITY_INSERT [dbo].[SemisterInfo] OFF
SET IDENTITY_INSERT [dbo].[StudentInfo] ON 

INSERT [dbo].[StudentInfo] ([Id], [StudentId], [Name], [Password]) VALUES (1, N'c153021', N'Diganta dey', N'diganta')
INSERT [dbo].[StudentInfo] ([Id], [StudentId], [Name], [Password]) VALUES (2, N'c153024', N'Md Sadman', N'sadman')
INSERT [dbo].[StudentInfo] ([Id], [StudentId], [Name], [Password]) VALUES (3, N'c153029', N'Robin das', N'Robin')
INSERT [dbo].[StudentInfo] ([Id], [StudentId], [Name], [Password]) VALUES (4, N'c153023', N'Tanin rahaman', N'tanin')
SET IDENTITY_INSERT [dbo].[StudentInfo] OFF
SET IDENTITY_INSERT [dbo].[SubjectTaken] ON 

INSERT [dbo].[SubjectTaken] ([Id], [Student], [Course]) VALUES (1, 1, 1)
INSERT [dbo].[SubjectTaken] ([Id], [Student], [Course]) VALUES (2, 1, 2)
INSERT [dbo].[SubjectTaken] ([Id], [Student], [Course]) VALUES (3, 1, 4)
INSERT [dbo].[SubjectTaken] ([Id], [Student], [Course]) VALUES (1002, 2, 1)
INSERT [dbo].[SubjectTaken] ([Id], [Student], [Course]) VALUES (1003, 2, 2)
INSERT [dbo].[SubjectTaken] ([Id], [Student], [Course]) VALUES (1004, 2, 3)
INSERT [dbo].[SubjectTaken] ([Id], [Student], [Course]) VALUES (1005, 3, 1)
INSERT [dbo].[SubjectTaken] ([Id], [Student], [Course]) VALUES (1006, 3, 2)
INSERT [dbo].[SubjectTaken] ([Id], [Student], [Course]) VALUES (1007, 3, 3)
SET IDENTITY_INSERT [dbo].[SubjectTaken] OFF
SET IDENTITY_INSERT [dbo].[TeacherInfo] ON 

INSERT [dbo].[TeacherInfo] ([Id], [Code], [Departrment], [Password]) VALUES (2, N'T101', 1, N'103rt')
INSERT [dbo].[TeacherInfo] ([Id], [Code], [Departrment], [Password]) VALUES (3, N'T102', 1, N'103rtd')
INSERT [dbo].[TeacherInfo] ([Id], [Code], [Departrment], [Password]) VALUES (4, N'T103', 1, N'103rtd')
SET IDENTITY_INSERT [dbo].[TeacherInfo] OFF
/****** Object:  Index [IX_AdminInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AdminInfo] ON [dbo].[AdminInfo]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BuildingInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BuildingInfo] ON [dbo].[BuildingInfo]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Course]    Script Date: 9/17/2018 7:53:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course] ON [dbo].[Course]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Course_1]    Script Date: 9/17/2018 7:53:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course_1] ON [dbo].[Course]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoomInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RoomInfo] ON [dbo].[RoomInfo]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StudentInfo] ON [dbo].[StudentInfo]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeacherInfo]    Script Date: 9/17/2018 7:53:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TeacherInfo] ON [dbo].[TeacherInfo]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoomInfo]  WITH CHECK ADD  CONSTRAINT [FK_RoomInfo_BuildingInfo] FOREIGN KEY([Building])
REFERENCES [dbo].[BuildingInfo] ([Id])
GO
ALTER TABLE [dbo].[RoomInfo] CHECK CONSTRAINT [FK_RoomInfo_BuildingInfo]
GO
ALTER TABLE [dbo].[RoomInfo]  WITH CHECK ADD  CONSTRAINT [FK_RoomInfo_RoomInfo] FOREIGN KEY([Id])
REFERENCES [dbo].[RoomInfo] ([Id])
GO
ALTER TABLE [dbo].[RoomInfo] CHECK CONSTRAINT [FK_RoomInfo_RoomInfo]
GO
ALTER TABLE [dbo].[TeacherInfo]  WITH CHECK ADD  CONSTRAINT [FK_TeacherInfo_TeacherInfo] FOREIGN KEY([Departrment])
REFERENCES [dbo].[DepartmentInfo] ([Id])
GO
ALTER TABLE [dbo].[TeacherInfo] CHECK CONSTRAINT [FK_TeacherInfo_TeacherInfo]
GO
USE [master]
GO
ALTER DATABASE [ExamHallMangementSystemDB] SET  READ_WRITE 
GO

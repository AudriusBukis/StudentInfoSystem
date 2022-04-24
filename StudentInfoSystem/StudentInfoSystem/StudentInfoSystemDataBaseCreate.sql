USE [master]
GO
/****** Object:  Database [StudentInfoSystem]    Script Date: 4/24/2022 2:26:34 PM ******/
CREATE DATABASE [StudentInfoSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentInfoSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentInfoSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentInfoSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentInfoSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentInfoSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentInfoSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentInfoSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentInfoSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentInfoSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentInfoSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentInfoSystem] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [StudentInfoSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentInfoSystem] SET  MULTI_USER 
GO
ALTER DATABASE [StudentInfoSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentInfoSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentInfoSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentInfoSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentInfoSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentInfoSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentInfoSystem', N'ON'
GO
ALTER DATABASE [StudentInfoSystem] SET QUERY_STORE = OFF
GO
USE [StudentInfoSystem]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/24/2022 2:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentLecture]    Script Date: 4/24/2022 2:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentLecture](
	[ListDepartmentsId] [uniqueidentifier] NOT NULL,
	[ListLecturesId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DepartmentLecture] PRIMARY KEY CLUSTERED 
(
	[ListDepartmentsId] ASC,
	[ListLecturesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/24/2022 2:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [uniqueidentifier] NOT NULL,
	[DepartmentName] [nvarchar](60) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 4/24/2022 2:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[Id] [uniqueidentifier] NOT NULL,
	[LectureName] [nvarchar](60) NULL,
 CONSTRAINT [PK_Lectures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LectureStudent]    Script Date: 4/24/2022 2:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureStudent](
	[ListLectureId] [uniqueidentifier] NOT NULL,
	[StudentId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LectureStudent] PRIMARY KEY CLUSTERED 
(
	[ListLectureId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 4/24/2022 2:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](60) NULL,
	[LastName] [nvarchar](60) NULL,
	[DepartmentId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220424111813_InitialCreate', N'5.0.10')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'a7c47175-51fe-498f-a624-0732b1f5904c', N'a0cf834b-e27f-465a-b143-2157e77ebe89')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5bde9712-ec90-40e0-a56d-32ef7ebda187', N'a0cf834b-e27f-465a-b143-2157e77ebe89')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'a0cf834b-e27f-465a-b143-2157e77ebe89')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'570bb844-cae2-46a2-bf66-fab40adb1ac4', N'a0cf834b-e27f-465a-b143-2157e77ebe89')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'a7c47175-51fe-498f-a624-0732b1f5904c', N'bbed5e32-2991-42dc-b30c-79ea14980da2')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5bde9712-ec90-40e0-a56d-32ef7ebda187', N'bbed5e32-2991-42dc-b30c-79ea14980da2')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'bbed5e32-2991-42dc-b30c-79ea14980da2')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'570bb844-cae2-46a2-bf66-fab40adb1ac4', N'bbed5e32-2991-42dc-b30c-79ea14980da2')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'570bb844-cae2-46a2-bf66-fab40adb1ac4', N'7c42c61b-b0b4-46f9-805f-88d587a68486')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'a7c47175-51fe-498f-a624-0732b1f5904c', N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5bde9712-ec90-40e0-a56d-32ef7ebda187', N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'570bb844-cae2-46a2-bf66-fab40adb1ac4', N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5bde9712-ec90-40e0-a56d-32ef7ebda187', N'e7da3506-5bf3-4602-8440-96968fa8c372')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'05567f80-564f-4499-8b0d-bf32f0b9567b')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'dae95c43-fdc4-4184-b429-c934cdd61bbb')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'a7c47175-51fe-498f-a624-0732b1f5904c', N'9a956e55-3834-47bc-bb60-cd4d3109b2bc')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5bde9712-ec90-40e0-a56d-32ef7ebda187', N'9a956e55-3834-47bc-bb60-cd4d3109b2bc')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'9a956e55-3834-47bc-bb60-cd4d3109b2bc')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'570bb844-cae2-46a2-bf66-fab40adb1ac4', N'9a956e55-3834-47bc-bb60-cd4d3109b2bc')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'440fe525-1302-4b81-88ac-d214efe3be5b')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'5908bc2d-297a-422d-80fc-d27fb940118e')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'570bb844-cae2-46a2-bf66-fab40adb1ac4', N'5908bc2d-297a-422d-80fc-d27fb940118e')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'cd8f14f0-030d-4b53-831f-dd0431efa464')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'570bb844-cae2-46a2-bf66-fab40adb1ac4', N'cd8f14f0-030d-4b53-831f-dd0431efa464')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'a7c47175-51fe-498f-a624-0732b1f5904c', N'5da3eb3d-7871-4012-8a0c-e79ff7069f93')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5bde9712-ec90-40e0-a56d-32ef7ebda187', N'5da3eb3d-7871-4012-8a0c-e79ff7069f93')
GO
INSERT [dbo].[DepartmentLecture] ([ListDepartmentsId], [ListLecturesId]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'5da3eb3d-7871-4012-8a0c-e79ff7069f93')
GO
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (N'a7c47175-51fe-498f-a624-0732b1f5904c', N'Informatikos')
GO
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (N'5bde9712-ec90-40e0-a56d-32ef7ebda187', N'Matematikos')
GO
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (N'5fc08aaf-9178-45e4-b30d-e29d90177606', N'Elektros inzinerijos')
GO
INSERT [dbo].[Departments] ([Id], [DepartmentName]) VALUES (N'570bb844-cae2-46a2-bf66-fab40adb1ac4', N'Valdymo Inzinerijos')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'Matematika2')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'7d087dca-b199-403e-890b-592f46261173', N'Eletrosauga')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'bbed5e32-2991-42dc-b30c-79ea14980da2', N'Chemija1')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'7c42c61b-b0b4-46f9-805f-88d587a68486', N'Valdymo sistemos1')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4', N'Fizika1')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'e7da3506-5bf3-4602-8440-96968fa8c372', N'Matematika3')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'f7175979-5a43-4ad3-a839-ac34302d1c60', N'Anglu kalba1')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'b379e9c4-3125-4350-87ee-b278ab82fff2', N'Informatika2')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'b555cbaf-1bda-4b80-a8ae-ba4e352a1721', N'Valdymo procesai')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'05567f80-564f-4499-8b0d-bf32f0b9567b', N'Energetinis naudingumas')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'dae95c43-fdc4-4184-b429-c934cdd61bbb', N'Elektros apskaitos')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'9a956e55-3834-47bc-bb60-cd4d3109b2bc', N'Informatika1')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'440fe525-1302-4b81-88ac-d214efe3be5b', N'Elektros tinklai')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'5908bc2d-297a-422d-80fc-d27fb940118e', N'Anglu kalba2')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'cd8f14f0-030d-4b53-831f-dd0431efa464', N'Grandiniu teorija1')
GO
INSERT [dbo].[Lectures] ([Id], [LectureName]) VALUES (N'5da3eb3d-7871-4012-8a0c-e79ff7069f93', N'Matematika1')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'8dcca5d9-34e7-4968-a149-2932a9b1dd41')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'bbed5e32-2991-42dc-b30c-79ea14980da2', N'8dcca5d9-34e7-4968-a149-2932a9b1dd41')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'05567f80-564f-4499-8b0d-bf32f0b9567b', N'8dcca5d9-34e7-4968-a149-2932a9b1dd41')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'9a956e55-3834-47bc-bb60-cd4d3109b2bc', N'8dcca5d9-34e7-4968-a149-2932a9b1dd41')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'440fe525-1302-4b81-88ac-d214efe3be5b', N'8dcca5d9-34e7-4968-a149-2932a9b1dd41')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'cd8f14f0-030d-4b53-831f-dd0431efa464', N'8dcca5d9-34e7-4968-a149-2932a9b1dd41')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'bbed5e32-2991-42dc-b30c-79ea14980da2', N'f65952ef-6a25-4782-9971-2dae3ef8b35f')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4', N'f65952ef-6a25-4782-9971-2dae3ef8b35f')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'05567f80-564f-4499-8b0d-bf32f0b9567b', N'f65952ef-6a25-4782-9971-2dae3ef8b35f')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'dae95c43-fdc4-4184-b429-c934cdd61bbb', N'f65952ef-6a25-4782-9971-2dae3ef8b35f')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'440fe525-1302-4b81-88ac-d214efe3be5b', N'f65952ef-6a25-4782-9971-2dae3ef8b35f')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'5da3eb3d-7871-4012-8a0c-e79ff7069f93', N'f65952ef-6a25-4782-9971-2dae3ef8b35f')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'86391798-8369-4c91-aafe-37e804886f9d')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'7c42c61b-b0b4-46f9-805f-88d587a68486', N'86391798-8369-4c91-aafe-37e804886f9d')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4', N'86391798-8369-4c91-aafe-37e804886f9d')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'cd8f14f0-030d-4b53-831f-dd0431efa464', N'86391798-8369-4c91-aafe-37e804886f9d')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'ffb30932-1bb6-4231-81ee-672598f2dc4e')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'bbed5e32-2991-42dc-b30c-79ea14980da2', N'ffb30932-1bb6-4231-81ee-672598f2dc4e')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4', N'ffb30932-1bb6-4231-81ee-672598f2dc4e')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'9a956e55-3834-47bc-bb60-cd4d3109b2bc', N'ffb30932-1bb6-4231-81ee-672598f2dc4e')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'06e7576a-3cc2-4895-bc03-69a0ddf0b689')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'bbed5e32-2991-42dc-b30c-79ea14980da2', N'06e7576a-3cc2-4895-bc03-69a0ddf0b689')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4', N'06e7576a-3cc2-4895-bc03-69a0ddf0b689')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'05567f80-564f-4499-8b0d-bf32f0b9567b', N'06e7576a-3cc2-4895-bc03-69a0ddf0b689')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'440fe525-1302-4b81-88ac-d214efe3be5b', N'06e7576a-3cc2-4895-bc03-69a0ddf0b689')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'cd8f14f0-030d-4b53-831f-dd0431efa464', N'06e7576a-3cc2-4895-bc03-69a0ddf0b689')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'1f23a6bd-8183-4465-b2bf-9d67885fa797')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'bbed5e32-2991-42dc-b30c-79ea14980da2', N'1f23a6bd-8183-4465-b2bf-9d67885fa797')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4', N'1f23a6bd-8183-4465-b2bf-9d67885fa797')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'87e14ac8-777b-423e-8c45-a465aa6d95c1')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4', N'87e14ac8-777b-423e-8c45-a465aa6d95c1')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'5da3eb3d-7871-4012-8a0c-e79ff7069f93', N'87e14ac8-777b-423e-8c45-a465aa6d95c1')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'ffae86f5-f95a-42a9-aaf9-a656ceeab42b')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'9a956e55-3834-47bc-bb60-cd4d3109b2bc', N'ffae86f5-f95a-42a9-aaf9-a656ceeab42b')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'5da3eb3d-7871-4012-8a0c-e79ff7069f93', N'ffae86f5-f95a-42a9-aaf9-a656ceeab42b')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'edb2e329-5885-40b7-bc5d-cba159cb7527')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'b379e9c4-3125-4350-87ee-b278ab82fff2', N'edb2e329-5885-40b7-bc5d-cba159cb7527')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'9a956e55-3834-47bc-bb60-cd4d3109b2bc', N'edb2e329-5885-40b7-bc5d-cba159cb7527')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'5da3eb3d-7871-4012-8a0c-e79ff7069f93', N'edb2e329-5885-40b7-bc5d-cba159cb7527')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'16415cd0-6fd3-437e-b74d-d32d58d3dfb8')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'bbed5e32-2991-42dc-b30c-79ea14980da2', N'16415cd0-6fd3-437e-b74d-d32d58d3dfb8')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'f2b6b2e3-0387-4da6-bbdd-951084e7e0f4', N'16415cd0-6fd3-437e-b74d-d32d58d3dfb8')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'9a956e55-3834-47bc-bb60-cd4d3109b2bc', N'16415cd0-6fd3-437e-b74d-d32d58d3dfb8')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'5da3eb3d-7871-4012-8a0c-e79ff7069f93', N'16415cd0-6fd3-437e-b74d-d32d58d3dfb8')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'a0cf834b-e27f-465a-b143-2157e77ebe89', N'de05b97b-7712-4f32-8263-f0a7211c1745')
GO
INSERT [dbo].[LectureStudent] ([ListLectureId], [StudentId]) VALUES (N'bbed5e32-2991-42dc-b30c-79ea14980da2', N'de05b97b-7712-4f32-8263-f0a7211c1745')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'8dcca5d9-34e7-4968-a149-2932a9b1dd41', N'Boris', N'Lukin', N'5fc08aaf-9178-45e4-b30d-e29d90177606')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'f65952ef-6a25-4782-9971-2dae3ef8b35f', N'Jouzas', N'Juozaitis', N'5fc08aaf-9178-45e4-b30d-e29d90177606')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'86391798-8369-4c91-aafe-37e804886f9d', N'Audrius', N'Bunkus', N'570bb844-cae2-46a2-bf66-fab40adb1ac4')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'ffb30932-1bb6-4231-81ee-672598f2dc4e', N'Algirdas', N'Arlauskas', N'5bde9712-ec90-40e0-a56d-32ef7ebda187')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'06e7576a-3cc2-4895-bc03-69a0ddf0b689', N'Bronius', N'Bronislavas', N'5fc08aaf-9178-45e4-b30d-e29d90177606')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'1f23a6bd-8183-4465-b2bf-9d67885fa797', N'Bronius', N'Bronislovas', N'5bde9712-ec90-40e0-a56d-32ef7ebda187')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'87e14ac8-777b-423e-8c45-a465aa6d95c1', N'Pranas', N'Princkus', N'a7c47175-51fe-498f-a624-0732b1f5904c')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'ffae86f5-f95a-42a9-aaf9-a656ceeab42b', N'Butautas', N'Butkus', N'a7c47175-51fe-498f-a624-0732b1f5904c')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'edb2e329-5885-40b7-bc5d-cba159cb7527', N'Audrius', N'Andriukaitis', N'a7c47175-51fe-498f-a624-0732b1f5904c')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'16415cd0-6fd3-437e-b74d-d32d58d3dfb8', N'Jonas', N'Jonaitis', N'5bde9712-ec90-40e0-a56d-32ef7ebda187')
GO
INSERT [dbo].[Student] ([Id], [Name], [LastName], [DepartmentId]) VALUES (N'de05b97b-7712-4f32-8263-f0a7211c1745', N'Julius', N'Minicius', N'a7c47175-51fe-498f-a624-0732b1f5904c')
GO
/****** Object:  Index [IX_DepartmentLecture_ListLecturesId]    Script Date: 4/24/2022 2:26:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentLecture_ListLecturesId] ON [dbo].[DepartmentLecture]
(
	[ListLecturesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LectureStudent_StudentId]    Script Date: 4/24/2022 2:26:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_LectureStudent_StudentId] ON [dbo].[LectureStudent]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_DepartmentId]    Script Date: 4/24/2022 2:26:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_DepartmentId] ON [dbo].[Student]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DepartmentLecture]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentLecture_Departments_ListDepartmentsId] FOREIGN KEY([ListDepartmentsId])
REFERENCES [dbo].[Departments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DepartmentLecture] CHECK CONSTRAINT [FK_DepartmentLecture_Departments_ListDepartmentsId]
GO
ALTER TABLE [dbo].[DepartmentLecture]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentLecture_Lectures_ListLecturesId] FOREIGN KEY([ListLecturesId])
REFERENCES [dbo].[Lectures] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DepartmentLecture] CHECK CONSTRAINT [FK_DepartmentLecture_Lectures_ListLecturesId]
GO
ALTER TABLE [dbo].[LectureStudent]  WITH CHECK ADD  CONSTRAINT [FK_LectureStudent_Lectures_ListLectureId] FOREIGN KEY([ListLectureId])
REFERENCES [dbo].[Lectures] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LectureStudent] CHECK CONSTRAINT [FK_LectureStudent_Lectures_ListLectureId]
GO
ALTER TABLE [dbo].[LectureStudent]  WITH CHECK ADD  CONSTRAINT [FK_LectureStudent_Student_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LectureStudent] CHECK CONSTRAINT [FK_LectureStudent_Student_StudentId]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Departments_DepartmentId]
GO
USE [master]
GO
ALTER DATABASE [StudentInfoSystem] SET  READ_WRITE 
GO

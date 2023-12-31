USE [master]
GO
/****** Object:  Database [DentistVault]    Script Date: 17.10.2023 3:19:01 ******/
CREATE DATABASE [DentistVault]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DentistVault', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DentistVault.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DentistVault_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DentistVault_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DentistVault] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DentistVault].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DentistVault] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DentistVault] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DentistVault] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DentistVault] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DentistVault] SET ARITHABORT OFF 
GO
ALTER DATABASE [DentistVault] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DentistVault] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DentistVault] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DentistVault] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DentistVault] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DentistVault] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DentistVault] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DentistVault] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DentistVault] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DentistVault] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DentistVault] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DentistVault] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DentistVault] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DentistVault] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DentistVault] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DentistVault] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DentistVault] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DentistVault] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DentistVault] SET  MULTI_USER 
GO
ALTER DATABASE [DentistVault] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DentistVault] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DentistVault] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DentistVault] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DentistVault] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DentistVault] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DentistVault] SET QUERY_STORE = OFF
GO
USE [DentistVault]
GO
/****** Object:  Table [dbo].[HUB-Appointment]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HUB-Appointment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[DoctorId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HUB-Branch]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HUB-Branch](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Address] [ntext] NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HUB-Client]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HUB-Client](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HUB-DiseaseHistory]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HUB-DiseaseHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[Disease] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_DiseaseHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HUB-Doctor]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HUB-Doctor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](10) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LINK-Branch-Appointment]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LINK-Branch-Appointment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HUB-BranchId] [bigint] NOT NULL,
	[HUB-AppointmentId] [bigint] NOT NULL,
 CONSTRAINT [PK_LINK-Branch-Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LINK-Client-Appointment]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LINK-Client-Appointment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HUB-ClientId] [bigint] NOT NULL,
	[HUB-AppointmentId] [bigint] NOT NULL,
 CONSTRAINT [PK_LINK-Client-Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LINK-DiseaseHistory-Client]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LINK-DiseaseHistory-Client](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HUB-DiseaseHistoryId] [bigint] NOT NULL,
	[HUB-ClientId] [bigint] NOT NULL,
 CONSTRAINT [PK_LINK-DiseaseHistory-Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LINK-Doctor-Appointment]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LINK-Doctor-Appointment](
	[id] [bigint] NOT NULL,
	[HUB-DoctorId] [bigint] NOT NULL,
	[HUB-AppointmentId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAT-Appointment]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAT-Appointment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[DoctorId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[Time] [datetime] NOT NULL,
	[ClientComment] [ntext] NULL,
	[DoctorComment] [ntext] NULL,
 CONSTRAINT [PK_SAT-Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAT-Branch]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAT-Branch](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [ntext] NOT NULL,
	[Phone] [bigint] NOT NULL,
	[Email] [varchar](max) NOT NULL,
 CONSTRAINT [PK_SAT-Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAT-Client]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAT-Client](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
	[Phone] [bigint] NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SAT-Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAT-DiseaseHistory]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAT-DiseaseHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [bigint] NOT NULL,
	[Disease] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[DiagnosisTime] [datetime2](7) NOT NULL,
	[CureTime] [datetime2](7) NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_SAT-DiseaseHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAT-Doctor]    Script Date: 17.10.2023 3:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAT-Doctor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](10) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
	[Specialty] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SAT-Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[LINK-Branch-Appointment]  WITH CHECK ADD  CONSTRAINT [FK_LINK-Branch-Appointment_HUB-Appointment] FOREIGN KEY([HUB-AppointmentId])
REFERENCES [dbo].[HUB-Appointment] ([Id])
GO
ALTER TABLE [dbo].[LINK-Branch-Appointment] CHECK CONSTRAINT [FK_LINK-Branch-Appointment_HUB-Appointment]
GO
ALTER TABLE [dbo].[LINK-Branch-Appointment]  WITH CHECK ADD  CONSTRAINT [FK_LINK-Branch-Appointment_HUB-Branch] FOREIGN KEY([HUB-BranchId])
REFERENCES [dbo].[HUB-Branch] ([Id])
GO
ALTER TABLE [dbo].[LINK-Branch-Appointment] CHECK CONSTRAINT [FK_LINK-Branch-Appointment_HUB-Branch]
GO
ALTER TABLE [dbo].[LINK-Client-Appointment]  WITH CHECK ADD  CONSTRAINT [FK_LINK-Client-Appointment_HUB-Appointment] FOREIGN KEY([HUB-AppointmentId])
REFERENCES [dbo].[HUB-Appointment] ([Id])
GO
ALTER TABLE [dbo].[LINK-Client-Appointment] CHECK CONSTRAINT [FK_LINK-Client-Appointment_HUB-Appointment]
GO
ALTER TABLE [dbo].[LINK-Client-Appointment]  WITH CHECK ADD  CONSTRAINT [FK_LINK-Client-Appointment_HUB-Client] FOREIGN KEY([HUB-ClientId])
REFERENCES [dbo].[HUB-Client] ([Id])
GO
ALTER TABLE [dbo].[LINK-Client-Appointment] CHECK CONSTRAINT [FK_LINK-Client-Appointment_HUB-Client]
GO
ALTER TABLE [dbo].[LINK-DiseaseHistory-Client]  WITH CHECK ADD  CONSTRAINT [FK_LINK-DiseaseHistory-Client_HUB-Client] FOREIGN KEY([HUB-ClientId])
REFERENCES [dbo].[HUB-Client] ([Id])
GO
ALTER TABLE [dbo].[LINK-DiseaseHistory-Client] CHECK CONSTRAINT [FK_LINK-DiseaseHistory-Client_HUB-Client]
GO
ALTER TABLE [dbo].[LINK-DiseaseHistory-Client]  WITH CHECK ADD  CONSTRAINT [FK_LINK-DiseaseHistory-Client_HUB-DiseaseHistory] FOREIGN KEY([HUB-DiseaseHistoryId])
REFERENCES [dbo].[HUB-DiseaseHistory] ([Id])
GO
ALTER TABLE [dbo].[LINK-DiseaseHistory-Client] CHECK CONSTRAINT [FK_LINK-DiseaseHistory-Client_HUB-DiseaseHistory]
GO
ALTER TABLE [dbo].[LINK-Doctor-Appointment]  WITH CHECK ADD  CONSTRAINT [FK_LINK-Doctor-Appointment_HUB-Appointment] FOREIGN KEY([HUB-AppointmentId])
REFERENCES [dbo].[HUB-Appointment] ([Id])
GO
ALTER TABLE [dbo].[LINK-Doctor-Appointment] CHECK CONSTRAINT [FK_LINK-Doctor-Appointment_HUB-Appointment]
GO
ALTER TABLE [dbo].[LINK-Doctor-Appointment]  WITH CHECK ADD  CONSTRAINT [FK_LINK-Doctor-Appointment_HUB-Doctor] FOREIGN KEY([HUB-DoctorId])
REFERENCES [dbo].[HUB-Doctor] ([Id])
GO
ALTER TABLE [dbo].[LINK-Doctor-Appointment] CHECK CONSTRAINT [FK_LINK-Doctor-Appointment_HUB-Doctor]
GO
ALTER TABLE [dbo].[SAT-Appointment]  WITH CHECK ADD  CONSTRAINT [FK_SAT-Appointment_SAT-Appointment] FOREIGN KEY([Id])
REFERENCES [dbo].[HUB-Appointment] ([Id])
GO
ALTER TABLE [dbo].[SAT-Appointment] CHECK CONSTRAINT [FK_SAT-Appointment_SAT-Appointment]
GO
ALTER TABLE [dbo].[SAT-Branch]  WITH CHECK ADD  CONSTRAINT [FK_SAT-Branch_HUB-Branch] FOREIGN KEY([Id])
REFERENCES [dbo].[HUB-Branch] ([Id])
GO
ALTER TABLE [dbo].[SAT-Branch] CHECK CONSTRAINT [FK_SAT-Branch_HUB-Branch]
GO
ALTER TABLE [dbo].[SAT-Client]  WITH CHECK ADD  CONSTRAINT [FK_SAT-Client_HUB-Client] FOREIGN KEY([Id])
REFERENCES [dbo].[HUB-Client] ([Id])
GO
ALTER TABLE [dbo].[SAT-Client] CHECK CONSTRAINT [FK_SAT-Client_HUB-Client]
GO
ALTER TABLE [dbo].[SAT-DiseaseHistory]  WITH CHECK ADD  CONSTRAINT [FK_SAT-DiseaseHistory_HUB-DiseaseHistory] FOREIGN KEY([Id])
REFERENCES [dbo].[HUB-DiseaseHistory] ([Id])
GO
ALTER TABLE [dbo].[SAT-DiseaseHistory] CHECK CONSTRAINT [FK_SAT-DiseaseHistory_HUB-DiseaseHistory]
GO
ALTER TABLE [dbo].[SAT-Doctor]  WITH CHECK ADD  CONSTRAINT [FK_SAT-Doctor_HUB-Doctor] FOREIGN KEY([Id])
REFERENCES [dbo].[HUB-Doctor] ([Id])
GO
ALTER TABLE [dbo].[SAT-Doctor] CHECK CONSTRAINT [FK_SAT-Doctor_HUB-Doctor]
GO
USE [master]
GO
ALTER DATABASE [DentistVault] SET  READ_WRITE 
GO

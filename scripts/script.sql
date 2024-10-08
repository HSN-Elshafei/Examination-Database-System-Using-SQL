USE [master]
GO
/****** Object:  Database [ExaminationSystemDatabase]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE DATABASE [ExaminationSystemDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExaminationSystemDatabase', FILENAME = N'D:\Users\MSSQL16.SQLEXPRESS\MSSQL\DATA\ExaminationSystemDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExaminationSystemDatabase_log', FILENAME = N'D:\Users\MSSQL16.SQLEXPRESS\MSSQL\DATA\ExaminationSystemDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExaminationSystemDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExaminationSystemDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExaminationSystemDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExaminationSystemDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExaminationSystemDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExaminationSystemDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExaminationSystemDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExaminationSystemDatabase]
GO
/****** Object:  User [training_manager_account]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE USER [training_manager_account] FOR LOGIN [training_manager_account] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [student_account]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE USER [student_account] FOR LOGIN [student_account] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [saif_mohamed]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE USER [saif_mohamed] FOR LOGIN [saif_mohamed] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [instructor_account]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE USER [instructor_account] FOR LOGIN [instructor_account] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Ahmed_doe]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE USER [Ahmed_doe] FOR LOGIN [Ahmed_doe] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin_account]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE USER [admin_account] FOR LOGIN [admin_account] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [abdo_fathy]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE USER [abdo_fathy] FOR LOGIN [abdo_fathy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [TrainingManager]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE ROLE [TrainingManager]
GO
/****** Object:  DatabaseRole [Student]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE ROLE [Student]
GO
/****** Object:  DatabaseRole [Instructor]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE ROLE [Instructor]
GO
/****** Object:  DatabaseRole [AdminRole]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE ROLE [AdminRole]
GO
/****** Object:  DatabaseRole [Admin]    Script Date: 16/07/2024 01:36:36 ص ******/
CREATE ROLE [Admin]
GO
ALTER ROLE [TrainingManager] ADD MEMBER [training_manager_account]
GO
ALTER ROLE [Student] ADD MEMBER [student_account]
GO
ALTER ROLE [db_datareader] ADD MEMBER [saif_mohamed]
GO
ALTER ROLE [Instructor] ADD MEMBER [instructor_account]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Ahmed_doe]
GO
ALTER ROLE [AdminRole] ADD MEMBER [admin_account]
GO
ALTER ROLE [Admin] ADD MEMBER [admin_account]
GO
ALTER ROLE [db_datareader] ADD MEMBER [abdo_fathy]
GO
/****** Object:  UserDefinedTableType [dbo].[QuestionIDTable]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE TYPE [dbo].[QuestionIDTable] AS TABLE(
	[QuestionID] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[StudentIDTableType]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE TYPE [dbo].[StudentIDTableType] AS TABLE(
	[StudentID] [int] NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[IsInstructorAssignedToCourse]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[IsInstructorAssignedToCourse] (
    @InstructorID INT,
    @CourseID INT
) RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT;

    IF EXISTS (SELECT 1 FROM InstructorCourses WHERE InstructorID = @InstructorID AND CourseID = @CourseID)
        SET @Result = 1;
    ELSE
        SET @Result = 0;

    RETURN @Result;
END;
GO
/****** Object:  Table [dbo].[Course]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](255) NULL,
	[Description] [text] NULL,
	[MaxDegree] [int] NULL,
	[MinDegree] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[IsTrainingManager] [bit] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorCourses]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorCourses](
	[InstructorCourseID] [int] IDENTITY(1,1) NOT NULL,
	[InstructorID] [int] NULL,
	[CourseID] [int] NULL,
	[Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InstructorCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[InstructorCoursesView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InstructorCoursesView] AS
SELECT 
    i.InstructorID,
    i.FirstName,
    i.LastName,
    c.CourseID,
    c.CourseName,
    ic.Year
FROM 
    Instructor i
JOIN 
    InstructorCourses ic ON i.InstructorID = ic.InstructorID
JOIN 
    Course c ON ic.CourseID = c.CourseID;

GO
/****** Object:  Table [dbo].[Users]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NULL,
	[PasswordHash] [varchar](255) NULL,
	[Role] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UsersView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[UsersView] AS
SELECT 
    UserID,
    Username,
    PasswordHash,
    Role
FROM 
    Users;
GO
/****** Object:  Table [dbo].[Student]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[IntakeID] [int] NULL,
	[BranchID] [int] NULL,
	[TrackID] [int] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourses]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourses](
	[StudentCourseID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL,
	[EnrollmentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentCourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentCoursesView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[StudentCoursesView] AS
select 
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseID,
    c.CourseName,
    sc.EnrollmentDate
from 
    Student s
JOIN 
    StudentCourses sc on s.StudentID = sc.StudentID
JOIN 
    Course c on sc.CourseID = c.CourseID;
GO
/****** Object:  Table [dbo].[StudentExams]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExams](
	[StudentExamID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[ExamID] [int] NULL,
	[ExamDate] [datetime] NULL,
	[Score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[InstructorID] [int] NULL,
	[ExamType] [varchar](50) NULL,
	[IntakeID] [int] NULL,
	[BranchID] [int] NULL,
	[TrackID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[TotalTime] [int] NULL,
	[Allowances] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ExamResultsView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ExamResultsView] AS
select 
    se.StudentID,
    s.FirstName,
    s.LastName,
    e.ExamID,
    se.Score
from 
    StudentExams se
JOIN 
    Student s on se.StudentID = s.StudentID
JOIN 
    Exam e on se.ExamID = e.ExamID;
GO
/****** Object:  View [dbo].[CourseDetailsView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[CourseDetailsView] AS
select 
    c.CourseID,
    c.CourseName,
    c.Description,
    i.InstructorID,
    i.FirstName AS InstructorFirstName,
    i.LastName AS InstructorLastName,
    sc.StudentID,
    s.FirstName AS StudentFirstName,
    s.LastName AS StudentLastName
from 
    Course c
LEFT JOIN 
    InstructorCourses ic on c.CourseID = ic.CourseID
LEFT JOIN 
    Instructor i on ic.InstructorID = i.InstructorID
LEFT JOIN 
    StudentCourses sc on c.CourseID = sc.CourseID
LEFT JOIN 
    Student s on sc.StudentID = s.StudentID;
GO
/****** Object:  Table [dbo].[QuestionPool]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionPool](
	[QuestionPoolID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[QuestionText] [text] NULL,
	[QuestionType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionPoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[QuestionPoolView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[QuestionPoolView] AS
select 
    qp.QuestionPoolID,
    qp.CourseID,
    c.CourseName,
    qp.QuestionText,
    qp.QuestionType
from 
    QuestionPool qp
JOIN 
    Course c on qp.CourseID = c.CourseID;
GO
/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAnswer](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[ExamID] [int] NULL,
	[QuestionID] [int] NULL,
	[StudentID] [int] NULL,
	[StudentAnswer] [nvarchar](500) NULL,
	[IsCorrect] [bit] NULL,
	[Marks] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentExamDetailsview]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[StudentExamDetailsview] AS
select 
    se.StudentID,
    s.FirstName,
    s.LastName,
    e.ExamID,
    sa.QuestionID,
    qp.QuestionText,
    sa.StudentAnswer,
    sa.IsCorrect,
    sa.Marks
from 
    StudentExams se
JOIN 
    Student s on se.StudentID = s.StudentID
JOIN 
    Exam e on se.ExamID = e.ExamID
JOIN 
    StudentAnswer sa on se.ExamID = sa.ExamID AND se.StudentID = sa.StudentID
JOIN 
    QuestionPool qp on sa.QuestionID = qp.QuestionPoolID;

GO
/****** Object:  View [dbo].[CourseView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[CourseView] AS
select 
    CourseID,
    CourseName,
    Description,
    MaxDegree,
    MinDegree
from 
    Course;
GO
/****** Object:  View [dbo].[InstructorView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[InstructorView] AS
select 
    InstructorID,
    FirstName,
    LastName,
    Email,
    IsTrainingManager,
    UserID
from 
    Instructor;
GO
/****** Object:  View [dbo].[StudentView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[StudentView] AS
select 
    StudentID,
    FirstName,
    LastName,
    Email,
    IntakeID,
    BranchID,
    TrackID,
    UserID
from 
    Student;

GO
/****** Object:  Table [dbo].[Branch]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BranchView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[BranchView] AS
select 
    BranchID,
    BranchName
from 
    Branch;
GO
/****** Object:  Table [dbo].[Track]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[TrackID] [int] IDENTITY(1,1) NOT NULL,
	[TrackName] [varchar](255) NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TrackView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[TrackView] AS
select 
    TrackID,
    TrackName,
    DepartmentID
from 
    Track;
GO
/****** Object:  Table [dbo].[Department]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](255) NULL,
	[BranchID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DepartmentView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DepartmentView] AS
select 
    DepartmentID,
    DepartmentName,
    BranchID
from 
    Department;
GO
/****** Object:  Table [dbo].[Intake]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intake](
	[IntakeID] [int] IDENTITY(1,1) NOT NULL,
	[IntakeName] [varchar](255) NULL,
	[Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IntakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[IntakeView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[IntakeView] AS
select 
    IntakeID,
    IntakeName,
    Year
from 
    Intake;
GO
/****** Object:  Table [dbo].[MultipleChoiceOption]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultipleChoiceOption](
	[OptionID] [int] IDENTITY(1,1) NOT NULL,
	[OptionText] [text] NULL,
	[IsCorrect] [bit] NULL,
	[QuestionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[MultipleChoiceOptionView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[MultipleChoiceOptionView] AS
select 
    OptionID,
    QuestionID,
    OptionText,
    IsCorrect
from 
    MultipleChoiceOption;
GO
/****** Object:  View [dbo].[ExamView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ExamView] AS
select 
    ExamID,
    CourseID,
    InstructorID,
    ExamType,
    IntakeID,
    BranchID,
	TrackID,
	StartTime,
	EndTime,
	TotalTime,
	Allowances
from 
    Exam;
GO
/****** Object:  View [dbo].[StudentAnswerView]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[StudentAnswerView] AS
select 
    AnswerID,
    ExamID,
    QuestionID,
    StudentID,
    StudentAnswer,
    IsCorrect,
    Marks
from 
    StudentAnswer;
GO
/****** Object:  Table [dbo].[ExamQuestion]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamQuestion](
	[ExamQuestionID] [int] IDENTITY(1,1) NOT NULL,
	[ExamID] [int] NULL,
	[QuestionID] [int] NULL,
	[Degree] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextQuestion]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextQuestion](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[BestAnswer] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrueFalseQuestion]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrueFalseQuestion](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[CorrectAnswer] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_department_branchid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_department_branchid] ON [dbo].[Department]
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_exam_branchid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_exam_branchid] ON [dbo].[Exam]
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_exam_courseid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_exam_courseid] ON [dbo].[Exam]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_exam_instructorid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_exam_instructorid] ON [dbo].[Exam]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_exam_intakeid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_exam_intakeid] ON [dbo].[Exam]
(
	[IntakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_exam_trackid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_exam_trackid] ON [dbo].[Exam]
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_examquestion_examid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_examquestion_examid] ON [dbo].[ExamQuestion]
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_examquestion_questionid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_examquestion_questionid] ON [dbo].[ExamQuestion]
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_instructor_userid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_instructor_userid] ON [dbo].[Instructor]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_instructorcourses_courseid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_instructorcourses_courseid] ON [dbo].[InstructorCourses]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_instructorcourses_instructorid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_instructorcourses_instructorid] ON [dbo].[InstructorCourses]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_multiplechoiceoption_questionid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_multiplechoiceoption_questionid] ON [dbo].[MultipleChoiceOption]
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_questionpool_courseid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_questionpool_courseid] ON [dbo].[QuestionPool]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_student_branchid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_student_branchid] ON [dbo].[Student]
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_student_intakeid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_student_intakeid] ON [dbo].[Student]
(
	[IntakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_student_trackid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_student_trackid] ON [dbo].[Student]
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_student_userid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_student_userid] ON [dbo].[Student]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_studentanswer_examid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_studentanswer_examid] ON [dbo].[StudentAnswer]
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_studentanswer_questionid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_studentanswer_questionid] ON [dbo].[StudentAnswer]
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_studentanswer_studentid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_studentanswer_studentid] ON [dbo].[StudentAnswer]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_studentcourses_courseid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_studentcourses_courseid] ON [dbo].[StudentCourses]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_studentcourses_studentid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_studentcourses_studentid] ON [dbo].[StudentCourses]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_studentexams_examid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_studentexams_examid] ON [dbo].[StudentExams]
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_studentexams_studentid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_studentexams_studentid] ON [dbo].[StudentExams]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_textquestion_questionid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_textquestion_questionid] ON [dbo].[TextQuestion]
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_track_departmentid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_track_departmentid] ON [dbo].[Track]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_truefalsequestion_questionid]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_truefalsequestion_questionid] ON [dbo].[TrueFalseQuestion]
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_users_username]    Script Date: 16/07/2024 01:36:37 ص ******/
CREATE NONCLUSTERED INDEX [idx_users_username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([BranchID])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([BranchID])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([IntakeID])
REFERENCES [dbo].[Intake] ([IntakeID])
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([TrackID])
GO
ALTER TABLE [dbo].[ExamQuestion]  WITH CHECK ADD FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ExamID])
GO
ALTER TABLE [dbo].[ExamQuestion]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([QuestionPoolID])
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[InstructorCourses]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[InstructorCourses]  WITH CHECK ADD FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructor] ([InstructorID])
GO
ALTER TABLE [dbo].[MultipleChoiceOption]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([QuestionPoolID])
GO
ALTER TABLE [dbo].[QuestionPool]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([BranchID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([IntakeID])
REFERENCES [dbo].[Intake] ([IntakeID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([TrackID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ExamID])
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([QuestionPoolID])
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentExams]  WITH CHECK ADD FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ExamID])
GO
ALTER TABLE [dbo].[StudentExams]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[TextQuestion]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([QuestionPoolID])
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[TrueFalseQuestion]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionPool] ([QuestionPoolID])
GO
/****** Object:  StoredProcedure [dbo].[AddBranch]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBranch]
    @BranchName VARCHAR(255)
AS
BEGIN
    INSERT INTO Branch (BranchName) VALUES (@BranchName);
END
GO
/****** Object:  StoredProcedure [dbo].[AddCourse]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCourse] (
    @CourseName NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @MaxDegree INT,
    @MinDegree INT
)
AS
BEGIN
    INSERT INTO Course (CourseName, Description, MaxDegree, MinDegree)
    VALUES (@CourseName, @Description, @MaxDegree, @MinDegree);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddInstructor]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddInstructor] (
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @IsTrainingManager BIT,
    @UserID INT
)
AS
BEGIN
    INSERT INTO Instructor (FirstName, LastName, Email, IsTrainingManager, UserID)
    VALUES (@FirstName, @LastName, @Email, @IsTrainingManager, @UserID);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddIntake]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddIntake]
    @IntakeName VARCHAR(255),
    @Year INT
AS
BEGIN
    INSERT INTO Intake (IntakeName, Year) VALUES (@IntakeName, @Year);
END
GO
/****** Object:  StoredProcedure [dbo].[AddQuestionToExam]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddQuestionToExam]
    @ExamID INT,
    @QuestionID INT,
    @Degree INT,
    @CourseID INT,
    @TotalDegree INT OUTPUT
AS
BEGIN
    DECLARE @MaxDegree INT;

    -- Get course max degree
    SELECT @MaxDegree = MaxDegree FROM Course WHERE CourseID = @CourseID;

    -- Check if adding the degree exceeds the max degree
    IF @TotalDegree + @Degree > @MaxDegree
    BEGIN
        RAISERROR('Total degrees exceed the course maximum degree.', 16, 1);
        RETURN;
    END

    -- Insert question into ExamQuestion
    INSERT INTO ExamQuestion (ExamID, QuestionID, Degree)
    VALUES (@ExamID, @QuestionID, @Degree);

    -- Update total degree
    SET @TotalDegree = @TotalDegree + @Degree;
END
GO
/****** Object:  StoredProcedure [dbo].[AddQuestionToPool]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddQuestionToPool] (
    @InstructorID INT,
    @CourseID INT,
    @QuestionText NVARCHAR(MAX),
    @QuestionType NVARCHAR(50)
)
AS
BEGIN
    -- Check if the instructor is assigned to the course
    IF dbo.IsInstructorAssignedToCourse(@InstructorID, @CourseID) = 0
    BEGIN
        RAISERROR('Instructor not assigned to the course.', 16, 1);
        RETURN;
    END

    -- Add the question to the question pool
    INSERT INTO QuestionPool (CourseID, QuestionText, QuestionType)
    VALUES (@CourseID, @QuestionText, @QuestionType);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddStudent] (
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @IntakeID INT,
    @BranchID INT,
    @TrackID INT,
    @UserID INT
)
AS
BEGIN
    INSERT INTO Student (FirstName, LastName, Email, IntakeID, BranchID, TrackID, UserID)
    VALUES (@FirstName, @LastName, @Email, @IntakeID, @BranchID, @TrackID, @UserID);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddTrack]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTrack]
    @TrackName VARCHAR(255),
    @DepartmentID INT
AS
BEGIN
    INSERT INTO Track (TrackName, DepartmentID) VALUES (@TrackName, @DepartmentID);
END
GO
/****** Object:  StoredProcedure [dbo].[AssignInstructorToCourse]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignInstructorToCourse] (
    @InstructorID INT,
    @CourseID INT
)
AS
BEGIN
    INSERT INTO InstructorCourses (InstructorID, CourseID)
    VALUES (@InstructorID, @CourseID);
END;
GO
/****** Object:  StoredProcedure [dbo].[AssignStudentsToExam]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignStudentsToExam]
    @ExamID INT,
    @StudentIDs StudentIDTableType READONLY
AS
BEGIN
    INSERT INTO StudentExams(ExamID, StudentID)
    SELECT @ExamID, StudentID FROM @StudentIDs;
END;
GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AuthenticateUser] (
    @Username NVARCHAR(50),
    @PasswordHash NVARCHAR(256),
    @Role NVARCHAR(20) OUTPUT
)
AS
BEGIN
    DECLARE @UserExists BIT;
    SELECT @UserExists = CASE WHEN EXISTS (SELECT 1 FROM Users WHERE Username = @Username AND PasswordHash = @PasswordHash) THEN 1 ELSE 0 END;

    IF @UserExists = 1
    BEGIN
        SELECT @Role = Role FROM Users WHERE Username = @Username AND PasswordHash = @PasswordHash;
    END
    ELSE
    BEGIN
        RAISERROR('Invalid username or password.', 16, 1);
        RETURN;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CalculateFinalResult]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateFinalResult]
    @StudentID INT,
    @CourseID INT
AS
BEGIN
    DECLARE @FinalResult INT;

    -- Calculate the final result by summing the marks from all exams in the course
    SELECT @FinalResult = SUM(sa.Marks)
    FROM StudentAnswer sa
    JOIN Exam e ON sa.ExamID = e.ExamID
    WHERE sa.StudentID = @StudentID AND e.CourseID = @CourseID;

    -- Return the final result
    SELECT @FinalResult AS FinalResult;
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateCompleteUser]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateCompleteUser] (
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @Username NVARCHAR(50),
    @Password NVARCHAR(256), -- This should be the plaintext password
    @Role NVARCHAR(20)
)
AS
BEGIN
    -- Create the user account with hashed password
    DECLARE @PasswordHash VARBINARY(256);
    SET @PasswordHash = HASHBYTES('SHA2_256', @Password);

    EXEC CreateUserAccount @Username = @Username, @PasswordHash = @PasswordHash, @Role = @Role;

    -- Get the newly created UserID
    DECLARE @UserID INT;
    SELECT @UserID = UserID FROM Users WHERE Username = @Username;

    -- Insert into respective tables based on the role
    IF @Role = 'TrainingManager'
    BEGIN
        INSERT INTO Instructor (FirstName, LastName, Email, IsTrainingManager, UserID)
        VALUES (@FirstName, @LastName, @Email, 1, @UserID);
    END
    ELSE IF @Role = 'Instructor'
    BEGIN
        INSERT INTO Instructor (FirstName, LastName, Email, IsTrainingManager, UserID)
        VALUES (@FirstName, @LastName, @Email, 0, @UserID);
    END
    ELSE IF @Role = 'Student'
    BEGIN
        INSERT INTO Student (FirstName, LastName, Email, UserID)
        VALUES (@FirstName, @LastName, @Email, @UserID);
    END
    ELSE
    BEGIN
        RAISERROR('Invalid role specified.', 16, 1);
        RETURN;
    END

    -- Create SQL Server login and user
    EXEC CreateLoginAndUser @Username = @Username, @Password = @Password, @Role = @Role;
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateExam]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateExam]
    @InstructorID INT,
    @CourseID INT,
    @ExamType VARCHAR(50),
    @IntakeID INT,
    @BranchID INT,
    @TrackID INT,
    @StartTime DATETIME,
    @EndTime DATETIME,
    @TotalTime INT,
    @Allowances TEXT,
    @ExamID INT OUTPUT
AS
BEGIN
    -- Check if instructor is teaching the course
    IF (SELECT dbo.IsInstructorAssignedToCourse(@InstructorID, @CourseID)) = 0
    BEGIN
        RAISERROR('Instructor is not assigned to this course.', 16, 1);
        RETURN;
    END

    -- Insert new exam
    INSERT INTO Exam (CourseID, InstructorID, ExamType, IntakeID, BranchID, TrackID, StartTime, EndTime, TotalTime, Allowances)
    VALUES (@CourseID, @InstructorID, @ExamType, @IntakeID, @BranchID, @TrackID, @StartTime, @EndTime, @TotalTime, @Allowances);

    -- Get the newly created ExamID
    SET @ExamID = SCOPE_IDENTITY();

    -- Return the new ExamID
    SELECT @ExamID AS ExamID;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateLoginAndUser]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateLoginAndUser] (
    @Username NVARCHAR(50),
    @Password NVARCHAR(256), -- This should be the plaintext password
    @Role NVARCHAR(20)
)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    
    -- Create login
    SET @SQL = 'CREATE LOGIN [' + @Username + '] WITH PASSWORD = ''' + @Password + ''';';
    EXEC sp_executesql @SQL;
    
    -- Create user and associate with login
    SET @SQL = 'CREATE USER [' + @Username + '] FOR LOGIN [' + @Username + '];';
    EXEC sp_executesql @SQL;
    
    -- Grant role-based permissions
    IF @Role = 'Admin'
    BEGIN
        SET @SQL = 'ALTER ROLE [db_owner] ADD MEMBER [' + @Username + '];';
        EXEC sp_executesql @SQL;
    END
    ELSE IF @Role = 'TrainingManager'
    BEGIN
        SET @SQL = 'ALTER ROLE [db_datawriter] ADD MEMBER [' + @Username + '];';
        EXEC sp_executesql @SQL;
    END
    ELSE IF @Role = 'Instructor'
    BEGIN
        SET @SQL = 'ALTER ROLE [db_datareader] ADD MEMBER [' + @Username + '];';
        EXEC sp_executesql @SQL;
    END
    ELSE IF @Role = 'Student'
    BEGIN
        SET @SQL = 'ALTER ROLE [db_datareader] ADD MEMBER [' + @Username + '];';
        EXEC sp_executesql @SQL;
    END
    ELSE
    BEGIN
        RAISERROR('Invalid role specified.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateUserAccount]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateUserAccount] (
    @Username NVARCHAR(50),
    @PasswordHash NVARCHAR(256),
    @Role NVARCHAR(20)
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Users WHERE Username = @Username)
    BEGIN
        RAISERROR('Username already exists.', 16, 1);
        RETURN;
    END

    INSERT INTO Users (Username, PasswordHash, Role)
    VALUES (@Username, @PasswordHash, @Role);
END;
GO
/****** Object:  StoredProcedure [dbo].[DefineExamDetails]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DefineExamDetails]
    @ExamID INT,
    @StartTime DATETIME,
    @EndTime DATETIME
AS
BEGIN
    UPDATE Exam
    SET StartTime = @StartTime, EndTime = @EndTime
    WHERE ExamID = @ExamID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteCourse]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteCourse] (
    @CourseID INT
)
AS
BEGIN
    DELETE FROM Course WHERE CourseID = @CourseID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructor]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteInstructor] (
    @InstructorID INT
)
AS
BEGIN
    DELETE FROM Instructor WHERE InstructorID = @InstructorID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteQuestionFromPool]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* delete question */
CREATE PROCEDURE [dbo].[DeleteQuestionFromPool] (
    @InstructorID INT,
    @CourseID INT,
    @QuestionID INT
)
AS
BEGIN
    -- Check if the instructor is assigned to the course
    IF dbo.IsInstructorAssignedToCourse(@InstructorID, @CourseID) = 0
    BEGIN
        RAISERROR('Instructor not assigned to the course.', 16, 1);
        RETURN;
    END

    -- Check if the question belongs to the course
    IF NOT EXISTS (SELECT 1 FROM QuestionPool WHERE QuestionPoolID = @QuestionID AND CourseID = @CourseID)
    BEGIN
        RAISERROR('Question not found in the specified course.', 16, 1);
        RETURN;
    END

    -- Delete the question from the question pool
    DELETE FROM QuestionPool
    WHERE QuestionPoolID = @QuestionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudent] (
    @StudentID INT
)
AS
BEGIN
    DELETE FROM Student WHERE StudentID = @StudentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetStudentUpcomingExams]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStudentUpcomingExams]
    @StudentID INT
AS
BEGIN
    SELECT e.ExamID, e.CourseID, e.InstructorID, e.ExamType, e.StartTime, e.EndTime, e.TotalTime, e.Allowances
    FROM Exam e
    INNER JOIN StudentExams es ON e.ExamID = es.ExamID
    WHERE es.StudentID = @StudentID AND GETDATE() BETWEEN e.StartTime AND e.EndTime;
END;
GO
/****** Object:  StoredProcedure [dbo].[RemoveInstructorFromCourse]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveInstructorFromCourse] (
    @InstructorID INT,
    @CourseID INT
)
AS
BEGIN
    DELETE FROM InstructorCourses
    WHERE InstructorID = @InstructorID AND CourseID = @CourseID;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectManualQuestions]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectManualQuestions]
    @QuestionIDs QuestionIDTable READONLY
AS
BEGIN
    SELECT QuestionPoolID
    FROM QuestionPool
    WHERE QuestionPoolID IN (SELECT QuestionID FROM @QuestionIDs);
END
GO
/****** Object:  StoredProcedure [dbo].[SelectRandomQuestionsByType]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectRandomQuestionsByType]
    @CourseID INT,
    @QuestionType VARCHAR(50),
    @NumQuestions INT
AS
BEGIN
    SELECT TOP (@NumQuestions) QuestionPoolID
    FROM QuestionPool
    WHERE CourseID = @CourseID AND QuestionType = @QuestionType
    ORDER BY NEWID();
END
GO
/****** Object:  StoredProcedure [dbo].[SubmitStudentAnswer]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubmitStudentAnswer]
    @ExamID INT,
    @QuestionID INT,
    @StudentID INT,
    @StudentAnswer NVARCHAR(500)
AS
BEGIN
    DECLARE @IsCorrect BIT;
    DECLARE @Marks INT;
    DECLARE @CorrectAnswer NVARCHAR(500);
    DECLARE @QuestionType VARCHAR(50);

    -- Determine the question type and correct answer
    SELECT @QuestionType = QuestionType, @CorrectAnswer = 
        CASE 
            WHEN QuestionType = 'MultipleChoice' THEN (SELECT OptionText FROM MultipleChoiceOption WHERE QuestionID = @QuestionID AND IsCorrect = 1)
            WHEN QuestionType = 'TrueFalse' THEN (SELECT CAST(CorrectAnswer AS NVARCHAR(500)) FROM TrueFalseQuestion WHERE QuestionID = @QuestionID)
            WHEN QuestionType = 'Text' THEN (SELECT BestAnswer FROM TextQuestion WHERE QuestionID = @QuestionID)
        END
    FROM QuestionPool 
    WHERE QuestionPoolID = @QuestionID;

    -- Calculate if the answer is correct and the marks
    SET @IsCorrect = CASE 
        WHEN @QuestionType = 'MultipleChoice' AND @StudentAnswer = @CorrectAnswer THEN 1 
        WHEN @QuestionType = 'TrueFalse' AND @StudentAnswer = @CorrectAnswer THEN 1 
        WHEN @QuestionType = 'Text' AND @StudentAnswer = @CorrectAnswer THEN 1 
        ELSE 0 
    END;

    SET @Marks = CASE 
        WHEN @IsCorrect = 1 THEN (SELECT Degree FROM ExamQuestion WHERE ExamID = @ExamID AND QuestionID = @QuestionID) 
        ELSE 0 
    END;

    -- Insert the student's answer into the StudentAnswer table
    INSERT INTO StudentAnswer (ExamID, QuestionID, StudentID, StudentAnswer, IsCorrect, Marks)
    VALUES (@ExamID, @QuestionID, @StudentID, @StudentAnswer, @IsCorrect, @Marks);
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCourse] (
    @CourseID INT,
    @CourseName NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @MaxDegree INT,
    @MinDegree INT
)
AS
BEGIN
    UPDATE Course
    SET CourseName = @CourseName, Description = @Description, MaxDegree = @MaxDegree, MinDegree = @MinDegree
    WHERE CourseID = @CourseID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateInstructor]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateInstructor] (
    @InstructorID INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @IsTrainingManager BIT
)
AS
BEGIN
    UPDATE Instructor
    SET FirstName = @FirstName, LastName = @LastName, Email = @Email, IsTrainingManager = @IsTrainingManager
    WHERE InstructorID = @InstructorID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuestionInPool]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateQuestionInPool] (
    @InstructorID INT,
    @CourseID INT,
    @QuestionID INT,
    @QuestionText NVARCHAR(MAX),
    @QuestionType NVARCHAR(50)
)
AS
BEGIN
    -- Check if the instructor is assigned to the course
    IF dbo.IsInstructorAssignedToCourse(@InstructorID, @CourseID) = 0
    BEGIN
        RAISERROR('Instructor not assigned to the course.', 16, 1);
        RETURN;
    END

    -- Check if the question belongs to the course
    IF NOT EXISTS (SELECT 1 FROM QuestionPool WHERE QuestionPoolID = @QuestionID AND CourseID = @CourseID)
    BEGIN
        RAISERROR('Question not found in the specified course.', 16, 1);
        RETURN;
    END

    -- Update the question in the question pool
    UPDATE QuestionPool
    SET QuestionText = @QuestionText, QuestionType = @QuestionType
    WHERE QuestionPoolID = @QuestionID;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 16/07/2024 01:36:37 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStudent] (
    @StudentID INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @IntakeID INT,
    @BranchID INT,
    @TrackID INT
)
AS
BEGIN
    UPDATE Student
    SET FirstName = @FirstName, LastName = @LastName, Email = @Email, IntakeID = @IntakeID, BranchID = @BranchID, TrackID = @TrackID
    WHERE StudentID = @StudentID;
END;
GO
USE [master]
GO
ALTER DATABASE [ExaminationSystemDatabase] SET  READ_WRITE 
GO

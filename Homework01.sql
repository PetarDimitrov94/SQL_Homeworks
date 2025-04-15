USE master
CREATE DATABASE SEDCACADEMYDM
GO

USE SEDCACADEMYDM
GO

CREATE TABLE Students (
Id int IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR (20) NOT NULL,
LastName NVARCHAR (20) NOT NULL,
DateOfBirth DATE NOT NULL,
EnrolledDate DATE NOT NULL,
Gender NVARCHAR (7) NOT NULL,
NationalIdNumber NVARCHAR (20) NOT NULL,
StudentCardNumber NVARCHAR (5)NOT NULL
)
GO

SELECT * FROM Students

INSERT INTO dbo.Students(FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIdNumber, StudentCardNumber)
VALUES ('Petar','Dimitrov','1991-01-01','2024-10-15','Male','123456789','1')
GO


CREATE TABLE Teachers (
Id int IDENTITY(1,1) NOT NULL,
FirstName NVARCHAR (20) NOT NULL,
LastName NVARCHAR (20) NOT NULL,
DateOfBirth DATE NOT NULL,
AcademicRank NVARCHAR (30) NOT NULL,
HireDate DATE NOT NULL
)
GO

SELECT * FROM Teachers

INSERT INTO dbo.Teachers(FirstName, LastName, DateOfBirth, AcademicRank,HireDate)
VALUES ('Borjan','Dimitrovski', '1983-05-07', 'Profesor', '2020-06-04' )

CREATE TABLE Grades (
Id INT NOT NULL,
StudentID NVARCHAR(10) NOT NULL,
CourseID NVARCHAR(10) NOT NULL,
TeacherID NVARCHAR(10) NOT NULL,
Grade NVARCHAR(5) NOT NULL,
Comment NVARCHAR(30) NOT NULL,
CreatedDate DATE NOT NULL
)
GO
SELECT * FROM  Grades


INSERT INTO dbo.Grades(Id, StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate)
VALUES (5, 20, 50, 123, 'B', 'No Comment', '2015-10-10')
GO

ALTER TABLE dbo.Grades 
ALTER Column StudentID NVARCHAR (10)
GO

ALTER TABLE dbo.Grades 
ALTER Column CourseID NVARCHAR (10)
GO

ALTER TABLE dbo.Grades 
ALTER Column TeacherID  NVARCHAR (10)
GO

ALTER TABLE dbo.Grades 
ALTER Column Comment NVARCHAR (30)
GO


CREATE TABLE Courses (
Id INT NOT NULL,
Name NVARCHAR NOT NULL,
Credit INT NOT NULL,
AcademicYear NVARCHAR(30) NOT NULL,
Semester NVARCHAR(30) NOT NULL
)
GO
SELECT * FROM  Courses

INSERT INTO dbo.Courses(Id,[Name], Credit, AcademicYear, Semester)
VALUES(5,'Database',4 ,'2024,2025','Spring')

ALTER TABLE Courses
ALTER COLUMN Name NVARCHAR(30);
GO



CREATE TABLE GradeDetails (
Id INT NOT NULL,
GradeID INT NOT NULL,
AchievementTypeID INT NOT NULL,
AchievementPoints INT NOT NULL,
AchievementMaxPoints INT NOT NULL,
AchievementDate DATE NOT NULL
)
GO

SELECT * FROM GradeDetails

INSERT INTO dbo.GradeDetails(Id, GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
VALUES(1, 150, 9, 90, 100, '2025-05-09')

EXEC sp_rename 'AchivementTypes', 'GradeDetails'
GO

CREATE TABLE AchievementType(
Id INT NOT NULL,
Name NVARCHAR(50) NOT NULL,
Description NVARCHAR(50) NOT NULL,
ParticipationRate DECIMAL NOT NULL
)
GO

SELECT * FROM AchievementType
INSERT INTO dbo.AchievementType(Id, [Name], [Description], ParticipationRate)
VALUES(30, 'Project', 'Final project',95.00 )
GO
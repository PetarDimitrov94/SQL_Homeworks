USE SEDC_ACADEMY_HOMEWORK
GO

-- Calculate the count of all grades per Teacher in the system
SELECT t.FirstName AS Teacher, COUNT(g.ID) AS GradeCount FROM dbo.Teacher t
JOIN Grade g ON t.ID = g.TeacherID
GROUP BY t.FirstName;
GO


-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID<100)
SELECT t.ID, t.FirstName AS TeacherName, COUNT(g.ID) AS GradeCount FROM dbo.Teacher t
JOIN Grade g ON t.ID = g.TeacherID
JOIN Student s ON g.StudentID = s.ID
WHERE s.ID < 100
GROUP BY t.ID, t.FirstName;
GO

-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT g.StudentID, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade FROM dbo.Grade g
GROUP BY g.StudentID;
GO

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName AS Teacher, COUNT(g.ID) AS GradeCount FROM dbo.Teacher t
JOIN Grade g ON t.ID = g.TeacherID
GROUP BY t.FirstName
HAVING COUNT(g.ID) > 200
GO

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grad
SELECT g.StudentID, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade FROM dbo.Grade g
GROUP BY g.StudentID
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

-- List Student First Name and Last Name next to the other details from previous query
SELECT g.StudentID, s.FirstName, s.LastName  ,MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGRade
FROM Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY g.StudentID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
AS 
SELECT
g.StudentID, COUNT(g.ID) AS GradeCount
FROM dbo.Grade g
GROUP BY g.StudentID
GO

SELECT * FROM vv_StudentGrades;
GO

-- Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT s.FirstName, s.LastName, COUNT(g.Grade) as CountGrades FROM [dbo].[Student] s JOIN [dbo].[Grade] g ON s.ID = g.StudentID GROUP BY s.FirstName, s.LastName
GO

-- List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades ORDER BY CountGrades DESC;
GO
USE SEDC_ACADEMY_HOMEWORK
GO

-- Declare scalar variable for storing FirstName values
DECLARE @FirstName NVARCHAR (100)

-- Assign value ‘Antonio’ to the FirstName variable
SET @FirstName = 'Antonio';
SELECT @FirstName AS FirstName

-- Find all Students having FirstName same as the variable
SELECT * FROM dbo.Student s WHERE s.FirstName = @FirstName

-- Declare table variable that will contain StudentId, StudentName and DateOfBirth
DECLARE @Students TABLE (
	StudentID INT,
	StudentName NVARCHAR(100),
	DateOfBirth DATE
);

-- Fill the table variable with all Female students
INSERT INTO @Students (StudentID, StudentName, DateOfBirth)
SELECT s.ID, s.FirstName + ' ' + s.LastName, s.DateOfBirth
FROM dbo.Student s
WHERE s.Gender = 'F';
SELECT * FROM @Students
GO

-- Declare temp table that will contain LastName and EnrolledDate columns
CREATE TABLE #TemsStudents (
	LastName NVARCHAR (100),
	EnrolledDate DATE
)

-- Fill the temp table with all Male students having First Name starting with ‘A’

INSERT INTO #TemsStudents (LastName, EnrolledDate )
SELECT LastName, EnrolledDate
FROM dbo.Student
WHERE Gender = 'M' AND FirstName LIKE 'A%'
SELECT * FROM #TemsStudents

-- Retrieve the students from the table which last name is with 7 characters
SELECT * FROM dbo.Student WHERE LEN(LastName) = 7;

-- Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName and LastName are the same
SELECT * FROM dbo.Teacher WHERE LEN(FirstName) < 5 AND LEFT(FirstName, 3) = LEFT (LastName, 3);
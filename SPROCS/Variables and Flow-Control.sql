-- Variables and Flow Control

USE [A01-School]
GO 

-- Declare a variable
DECLARE @Cost money
--Variable hold only one value
-- Set a value for the variable using a value from the database
-- Note that the whole SELECT statement is in parenthesis
SET @Cost = (SELECT CourseCost FROM Course WHERE CourseId = 'DMIT101')
PRINT @Cost
--return only one column and one row
--An alternative way of assigning the value would be within a SELECT statement
SELECT @Cost=CourseCost FROM Course WHERE CourseId = 'DMIT101'
PRINT @Cost


-- Understanding BEGIN/END blocks
--  A BEGIN/END block basically acts like a pair of curly braces in C#.
--  It represents a single block of code, that is, a single set of instructions.
--  These are helpful especially with the IF/ELSE flow-control statements.
--  Consider the following example.
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = N'PROCEDURE' AND ROUTINE_NAME = 'GuessRows')
    DROP PROCEDURE GuessRows
GO
CREATE PROCEDURE GuessRows
    @clubRows   int
AS
    DECLARE @actual int
    SELECT @actual = COUNT(*) FROM Club
    IF @actual <> @clubRows
    BEGIN --Identifies a start if a set of instructions
        RAISERROR('Wrong guess. Club has a different number of rows', 16, 1)
        IF @clubRows > @actual
            RAISERROR('Too high a guess', 16, 1)
        ELSE
            RAISERROR('Too low a guess', 16, 1)
    END --Identifies a end if a set of instructions
    ELSE
    BEGIN
        RAISERROR('Good guess!', 16, 1)
    END
RETURN
GO
EXEC GuessRows 5

EXEC GuessRows 10

EXEC GuessRows 8

EXEC GuessRows 11
--Statemnet can nest inside a statement
--Only have if-else, no if-else if- else

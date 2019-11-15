USE [A01-School]
GO

--ONLY DO TRANSACTIONS WHERE THERE ARE MORE THAN 1 INSERT/DELETE/UPDATE/IF (MANY STATEMETS)
/*
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = N'PROCEDURE' AND ROUTINE_NAME = 'SprocName')
    DROP PROCEDURE SprocName
GO
CREATE PROCEDURE SprocName
    -- Parameters here
AS
    -- Body of procedure here
RETURN
GO
*/

--1. Create a stored procedure called DissolveClub that will accept a club id as its parameter. Ensure that the lub exists before attempting to dissolve the club. You are to dissolve the club by first removing all the members of the club and then removing the club itself.

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = N'PROCEDURE' AND ROUTINE_NAME = 'DissolveClub')
    DROP PROCEDURE DissolveClub
GO
CREATE PROCEDURE DissolveClub
    -- Parameters here
    @ClubId         varchar(10),
    @StudentID      int,
    @ClubName       varchar(50)
AS
    -- Body of procedure here
    IF @ClubId <> 0
RETURN
GO

--2.Create a stored procedure ArchivePayments. You will need to use the following StudentPayment
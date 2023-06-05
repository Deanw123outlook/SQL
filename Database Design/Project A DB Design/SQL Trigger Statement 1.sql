/***Create Trigger (Table Level)***/
USE [Polish Car Sales Data]
GO
CREATE TRIGGER [trigger-test-two]
ON [Polish Car Sales Data].[dbo].[Data]
AFTER INSERT
AS
BEGIN
PRINT 'INSERT STATEMENT FAILED. TRIGGER TEST TWO SUCCESSFULL'
ROLLBACK TRANSACTION
END 



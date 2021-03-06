/*
   Monday, December 19, 20111:59:30 AM
   User: 
   Server: P-6294A2\MSSQLSERVER2008
   Database: Felegehiwot
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Type
	(
	ID int NOT NULL,
	Name varchar(50) NULL,
	Description varchar(50) NULL
	)  ON [PRIMARY]
GO

IF EXISTS(SELECT * FROM dbo.Type)
	 EXEC('INSERT INTO dbo.Tmp_Type (ID, Name, Description)
		SELECT ID, Name, Description FROM dbo.Type WITH (HOLDLOCK TABLOCKX)')
GO
ALTER TABLE dbo.Product
	DROP CONSTRAINT FK_INN_Type
GO
DROP TABLE dbo.Type
GO
EXECUTE sp_rename N'dbo.Tmp_Type', N'Type', 'OBJECT' 
GO
ALTER TABLE dbo.Type ADD CONSTRAINT
	PK_Type PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Type', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Type', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Type', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Product ADD CONSTRAINT
	FK_INN_Type FOREIGN KEY
	(
	TypeID
	) REFERENCES dbo.Type
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Product', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Product', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Product', 'Object', 'CONTROL') as Contr_Per 
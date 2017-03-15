CREATE TABLE [dbo].[Customers]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Title] NVARCHAR(10) NOT NULL, 
    [FirstName] NVARCHAR(50) NOT NULL, 
    [LastName] NVARCHAR(50) NOT NULL, 
    [DateOfBirth] DATETIME NOT NULL, 
    [GenderId] INT NOT NULL,
	CONSTRAINT [FK_Customers_Genders] FOREIGN KEY ([GenderId]) REFERENCES [Genders]([Id]) 
)

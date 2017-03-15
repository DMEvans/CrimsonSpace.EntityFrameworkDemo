CREATE TABLE [dbo].[Addresses]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
	[CustomerId] INT NOT NULL,
    [Name] NVARCHAR(100) NOT NULL, 
    [Recipient] NVARCHAR(100) NULL,
	[AddressLine1] NVARCHAR(100) NOT NULL,
	[AddressLine2] NVARCHAR(100) NOT NULL,
	[AddressLine3] NVARCHAR(100) NOT NULL,
	[City] NVARCHAR(100) NOT NULL,
	[County] NVARCHAR(100) NOT NULL,
	[Country] NVARCHAR(100) NOT NULL,
	[PostCode] NVARCHAR(20) NOT NULL,
	CONSTRAINT [FK_Addresses_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [Customers]([Id])

)

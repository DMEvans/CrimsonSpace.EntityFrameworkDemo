CREATE TABLE [dbo].[Products]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
	[CategoryId] INT NOT NULL DEFAULT 0,
    [Name] NVARCHAR(100) NOT NULL, 
    [Price] MONEY NOT NULL,
	[ImageUrl] NVARCHAR(500) NOT NULL DEFAULT 'images/products/default_dvd.jpg', 
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryId]) REFERENCES [Categories]([Id]),
		
)

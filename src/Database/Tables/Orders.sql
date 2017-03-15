CREATE TABLE [dbo].[Orders]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [CustomerId] INT NOT NULL, 
    [DeliveryAddressId] INT NOT NULL,
	[InvoiceAddressId] INT NOT NULL,
	[CreatedTimestamp] DATETIME NOT NULL, 
    [IsSent] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerId]) REFERENCES [Customers]([Id]),
	CONSTRAINT [FK_Orders_DeliveryAddress] FOREIGN KEY ([DeliveryAddressId]) REFERENCES [Addresses]([Id]),
	CONSTRAINT [FK_Orders_InvoiceAddress] FOREIGN KEY ([InvoiceAddressId]) REFERENCES [Addresses]([Id])
)

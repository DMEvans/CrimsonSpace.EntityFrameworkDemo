SET IDENTITY_INSERT [dbo].[Genders] ON 

GO
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (1, N'Male')
GO
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (2, N'Female')
GO
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (3, N'Unknown')
GO
SET IDENTITY_INSERT [dbo].[Genders] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

GO
INSERT [dbo].[Customers] ([Id], [Title], [FirstName], [LastName], [DateOfBirth], [GenderId]) VALUES (1, N'Mr', N'Quinn', N'Dyer', CAST(N'1962-May-05 00:00:00' AS DateTime), 1)
GO
INSERT [dbo].[Customers] ([Id], [Title], [FirstName], [LastName], [DateOfBirth], [GenderId]) VALUES (3, N'Mr', N'Phillip', N'Firmin', CAST(N'1981-Sep-22 00:00:00' AS DateTime), 1)
GO
INSERT [dbo].[Customers] ([Id], [Title], [FirstName], [LastName], [DateOfBirth], [GenderId]) VALUES (4, N'Mrs', N'Claire', N'Fishman', CAST(N'1992-Nov-19 00:00:00' AS DateTime), 2)
GO
INSERT [dbo].[Customers] ([Id], [Title], [FirstName], [LastName], [DateOfBirth], [GenderId]) VALUES (6, N'Miss', N'Miriam', N'Ridley', CAST(N'1985-May-03 00:00:00' AS DateTime), 2)
GO
INSERT [dbo].[Customers] ([Id], [Title], [FirstName], [LastName], [DateOfBirth], [GenderId]) VALUES (7, N'Mr', N'Thaddeus', N'Brownlow', CAST(N'1955-Jul-06 00:00:00' AS DateTime), 1)
GO
INSERT [dbo].[Customers] ([Id], [Title], [FirstName], [LastName], [DateOfBirth], [GenderId]) VALUES (8, N'Miss', N'Lorna', N'Nash', CAST(N'1996-Jan-01 00:00:00' AS DateTime), 2)
GO
INSERT [dbo].[Customers] ([Id], [Title], [FirstName], [LastName], [DateOfBirth], [GenderId]) VALUES (10, N'Mr', N'Arnold', N'Johnson', CAST(N'1991-Jan-01 00:00:00' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

GO
INSERT [dbo].[Addresses] ([Id], [CustomerId], [Name], [Recipient], [AddressLine1], [AddressLine2], [AddressLine3], [City], [County], [Country], [PostCode]) VALUES (3, 1, N'Home', NULL, N'85 Nenthead Road', N'', N'', N'High Harrogate', N'Yorkshire', N'United Kingdom', N'SN13 0HR')
GO
INSERT [dbo].[Addresses] ([Id], [CustomerId], [Name], [Recipient], [AddressLine1], [AddressLine2], [AddressLine3], [City], [County], [Country], [PostCode]) VALUES (7, 1, N'Work', N'Director Dyer', N'Dyer Solutions', N'Regency Business Park', N'North Road', N'High Harrogate', N'Yorkshire', N'United Kingdom', N'SN12 9LL')
GO
INSERT [dbo].[Addresses] ([Id], [CustomerId], [Name], [Recipient], [AddressLine1], [AddressLine2], [AddressLine3], [City], [County], [Country], [PostCode]) VALUES (10, 3, N'Home', NULL, N'67 Seaford Road', N'', N'', N'Culkein', N'', N'United Kingdom', N'IV27 0UB')
GO
INSERT [dbo].[Addresses] ([Id], [CustomerId], [Name], [Recipient], [AddressLine1], [AddressLine2], [AddressLine3], [City], [County], [Country], [PostCode]) VALUES (11, 4, N'Home', NULL, N'3 Constitution St', N'', N'', N'Llanhilleth', N'Camarthen', N'United Kingdom', N'NP3 6BT')
GO
INSERT [dbo].[Addresses] ([Id], [CustomerId], [Name], [Recipient], [AddressLine1], [AddressLine2], [AddressLine3], [City], [County], [Country], [PostCode]) VALUES (12, 6, N'Home', NULL, N'2 Peachfield Road', N'', N'', N'Chapel Town', N'Somerset', N'United Kingdom', N'TR8 7XX')
GO
INSERT [dbo].[Addresses] ([Id], [CustomerId], [Name], [Recipient], [AddressLine1], [AddressLine2], [AddressLine3], [City], [County], [Country], [PostCode]) VALUES (15, 7, N'Home', NULL, N'101 Saxon Drive', N'Camden', N'', N'London', N'', N'United Kingdom', N'W3 0NY')
GO
INSERT [dbo].[Addresses] ([Id], [CustomerId], [Name], [Recipient], [AddressLine1], [AddressLine2], [AddressLine3], [City], [County], [Country], [PostCode]) VALUES (16, 7, N'Work', NULL, N'Doogal Metals', N'Hastings Street', N'Kings Cross', N'London', N'', N'United Kingdon', N'WC1H')
GO
INSERT [dbo].[Addresses] ([Id], [CustomerId], [Name], [Recipient], [AddressLine1], [AddressLine2], [AddressLine3], [City], [County], [Country], [PostCode]) VALUES (19, 8, N'Home', NULL, N'1 Badgers Walk', N'Vernon Road', N'', N'Stourport-On-Severn', N'Worcestershire', N'United Kingdom', N'DY13 8BW')
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [DeliveryAddressId], [InvoiceAddressId], [CreatedTimestamp], [IsSent]) VALUES (4, 1, 3, 3, CAST(N'2017-Feb-25 13:14:00' AS DateTime), 0)
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [DeliveryAddressId], [InvoiceAddressId], [CreatedTimestamp], [IsSent]) VALUES (9, 1, 7, 3, CAST(N'2017-Feb-25 13:25:00' AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [DeliveryAddressId], [InvoiceAddressId], [CreatedTimestamp], [IsSent]) VALUES (11, 3, 10, 10, CAST(N'2017-Feb-25 13:29:00' AS DateTime), 0)
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [DeliveryAddressId], [InvoiceAddressId], [CreatedTimestamp], [IsSent]) VALUES (12, 6, 12, 12, CAST(N'2017-Feb-25 13:31:00' AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [DeliveryAddressId], [InvoiceAddressId], [CreatedTimestamp], [IsSent]) VALUES (13, 7, 16, 15, CAST(N'2017-Feb-25 13:34:00' AS DateTime), 0)
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [DeliveryAddressId], [InvoiceAddressId], [CreatedTimestamp], [IsSent]) VALUES (14, 8, 19, 19, CAST(N'2017-Feb-25 13:35:00' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'DVD')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'BluRay')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (2, 2, N'Rogue One: A Star Wars Story', 14.50, N'images/products/rogueone.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (3, 2, N'Doctor Strange', 13.00, N'images/products/doctorstrange.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (5, 2, N'Fanatastic Beasts and Where To Find Them', 12.50, N'images/products/fantasticbeasts.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (7, 1, N'The Girl On The Train', 10.00, N'images/products/girlonthetrain.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (9, 1, N'John Wick', 5.00, N'images/products/johnwick.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (11, 1, N'Deepwater Horizon', 9.88, N'images/products/deepwaterhorizon.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (14, 1, N'Deadpool', 6.70, N'images/products/deadpool.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (15, 2, N'Arrival', 12.00, N'images/products/arrival.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (16, 1, N'Beauty and The Beast', 9.99, N'images/products/beautyandthebeast.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (17, 1, N'Hidden Figures', 8.50, N'images/products/hiddenfigures.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (18, 2, N'Logan', 10.29, N'images/products/logan.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (20, 2, N'The Lego Batman Movie', 14.96, N'images/products/legobatman.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (21, 1, N'The Magnificent Seven', 7.99, N'images/products/magnificentseven.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (22, 2, N'Star Trek Beyond', 13.00, N'images/products/startrekbeyond.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (23, 1, N'Suicide Squad', 1.20, N'images/products/suicidesquad.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (24, 1, N'Sully: Miracle On The Hudson', 9.99, N'images/products/sully.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (25, 2, N'The Revenant', 7.50, N'images/products/therevenant.jpg')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [Price], [ImageUrl]) VALUES (26, 2, N'X-Men Apocalypse', 5.00, N'images/products/xmenapocalypse.jpg')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 4, 2, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 4, 3, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 4, 5, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 9, 5, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (6, 9, 14, 2)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (7, 11, 9, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (8, 11, 11, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (9, 11, 14, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (10, 12, 11, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (11, 13, 2, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (12, 13, 3, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 13, 11, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 14, 2, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (15, 14, 3, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (17, 14, 5, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (18, 14, 7, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (19, 14, 9, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (20, 14, 11, 1)
GO
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (21, 14, 14, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO

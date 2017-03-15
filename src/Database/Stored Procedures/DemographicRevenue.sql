CREATE PROCEDURE [dbo].[DemographicRevenue]
	@StartDateTime DATETIME,
	@EndDateTime DATETIME
AS
BEGIN
	SELECT 
	[DemographicType],
	[DemographicValue],
	SUM([TotalSales]) as [TotalSales]
	FROM 
	(SELECT 
		'Delivery Region' as [DemographicType],
		[A].[City] as [DemographicValue],
		[OI].[Quantity] * [P].[Price] as [TotalSales]
		FROM [OrderItems] [OI]
		INNER JOIN [Orders] [O] ON [O].[Id] = [OI].[OrderId]
		INNER JOIN [Products] [P] ON [P].[Id] = [OI].[ProductId]
		INNER JOIN [Addresses] [A] ON [A].[Id] = [O].[DeliveryAddressId]
		WHERE [O].[CreatedTimestamp] BETWEEN @StartDateTime AND @EndDateTime
	UNION ALL
	SELECT 
		'Age' as [DemographicType],
		CASE 
			WHEN DATEDIFF(YEAR, [C].[DateOfBirth], GETDATE()) BETWEEN 0 AND 17 THEN 'Under 18 years'
			WHEN DATEDIFF(YEAR, [C].[DateOfBirth], GETDATE()) BETWEEN 18 AND 24 THEN '18 - 24 years'
			WHEN DATEDIFF(YEAR, [C].[DateOfBirth], GETDATE()) BETWEEN 25 AND 34 THEN '25 - 34 years'
			WHEN DATEDIFF(YEAR, [C].[DateOfBirth], GETDATE()) BETWEEN 35 AND 44 THEN '35 - 44 years'
			WHEN DATEDIFF(YEAR, [C].[DateOfBirth], GETDATE()) BETWEEN 45 AND 54 THEN '45 - 54 years'
			WHEN DATEDIFF(YEAR, [C].[DateOfBirth], GETDATE()) BETWEEN 55 AND 64 THEN '55 - 64 years'
			WHEN DATEDIFF(YEAR, [C].[DateOfBirth], GETDATE()) > 65 THEN '65+ years'
			END as [DemographicValue],
		[OI].[Quantity] * [P].[Price] as [TotalSales]
		FROM [OrderItems] [OI]
		INNER JOIN [Orders] [O] ON [O].[Id] = [OI].[OrderId]
		INNER JOIN [Products] [P] ON [P].[Id] = [OI].[ProductId]
		INNER JOIN [Customers] [C] ON [C].[Id] = [O].[CustomerId]
		WHERE [O].[CreatedTimestamp] BETWEEN @StartDateTime AND @EndDateTime
	UNION ALL
	SELECT 
		'Gender' as [DemographicType],
		[G].[Name] as [DemographicValue],
		[OI].[Quantity] * [P].[Price] as [TotalSales]	
		FROM [OrderItems] [OI]
		INNER JOIN [Orders] [O] ON [O].[Id] = [OI].[OrderId]
		INNER JOIN [Products] [P] ON [P].[Id] = [OI].[ProductId]
		INNER JOIN [Customers] [C] ON [C].[Id] = [O].[CustomerId]
		INNER JOIN [Genders] [G] ON [G].[Id] = [C].[GenderId]
		WHERE [O].[CreatedTimestamp] BETWEEN @StartDateTime AND @EndDateTime) as [Data]
	GROUP BY
		[DemographicType],
		[DemographicValue]
	ORDER BY
		[DemographicType],
		[DemographicValue]
END

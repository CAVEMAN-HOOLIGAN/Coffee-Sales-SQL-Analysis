--combining order years
With all_orders as(
SELECT [OrderID]
      ,[CustomerID]
      ,[ProductID]
      ,[OrderDate]
      ,[Quantity]
      ,[Revenue]
      ,[COGS]
  FROM [Grid_Sales].[dbo].[Orders_2023]

  UNION ALL
  SELECT [OrderID]
      ,[CustomerID]
      ,[ProductID]
      ,[OrderDate]
      ,[Quantity]
      ,[Revenue]
      ,[COGS]
  FROM [Grid_Sales].[dbo].[Orders_2024]

  UNION ALL
  SELECT [OrderID]
      ,[CustomerID]
      ,[ProductID]
      ,[OrderDate]
      ,[Quantity]
      ,[Revenue]
      ,[COGS]
  FROM [Grid_Sales].[dbo].[Orders_2025] )
  
  --Building main dataset query
  SELECT 
  a.OrderID,
  a.CustomerID,
  c.Region,
  a.ProductID,
  a.OrderDate,
  c.CustomerJoinDate,
  a.Quantity,
  a.Revenue,
 CASE WHEN a.Revenue IS null THEN p.Price * CONVERT(decimal(18,2),a.Quantity) ELSE a.Revenue END AS CleanedRevenue,
  a.COGS,
  CONVERT(decimal(18,2),a.Revenue) - CONVERT(decimal(18,2),a.COGS) AS Profit,
  p.ProductName,
  p.ProductCategory,
  p.Price,
  p.Base_Cost
  FROM all_orders a

  --Join the customer table
  LEFT JOIN customers c
  on a.CustomerID = c.CustomerID
 
 --Join the product table
 LEFT JOIN products p
 on a.ProductID = p.ProductID

 --Checking for NULLs
 WHERE a.CustomerID is not null
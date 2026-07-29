SELECT TOP (1000) [Type]
      ,[Days_for_shipping_real]
      ,[Days_for_shipment_scheduled]
      ,[Benefit_per_order]
      ,[Sales_per_customer]
      ,[Delivery_Status]
      ,[Late_delivery_risk]
      ,[Category_Id]
      ,[Category_Name]
      ,[Customer_City]
      ,[Customer_Country]
      ,[Customer_Email]
      ,[Customer_Fname]
      ,[Customer_Id]
      ,[Customer_Lname]
      ,[Customer_Password]
      ,[Customer_Segment]
      ,[Customer_State]
      ,[Customer_Street]
      ,[Customer_Zipcode]
      ,[Department_Id]
      ,[Department_Name]
      ,[Latitude]
      ,[Longitude]
      ,[Market]
      ,[Order_City]
      ,[Order_Country]
      ,[Order_Customer_Id]
      ,[order_date_DateOrders]
      ,[Order_Id]
      ,[Order_Item_Cardprod_Id]
      ,[Order_Item_Discount]
      ,[Order_Item_Discount_Rate]
      ,[Order_Item_Id]
      ,[Order_Item_Product_Price]
      ,[Order_Item_Profit_Ratio]
      ,[Order_Item_Quantity]
      ,[Sales]
      ,[Order_Item_Total]
      ,[Order_Profit_Per_Order]
      ,[Order_Region]
      ,[Order_State]
      ,[Order_Status]
      ,[Product_Card_Id]
      ,[Product_Category_Id]
      ,[Product_Image]
      ,[Product_Name]
      ,[Product_Price]
      ,[Product_Status]
      ,[shipping_date_DateOrders]
      ,[Shipping_Mode]
  FROM [dataco_supply_chain].[dbo].[orders]


  SELECT TOP 10
    [Product_Name],
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY [Product_Name]
ORDER BY Total_Sales DESC;


SELECT TOP 10
    [Product_Name],
    SUM([Benefit_per_order]) AS Total_Profit
FROM orders
GROUP BY [Product_Name]
ORDER BY Total_Profit DESC;


SELECT TOP 10
    [Category_Name],
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY [Category_Name]
ORDER BY Total_Orders DESC;


SELECT TOP 10
    [Department_Name],
    SUM([Benefit_per_order]) AS Total_Profit
FROM orders
GROUP BY [Department_Name]
ORDER BY Total_Profit DESC;


SELECT TOP 10
    Market,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Market
ORDER BY Total_Sales DESC;


SELECT TOP 10
    [Customer_Fname],
    [Customer_Lname],
    SUM(Sales) AS Total_Purchases
FROM orders
GROUP BY [Customer_Fname], [Customer_Lname]
ORDER BY Total_Purchases DESC;


SELECT
    COUNT(*) AS Late_Orders
FROM orders
WHERE [Delivery_Status] = 'Late delivery';

SELECT COUNT(*) AS Total_Orders
FROM orders;

SELECT
    YEAR([order_date_DateOrders]) AS Year,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY YEAR([order_date_DateOrders])
ORDER BY Year DESC;


SELECT
    [Delivery_Status],
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    AVG(Sales) AS Avg_Sales
FROM orders
GROUP BY [Delivery_Status]
ORDER BY Total_Sales DESC;


SELECT
    [Shipping_Mode],
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY [Shipping_Mode]
ORDER BY Total_Orders DESC;  



SELECT
    o.[Product_Name],
    o.Sales,
    o.[Benefit_per_order],
    t.Department,
    t.ip,
    t.url
FROM orders o
INNER JOIN tokenized t
ON o.[Product_Name] = t.Product;



SELECT
    o.[Product Name],
    o.Sales,
    t.Category,
    t.Department
FROM orders o
LEFT JOIN tokenized t
ON o.[Product Name] = t.Product;



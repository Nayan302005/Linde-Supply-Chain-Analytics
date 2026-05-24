USE linde_analytics;

-- Total Revenue
SELECT ROUND(SUM(Monthly_Revenue_USD), 2) AS Total_Revenue
FROM linde_supply_chain;

-- Total SKU
SELECT COUNT(DISTINCT SKU_ID) AS Total_SKUs
FROM linde_supply_chain;

-- Inventory Status
SELECT Inventory_Status, COUNT(*) AS Count_Items
FROM linde_supply_chain
GROUP BY Inventory_Status;

-- Top 10 Revenue Products
SELECT SKU_Description,
       ROUND(SUM(Monthly_Revenue_USD), 2) AS Revenue
FROM linde_supply_chain
GROUP BY SKU_Description
ORDER BY Revenue DESC
LIMIT 10;

-- Revenue by Product Group
SELECT Product_Group,
       ROUND(SUM(Monthly_Revenue_USD), 2) AS Revenue
FROM linde_supply_chain
GROUP BY Product_Group
ORDER BY Revenue DESC;

-- Forecast Accuracy
SELECT ROUND(AVG(Forecast_Accuracy_pct), 2) AS Avg_Forecast_Accuracy
FROM linde_supply_chain;

-- Manufacturing Performance
SELECT Manufacturing_Line,
       ROUND(AVG(Capacity_Utilization_pct), 2) AS Avg_Utilization
FROM linde_supply_chain
GROUP BY Manufacturing_Line
ORDER BY Avg_Utilization DESC;

-- Stockout Products
SELECT SKU_Description,
       OnHand_Inventory_units
FROM linde_supply_chain
WHERE Inventory_Status = 'Out of Stock';

-- Customer Priority Revenue
SELECT Customer_Priority,
       ROUND(SUM(Monthly_Revenue_USD), 2) AS Revenue
FROM linde_supply_chain
GROUP BY Customer_Priority
ORDER BY Revenue DESC;

-- On-Time Delivery
SELECT 
ROUND(
    (SUM(PO_OnTime_Flag) * 100.0) / COUNT(*),
    2
) AS On_Time_Delivery_Percentage
FROM linde_supply_chain;
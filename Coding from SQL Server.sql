SELECT *
  FROM [Car sales db].[dbo].[car_sales_data];
--------------------------------------------------------------------------------
  -------------calculating units sold
SELECT COUNT(*) AS units_sold
 FROM [Car sales db].[dbo].[car_sales_data];
 ---------------------------------------------
 --------units sold by make
 Select make,
  count(make)As Cars_Soldmake
  FROM [Car sales db].[dbo].[car_sales_data]
  Group by make;
  --------------------------------

  Select distinct Transmission,
  Count(transmission)As Transmission_type
 FROM [Car sales db].[dbo].[car_sales_data]
  Where transmission !='NULL'
 Group by Transmission;
    --------------------------------------------------------
-----  Revenue by car make
select make,
model,
sum(sellingprice)As Revenue_bycarMake

FROM [Car sales db].[dbo].[car_sales_data]
Group by Make,Model
order by Revenue_bycarMake desc;
-------------------------------------------------------
---Revenue by state
Select state,
sum(sellingprice) AS Revenue_bystate
FROM [Car sales db].[dbo].[car_sales_data]
Group by state
Order by Revenue_bystate ;
---------------------------------------------------------
SELECT
    MAKE,
    MODEL,
    YEAR,
    Body,
    Color,
    sellingprice,
    STATE AS region, 
    CASE 
        WHEN MAKE ='Dodge' THEN 'PETROL'
        WHEN Make ='Chevrolet' THEN 'Gasoline/Flex Fuel'
        WHEN Make ='Nissan' THEN 'Diesel'
        WHEN Make = 'Ford' THEN 'Electric'
        WHEN Make ='Hyndui' THEN 'Electric'
        ELSE 'Unknown'
    END AS Fuel_Type,
    CONVERT(varchar(3),saledate,100)AS MONTH_NAME,
    CONVERT(varchar(4),YEAR(saledate))AS YEAR_NAME,
    DATENAME(WEEKDAY,saledate)AS DAY_NAME,
    --- Performance Tier (Margin Category)---
    CASE 
        WHEN ((SELLINGPRICE - MMR) / NULLIF(MMR, 0)) >= 0.20 THEN 'High Margin'
        WHEN ((SELLINGPRICE - MMR) / NULLIF(MMR, 0)) BETWEEN 0.05 AND 0.199 THEN 'Medium Margin'
        WHEN ((SELLINGPRICE - MMR) / NULLIF(MMR, 0)) < 0.05 THEN 'Low Margin'
        ELSE 'Unknown'
    END AS Performance_Tier


    FROM [Car sales db].[dbo].[car_sales_data];

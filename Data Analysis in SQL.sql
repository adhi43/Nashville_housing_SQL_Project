-- Data Analysis

-- 1. Showing number of sales per day

SELECT SaleDay, COUNT(*) AS Daily_Numb_Sales
FROM house_datas
GROUP BY SaleDay
ORDER BY Daily_Numb_Sales DESC;

-- 2. Showing number of sales per month

SELECT SaleMonthName, COUNT(*) AS Monthly_Numb_Sales
FROM house_datas
GROUP BY SaleMonthName
ORDER BY Monthly_Numb_Sales DESC;


-- 3. Showing number of sales per year
SELECT SaleYear, COUNT(*) AS Yearly_Numb_Sales
FROM house_datas
GROUP BY SaleYear
ORDER BY SaleYear DESC;


-- 4.showing number of sales by land use
SELECT LandUse, COUNT(*) AS LandUse_Num_Sales 
FROM house_datas
GROUP BY LandUse
ORDER BY LandUse_Num_Sales DESC;


-- 5.showing number of sales by property location
SELECT PropertySplitCity, COUNT(*) AS Numb_Sales_by_location
FROM house_datas
GROUP BY PropertySplitCity
ORDER BY Numb_Sales_by_location DESC;

-- 6. showing homes with highest sales price
SELECT 
    SaleDate, 
    LandUse, 
    PropertySplitCity, 
    MAX(SalePrice) AS Highest_Sale_Price,
    (SELECT ROUND(AVG(SalePrice), 0) FROM house_datas) AS AllAvgSalePrice
FROM 
    house_datas
GROUP BY 
    SaleDate, 
    LandUse, 
    PropertySplitCity
ORDER BY 
    Highest_Sale_Price DESC;
    
    
-- 7.Showing home prices higher than all average sale price in relation to their locations
SELECT 
    SalePrice, 
    LandUse, 
    PropertySplitCity
FROM 
    house_datas
WHERE 
    SalePrice > (
        SELECT AVG(SalePrice) 
        FROM house_datas
    )
ORDER BY 
    PropertySplitCity, SalePrice DESC;


-- 8. Showing Total revenue generated per Year
SELECT 
    SaleYear,
    SUM(SalePrice) AS TotalRevenue
FROM 
    house_datas
GROUP BY 
    SaleYear
ORDER BY 
    SaleYear;


-- 9.FINDING THE TOTAL NUMBER OF EACH PROPERTY TYPE -- 
SELECT LandUse AS 'PropertyType', COUNT(LandUse) AS 'Number of Properties' 
FROM house_datas
GROUP BY LandUse 
ORDER BY 'Number of Properties' DESC; -- FINDING THE AVERAGE LAND VALUE OF EAC

-- FINDING THE AVERAGE LAND VALUE OF EACH PROPERTY TYPE --  
SELECT LandUse AS 'PropertyType', ROUND(AVG(LandValue), 0) AS 'Avg. Land Value' 
FROM house_datas
GROUP BY LandUse 
ORDER BY 'Avg. Land Value' DESC; 

-- FINDING THE TOTAL ACREAGE OF EACH PROPERTY TYPE --  
SELECT LandUse AS 'PropertyType', ROUND(SUM(Acreage), 0) AS 'Total' 
FROM house_datas
WHERE Acreage IS NOT NULL  
GROUP BY LandUse 
ORDER BY 'Total' DESC; 


-- FINDING THE TOTAL NUMBER OF PROPERTIES BUILT IN EACH CITY --  
SELECT OwnerSplitCity AS 'City', COUNT(*) AS 'Number of Properties' 
FROM house_datas
GROUP BY OwnerSplitCity 
ORDER BY 'NumberofProperties' DESC; 

-- FINDING TOTAL ACREAGE BY CITY --  
SELECT OwnerSplitCity AS 'City', ROUND(SUM(Acreage), 0) AS 'Total Acreage' 
FROM house_datas 
WHERE Acreage IS NOT NULL  
GROUP BY OwnerSplitCity 
ORDER BY 'Total Acreage' DESC; 

 
-- FINDING TOTAL PROPERTY VALUE BY CITY -- 
SELECT OwnerAddressCity AS 'City', SUM(TotalValue) AS 'Total Property Value' 
FROM housingcopy 
WHERE TotalValue IS NOT NULL 
GROUP BY OwnerAddressCity 
ORDER BY 'Total Property Value' DESC;  


-- FINDING THE NUMBER OF PROPERTIES BUILT BY YEAR --  
SELECT YearBuilt AS 'Year', COUNT(*) AS 'Number of Properties Built' 
FROM house_datas
WHERE YearBuilt IS NOT NULL 
GROUP BY YearBuilt 
ORDER BY YearBuilt; 


-- FINDING THE NUMBER OF PROPERTIES TYPES BUILT EACH YEAR --  
SELECT YearBuilt AS 'Year', LandUse AS 'PropertyType', COUNT(*) AS 'Number of Properties Built' 
FROM house_datas
WHERE YearBuilt IS NOT NULL 
GROUP BY YearBuilt, LandUse 
ORDER BY 'Year', 'PropertyType';
select * from house_datas;


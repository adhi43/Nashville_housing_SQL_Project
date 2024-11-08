create database housees;
use housees;
select count(*) from house_datas; 
select * from house_datas;
set sql_safe_updates = 0;

-- --cleaning data in SQl
-- Remove Duplicates
select distinct(count(*)) from house_datas;

-- no duplicates here
------------------------------------------------------------------------------

-- --formatting the saledate column into a standard date format
set sql_safe_updates = 0;

UPDATE house_datas
SET SaleDate = STR_TO_DATE(SaleDate, '%Y-%M-%D');





ALTER TABLE house_datas
MODIFY `SaleDate` DATE;

SELECT SaleDate from house_datas;



--------------------------------------------------------------------------------


-- Add the SaleYear column as a FLOAT
ALTER TABLE house_datas
ADD SaleYear FLOAT;

-- Update SaleYear by extracting the year from SaleDateConverted
UPDATE house_datas
SET SaleYear = YEAR(SaleDate);

-- Add the SaleMonth column as a FLOAT
ALTER TABLE house_datas
ADD SaleMonth FLOAT;

-- Update SaleMonth by extracting the month from SaleDateConverted
UPDATE house_datas
SET SaleMonth = MONTH(SaleDate);

-- Add the SaleMonthName column as a VARCHAR(50)
ALTER TABLE house_datas
ADD SaleMonthName VARCHAR(50);

-- Update SaleMonthName by extracting the month name from SaleDateConverted
UPDATE house_datas
SET SaleMonthName = MONTHNAME(STR_TO_DATE(CONCAT(SaleMonth, '/1/2022'), '%m/%d/%Y'));



-- Add the SaleDay column as a FLOAT
ALTER TABLE house_datas
ADD SaleDay FLOAT;

-- Update SaleDay by extracting the day from SaleDateConverted
UPDATE house_datas
SET SaleDay = DAY(SaleDate);



---------------------------------------------------------------------
-- --Populate property address
Select * from house_datas
-- --where PropertyAddress is Null
order by ParcelID;

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress,
       IFNULL(a.PropertyAddress, b.PropertyAddress) AS UpdatedAddress
FROM house_datas a
JOIN house_datas b
   ON a.ParcelID = b.ParcelID
   	AND a.UniqueID <> b.UniqueID
WHERE a.PropertyAddress IS NULL;




UPDATE house_datas a
JOIN house_datas b
    ON a.ParcelID = b.ParcelID
    AND a.UniqueID <> b.UniqueID
SET a.PropertyAddress = IFNULL(a.PropertyAddress, b.PropertyAddress)
WHERE a.PropertyAddress IS NULL;




Select * from house_datas
where PropertyAddress is Null
order by ParcelID;
--------------------------------------------------------------------------------------------------------------------------
-- Breaking out Address into Individual Columns (Address, City, State) using a proper delimeter

Select PropertyAddress, ParcelID
From house_datas
order by ParcelID;

SELECT
    SUBSTRING_INDEX(PropertyAddress, ',', 1) AS PropertySplitAddress,
    TRIM(SUBSTRING(PropertyAddress, LOCATE(',', PropertyAddress) + 1)) AS PropertySplitCity
FROM house_datas;


Alter table house_datas
Add PropertySplitAddress varchar(255);

UPDATE house_datas
SET PropertySplitAddress = SUBSTRING_INDEX(PropertyAddress, ',', 1);


Alter table house_datas
Add PropertySplitCity varchar(255);

UPDATE house_datas
SET PropertySplitCity = TRIM(SUBSTRING(PropertyAddress, LOCATE(',', PropertyAddress) + 1));

Select PropertyAddress, PropertySplitAddress, PropertySplitCity
From house_datas;

Select OwnerAddress, PropertyAddress
From house_datas;

SELECT
    SUBSTRING_INDEX(OwnerAddress, ',', 1) AS OwnerSplitAddress,
    TRIM(SUBSTRING(SUBSTRING_INDEX(OwnerAddress, ',', 2), LENGTH(SUBSTRING_INDEX(OwnerAddress, ',', 1)) + 2)) AS OwnerSplitCity,
    TRIM(SUBSTRING_INDEX(OwnerAddress, ',', -1)) AS OwnerSplitState
FROM house_datas;




Alter table house_datas
Add OwnerSplitAddress varchar(255);

UPDATE house_datas
SET OwnerSplitAddress =  SUBSTRING_INDEX(OwnerAddress, ',', 1);
    


ALTER TABLE house_datas
Add OwnerSplitCity varchar(255);

UPDATE house_datas
SET OwnerSplitCity = TRIM(SUBSTRING(SUBSTRING_INDEX(OwnerAddress, ',', 2), LENGTH(SUBSTRING_INDEX(OwnerAddress, ',', 1)) + 2));


ALTER TABLE house_datas
Add OwnerSplitState varchar(255);

UPDATE house_datas
SET OwnerSplitState = TRIM(SUBSTRING_INDEX(OwnerAddress, ',', -1));


Select *
From house_datas;


-- --------------------------------------------------------------------------------------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant" field

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From house_datas
Group by SoldAsVacant
order by 2;

Select SoldAsVacant,
  CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END as new_sold_as_vacant
From house_datas;

Update house_datas
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Delete Unused Columns
-- ----------------------------------------------------------------------------------------------------------

-- Delete Columns THAT HAS BEEN REFINED
-- Select all records from the NashvilleHousing table
SELECT *
FROM house_datas;

-- Drop multiple columns from the NashvilleHousing table
ALTER TABLE house_datas
DROP COLUMN OwnerAddress, 
DROP COLUMN TaxDistrict, 
DROP COLUMN PropertyAddress;


-- Drop a single column from the NashvilleHousing table
ALTER TABLE housing_data
DROP COLUMN SaleDate;


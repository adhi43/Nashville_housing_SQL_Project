# Nashville_housing_SQL_Project
## Project Overview
This project involves the analysis of a housing dataset, where data is cleaned, transformed, and analyzed to extract useful insights about property sales. The dataset includes information on property addresses, sale prices, property types, acreage, and more. The goal of the project is to clean the data, make it more usable, and generate analytical insights from it.
## Objectives
- Identify Sales Patterns: The primary objective is to uncover patterns in sales volume
across different years, months, and specific dates, which could help predict future
peaks and informs real estate strategies.
- Analyze Revenue Trends: Understanding revenue generated year-over-year and how
it correlates with sales volume and provides insights into the city’s economic growth and
property valuation trends.
- Assess Demand by Property Type and Location: By studying property types and
locations, we aim to identify where and what types of homes are in demand. This
could help prospective buyers, investors, and developers make informed decisions.
- Historical Market Performance: Tracking the housing market’s historical perfor-
mance offers valuable context for evaluating the current market state and making
predictions.
## Dataset Overview
The dataset contains the following columns:
- UniqueID: Unique identifier for each property.
- ParcelID: Unique identifier for the parcel of land.
- PropertyAddress: Address of the property.
- OwnerName: Name of the property owner.
- OwnerAddress: Address of the owner.
- SaleDate: The date of the sale.
- SalePrice: The price at which the property was sold.
- LandUse: The type of property (e.g., residential, commercial).
- Acreage: The size of the property in acres.
- LegalReference: Legal description of the property.
- TaxDistrict: Taxation district of the property.
- TotalValue: Total assessed value of the property.
- YearBuilt: The year the property was built.
- SoldAsVacant: Indicates whether the property was sold as vacant land (Y/N).
- SaleYear: Year extracted from SaleDate for trend analysis.
- SaleMonth: Month extracted from SaleDate for seasonal analysis.
- SaleMonthName: Name of the month extracted from SaleDate.
- SaleDay: Day extracted from SaleDate for daily trend analysis.
- PropertySplitCity: City component of the PropertyAddress.
- PropertySplitAddress: Main address component of the PropertyAddress.
- OwnerSplitCity: City component of the OwnerAddress.
- OwnerSplitAddress: Main address component of the OwnerAddress.
- OwnerSplitState: State component of the OwnerAddress.
## Data Cleaning:
- Remove duplicates
- Date Formatting: The SaleDate column is reformatted to a standard date format.
- Remove empty or null owner names
- Remove empty or null property address
- New Columns Added: Several new columns are added based on SaleDate:
1.SaleYear (extracts year from SaleDate)
2.SaleMonth (extracts month)
3.SaleMonthName (month name)
4.SaleDay (day of sale)
  ## Data Transformation
  1. Breaking Down Addresses: The PropertyAddress is split into PropertySplitAddress and PropertySplitCity, and the OwnerAddress is split into OwnerSplitAddress, OwnerSplitCity, and OwnerSplitState.
  2. Handling Categorical Data: The values in the SoldAsVacant column are converted from 'Y' and 'N' to 'Yes' and 'No'.
  3. Dropping Unused Columns: Columns that are no longer needed after cleaning and transformation (like OwnerAddress, TaxDistrict, PropertyAddress) are removed.
     ## Data Analysis
     1. Sales by Day
     2. Sales by Month
     3. Sales by Year
     4. Sales by Property Type(Land Use)
     5. Sales by Propery Location(City)
     6. Highest Sales Price
     7. Revenue Per Year
     8. Property Count by City
     9. Average land values by property type.
     10. Total acreage by property type.
     11. Total acreage and total property value by city.
## Conclusion
The analysis revealed several key insights regarding the Nashville housing market:
- The year 2015 was particularly significant, marked by the highest demand for homes
at 18574 sales and the highest revenue generated, totaling $1,894,700,218.
- The middle of the year, especially June, experienced the highest number of sales,
with 2757 transactions recorded.
- Notably, sales peaked on the 30th of each month, generating 1358 transactions.
- Homes located in Nashville were in high demand, with a total of 18574 properties
sold.
- The primary motivation for home purchases was Single family needs, accounting
for 20757 sales followed by Duplex (1142).

These insights contribute to a better understanding of market trends and consumer be-
havior in Nashville’s real estate sector during this period, providing valuable information
for stakeholders and potential investors.

## Suggestions Based on Analysis
### Optimize Sales Timing
- Sellers should target the mid-year period, especially June, and consider listing
properties closer to month-end for quicker sales.
- Developers and investors should prepare listings to capitalize on these high-
demand periods, potentially increasing the asking price or selecting peak months
for new property releases.
### Focus on Popular Property Types
- Given the strong demand for single-family homes and condos, developers should
prioritize building these types, especially in high-demand locations like Nashville.
- Real estate agents should emphasize these popular property types in their mar-
keting strategies, targeting families and individuals looking for urban residential
options.
### Expand in Nashville’s Core
- With Nashville itself showing the highest sales volume, investors and developers
should focus on opportunities within the city to meet the growing demand for both
single-family homes and urban condos.
### Investment Opportunities in Growing Locations
- Some suburban areas like Antioch and Hermitage have seen moderate yet consistent
demand. Investing in development or improved infrastructure here could make these
areas even more appealing as overflow markets from Nashville.
### Market to Specific Buyer Needs
- The data shows that family needs and urban lifestyle choices drive most pur-
chases. This insight suggests that targeted marketing campaigns emphasizing neigh-
borhood amenities, school districts, and commute times could attract these buyers





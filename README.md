# Project Report 

## Project Questions

1.  Given the total number of acres burned by a fire in California, and data on wind conditions, can we predict the air quality in SF on the date that it is contained?
2. How about if we group the data by month?
3. How about if we add wind data?
4. How about if we add information on the distance from San Francisco?

## Summary of Jupyter Notebooks

* step_1_load_air_quality:  read in csvs for air quality, 1 per year 2001 to 2015.  load them into database table aqi_data
* step_2_load_wilfires: read in .csv for wildfire info, drop unnecessary columns & name remaining ones, add a unique wildfire id, convert start & end dates to standard format, & write to database table wildfire_data
* step_3_load_wind: read in .csv with wind info, drop unnecessary columns & rename remaining ones, & write to database table wind_data
* step_4_clean_fire_data: reads data from wildfire_data, creates a containment date where missing, calculates distance from SF based on lat & long, & write to table cleaned_wildfire_data
* step_5_merge_fires_and_air: reads data from aqi_data & cleaned_wildfire_data, merges it, writes to fire_and_air table
* step_6_bin_results: reads in fire_and_air data & applies bins based on distance of fire from SF
* step_7_group_by_month_binned_acres: read in binned_by_acres, created groups for fires (total acres per bin per month) and groups for air quality (max, min, and mean air quality per month), combine & write to table final_binned_monthly_data
* step_8_group_by_month_total_acres_plus_wind: read in binned_by_acres, group total acres by month, add air quality max, min, mean by month, add wind max for avg daily wind speed, fastest avg 2 & 5 min per month, write to group_by_month_total_acres_plus_wind

## Description of Database Tables
* aqi_data: air quality info for the Bay Area 2001 to 2015 , 1 row per day
* wildfire_data: one row per fire for California fires
* wind_data: 1 row per day wind data from SFO 
* cleaned_wildfire_data: wildfire_data with missing containment dates & distance from SF added
* fire_and_air_data: combined air quality & fire data (1 row for each fire includes air quality for containment date)
* binned_by_acres:  bins added based on distance from SF (1 row per fire)
* final_binned_monthly_data: each month has a row with a column of total acres for each bin + columns for min, max, mean of aqi that month
* final_monthly_total_plus_wind: each month has a row with total acres + air quality min, max, mean + max wind values for avg daily wind plus highest daily speed for 2 & 5 minutes



## Technologies Used

* Sci-Kit learn
* Python pandas
* Python matplotlib
* MySQL database












![xkcd](/images/negative_results.png)

# Project Report 

## Project Questions

1. Given the total number of acres burned by a fire in California, and data on wind conditions, can we predict the air quality in SF on the date that it is contained?
2. Given the total acres burned by fires each month in California, and data on wind conditions, can we predict the air quality in SF for the month?
3. Given the number of acres burned each day by fires in California, binned by size, and wind data, can we predict the air quality in SF on the date that they are contained?
4. Given the total number of acres burned by fires in California each month, binned by distance from SF, can we predict the air quality in SF on the date that they are contained?

## Results

None of the questions were successfully answered.  Relative scores are:
![relative scores](/images/Results.png)



## Summary of Jupyter Notebooks

#### Data preparation notebooks:

* data_prep_step_1_load_air_quality:  read in csvs for air quality, 1 per year 2001 to 2015.  load them into database table aqi_data
* data_prep_step_2_load_wilfires: read in .csv for wildfire info, drop unnecessary columns & name remaining ones, add a unique wildfire id, convert start & end dates to standard format, & write to database table wildfire_data
* data_prep_step_3_load_wind: read in .csv with wind info, drop unnecessary columns & rename remaining ones, & write to database table wind_data
* data_prep_step_4_clean_fire_data: reads data from wildfire_data, creates a containment date where missing, calculates distance from SF based on lat & long, & write to table cleaned_wildfire_data
* data_prep_step_5_merge_fires_and_air: reads data from aqi_data & cleaned_wildfire_data, merges it, writes to fire_and_air table
* data_prep_step_6_bin_results: reads in fire_and_air data & applies bins based on distance of fire from SF
* data_prep_step_7_group_by_month_binned_acres: read in binned_by_acres, created groups for fires (total acres per bin per month) and groups for air quality (max, min, and mean air quality per month), combine & write to table final_binned_monthly_data
* data_prep_step_8_group_by_month_total_acres_plus_wind: read in binned_by_acres, group total acres by month, add air quality max, min, mean by month, add wind max for avg daily wind speed, fastest avg 2 & 5 min per month, write to group_by_month_total_acres_plus_wind
* data_prep_step_9_group_by_day_total_acres_plus_wind: reads from binned_by_acres, groups by date (giving sum of acres for fires contained that day), adds air quality info, and wind info, then writes to final_daily_total_plus_wind
* data_prep_step_10_group_by_day_binned_acres:  reads from binned_by_acres, groups by date and bins (ie total acres per bin per day), adds air-quality and wind data, then writes to final_binned_daily_data

#### Machine learning notebooks used linear regression, k neighbors, gradient boosting, random forests, and unsupervised learning on eac set of data
* question_1_predicting_with_total_acres_per_day_plus_wind: machine learning with total acres from fires contained per day, air quality for that day, and wind info for that day
* question_2_predicting_with_monthly_total_acres_plus_wind: machine learning with total acres from fires contained per month, air quality max min and mean for the month, and max for different wind factors that month
* question_3_predicting_with_binned_acres_per_day_plus_wind: machine learning with total acres from fires in each bin contained per day, air quality for the day, and wind factors for the day
* question_4_predicting_with_monthly_binned_data: machine learning with total acres from fires in each bin contained in a month, and air quality max min and mean for that month

## Description of Database Tables
* aqi_data: air quality info for the Bay Area 2001 to 2015 , 1 row per day
* wildfire_data: one row per fire for California fires
* wind_data: 1 row per day wind data from SFO 
* cleaned_wildfire_data: wildfire_data with missing containment dates & distance from SF added
* fire_and_air_data: combined air quality & fire data (1 row for each fire includes air quality for containment date)
* binned_by_acres:  bins added based on distance from SF (1 row per fire)
* final_binned_monthly_data: each month has a row with a column of total acres for each bin + columns for min, max, mean of aqi that month
* final_monthly_total_plus_wind: each month has a row with total acres + air quality min, max, mean + max wind values for avg daily wind plus highest daily speed for 2 & 5 minutes
* final_daily_total_plus_wind: one row per day, with total acres contained on that day, wind info, and air quality info
final_binned_daily_data:  one row per day, with total acres per bin, overall air quality, and wind data



## Technologies Used

* Sci-Kit learn: linear regression, k neighbors, gradient boosting, random forest and unsupervised learning with pca and kmeans
* Python pandas
* Python matplotlib
* MySQL database












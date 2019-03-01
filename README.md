# Project Report 

## Project Proposal

Our goal of this project is to combine two dataframes: 
* California wildfire data (1991 ~ 2015)
* San Francisco air quality data (aqidaily2000.csv ~ aqidaily2018.csv)


## Step 1: Air Quality Data

#### Datasource

* The EPA provides information on historic air quality data sources: 
  https://www.epa.gov/outdoor-air-quality-data/air-quality-index-daily-values-report

#### Extract/ Transform/ Load

* By using this site, we downloaded data under csv files from year 2000 to year 2018.
* For each csv files, we used Jupyter notebook to load the file into a dataframe, then transform the data so it contains the 
  columns that we want to keep, and created a MySQL database accordingly to a table that matches the dataframe structure.

#### Challenges

* We created a script in Jupyter Notebook to load all the air quality data csv files at once.
* Initially, we planned to use the data from 2000 to 2018; however, the wildfire data is only up to 2015 and so we had to 
  reduce our scope.

#### Files

* air_quality_data folder contains .csv files
* load_air_quality_final.ipynb reads in this data, transforms it, and loads it into the database
* sql_scripts.sql creates the database and tables

## Step 2: Wildfire Data

#### Datasource

* Kaggle contains a SQLite database on 24 years worth of US wildfire data:  
  https://www.kaggle.com/rtatman/188-million-us-wildfires

#### Extract/ Transform/ Load

* As the data was contained in a SQLite database file, we first used DB Browser for SQL Lite to extract a .csv with data on   
  wildfires that took place in California, with a reduced set of columns.
* We used Jupyter notebook to load the file into a dataframe, transform it, and load it into a MySQL database.


#### Challenges

* We used DB Browser for SQLite to create a .csv file with the subset of data we needed.
* Dates within the database were originally stored as Julian dates; we converted them to Gregorian dates in order to make the 
  tables compatible.

#### Files

* wildfire_data folder contains the .csv with the subset of wildfire data we were interested in.
* load_wildfires_final.ipynb reads in the spreadsheet data, transforms it, and loads it into the database.
* sql_scripts.sql contains the code to extract the relevant information from the initial SQLite database provide.
* sql_scripts.sql also contains the code to create the final MySQL database with tables for air quality and wildfire data.

## step 3: merge data

#### Final code
The sql to get combined results from the two data sources is:
SELECT date, overall_aqi, fire_name, size, class
FROM
aqi_data
LEFT JOIN
cleaned_wildfires ON aqi_data.date = cleaned_wildfires.discovery_date

#### Challenges
Initially I wanted to create a table that would contain:
* a row for each date from 2000 to 2015
* for each fire, for every day that it was still active (defined by the time period between discovery_date and containment_date) the acres would be totaled into a total_size field

However, I ran into trouble with the fact that for each wildfire I had a start date and an end date.  I was unable to map every day of every fire onto the air quality data.  Yifu and I both worked heroically, but were unable to get this.

Ultimately I settled for joining the start date from wildfire data to the date of air quality data.






# Creating the database

create database fires;

use fires;

CREATE TABLE `fires`.`aqi_data` (
  `date` DATETIME NOT NULL,
  `overall_aqi` INT(11) NULL,
  `site_name` VARCHAR(45) NULL,
  `year` INT(11) NULL,
  PRIMARY KEY (`date`));
  
  
CREATE TABLE `fires`.`wildfire_data` (
  `index` INT NOT NULL,
  `discovery_date` DATETIME NULL,
  `containment_date` DATETIME NULL,
  `size` FLOAT NULL,
  `class` VARCHAR(45) NULL,
  `fire_year` INT NULL,
  `fire_name` VARCHAR(45) NULL,
  PRIMARY KEY (`index`));
  
  # Extracting the wildfire data from sqlite database
  
select "SOURCE_REPORTING_UNIT_NAME",  "FIRE_NAME",  "FIRE_YEAR", "DISCOVERY_DATE", "CONT_DATE",  "FIRE_SIZE", "FIRE_SIZE_CLASS", "FIPS_NAME" from fires
where "STATE" = "CA";
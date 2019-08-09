
-------------------------------------------------------------------------------------------
--Author: Earlyn Reinhardt

--Description: Show multiple ways to create tables from an S3 bucket.
--             File not meant to be run from the command line (not production ready).
--             Enter the queries separately.

--Note:       If you have multiple files in a directory, it will merge all text files into one,
--            even txt and csv files together.
-------------------------------------------------------------------------------------------


--Create DB
CREATE DATABASE movies;
SHOW DATABASES;
SHOW SCHEMAS;

--Use DB you just created
USE movies;



--Create tables
--Use one or the other. Not both

--Allows you to point to a specific type of file format
CREATE EXTERNAL TABLE movies
(
    movieId BIGINT,
    title STRING, -- VARCHAR(5000),
    genres STRING --VARCHAR(1000)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("input.regex" = "*.csv")
STORED AS textfile
LOCATION 's3://{directory_name}/files/'
TBLPROPERTIES ("skip.header.line.count"="1");


--Allows you to create tables but it includes txt and csv files.
CREATE EXTERNAL TABLE movies
(
    movieId BIGINT,
    title STRING, -- VARCHAR(5000),
    genres STRING --VARCHAR(1000)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS textfile
LOCATION 's3://{directory_name}/files/'
TBLPROPERTIES ("skip.header.line.count"="1");

--Create indices to optimize queries
CREATE INDEX movies_tbl_indx ON TABLE movies (movieId) AS 'COMPACT';

--Show the table you created
SHOW TABLES;

--Describe the table you created.
DESCRIBE movies;

--Truncate table if you want to keep the schema but not the records.
TRUNCATE TABLE IF EXISTS movies;

--Drop the table from database.
DROP TABLE IF EXISTS movies;








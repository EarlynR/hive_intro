/*
-------------------------------------------------------------------------------------------
Author: Earlyn Reinhardt

Description: Show the way to create table from one specific file, as oppose to all files
             in the directory. The way to do it is by importing the file from s3 to the
             local directory in the EMR cluster.


Steps: 1. Run the bash command first
       2. Run the queries

Note: The files are relatively small. It's better to aggregate them into large files and
      then compressing them. Since this is just for educational purposes, I will leave them
      as is.
-------------------------------------------------------------------------------------------
*/

--Run bash command
--aws s3 cp s3://{directory_with_files}/movies.csv to ./movies.csv

--Create DB
CREATE DATABASE movies;
SHOW DATABASES;
SHOW SCHEMAS;

--Use DB you just created3
USE movies;

CREATE EXTERNAL TABLE movies
(
    movieId BIGINT,
    title STRING, -- VARCHAR(5000),
    genres STRING --VARCHAR(1000)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

LOAD DATA LOCAL INPATH 'movies.csv' OVERWRITE INTO TABLE movies;












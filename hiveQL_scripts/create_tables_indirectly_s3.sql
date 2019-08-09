--------------------------------------------------------------------------------------------
--Author: Earlyn Reinhardt

--Description: Show the way to create table from one specific file, as oppose to all files
--             in the directory. The way to do it is by importing the file from s3 to the
--             local directory in the EMR cluster.


--Steps: 1. Run the bash file first
--       2. Run the queries

--Note: The files are relatively small. It's better to aggregate them into large files and
--      then compressing them. Since this is just for educational purposes, I will leave them
--      as is.
-------------------------------------------------------------------------------------------


--Create DB
CREATE DATABASE movies;
--SHOW DATABASES;
--SHOW SCHEMAS;

--Use DB you just created3
USE movies;

CREATE EXTERNAL TABLE movies
(
    movieId BIGINT,
    title STRING, -- VARCHAR(5000),
    genres STRING --VARCHAR(1000)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");
LOAD DATA LOCAL INPATH './data/movies.csv' OVERWRITE INTO TABLE movies;

CREATE EXTERNAL TABLE tags
(
    userID BIGINT,
    movieId BIGINT,
    tag VARCHAR(1000),
    tmstamp BIGINT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");
LOAD DATA LOCAL INPATH './data/tags.csv' OVERWRITE INTO TABLE tags;

CREATE EXTERNAL TABLE ratings
(
    userId BIGINT,
    movieId BIGINT,
    rating DECIMAL(18, 2),
    tmstamp CHAR(255)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");
LOAD DATA LOCAL INPATH './data/ratings.csv' OVERWRITE INTO TABLE ratings;

CREATE EXTERNAL TABLE genome_tags
(
    tagId BIGINT,
    tag VARCHAR(1000)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");
LOAD DATA LOCAL INPATH './data/genome-tags.csv' OVERWRITE INTO TABLE genome_tags;
CREATE INDEX genome_tags_tbl_indx ON TABLE genome_tags (tagId) AS 'COMPACT';


CREATE EXTERNAL TABLE genome_scores
(
    movieId BIGINT,
    tagId BIGINT,
    relevance DECIMAL(38, 10)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY  ',';
LOAD DATA LOCAL INPATH './data/genome-scores.csv' OVERWRITE INTO TABLE links;


CREATE EXTERNAL TABLE links
(
    movieId BIGINT,
    imdbId CHAR(20),
    tmdbId BIGINT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");
LOAD DATA LOCAL INPATH './data/links.csv' OVERWRITE INTO TABLE links;











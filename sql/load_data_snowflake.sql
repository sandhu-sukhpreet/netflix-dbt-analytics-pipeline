-- =============================================
-- Load MovieLens Raw Data from Amazon S3 into Snowflake
-- =============================================

USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;


-- Create external stage
CREATE STAGE netflixstage
URL = 's3://netflixdataset-sukhpreet'
CREDENTIALS = (
  AWS_KEY_ID = '<your_aws_key_id>'
  AWS_SECRET_KEY = '<your_aws_secret_key>'
);


-- Load raw_movies
COPY INTO RAW_MOVIES
FROM @NETFLIXSTAGE/movies.csv
FILE_FORMAT = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);


-- Load raw_ratings
COPY INTO RAW_RATINGS
FROM @NETFLIXSTAGE/ratings.csv
FILE_FORMAT = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);


-- Load raw_tags
COPY INTO RAW_TAGS
FROM @NETFLIXSTAGE/tags.csv
FILE_FORMAT = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
)
ON_ERROR = 'CONTINUE';


-- Load raw_genome_scores
COPY INTO RAW_GENOME_SCORES
FROM @NETFLIXSTAGE/genome-scores.csv
FILE_FORMAT = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);


-- Load raw_genome_tags
COPY INTO RAW_GENOME_TAGS
FROM @NETFLIXSTAGE/genome-tags.csv
FILE_FORMAT = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);


-- Load raw_links
COPY INTO RAW_LINKS
FROM @NETFLIXSTAGE/links.csv
FILE_FORMAT = (
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);
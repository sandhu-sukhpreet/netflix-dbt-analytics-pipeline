-- =============================================
-- Create Raw Tables for MovieLens Dataset
-- =============================================

USE DATABASE MOVIELENS;
USE SCHEMA RAW;


-- Movies table
CREATE OR REPLACE TABLE RAW_MOVIES (
    movieId INTEGER,
    title STRING,
    genres STRING
);


-- Ratings table
CREATE OR REPLACE TABLE RAW_RATINGS (
    userId INTEGER,
    movieId INTEGER,
    rating FLOAT,
    timestamp BIGINT
);


-- Tags table
CREATE OR REPLACE TABLE RAW_TAGS (
    userId INTEGER,
    movieId INTEGER,
    tag STRING,
    timestamp BIGINT
);


-- Genome scores table
CREATE OR REPLACE TABLE RAW_GENOME_SCORES (
    movieId INTEGER,
    tagId INTEGER,
    relevance FLOAT
);


-- Genome tags table
CREATE OR REPLACE TABLE RAW_GENOME_TAGS (
    tagId INTEGER,
    tag STRING
);


-- Links table
CREATE OR REPLACE TABLE RAW_LINKS (
    movieId INTEGER,
    imdbId INTEGER,
    tmdbId INTEGER
);
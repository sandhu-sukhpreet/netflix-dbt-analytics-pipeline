WITH src_movies AS (

    -- This code pulls data from the dbt model src_movies.
    -- Creates a temporary table called src_movies that the rest of the query will use.
    SELECT * FROM {{ ref('src_movies') }}
)


/* This query cleans movie titles and converts the genre string into an array 
   while selecting data from the src_movies table. */
SELECT
    movie_id,
    INITCAP(TRIM(title)) AS movie_title,
    SPLIT(genres, '|')  AS genre_Array,
    genres
    
FROM src_movies
WITH RAW_MOVIES  AS(
    SELECT * FROM {{ source('netflix', 'r_movies')}}
)

SELECT
    movieID AS movie_id,
    title,
    genres
FROM raw_movies
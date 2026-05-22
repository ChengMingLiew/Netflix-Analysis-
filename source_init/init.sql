CREATE SCHEMA IF NOT EXISTS bronze;

DROP TABLE IF EXISTS bronze.raw_netflix_titles;

CREATE TABLE bronze.raw_netflix_titles(
    show_id         VARCHAR(256),
    type            VARCHAR(256),
    title           VARCHAR(256),
    director        VARCHAR(256),
    casts           VARCHAR(256),
    country         VARCHAR(256),
    date_added      TIMESTAMP,
    release_year    INT,
    rating          VARCHAR(256),
    duration        VARCHAR(256)
);
-- Создание пользователя user_reader с ролью ddl_reader
CREATE USER user_reader IDENTIFIED WITH plaintext_password BY '123456';
GRANT ddl_reader TO user_reader;

-- Создание пользователя user_dropper с ролью writer_dropper
CREATE USER user_dropper IDENTIFIED WITH plaintext_password BY '654321';
GRANT writer_dropper TO user_dropper;

-- Создание таблицы
create table movie_ratings (
    movie_id UInt32,
    genre String,
    rating Float32
)
ENGINE = MergeTree()

-- Создание аггрегирующей таблицы 
CREATE TABLE genre_avg_rating (
    genre String,
    avg_rating AggregateFunction(avg, Float32)
) ENGINE = AggregatingMergeTree()
ORDER BY genre;

-- Создание представления
CREATE MATERIALIZED VIEW mv_genre_avg_rating
ENGINE = AggregatingMergeTree()
ORDER BY genre AS
SELECT
    genre,
    avgState(rating) AS avg_rating
FROM movie_ratings
GROUP BY genre;
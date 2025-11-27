DROP TABLE IF EXISTS books;

CREATE TABLE IF NOT EXISTS books (
    id VARCHAR(255),
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(255),
    publisher VARCHAR(255),
    year INT,
    price VARCHAR(20)   
);

SELECT * FROM books LIMIT 10;

DROP TABLE IF EXISTS summary;

CREATE TABLE summary AS
SELECT
    year AS publication_year,
    COUNT(*) AS book_count,
    ROUND(
        AVG(
            CASE
                WHEN price LIKE '€%' THEN CAST(SUBSTRING(price, 2) AS DECIMAL(10,2)) * 1.2
                WHEN price LIKE '$%' THEN CAST(SUBSTRING(price, 2) AS DECIMAL(10,2))
                ELSE NULL
            END
        ),
        2
    ) AS average_price_usd
FROM books
GROUP BY year
ORDER BY year;

SELECT * FROM summary;
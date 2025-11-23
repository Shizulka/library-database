--Напишіть мінімум 4 запити, що містять агрегаційні функції (SUM, AVG, COUNT, MIN, MAX, GROUP BY)

SELECT
    author.name ,
    COUNT(book.book_id)
FROM author
         JOIN author_book ON author.author_id = author_book.author_id
         JOIN book ON author_book.book_id = book.book_id
GROUP BY author.name ;


SELECT
    genre.name ,
    AVG(book.pages)
FROM book
         INNER JOIN book_genres  ON book.book_id = book_genres.book_id
         INNER JOIN genre ON genre.genre_id = book_genres.genre_id
GROUP BY genre.name

SELECT
    genre.name ,
    MAX(book.year_published),
    MIN(book.year_published)
FROM genre
         INNER JOIN book_genres  ON book_genres.genre_id=genre.genre_id
         INNER JOIN book ON book_genres.book_id = book.book_id
GROUP BY genre.name;

SELECT
    language,
    COUNT(*),
    AVG(pages)
FROM book
Group by  language



--Мінімум 3 запити, що використовують різні типи джоінів

SELECT
    book.title
    genre.name
FROM book
         INNER JOIN book_genres ON book.book_id = book_genres.book_id
         INNER JOIN genre ON book_genres.genre_id = genre.genre_id;

SELECT
    patron.first_name,
    patron.last_name,
    checkout.start_time,
    checkout.end_time
FROM patron
         LEFT JOIN checkout ON patron.patron_id = checkout.patron_id;

SELECT
    book.title,
    book_copy.copy_number
FROM book
         FULL JOIN book_copy ON book.book_id=book_copy.book_id;

--мінімум 3 запити з використанням підзапитів

SELECT (title , pages)
FROM book
WHERE pages > (SELECT AVG(pages) FROM book)

SELECT
    title,
    (SELECT copy_number FROM book_copy WHERE book.book_id=book_copy.book_id )
FROM book

SELECT
    genre_id,
    COUNT(book_id)
FROM book_genres
GROUP BY  genre_id
HAVING (COUNT(book_id) > (SELECT COUNT(*) FROM book_genres WHERE genre_id=1))

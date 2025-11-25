***
***

## **Агрегаційні функції**

### 1. ```COUNT```

```sql
SELECT
    author.name ,
    COUNT(book.book_id)
FROM author
         JOIN author_book ON author.author_id = author_book.author_id
         JOIN book ON author_book.book_id = book.book_id
GROUP BY author.name ;
```

Цей запит обчислює скільки книг написав кожен автор. Може використовуватись для обрахування статистики.

### 2. ```AVG```

```sql
SELECT
    genre.name ,
    AVG(book.pages)
FROM book
         INNER JOIN book_genres  ON book.book_id = book_genres.book_id
         INNER JOIN genre ON genre.genre_id = book_genres.genre_id
GROUP BY genre.name
```

Цей запит обчислює середню кількість сторінок у книг кожного жанру. Може використовуватись для статистичного аналізу.

### 3. ```MIN``` ```MAX```

```sql
SELECT
    genre.name ,
    MAX(book.year_published),
    MIN(book.year_published)
FROM genre
         INNER JOIN book_genres  ON book_genres.genre_id=genre.genre_id
         INNER JOIN book ON book_genres.book_id = book.book_id
GROUP BY genre.name;
```

Цей запит показує найстаріші та найновіші роки публікації книг у кожному жанрі. Може використовуватись для обрахування статистики.

### 4. ```GROUP BY``` 

```sql
SELECT
    language,
    COUNT(*),
    AVG(pages)
FROM book
GROUP BY  language
```

Цей запит очислює кількість книг для кожної мови та вираховує середню кількість сторінок. Може використовуватись для обрахування статистики. <!--я поні маю, шо це речення повторюється 4 рази, але ж це реально тіки для обрахування стати. от нашо комусь знати середню кількість сторінок по мові bfr-->

***
***

## **Запити JOIN**

### 1. ```INNER JOIN```

```sql
SELECT
    book.title
    genre.name
FROM book
         INNER JOIN book_genres ON book.book_id = book_genres.book_id
         INNER JOIN genre ON book_genres.genre_id = genre.genre_id;
```

Цей запит показує всі книги з відповідними жанрами. Може використовуватись для перегляду жанрової класифікації книг. <!--мені здається я вже починаю звучати як чат жопете -->

### 2. ```LEFT JOIN```

```sql
SELECT
    patron.first_name,
    patron.last_name,
    checkout.start_time,
    checkout.end_time
FROM patron
         LEFT JOIN checkout ON patron.patron_id = checkout.patron_id;
```

Цей запит показує усіх клієнтів, незалежно від того чи вони брали книги, чи ні. Може використовуватись для перегляду активності клієнтів.

### 3. ```FULL JOIN```

```sql
SELECT
    book.title,
    book_copy.copy_number
FROM book
         FULL JOIN book_copy ON book.book_id=book_copy.book_id;
```

Цей запит показує всі книги та всі примірники книг, навіть якщо в книги немає фізичних примірників, або фізичний примірник не прив'язаний до певної книги. Може використовувати для пошуку неправильно ведених даних і подальшого виправлення проблеми. <!--єдине реально корисне використання цих запитів поки шо-->

***
***

## **Запити з використанням підзапитів**

### 1. ```WHERE```

```sql
SELECT (title , pages)
FROM book
WHERE pages > (SELECT AVG(pages) FROM book)
```

Цей запит показує книги, у яких кількість сторінок більша за середнє значення. <!--я чесно не знаю як це може пригодитись в реаьному житті, це тупо fun little stats for nerds-->

### 2. ```SELECT``` <!--я взагалі не знаю як можна ці 3 пункти назвати, якшо в перших 2 категоріяг були функції які можна виділити то тут вони тупо повторюються-->

```sql
SELECT
    title,
    (SELECT copy_number FROM book_copy WHERE book.book_id=book_copy.book_id )
FROM book
```

Цей запит шукає для кожної книги номер копії через підзапит.

### 3. ```HAVING```

```sql
SELECT
    genre_id,
    COUNT(book_id)
FROM book_genres
GROUP BY  genre_id
HAVING (COUNT(book_id) > (SELECT COUNT(*) FROM book_genres WHERE genre_id=1))
```

Цей запит порівнює кількість книг у кожному жанрі з кількістю книг у жанрі з ID 1. Може використовуватись для пошуку популярних жанрів.

***
***

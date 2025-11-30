# Звіт з нормалізації бази даних бібліотеки

## Перероблений дизайн таблиць

### Таблиця `checkout`

``` sql
ALTER TABLE checkout
DROP COLUMN is_borrowing;
```

Видалення зайвого поля `is_borrowing`, оскільки статус видачі можна визначити за наявністю дати повернення або статусу.


### Таблиця ` book`

``` sql
ALTER TABLE book
ADD publisher varchar(50) NOT NULl DEFAULT 'Невідомо';
```

У книжки може бути один автор назва і рік ,то краще мати ще видавця що б полегшити пошук.

### Таблиця `patron`

``` sql
ALTER TABLE patron
ADD CONSTRAINT email CHECK (email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$');

ALTER TABLE patron
ADD CONSTRAINT phone_number CHECK ( LENGTH(phone_number) = 10 AND  phone_number ~ '^[0-9]+$')
```

Валідація даних читача.Додавання обмежень  для забезпечення коректності даних.

### Таблиця `debtors`

``` sql
DROP TABLE debtors;
```

Таблиця debtors порушувала 3НФ, оскільки залежала від атрибутів таблиці checkout.

### Таблиця `checkout`

``` sql
CREATE TYPE status_type AS ENUM ('Overdue', 'Soon', 'OK');

ALTER TABLE checkout
ADD COLUMN status status_type NOT NULL DEFAULT 'OK';
``` 

Debtors був перенесений в якості  ENUM в таблицю checkout.

## Функціональні залежності

#### Таблиця book

book_id -> title, author, year ,publisher_id

#### Таблиця patron

patron_id -> name, email, phone_number

#### Таблиця checkout

checkout_id -> book_id, patron_id, checkout_date, status 

## Покрокове пояснення нормалізації

#### Третя нормальна форма (3НФ)

Таблиця debtors порушувала принципи нормалізації, оскільки містила дані, що повністю обчислюються на основі checkout . Зберігання цих даних окремо створює ризик розсинхронізації.
Ми видалили debtors і додали поле status в checkout.





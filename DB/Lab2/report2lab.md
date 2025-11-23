
## [cite_start] Перелік таблиць та обмежень схеми [cite: 1]

---

### [cite_start] AUTHOR – зберігає авторів [cite: 2]

| Поле | Тип | Опис |
| :--- | :--- | :--- |
| author_id | integer **PK** | [cite_start]Унікальний ID автора [cite: 3] |
| name | varchar(50) | [cite_start]Імʼя автора [cite: 3] |

---

### [cite_start] BOOK – зберігає книги [cite: 4]

| Поле | Тип | Опис |
| :--- | :--- | :--- |
| book_id | integer **PK** | [cite_start]Унікальний ID книги [cite: 5] |
| title | varchar(255) | [cite_start]Назва [cite: 5] |
| author_id | integer **PK** | [cite_start]ID автора – **зовнішній ключ**, що посилається на `Author(author_id)` [cite: 5] |
| genre_id | varchar(255) | [cite_start]ID жанру – **зовнішній ключ**, що посилається на `Genre(genre_id)` [cite: 5] |
| language | varchar(255) | [cite_start]Мова [cite: 5] |
| year_published | integer | [cite_start]Рік видання [cite: 5] |
| pages | integer | [cite_start]К-сть сторінок (**>0**) [cite: 5] |

---

### [cite_start] BOOK_COPY – зберігає окремі екземпляри книг [cite: 6]

| Поле | Тип | Опис |
| :--- | :--- | :--- |
| book_copy_id | integer (**PK**) | [cite_start]ID копії [cite: 7] |
| book_id | integer (**FK → book**) | [cite_start]ID книги – **зовнішній ключ**, що посилається на `Book(book_id)` [cite: 7] |
| copy_number | varchar(255) | [cite_start]Кількість копій [cite: 7] |

---

### [cite_start]️ GENRE – зберігає жанри книг [cite: 8]

| Поле | Тип | Опис |
| :--- | :--- | :--- |
| genre_id | integer (**PK**) | [cite_start]ID жанру [cite: 9] |
| name | varchar(100) **UNIQUE** | [cite_start]Назва жанру [cite: 9] |

---

### [cite_start] PATRON – зберігає користувачів [cite: 10]

| Поле | Тип | Опис |
| :--- | :--- | :--- |
| patron_id | integer (**PK**) | [cite_start]ID користувача [cite: 11] |
| first_name | varchar(50) | [cite_start]Ім’я [cite: 11] |
| last_name | varchar(50) | [cite_start]Прізвище [cite: 11] |
| email | varchar(100) **UNIQUE** | [cite_start]Email [cite: 11] |
| phone_number | varchar(50) | [cite_start]Телефон [cite: 11] |

---

### [cite_start] CHECKOUT – реєстрація виданих книг [cite: 12]

| Поле | Тип | Опис |
| :--- | :--- | :--- |
| checkout_id | integer (**PK**) | [cite_start]ID видачі [cite: 13] |
| book_copy_id | integer (**FK → book_copy**) | [cite_start]ID копії – **зовнішній ключ**, що посилається на `Book_copy(book_copy_id)` [cite: 13] |
| patron_id | integer (**FK → patron**) | [cite_start]ID користувача – **зовнішній ключ**, що посилається на `Patron(patron_id)` [cite: 13] |
| start_time | timestamp (**DEFAULT now()**) | [cite_start]Дата початку видачі [cite: 13] |
| end_time | timestamp | [cite_start]Дата повернення [cite: 13] |
| is_borrowing | boolean | [cite_start]`true` = книга на руках [cite: 13] |

---

### [cite_start] NOTIFICATION – зберігає сповіщення [cite: 14]

| Поле | Тип | Опис |
| :--- | :--- | :--- |
| notification_id | integer (**PK**) | [cite_start]ID сповіщення [cite: 15] |
| patron_id | integer (**FK → patron**) | [cite_start]ID користувача – **зовнішній ключ**, що посилається на `Patron(patron_id)` [cite: 15] |
| contents | text | [cite_start]Текст повідомлення [cite: 15] |

---

### [cite_start] WAITLIST – зберігає чергу очікування [cite: 16]

| Поле | Тип | Опис |
| :--- | :--- | :--- |
| waitlist_id | integer (**PK**) | [cite_start]ID запису [cite: 17] |
| patron_id | integer (**FK → patron**) | [cite_start]ID користувача – **зовнішній ключ**, що посилається на `Patron(patron_id)` [cite: 17] |
| book_id | integer (**FK → book**) | [cite_start]ID книги – **зовнішній ключ**, що посилається на `Book(book_id)` [cite: 17] |

---

### [cite_start] DEBTORS – зберігає боржників [cite: 18]

| Поле | Тип | Опис |
| :--- | :--- | :--- |
| patron_id | integer (**FK → patron**) | [cite_start]ID користувача – **зовнішній ключ**, що посилається на `Patron(patron_id)` [cite: 19] |
| book_id | integer (**FK → book**) | [cite_start]ID книги – **зовнішній ключ**, що посилається на `Book(book_id)` [cite: 19] |
| due_date | timestamp | [cite_start]Дата, до якої треба повернути [cite: 19] |

---

## [cite_start] Додані дані [cite: 20]

### [cite_start] AUTHOR [cite: 21]

| author_id | name |
| :--- | :--- |
| 1 | [cite_start]Чак Поланік [cite: 22] |
| 2 | [cite_start]Сіжань Джей Джао [cite: 22] |
| 3 | [cite_start]Медлін Міллер [cite: 22] |
| 4 | В. [cite_start]Домонтович [cite: 22] |

---

### [cite_start] BOOK [cite: 23]

| book_id | title | author_id | genre_id | language | year_published | pages |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 2 | Залізна Вдова | 2 | 5,4,2 | Українська | 2024 | [cite_start]446 [cite: 24] |
| 3 | Цирцея | 3 | 2,4 | Українська | 2024 | [cite_start]399 [cite: 24] |
| 4 | Доктор Серафікус | 4 | 1, 29 | Українська | 2024 | [cite_start]315 [cite: 24] |
| 1 | Бійцівський Клуб | 1 | 26,25,8,2 | Українська | 1996 | [cite_start]318 [cite: 24] |

---

### [cite_start] BOOK_COPY [cite: 25]

| book_copy_id | book_id | copy_number |
| :--- | :--- | :--- |
| 1 | 1 | [cite_start]5 [cite: 26] |
| 2 | 3 | [cite_start]8 [cite: 26] |
| 3 | 2 | [cite_start]2 [cite: 26] |

---

### [cite_start] GENRE [cite: 27]

| genre_id | name |
| :--- | :--- |
| 3 | [cite_start]Оповідання [cite: 28] |
| 4 | [cite_start]Фентезі [cite: 28] |
| 5 | [cite_start]Наукова фантастика [cite: 28] |
| 6 | [cite_start]Пригоди [cite: 28] |
| 7 | [cite_start]Детектив [cite: 28] |
| 8 | [cite_start]Трилер [cite: 28] |
| 9 | [cite_start]Жахи [cite: 28] |
| 10 | [cite_start]Драма [cite: 28] |
| 11 | [cite_start]Мелодрама [cite: 28] |
| 12 | [cite_start]Біографія [cite: 28] |
| 13 | [cite_start]Історичний роман [cite: 28] |
| 14 | [cite_start]Міфологія [cite: 28] |
| 15 | [cite_start]Психологічний роман [cite: 28] |
| 16 | [cite_start]Поезія [cite: 28] |
| 17 | [cite_start]Сатира [cite: 28] |
| 18 | [cite_start]Комедія [cite: 28] |
| 19 | [cite_start]Документальна література [cite: 28] |
| 20 | [cite_start]Філософія [cite: 28] |
| 21 | [cite_start]Релігія [cite: 28] |
| 22 | [cite_start]Есе [cite: 28] |
| 23 | [cite_start]Дитяча література [cite: 28] |
| 24 | [cite_start]Навчальна література [cite: 28] |
| 25 | [cite_start]Художня література [cite: 28] |
| 26 | [cite_start]Сучасна проза [cite: 28] |
| 27 | [cite_start]Роман [cite: 28] |
| 28 | [cite_start]Повість [cite: 28] |
| 1 | [cite_start]Українське [cite: 28] |
| 2 | [cite_start]Зарубіжне [cite: 28] |
| 29 | [cite_start]Класична проза [cite: 28] |

---

### [cite_start] PATRON [cite: 29]

| patron_id | first_name | last_name | email | phone_number |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Анна | Куц | anna@gmail.com | [cite_start]0662484478 [cite: 30] |
| 2 | Андрій | Туров | andrii@gmail.com | [cite_start]0662484479 [cite: 30] |
| 3 | Сірко | Кропивницький | sirko@gmail.com | [cite_start]0662484480 [cite: 30] |
| 4 | Артем | Тен | artem.tem@gmail.com | [cite_start]0693773843 [cite: 30] |
| 5 | Нікіта | Бен | nikita.ben@gmail.com | [cite_start]0583884467 [cite: 30] |

---

### [cite_start] CHECKOUT [cite: 31]

| checkout_id | book_copy_id | patron_id | start_time | end_time | is_borrowing |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 2 | 2 | 4 | 2025-11-10 19:07:56.744589 | [cite_start]2025-11-10 00:00:00 | t [cite: 32] |
| 3 | 1 | 2 | 2025-11-10 19:08:30.424319 | [cite_start]2025-11-10 00:00:00 | t [cite: 32] |
| 4 | 3 | 5 | 2025-11-10 19:08:41.561400 | [cite_start]2025-11-10 00:00:00 | t [cite: 32] |
| 6 | 1 | 5 | 2025-11-10 19:08:57.361130 | [cite_start]2025-11-10 00:00:00 | t [cite: 32] |

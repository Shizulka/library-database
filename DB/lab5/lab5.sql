ALTER TABLE checkout
DROP COLUMN is_borrowing;

     //ми самі забули навіщо в чекаут це

CREATE TABLE publisher_book(
publisher_id int not null references publisher(publisher_id),
book_id int not null references book (book_id)
);

CREATE TABLE publisher (
publisher_id SERIAL PRIMARY KEY,
name  VARCHAR(32) NOT NULL
);

// у книжки може бути один автор назва і рік то краще мати ще видавця що б полегшити пошук


ALTER TABLE patron
ADD CONSTRAINT email CHECK (email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$');

ALTER TABLE patron
ADD CONSTRAINT phone_number CHECK ( LENGTH(phone_number) = 10 AND  phone_number ~ '^[0-9]+$')


//валідація данних

DROP TABLE debtors;

CREATE TYPE status_type AS ENUM ('Overdue', 'Soon', 'OK');

ALTER TABLE checkout
ADD COLUMN status status_type NOT NULL DEFAULT 'OK';

//можна все запихнути в чекаут

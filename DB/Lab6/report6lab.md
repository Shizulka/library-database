***


# Міграції через Flyway 

Всі міграції проводилися через  Docker та командним рядоком через команду :

```
docker run --rm ^
  -v "C:\Users\Home\Desktop\sql":/flyway/sql ^
  flyway/flyway ^
  migrate ^
  -url="jdbc:postgresql://hopper.proxy.rlwy.net:44865/railway" ^
  -user=postgres ^
  -password=IAnAFRyJnFpWsmUGiVLdfohFPCedaXDN

```
***
***

## V2__Add_Wishlist.sql

```sql 
CREATE TABLE wishlist (
    wishlist_id SERIAL PRIMARY KEY,
    patron_id INT NOT NULL REFERENCES patron(patron_id),
    book_id INT NOT NULL REFERENCES book(book_id)
);
```

## Результат:

```
C:\Users\Home>docker run --rm ^
More?   -v "C:\Users\Home\Desktop\sql":/flyway/sql ^
More?   flyway/flyway ^
More?   migrate ^
More?   -url="jdbc:postgresql://hopper.proxy.rlwy.net:44865/railway" ^
More?   -user=postgres ^
More?   -password=IAnAFRyJnFpWsmUGiVLdfohFPCedaXDN
WARNING: Storing migrations in 'sql' is not recommended and default scanning of this location may be deprecated in a future release
Flyway OSS Edition 11.18.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://hopper.proxy.rlwy.net:44865/railway (PostgreSQL 17.6)
Successfully validated 3 migrations (execution time 00:00.532s)
Current version of schema "public": 1
Migrating schema "public" to version "2 - Add Wishlist"
Successfully applied 1 migration to schema "public", now at version v2 (execution time 00:01.030s)
```

***
***

## V3__Update_Wishlist.sql

```sql 
ALTER TABLE  wishlist 
ADD COLUMN added_date TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE  wishlist 
ADD COLUMN  for_delete int not null 
```

## Результат:

```
C:\Users\Home>docker run --rm ^
More?   -v "C:\Users\Home\Desktop\sql":/flyway/sql ^
More?   flyway/flyway ^
More?   migrate ^
More?   -url="jdbc:postgresql://hopper.proxy.rlwy.net:44865/railway" ^
More?   -user=postgres ^
More?   -password=IAnAFRyJnFpWsmUGiVLdfohFPCedaXDN
WARNING: Storing migrations in 'sql' is not recommended and default scanning of this location may be deprecated in a future release
Flyway OSS Edition 11.18.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://hopper.proxy.rlwy.net:44865/railway (PostgreSQL 17.6)
Successfully validated 4 migrations (execution time 00:00.563s)
Current version of schema "public": 1
Migrating schema "public" to version "3 - Update Wishlist"
Successfully applied 2 migrations to schema "public", now at version v3 (execution time 00:01.780s)
```

***
***

## V4__Delete_Column .sql

```sql 
ALTER TABLE wishlist
DROP COLUMN for_delete;
```

## Результат:

```
C:\Users\Home>docker run --rm ^
More?   -v "C:\Users\Home\Desktop\sql":/flyway/sql ^
More?   flyway/flyway ^
More?   migrate ^
More?   -url="jdbc:postgresql://hopper.proxy.rlwy.net:44865/railway" ^
More?   -user=postgres ^
More?   -password=IAnAFRyJnFpWsmUGiVLdfohFPCedaXDN
WARNING: Storing migrations in 'sql' is not recommended and default scanning of this location may be deprecated in a future release
Flyway OSS Edition 11.18.0 by Redgate

See release notes here: https://rd.gt/416ObMi
Database: jdbc:postgresql://hopper.proxy.rlwy.net:44865/railway (PostgreSQL 17.6)
Successfully validated 5 migrations (execution time 00:00.526s)
Current version of schema "public": 3
Migrating schema "public" to version "4 - Delete Column "
Successfully applied 1 migration to schema "public", now at version v4 (execution time 00:00.769s)
```
***
***

 ## Історія міграцій у файлі flyway_schema_history

<img width="1401" height="714" alt="image" src="https://github.com/user-attachments/assets/65d15e39-ffbc-4a1b-9b39-1b49770831d8" />

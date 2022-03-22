### Giorgio Sawaya - 300126961

## Solution au liste d'exercise pour le lab 9


#### 1. Author and books
```
CREATE TABLE Author (
	Authorid int,
	Authorname varchar (20),
	PRIMARY KEY (Authorid)
);

CREATE TABLE Book (
	bookid int,
	bookname varchar(20),
	authorid int,
	amount numeric(7,2),
	rating int,
	booktype varchar(25),
	PRIMARY KEY (bookid),
	FOREIGN KEY (authorid) REFERENCES Author (authorid) ON DELETE CASCADE ON UPDATE CASCADE,
	CHECK (booktype IN ('Fictionadulte', 'Non-fiction-adulte', 'Fiction-jeunesse', 'Non-fictionjeunesse')),
	CHECK (amount > 0),
	CHECK (rating <= 10 AND rating >= 1)
);
```

#### 2. Limit on number of books and authors.

```
CREATE ASSERTION librarylimit
CHECK ( 
	(SELECT COUNT(*) FROM Book) + (SELECT COUNT(*) FROM Author) <= 10000
);
```

#### 3. Trigger

```
CREATE TRIGGER bookrating
BEFORE UPDATE ON book
FOR EACH ROW
EXECUTE PROCEDURE check_book_rating()
```


#### 4.  Creer un trigger pour changer le rating total d'un auteur

i)
```
ALTER TABLE Author ADD COLUMN author_sum_rating int;
ALTER TABLE Author ALTER COLUMN  author_sum_rating SET DEFAULT 0;
UPDATE Author Set author_sum_rating = DEFAULT
```

ii)

```
CREATE TRIGGER updatesum
AFTER UPDATE OF rating ON Book
FOR EACH ROW
UPDATE Author
	SET Author.author_sum_rating = rate.sumRate
	FROM Author 
	INNER JOIN(
	SELECT authorid, sum(rating) as sumRate
	FROM book
	GROUP BY authorid
	) rate
	ON Author.Authorid = rate.authorid
```

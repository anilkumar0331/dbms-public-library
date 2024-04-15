-- CREATE TABLES

CREATE TABLE Catalog (
	Catalog_ID serial PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Location varchar(255) 
);

CREATE TABLE Genre (
	Genre_ID serial PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Description TEXT
);

CREATE TABLE Material (
	Material_ID serial PRIMARY KEY,
	Title varchar(255) NOT NULL,
	Publication_Date DATE,
	Catalog_ID INTEGER NOT NULL,
	Genre_ID INTEGER NOT NULL,
	FOREIGN KEY (Catalog_ID) REFERENCES Catalog(Catalog_ID),
	FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID)
);

CREATE TABLE Author (
	Author_ID serial PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Birth_Date DATE,
	Nationality varchar(255)
);

CREATE TABLE Authorship (
	Authorship_ID serial PRIMARY KEY,
	Author_ID INTEGER NOT NULL,
	Material_ID INTEGER NOT NULL,
	FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
	FOREIGN KEY (Material_ID) REFERENCES Material(Material_ID)
);

CREATE TABLE Member (
	Member_ID serial PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Contact_Info varchar(255) NOT NULL,
	Join_Date DATE NOT NULL
);

CREATE TABLE Staff (
	Staff_ID serial PRIMARY KEY,
	Name varchar(255) NOT NULL,
	Contact_Info varchar(255) NOT NULL,
	Job_Title varchar(255) NOT NULL,
	Hire_Date DATE NOT NULL
);

CREATE TABLE Borrow (
	Borrow_ID serial PRIMARY KEY,
	Material_ID INTEGER NOT NULL,
	Member_ID INTEGER NOT NULL,
	Staff_ID INTEGER NOT NULL,
	Borrow_Date DATE NOT NULL,
	Due_Date DATE NOT NULL,
	Return_Date DATE,
	FOREIGN KEY (Material_ID) REFERENCES Material(Material_ID),
	FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
	FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- INSERT DATA INTO TABLES

INSERT INTO Catalog (Name, Location)
VALUES ('Books', 'A1.1'),
       ('Magazines', 'B2.1'),
	   ('E-Books', 'C3.1'),
	   ('Audiobooks', 'D4.1'),
	   ('Journals', 'E5.1'),
	   ('Newspaper', 'F6.1'),
	   ('Maps', 'G7.1'),
	   ('Novels', 'H8.1'),
	   ('Sheet Music', 'I9.1'),
	   ('Educational', 'J10.1');

INSERT INTO Genre (Name, Description) 
VALUES ('General Fiction', 'Literary works with a focus on character and plot development, exploring various themes and human experiences.'),
       ('Mystery & Thriller', 'Suspenseful stories centered around crime, investigation, or espionage with an emphasis on tension and excitement.'),
       ('Science Fiction & Fantasy', 'Imaginative works that explore alternate realities, futuristic concepts, and magical or supernatural elements.'),
       ('Horror & Suspense', 'Stories designed to evoke fear, unease, or dread, often featuring supernatural or psychological elements.'),
       ('Dystopian & Apocalyptic', 'Depictions of societies in decline or collapse, often exploring themes of political and social oppression or environmental disaster.'),
       ('Classics', 'Enduring works of literature that have stood the test of time, often featuring rich language and complex themes.'),
       ('Historical Fiction', 'Fictional stories set in the past, often based on real historical events or figures, and exploring the customs and experiences of that time.'),
       ('Epic Poetry & Mythology', 'Ancient or traditional stories and poems, often featuring heroes, gods, and mythical creatures, and exploring cultural values and beliefs.');

INSERT INTO Material (Title, Publication_Date, Catalog_ID, Genre_ID)
VALUES ('The Catcher in the Rye', '1951-07-16', 1, 1),
       ('To Kill a Mockingbird', '1960-07-11', 2, 1),
       ('The Da Vinci Code', '2003-04-01', 3, 2),
       ('The Hobbit', '1937-09-21', 4, 3),
       ('The Shining', '1977-01-28', 5, 4),
       ('Pride and Prejudice', '1813-01-28', 1, 1),
       ('The Great Gatsby', '1925-04-10', 2, 1),
       ('Moby Dick', '1851-10-18', 3, 1),
       ('Crime and Punishment', '1866-01-01', 4, 1),
       ('The Hitchhiker''s Guide to the Galaxy', '1979-10-12', 5, 3),
       ('1984', '1949-06-08', 1, 5),
       ('Animal Farm', '1945-08-17', 2, 5),
       ('The Haunting of Hill House', '1959-10-17', 3, 4),
       ('Brave New World', '1932-08-01', 4, 5),
       ('The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', '1950-10-16', 5, 3),
       ('The Adventures of Huckleberry Finn', '1884-12-10', 6, 1),
       ('The Catch-22', '1961-10-11', 7, 1),
       ('The Picture of Dorian Gray', '1890-07-01', 8, 1),
       ('The Call of Cthulhu', '1928-02-01', 9, 4),
       ('Harry Potter and the Philosopher''s Stone', '1997-06-26', 10, 3),
       ('Frankenstein', '1818-01-01', 6, 4),
       ('A Tale of Two Cities', '1859-04-30', 7, 1),
       ('The Iliad', '1750-01-01', 8, 6),
       ('The Odyssey', '1725-01-01', 9, 6),
       ('The Brothers Karamazov', '1880-01-01', 10, 1),
       ('The Divine Comedy', '1320-01-01', 6, 6),
       ('The Grapes of Wrath', '1939-04-14', 7, 1),
       ('The Old Man and the Sea', '1952-09-01', 8, 1),
       ('The Count of Monte Cristo', '1844-01-01', 9, 1),
       ('A Midsummer Night''s Dream', '1596-01-01', 10, 7),
       ('The Tricky Book', '1888-01-01', 10, 7);

INSERT INTO Author (Name, Birth_Date, Nationality)
VALUES ('Jane Austen', '1775-12-16', 'British'),
       ('Ernest Hemingway', '1899-07-21', 'American'),
       ('George Orwell', '1903-06-25', 'British'),
       ('Scott Fitzgerald', '1896-09-24', 'American'),
       ('J.K. Rowling', '1965-07-31', 'British'),
       ('Mark Twain', '1835-11-30', 'American'),
       ('Leo Tolstoy', '1828-09-09', 'Russian'),
       ('Virginia Woolf', '1882-01-25', 'British'),
       ('Gabriel Márquez', '1927-03-06', 'Colombian'),
       ('Charles Dickens', '1812-02-07', 'British'),
       ('Harper Lee', '1926-04-28', 'American'),
       ('Oscar Wilde', '1854-10-16', 'Irish'),
       ('William Shakespeare', '1564-04-26', 'British'),
       ('Franz Kafka', '1883-07-03', 'Czech'),
       ('James Joyce', '1882-02-02', 'Irish'),
       ('J.R.R. Tolkien', '1892-01-03', 'British'),
       ('Emily Brontë', '1818-07-30', 'British'),
       ('Toni Morrison', '1931-02-18', 'American'),
       ('Fyodor Dostoevsky', '1821-11-11', 'Russian'),
       ('Lucas Piki', '1847-10-16', 'British');
       
INSERT INTO Authorship (Author_ID, Material_ID)
VALUES (1, 1),(2, 2),
       (3, 3),(4, 4),
	   (5, 5),(6, 6),
	   (7, 7),(8, 8),
	   (9, 9),(10, 10),
	   (11, 11),(12, 12),
	   (13, 13),(14, 14),
	   (15, 15),(16, 16),
	   (17, 17),(18, 18),
       (19, 19),(20, 20),
	   (1, 21),(2, 22),
	   (3, 23),(4, 24),
	   (5, 25),(6, 26),
	   (7, 27),(8, 28),
	   (19, 28),(9, 29),
       (10, 30),(8, 30),(2, 29);

INSERT INTO Member (Name, Contact_Info, Join_Date)
VALUES ('Alice Johnson', 'alice.johnson@email.com', '2018-01-10'),
       ('Bob Smith', 'bob.smith@email.com', '2018-03-15'),
       ('Carol Brown', 'carol.brown@email.com', '2018-06-20'),
       ('David Williams', 'david.williams@email.com', '2018-09-18'),
       ('Emily Miller', 'emily.miller@email.com', '2019-02-12'),
       ('Frank Davis', 'frank.davis@email.com', '2019-05-25'),
       ('Grace Wilson', 'grace.wilson@email.com', '2019-08-15'),
       ('Harry Garcia', 'harry.garcia@email.com', '2019-11-27'),
       ('Isla Thomas', 'isla.thomas@email.com', '2020-03-04'),
       ('Jack Martinez', 'jack.martinez@email.com', '2020-07-01'),
       ('Kate Anderson', 'kate.anderson@email.com', '2020-09-30'),
       ('Luke Jackson', 'luke.jackson@email.com', '2021-01-18'),
       ('Mia White', 'mia.white@email.com', '2021-04-27'),
       ('Noah Harris', 'noah.harris@email.com', '2021-07-13'),
       ('Olivia Clark', 'olivia.clark@email.com', '2021-10-05'),
       ('Peter Lewis', 'peter.lewis@email.com', '2021-12-01'),
       ('Quinn Hall', 'quinn.hall@email.com', '2022-02-28'),
       ('Rachel Young', 'rachel.young@email.com', '2022-06-17'),
       ('Sam Walker', 'sam.walker@email.com', '2022-09-25'),
       ('Tiffany Allen', 'tiffany.allen@email.com', '2022-12-10');

INSERT INTO Staff (Name, Contact_Info, Job_Title, Hire_Date)
VALUES ('Amy Green', 'amy.green@email.com', 'Librarian', '2017-06-01'),
       ('Brian Taylor', 'brian.taylor@email.com', 'Library Assistant', '2018-11-15'),
       ('Christine King', 'chris.king@email.com', 'Library Assistant', '2019-05-20'),
       ('Daniel Wright', 'dan.wright@email.com', 'Library Technician', '2020-02-01');

INSERT INTO Borrow (Material_ID, Member_ID, Staff_ID, Borrow_Date, Due_Date, Return_Date) 
VALUES (1, 1, 1, '2018-09-12', '2018-10-03', '2018-09-30'),
       (2, 2, 1, '2018-10-15', '2018-11-05', '2018-10-29'),
       (3, 3, 1, '2018-12-20', '2019-01-10', '2019-01-08'),
       (4, 4, 1, '2019-03-11', '2019-04-01', '2019-03-27'),
       (5, 5, 1, '2019-04-20', '2019-05-11', '2019-05-05'),
       (6, 6, 1, '2019-07-05', '2019-07-26', '2019-07-21'),
       (7, 7, 1, '2019-09-10', '2019-10-01', '2019-09-25'),
       (8, 8, 1, '2019-11-08', '2019-11-29', '2019-11-20'),
       (9, 9, 1, '2020-01-15', '2020-02-05', '2020-02-03'),
       (10, 10, 1, '2020-03-12', '2020-04-02', '2020-03-28'),
       (1, 11, 2, '2020-05-14', '2020-06-04', '2020-05-28'),
       (2, 12, 2, '2020-07-21', '2020-08-11', '2020-08-02'),
       (3, 13, 2, '2020-09-25', '2020-10-16', '2020-10-15'),
       (4, 1, 2, '2020-11-08', '2020-11-29', '2020-11-24'),
       (5, 2, 2, '2021-01-03', '2021-01-24', '2021-01-19'),
       (6, 3, 2, '2021-02-18', '2021-03-11', '2021-03-12'),
       (17, 4, 2, '2021-04-27', '2021-05-18', '2021-05-20'),
       (18, 5, 2, '2021-06-13', '2021-07-04', '2021-06-28'),
       (19, 6, 2, '2021-08-15', '2021-09-05', '2021-09-03'),
       (20, 7, 2, '2021-10-21', '2021-11-11', '2021-11-05'),
       (21, 1, 3, '2021-11-29', '2021-12-20', NULL),
       (22, 2, 3, '2022-01-10', '2022-01-31', '2022-01-25'),
       (23, 3, 3, '2022-02-07', '2022-02-28', '2022-02-23'),
       (24, 4, 3, '2022-03-11', '2022-04-01', '2022-03-28'),
       (25, 5, 3, '2022-04-28', '2022-05-19', '2022-05-18'),
       (26, 6, 3, '2022-06-22', '2022-07-13', '2022-07-08'),
       (27, 7, 3, '2022-08-04', '2022-08-25', '2022-08-23'),
       (28, 8, 3, '2022-09-13', '2022-10-04', '2022-09-28'),
       (29, 9, 3, '2022-10-16', '2022-11-06', '2022-11-05'),
       (30, 8, 3, '2022-11-21', '2022-12-12', '2022-12-05'),
       (1, 9, 4, '2022-12-28', '2023-01-18', NULL),
       (2, 1, 4, '2023-01-23', '2023-02-13', NULL),
       (3, 10, 4, '2023-02-02', '2023-02-23', '2023-02-17'),
       (4, 11, 4, '2023-03-01', '2023-03-22', NULL),
       (5, 12, 4, '2023-03-10', '2023-03-31', NULL),
       (6, 13, 4, '2023-03-15', '2023-04-05', NULL),
       (7, 17, 4, '2023-03-25', '2023-04-15', NULL),
       (8, 8, 4, '2023-03-30', '2023-04-20', NULL),
       (9, 9, 4, '2023-03-26', '2023-04-16', NULL),
       (10, 20, 4, '2023-03-28', '2023-04-18', NULL);

-- ==================================
-- QUERYING AND MANIPULATION
-- ==================================

-- 1.Which materials are currently available in the library?

-- Query: 1
SELECT m.title FROM Material AS m
WHERE NOT EXISTS 
(SELECT * FROM Borrow AS b 
WHERE m.material_id = b.material_id AND b.return_date IS NULL);	

-- Query: 2
SELECT m1.title FROM Material AS m1,
(SELECT material_id FROM Material
EXCEPT
SELECT material_id FROM Borrow WHERE return_date IS NULL) AS m2
WHERE m1.material_id = m2.material_id
ORDER BY m1.material_id;

-- 2.Which materials are currently overdue?
-- Suppose today is 04/01/2023, and show the borrow date and due date of each material

-- Query: 1
SELECT m.title, b.borrow_date, b.due_date FROM Borrow AS b, Material AS m
WHERE b.material_id = m.material_id 
AND b.due_date < '2023-04-01' 
AND b.return_date IS NULL;

-- Query: 2
SELECT m.title, b.borrow_date, b.due_date FROM Borrow AS b
INNER JOIN Material AS m
ON b.material_id = m.material_id 
AND b.due_date < '2023-04-01' 
AND b.return_date IS NULL;

-- 3.What are the top 10 most borrowed materials in the library? 
-- Show the title of each material and order them based on their available counts

-- Query: 1
SELECT m.title FROM Material AS m, Borrow AS b
WHERE b.material_id = m.material_id
GROUP BY m.title
ORDER BY COUNT(b.material_id) DESC
LIMIT 10;

-- Query: 2
SELECT m.title FROM Material AS m
INNER JOIN Borrow AS b
ON b.material_id = m.material_id
GROUP BY m.title
ORDER BY COUNT(b.material_id) DESC
LIMIT 10;

-- 4.How many books has the author Lucas Piki written?

SELECT COUNT(*) AS Number_of_Books FROM 
(SELECT a1.material_id FROM Authorship AS a1, Author AS a2, Material AS m
WHERE a1.author_id = a2.author_id AND 
      a2.name = 'Lucas Piki' AND 
      a1.material_id = m.material_id AND 
      m.catalog_id = (SELECT catalog_id FROM Catalog WHERE name = 'Books')) AS result;

-- 5.How many books were written by two or more authors?

SELECT COUNT(*) AS number_of_books FROM 
(SELECT a.material_id FROM Authorship AS a, Material AS m
WHERE a.material_id = m.material_id AND 
m.catalog_id = (SELECT catalog_id FROM Catalog WHERE name = 'Books')
GROUP BY a.material_id
HAVING COUNT(a.author_id) >= 2) AS result;

-- 6.What are the most popular genres in the library?

-- Based on the materials in the library
-- Query: 1
SELECT g.name FROM Genre as g, Material as m 
WHERE g.genre_id = m.genre_id
GROUP BY g.name
ORDER BY COUNT(g.genre_id) DESC;

-- Query: 2
SELECT g.name FROM Genre as g
INNER JOIN Material as m 
ON g.genre_id = m.genre_id
GROUP BY g.name
ORDER BY COUNT(g.genre_id) DESC;

-- Based on the interest of the people
-- Query: 1
SELECT g.name FROM Genre as g, Material as m, Borrow as b 
WHERE g.genre_id = m.genre_id AND m.material_id = b.material_id
GROUP BY g.name
ORDER BY COUNT(g.genre_id) DESC;

-- Query: 2
SELECT g1.name FROM Genre AS g1, 
(SELECT genre_id FROM Material NATURAL JOIN Borrow) AS g2
WHERE g1.genre_id = g2.genre_id
GROUP BY g1.genre_id
ORDER BY COUNT(g1.genre_id) DESC;

-- 7.How many materials have been borrowed from 09/2020-10/2020?

SELECT COUNT(*) AS number_of_materials FROM Borrow 
WHERE borrow_date >= '2020-09-01' AND 
      borrow_date < '2020-11-01';

-- 8.How do you update the “Harry Potter and the Philosopher's Stone” when it is returned on 04/01/2023?

-- Update Operation
UPDATE Borrow 
SET return_date = '2023-04-01'
WHERE material_id = (SELECT material_id FROM Material 
					 WHERE title = 'Harry Potter and the Philosopher''s Stone');

-- Check the updated table
SELECT * FROM Borrow

-- 9.How do you delete the member Emily Miller and all her related records from the database?

-- Drop member_id constraint
ALTER TABLE Borrow
DROP CONSTRAINT borrow_member_id_fkey;

-- Add member_id constraint with Delete CASCADE
ALTER TABLE Borrow
ADD CONSTRAINT borrow_member_id_fkey
FOREIGN KEY (Member_ID)
REFERENCES Member(Member_ID)
ON DELETE CASCADE;

-- Delete Emily Miller record
DELETE FROM Member WHERE name = 'Emily Miller';

-- 10. How do you add the following material to the database?

-- Insert into Material
INSERT INTO Material (Title, Publication_Date, Catalog_ID, Genre_ID)
VALUES
('New book', 
 '2020-08-01', 
 (SELECT catalog_id FROM Catalog WHERE name = 'E-Books'), 
 (SELECT genre_id FROM Genre WHERE name = 'Mystery & Thriller'));

-- Insert into Author
INSERT INTO Author (Name)
VALUES ('Lucas Pipi');

-- Insert into Authorship
INSERT INTO Authorship (Author_ID, Material_ID)
VALUES ((SELECT Author_ID FROM Author WHERE name = 'Lucas Pipi'),
        (SELECT Material_ID FROM Material WHERE title = 'New book'));

-- Check the updated Material table
SELECT * FROM Material

-- Check the updated Author table
SELECT * FROM Author

-- Check the updated Authorship table
SELECT * FROM Authorship

-- ==================================
-- EXTENDING THE DATABASE
-- ==================================

-- 1. Alert staff about overdue materials on a daily-basis?		
CREATE TABLE AlertStaff (
	Alert_ID serial PRIMARY KEY,
	Staff_ID int NOT NULL,
	Material_ID int NOT NULL,
	Member_ID int NOT NULL,
	Due_Date DATE NOT NULL,
	Alert_Date DATE NOT NULL DEFAULT CURRENT_DATE,
	FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
	FOREIGN KEY (Material_ID) REFERENCES Material(Material_ID),
	FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

CREATE FUNCTION overdue_materials() RETURNS TRIGGER AS 
BEGIN
  IF NEW.due_date < CURRENT_DATE AND NEW.return_date IS NULL THEN
    INSERT INTO AlertStaff (Staff_ID, Material_ID, Member_ID, Due_Date)
    VALUES (NEW.Staff_ID, NEW.Material_ID, NEW.Member_ID, NEW.Due_Date);
  END IF;
  RETURN NULL;
END;
	
CREATE TRIGGER alert_staff_trigger
AFTER INSERT ON Borrow
FOR EACH ROW
EXECUTE FUNCTION overdue_materials();

-- 2. Automatically deactivate the membership based on the member’s overdue occurrence (>= 
-- three times). And reactivate the membership once the member pays the overdue fee.
ALTER TABLE Member ADD COLUMN Overdue_Count int NOT NULL DEFAULT 0;

CREATE FUNCTION membership() RETURNS TRIGGER AS
BEGIN
    IF NEW.Overdue_Count >= 3 THEN
        UPDATE Member SET Membership_Status = 'Inactive' WHERE Member_ID = NEW.Member_ID;
	ELSE
        IF NEW.Membership_Status = 'Inactive' THEN
            UPDATE Member SET Membership_Status = 'Active' WHERE Member_ID = NEW.Member_ID;
        END IF;	
    END IF;
    RETURN NULL;
END;

CREATE TRIGGER membership_trigger
AFTER INSERT OR UPDATE OF Return_Date, Overdue_Count ON Borrow
FOR EACH ROW
EXECUTE FUNCTION membership();





/*
All = {1,2,3,4,5,6,7,8,9,10}
Even = {2,4,6,8,10}
Odd = {1,3,5,7,9}

Realice las siguientes operaciones:
Even U Odd = {1,2,3,4,5,6,7,8,9,10}
Even ∩ Odd = {}
All - Odd = {2,4,6,8,10}
C(Even) = {1,3,5,7,9}
C(Odd-All) = {1,2,3,4,5,6,7,8,9,10}
*/

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Rents;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Authors;

CREATE TABLE IF NOT EXISTS Authors (
    idAuthor   INTEGER PRIMARY KEY AUTOINCREMENT,
    authorName TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Books (
    idBook   INTEGER PRIMARY KEY AUTOINCREMENT,
    bookName TEXT NOT NULL,
    idAuthor INTEGER NULL,
    FOREIGN KEY (idAuthor) REFERENCES Authors(idAuthor)
        ON DELETE SET NULL
        ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS Customers (
    idCustomer   INTEGER PRIMARY KEY AUTOINCREMENT,
    customerName TEXT NOT NULL,
    email        TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Rents (
    idRent     INTEGER PRIMARY KEY AUTOINCREMENT,
    idBook     INTEGER NOT NULL,
    idCustomer INTEGER NOT NULL,
    rentState  TEXT NOT NULL,
    FOREIGN KEY (idBook) REFERENCES Books(idBook)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (idCustomer) REFERENCES Customers(idCustomer)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE INDEX IF NOT EXISTS idx_rents_book ON Rents(idBook);
CREATE INDEX IF NOT EXISTS idx_rents_customer ON Rents(idCustomer);

-- Inserts (con tus nombres)
INSERT INTO Authors (idAuthor, authorName) VALUES
(1, 'Miguel de Cervantes'),
(2, 'Dante Alighieri'),
(3, 'Takehiko Inoue'),
(4, 'Akira Toriyama'),
(5, 'Walt Disney');

INSERT INTO Books (idBook, bookName, idAuthor) VALUES
(1, 'Don Quijote', 1),
(2, 'La Divina Comedia', 2),
(3, 'Vagabond 1-3', 3),
(4, 'Dragon Ball 1', 4),
(5, 'The Book of the 5 Rings', NULL);

INSERT INTO Customers (idCustomer, customerName, email) VALUES
(1, 'John Doe', 'j.doe@email.com'),
(2, 'Jane Doe', 'jane@doe.com'),
(3, 'Luke Skywalker', 'darth.son@email.com');

INSERT INTO Rents (idRent, idBook, idCustomer, rentState) VALUES
(1, 1, 2, 'Returned'),
(2, 2, 2, 'Returned'),
(3, 1, 1, 'On time'),
(4, 3, 1, 'On time'),
(5, 2, 2, 'Overdue');


-- Queries

-- Ver imagenes agregadas con cada uno de los Queries
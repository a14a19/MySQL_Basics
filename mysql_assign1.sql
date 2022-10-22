create DATABASE mysql_assignment1;

use mysql_assignment1;

create table SalesPeople(
    Snum INT NOT NULL,
    Sname VARCHAR(255) NOT NULL,
    City VARCHAR(255),
    Comm INT,
    PRIMARY KEY (Snum),
    UNIQUE (Sname)
);

show tables;

INSERT INTO mysql_assignment1.salespeople(Snum, Sname, City, Comm)
values
    (1001, 'Peel', 'London', 12),
    (1002, 'Serres', 'Sanjose', 13),
    (1004, 'Motika', 'London', 11),
    (1007, 'Rifkin', 'Barcelona', 15),
    (1003, 'Axelrod', 'Newyork', 10);

select * FROM salespeople;

CREATE TABLE Customers(
    Cnum INT NOT NULL,
    Cname VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    Snum INT,
    PRIMARY KEY (Cnum),
    FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

show tables;

INSERT INTO mysql_assignment1.Customers(Cnum, Cname, City, Snum)
values
    (2001, 'Hoffman', 'London', 1001),
    (2002, 'Giovanni', 'Rome', 1003),
    (2003, 'Liu', 'Sanjose', 1002),
    (2004, 'Grass', 'Berlin', 1002),
    (2006, 'Clemens', 'London', 1001),
    (2008, 'Cisneros', 'Sanjose', 1007),
    (2007, 'Pereira', 'Rome', 1004);

SELECT * FROM Customers;

CREATE TABLE Orders(
    Onum INT NOT NULL,
    Amt INT NOT NULL,
    Odate DATE NOT NULL,
    Cnum INT NOT NULL,
    Snum INT NOT NULL,
    PRIMARY KEY (Onum),
    FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
    FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);

SHOW tables;

INSERT INTO mysql_assignment1.Orders(Onum, Amt, Odate, Cnum, Snum)
values
    (3001, 18.69, '1990-10-03', 2008, 1007),
    (3003, 767.19, '1990-10-03', 2001, 1001),
    (3002, 1900.10, '1990-10-03', 2007, 1004),
    (3005, 5160.45, '1990-10-03', 2003, 1002),
    (3006, 1098.16, '1990-10-03', 2008, 1007),
    (3009, 1713.23, '1990-10-04', 2002, 1003),
    (3007, 75.75, '1990-10-04', 2004, 1002),
    (3008, 4273.00, '1990-10-05', 2006, 1001),
    (3010, 1309.95, '1990-10-06', 2004, 1002),
    (3011, 9891.88, '1990-10-06', 2006, 1001);

select * from orders;

-- Q.1 Count the number of Salesperson whose name begin with ‘a’/’A’.

SELECT count(*), Sname AS Name_begin_A 
FROM mysql_assignment1.salespeople
WHERE Sname LIKE 'a%';

-- Q.2 Display all the Salesperson whose all orders worth is more than Rs. 2000.

SELECT Salespeople.Snum, Salespeople.Sname, Salespeople.City, salespeople.Comm
FROM salespeople LEFT JOIN Orders
ON salespeople.Snum = Orders.Snum
WHERE Amt > 2000;

-- Q.3 Count the number of Salesperson belonging to Newyork.

SELECT count(*), Sname, City AS From_NY
FROM mysql_assignment1.salespeople
WHERE City = 'Newyork';

-- Q.4 Display the number of Salespeople belonging to London and belonging to Paris.

SELECT count(*), salespeople.City FROM mysql_assignment1.salespeople
WHERE City = 'London' OR 'Paris'
GROUP BY salespeople.City;

-- OR to display the names of people from london and paris

SELECT * FROM mysql_assignment1.salespeople
WHERE City = 'London' OR 'Paris';

-- Q.5 Display the number of orders taken by each Salesperson and their date of orders.

SELECT salespeople.Sname, orders.Odate
FROM mysql_assignment1.salespeople LEFT JOIN mysql_assignment1.orders
ON salespeople.Snum = orders.Snum; 
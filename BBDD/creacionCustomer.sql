CREATE TABLE customer (
    CustomerID	INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ContactName	VARCHAR(50),
    Address	VARCHAR(50),
    City VARCHAR(50),
    PostalCode INT,
    Country VARCHAR(50)
);

insert into customer (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
values (5, 'Berglunds snabbkop', 'Christina Berglund', 'Berguvsvägen 8', 'Lulea', 95822, 'Sweden')
values (4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq', 'London', 11234, 'UK')
values (3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'México DF', 5023, 'Mexico')
values (2, 'Ana Trujillo Emparedados y helac.', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México DF', 5021, 'Mexico')
values (1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', 12.209, 'Germany')
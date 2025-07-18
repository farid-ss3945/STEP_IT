create database Estore;

use Estore;

create table Categories(
    [Id] int not null primary key identity (1,1),
    [Name] nvarchar(50) not null CHECK (name <> '')
)

create table Products
(
    [Id] int not null primary key identity (1,1),
    [Name] nvarchar(50) not null CHECK (name <> ''),
    [Price] money not null CHECK ([Price]>0),
    [Category] int foreign key references Categories(Id)
)

create table Orders(
    [Id] int not null primary key identity (1,1),
    [ProductID] int foreign key references Products(Id),
    [CategoryID] int foreign key references Categories(Id),
    [OrderDate] date not null
)

INSERT INTO Categories (Name)
VALUES
('Smartphones'),
('Laptops'),
('Tablets'),
('Accessories'),
('Wearables'),
('Audio'),
('Gaming'),
('Cameras'),
('TV & Video'),
('Home Appliances');

INSERT INTO Products (Name, Price, Category)
VALUES
('iPhone 14', 799.99, 1),
('Samsung Galaxy S23', 699.99, 1),
('MacBook Pro 16"', 2499.00, 2),
('Dell XPS 13', 1199.00, 2),
('iPad Air', 599.00, 3),
('Wireless Charger', 29.99, 4),
('Apple Watch Series 9', 399.00, 5),
('Sony WH-1000XM5 Headphones', 349.99, 6),
('PlayStation 5 Console', 499.99, 7),
('Canon EOS R6 Camera', 2499.00, 8);


INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (1, 1, '2025-07-01');
INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (2, 1, '2025-07-02');
INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (3, 2, '2025-07-03');
INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (4, 2, '2025-07-04');
INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (5, 3, '2025-07-05');
INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (6, 4, '2025-07-06');
INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (7, 5, '2025-07-07');
INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (8, 6, '2025-07-08');
INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (9, 7, '2025-07-09');
INSERT INTO Orders (ProductID, CategoryID, OrderDate) VALUES (10, 8, '2025-07-10');





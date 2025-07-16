create database Academy;

use Academy;

create table Groups(
    [Id] int not null primary key identity(1, 1),
    [Name] nvarchar(10) not null CHECK (name <> '') unique,
    [Rating] int not null CHECK([Rating]>=0 and [Rating]<=5),
    [Year] int not null CHECK([Year]>=1 and [Year]<5)
);

create table Departments(
    [Id] int not null primary key identity(1, 1),
    [Name] nvarchar(100) not null CHECK (name <> '') unique,
    [Rating] int not null CHECK([Rating]>=0) default(0),
    [Financing] money not null CHECK([Financing]>=0) default(0)
)

create table Faculties(
    [Id] int not null primary key identity(1, 1),
    [Name] nvarchar(100) not null CHECK (name <> '') unique
)

create table Teachers(
    [Id] int not null primary key identity(1, 1),
    [EmploymentDate] date not null CHECK(Year([EmploymentDate])>=1990),
    [Name] nvarchar(max) not null CHECK (name <> ''),
    [Premium] money not null CHECK([Premium]>=0) default(0),
    [Salary] money not null CHECK([Salary]>0),
    [Surname] nvarchar(max) not null CHECK (name <> '')
)

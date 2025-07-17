create database Academy;

use Academy;

create table Groups(
    [Id] int not null primary key identity(1, 1),
    [Name] nvarchar(10) not null CHECK (name <> '') unique,
    [Rating] int not null check([Rating]>=0 and [Rating]<=5),
    [Year] int not null check([Year]>=1 and [Year]<=5)
);

create table Departments(
    [Id] int not null primary key identity(1, 1),
    [Name] nvarchar(100) not null CHECK (name <> '') unique,
    [Rating] int not null check([Rating]>=0) default(0),
    [Financing] money not null check([Financing]>=0) default(0)
)

create table Faculties(
    [Id] int not null primary key identity(1, 1),
    [Name] nvarchar(100) not null CHECK (Name <> '') unique,
    [Dean] nvarchar(max) not null CHECK (Dean <> '')
)

create table Teachers(
    [Id] int not null primary key identity(1, 1),
    [EmploymentDate] date not null CHECK(Year([EmploymentDate])>=1990),
    [Name] nvarchar(max) not null CHECK (name <> ''),
    [Premium] money not null CHECK([Premium]>0) default(0),
    [Salary] money not null CHECK([Salary]>0),
    [Surname] nvarchar(max) not null CHECK (Surname <> ''),
    [Position] nvarchar(max) not null CHECK (Position <> ''),
    [isProfessor] bit not null default(0),
    [isAssistant] bit not null default(0)
)


INSERT INTO Faculties ([Name], [Dean])
VALUES
('Faculty of Computer Science', 'Dr. Ivan Petrov'),
('Faculty of Mathematics', 'Prof. Olga Sidorova'),
('Faculty of Physics', 'Dr. Sergey Kuznetsov'),
('Faculty of Chemistry', 'Prof. Elena Smirnova'),
('Faculty of Biology', 'Dr. Andrey Ivanov'),
('Faculty of History', 'Prof. Natalia Volkova'),
('Faculty of Economics', 'Dr. Dmitry Fedorov'),
('Faculty of Philology', 'Prof. Maria Petrova'),
('Faculty of Law', 'Dr. Anton Lebedev'),
('Faculty of Engineering', 'Prof. Viktoria Orlova');

INSERT INTO Teachers ([EmploymentDate], [Name], [Premium], [Salary], [Surname], [Position], [isProfessor], [isAssistant])
VALUES
('2000-09-01', 'Anna', 300, 2000, 'Ivanova', 'Lecturer', 0, 1),
('1995-08-20', 'Boris', 500, 800, 'Petrov', 'Professor', 1, 0),
('2003-01-15', 'Vera', 400, 2000, 'Sidorova', 'Assistant', 0, 1),
('2010-03-10', 'Dmitry', 350, 2600, 'Kuznetsov', 'Lecturer', 0, 1),
('1999-12-01', 'Elena', 600, 1000, 'Smirnova', 'Professor', 1, 0),
('2005-04-25', 'Igor', 200, 2200, 'Popov', 'Lecturer', 0, 1),
('2012-07-30', 'Maria', 450, 2800, 'Sokolova', 'Assistant', 0, 1),
('2001-11-05', 'Oleg', 700, 1200, 'Fedorov', 'Professor', 1, 0),
('1998-06-12', 'Nina', 300, 1400, 'Voronina', 'Lecturer', 0, 1),
('2015-09-18', 'Sergey', 150, 500, 'Lebedev', 'Assistant', 0, 1);

INSERT INTO Groups ([Name], [Rating], [Year]) VALUES
('GRP101', 4, 1),
('GRP102', 3, 2),
('GRP103', 5, 3),
('GRP104', 2, 1),
('GRP105', 4, 4),
('GRP106', 1, 2),
('GRP107', 0, 3),
('GRP108', 3, 5),
('GRP109', 2, 5),
('GRP110', 5, 2);

INSERT INTO Departments ([Name], [Rating], [Financing]) VALUES
('Human Resources', 5, 10000.00),
('Finance', 8, 2000.00),
('Marketing', 7, 15000.00),
('IT', 9, 30000.00),
('Operations', 6, 12000.00),
('Sales', 7, 18000.00),
('Research & Development', 10, 40000.00),
('Customer Service', 4, 9000.00),
('Software Development', 3, 80000.00),
('Administration', 5, 11000.00);

SELECT [Financing], [Rating], [Name], [Id]
FROM Departments;

SELECT Groups.Name, Groups.Rating
FROM Groups;

SELECT [Surname],([Salary]/[Premium])*100 as StoP,([Salary]/([Salary]+[Premium]))*100 StoSP from Teachers

SELECT 'The dean of faculty ' + [Name] + ' is ' + [Dean] + '.' as Announcement from Faculties

SELECT [Surname] from Teachers
WHERE isProfessor=1 AND Salary>1050

SELECT [Name] from Departments
WHERE Financing<11000 OR Financing>25000

SELECT * FROM Faculties
WHERE Name<>'Faculty of Computer Science'

SELECT [Surname],[Position] from Teachers
WHERE isProfessor=0

SELECT [Surname],[Position],[Salary],[Premium] from Teachers
WHERE isAssistant=1 AND Premium>=160 AND Premium<=550

SELECT [Surname],[Salary] from Teachers
WHERE isAssistant=1

SELECT [Surname],[Position] from Teachers
WHERE YEAR(EmploymentDate)<2000

SELECT [Name] as 'Name of Department' from Departments
WHERE [Name]<'Software Development'

SELECT [Surname] from Teachers
WHERE isAssistant=1 AND Salary+Premium<=1200

SELECT [Name] from Groups
WHERE Rating>=2 AND Rating<=4 AND Year=5

SELECT [Surname] FROM Teachers
WHERE isAssistant=1 AND Salary<550 Or Premium<200

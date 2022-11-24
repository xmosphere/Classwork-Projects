/*
  Create and Load Sample Database
*/
USE [master]
GO

IF DB_ID('CIS435LProject ') IS NOT NULL
ALTER DATABASE CIS435LProject 
SET SINGLE_USER 
WITH ROLLBACK IMMEDIATE
GO

IF DB_ID('CIS435LProject') IS NOT NULL
DROP DATABASE [CIS435LProject]
GO


CREATE DATABASE [CIS435LProject]
GO

USE [CIS435LProject]
GO

-- create schemas
CREATE SCHEMA WBank;
go


-- create tables
CREATE TABLE WBank.Locations (
	LocationID INT IDENTITY (1, 1) PRIMARY KEY,
	LocationCode nvarchar (15) NOT NULL UNIQUE,
	Address nvarchar (60) NOT NULL,
	City nvarchar (30) NOT NULL,
	State nvarchar (50) NOT NULL
);

CREATE TABLE WBank.AccountType (
	AccountTypeID INT IDENTITY (1, 1) PRIMARY KEY,
	AccountType NCHAR (2) NOT NULL
);

CREATE TABLE WBank.Employees (
	EmployeeID INT IDENTITY (1, 1) PRIMARY KEY,
	EmployeeNumber NVARCHAR (15) NOT NULL UNIQUE,
	FirstName nvarchar (50) NOT NULL,
	LastName nvarchar (50) NOT NULL,
	Title nvarchar (8),
	CanCreateNewAccount BIT NOT NULL,
	HourlySalary DECIMAL (9, 2) NOT NULL,
	Address varchar (250) NOT NULL,
	City nvarchar (30) NOT NULL,
	State nvarchar (50) NOT NULL,
	ZipCode nvarchar (15) NOT NULL,
	EmailAddress varchar (255) NOT NULL
);

CREATE TABLE WBank.Customers (
	CustomerID INT IDENTITY (1, 1) PRIMARY KEY,
	DateCreated Datetime NOT NULL,
	AccountNumber VARCHAR (10) NOT NULL UNIQUE,
	AccountTypeID INT NOT NULL,
	Fname nvarchar (50) NOT NULL,
	Lname nvarchar(50) NOT NULL,
	Gender Char (1),
	Address VARCHAR (250) NOT NULL,
	City nvarchar(50) NOT NULL,
	State nvarchar (50) NOT NULL,
	PhoneNumber nvarchar (15) NOT NULL,
	EmailAddress varchar (255) NOT NULL
);

CREATE TABLE WBank.Deposits (
	DepositID INT IDENTITY (1, 1) PRIMARY KEY,
	LocationID INT NOT NULL,
	EmployeeID INT NOT NULL,
	CustomerID INT NOT NULL,
	DepositDate Datetime NOT NULL,
	DepositAmount Decimal(9, 2) NOT NULL
);

CREATE TABLE WBank.Withdrawals (
	WithdrawalID INT IDENTITY (1, 1) PRIMARY KEY,
	LocationID INT NOT NULL,
	EmployeeID INT NOT NULL,
	CustomerID INT NOT NULL,
	WithdrawalDate Datetime NOT NULL,
	WithdrawalAmount DECIMAL(9, 2) NOT NULL,
	WithdrawalSuccessful BIT NOT NULL
);

CREATE TABLE WBank.CheckCashing (
	CheckCashingID INT IDENTITY (1, 1) PRIMARY KEY,
	LocationID INT NOT NULL,
	EmployeeID INT NOT NULL,
	CustomerID INT NOT NULL,
	CheckCashingDate Datetime NOT NULL,
	CheckCashingAmount DECIMAL(9, 2) NOT NULL
);

SET IDENTITY_INSERT WBank.Employees OFF;  

INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-1', 'John', 'Doe', 'Jr.', 1, 15.25, '1 Big Street', 'Richmond', 'Virginia', '12345', 'email@website.com' )
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-2', 'Thalia', 'Romero', 1, 16.75, '4520 Maryland Avenue', 'Pinellas', 'Florida', '34624', 'ThaliaWRomero@jourrapide.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-3', 'David', 'Copeland', 'Sr.', 0, 18.45, '2719 Brownton Road', 'Jackson', 'Mississippi', '39201', 'DavidBCopeland@dayrep.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-4','Mildred', 'Wilson', 0, 7.25, '2008 Code Ridge Road', 'Clinton', 'Oklahoma', '73601', 'MildredRWilson@dayrep.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-5', 'Billy', 'Camp', '3rd. ', 1, 9.25, '1144 Jones Street', 'Granbury', 'Texas', '76048',  'BillyCamp@gmail.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-6', 'David', 'Camp', 'Jr.. ', 1, 9.25, '4686 Bagwell Avenue', 'Norcross', 'Georga', '30071',  'DavidCamp@gmail.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-7', 'George', 'Jones', '4th. ', 1, 19.25, '589 Chandler Hollow Road', 'Homestead', 'Pennsylvania', '15120',  'GeorgeJones@gmail.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-8', 'Rachel', 'Bryden', 'Sr.', 1, 25.25, '320 Woodlawn Drive', 'Milwaukee', 'Wisconsin', '53202',  'RachelBryden@gmail.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-9', 'Bob', 'Ruiz', 'Sr. ', 1, 29.25, '3918 Lake Floyd Circle', 'Silver Spring', 'Maryland', '20906',  'BobRuiz@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-10', 'Bill', 'Blackman', 'Sr. ', 1, 39.25, '3304 Clinon Street', 'Little Rock', 'Arizona', '72211',  'BillBlackman@hotmail.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-11', 'Robin', 'Triplett', 'Sr. ', 1, 45.25, '466 Waipahu Avenue', 'Honolulu', 'Hawaii', '35071',  'RobinTriplett@hotmail.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-12', 'Lara', 'Smith', 'Sr. ', 1, 7.25, '1136 North Avenue', 'Raymond', 'Nebraska', '688428',  'LaraSmith@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-13', 'Summer', 'Dye', 'Sr. ', 1, 9.25, '2956 Patton Lane', 'Raleigh', 'North Carolina', '27603',  'SummerDye@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-14', 'Saul', 'Donald', 'Sr. ', 1, 12.25, '2075 Walt Nuzum Farm Road', 'Batavia', 'New York', '14020',  'SaulDonald@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-15', 'Navi', 'Wright', 'Sr. ', 1, 19.25, '3802 Goodwin Avenue', 'Spokane', 'Washington', '99201',  'NaviWright@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-16', 'Gail', 'Amundson', 'Sr. ', 1, 15.25, '829 Petunia Way', 'Birmingham', 'Alabama', '35222',  'GailAmundson@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-17', 'Dwight', 'Wilson', 'Sr. ', 1, 20.25, '3195 Goldcliff Circle', 'Washington', 'DC', '20011',  'DwightWilson@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-18', 'Ricky', 'Winget', 'Sr. ', 1, 27.25, '413 Rivendell Drive', 'Akron', 'Ohio', '44307',  'RickyWinget@hotmail.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-19', 'Julian', 'Payne', 'Sr. ', 1, 9.25, '102 Poe Road', 'Florence', 'South Carolina', '29501',  'JulianPayne@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-20', 'Jim', 'Ingram', 'Sr. ', 1, 59.25, '1412 Richards Avenue', 'Stockton', 'California', '95207',  'JimIngram@hotmail.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-21', 'Paul', 'Clark', 'Sr. ', 1, 15.25, '3312 Hiney Road', 'Las Vegas', 'Nevada', '89119',  'PaulClark@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-22', 'Paula', 'Roberts', 'Sr. ', 1, 19.25, '3570 Raintree Boulevard', 'River Rapids', 'Minnesota', '55448', 'PaulaRoberts@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-23', 'Gregor', 'Cunningham', 'Sr. ', 1, 78.25, '3177 Hornor Avenue', 'Tulsa', 'Oklahoma', '74119',  'GregorCunningham@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-24', 'Eli', 'Landrum', 'Sr. ', 1, 34.25, '3839 Blane Street', 'Saint Louis', 'Missouri', '63146',  'EliLandrum@yahoo.com')
INSERT INTO WBank.Employees(EmployeeNumber, FirstName, LastName, Title, CanCreateNewAccount, HourlySalary, Address, City, State, ZipCode,
	EmailAddress) VALUES ('E-25', 'Ari', 'Magruder', 'Sr. ', 1, 39.25, '271 Gladwell Street', 'Collierville', 'Tennessee', '38017',  'AriMagruder@yahoo.com')


SET IDENTITY_INSERT WBank.Customers OFF;

INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-1', 1, 'Alexander', 'Diaz', 'M', '3968 Shearwood Forrest Drive', 'Rochester', 'New Hampshire', '(603) 332-0137', 'AlexanderEDiaz@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-2', 2, 'Michael', 'Parsons', 'M', '3729 Sun Valley Road', 'Spokane', 'Washington', '(509) 753-0501', 'MichaelSParson@yahoo.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-3', 3, 'Tamika', 'Brown', 'F', '4676 Lang Avenue', 'Cedar City', 'Utah', '(435) 865-0013', 'TamikaBrown@hotmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-4', 1, 'Stewart', 'Patel', 'M', '437 Ripple Street', 'Bridgeport', 'Michigan', '(818) 574-5795', 'StewardPatel@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-5', 2, 'John', 'Deere', 'M', '4284 Irish Lane', 'Roanoke ', 'Virginia', '(609) 964-9953', 'JohnDeere@yahoo.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-6', 3, 'Bliiy', 'Greene', 'M', '3564 John Avenue', 'Seatle', 'Michigan', '(517) 899-4516', 'BillyGreene@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-7', 1, 'Sam', 'Summers', 'M', '4675 Clair Street', 'Bedford', 'New Hampshire', '(254) 618-7457', 'SamSummers@hotmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-8', 2, 'Noah', 'Brown', 'M', '1498 West Street', 'Richmond', 'Virginia', '(616) 791-4281', 'NoahBrown@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-9', 3, 'Lara', 'Smith', 'F', '2042 Marcus Street', 'Seatle', 'Washington', '(256) 564-7281', 'LaraSmith@aol.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-10', 1, 'Julie', 'Hernadez', 'F', '1122 Eagle Lane', 'Washington', 'DC', '(218) 747-4880', 'JulieHernadez@aol.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-11', 2, 'Gail', 'Davis', 'F', '1160 Southside Lane', 'Seatle', 'Washington', '(323) 692-8571', 'GailDavis@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-12', 3, 'Jane', 'Gregory', 'F', '832 Mill Street', 'Salt Lake City', 'Utah', '(864) 208-3629', 'JaneGregory@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-13', 1, 'Abby', 'Patterson', 'F', '3989 Smith Road', 'Roanoke', 'Virginia', '(770) 984-7554', 'AbbyPatterson@yahoo.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-14', 2, 'Mary', 'Jones', 'F', '4094 Haul Road', 'Bedford', 'New Hampshire', '(651) 226-0956', 'MaryJones@aol.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-15', 3, 'William', 'Anderson', 'M', '3946 Pearcy Avenue', 'Detroit', 'Michigan', '(262) 250-6743', 'WilliamAnderson@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-16', 1, 'Juanita', 'Haney', 'F', '68 Columbia Boulevard', 'Seatle', 'Washington', '(410) 424-8657', 'JuanitaHaney@protonmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-17', 2, 'Richard', 'Steck', 'M', '844 North Avenue', 'Gresham', 'Nebraska', '(402) 735-3004', 'RichardSteck@aol.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-18', 3, 'Ruth', 'Singh', 'F', '3042 Pooz Street', 'Roanoke', 'Virginia', '(732) 263-5507', 'RuthSingh@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-19', 1, 'Johny', 'Potts', 'M', '4389 O Conner Street', 'Flint', 'Michigan', '(228) 880-7879', 'JohnnyPotts@yahoo.co')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-20', 2, 'Kathleen', 'Gonzalez', 'F', '182 Owagner Lane', 'Washington', 'DC', '(206) 258-6945', 'KathleenGonzalez@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-21', 3, 'Lucile', 'Eiland', 'F', '2427 Nash Street', 'Richmond', 'Virginia', '(312) 949-2325', 'LucileEiland@hotmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-22', 1, 'Caroline', 'Mingo', 'F', '4876 Quilly Lane', 'Upper Arlington', 'Ohio', '(614) 485-1025', 'CarolineMingo@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-23', 2, 'Kandice', 'Walker', 'F', '53 Graystone Lake', 'Flint', 'Michigan', '(478) 387-9030', 'KandiceWalker@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-24', 3, 'Helen', 'Smith', 'F', '2980 Frank Avenue', 'Richmond', 'Virginia', '(412) 964-0129', 'HellenSmith@gmail.com')
INSERT INTO WBank.Customers(DateCreated, AccountNumber, AccountTypeID, Fname, Lname, Gender, Address, City, State, PhoneNumber, EmailAddress)
	VALUES((DATEADD(DAY, -(ABS(CHECKSUM(NEWID()) % 36500 )), getdate())), 'C-25', 1, 'Marylou', 'Henderson', 'F', '750 Timber Ridge Road', 'Salt Lake City', 'Utah', '(916) 807-4763', 'MarylouHenderson@yahoo.com')

SET IDENTITY_INSERT WBank.AccountType ON;

INSERT INTO WBank.AccountType(AccountTypeID, AccountType)
VALUES(1, 'S')
INSERT INTO WBank.AccountType(AccountTypeID, AccountType)
VALUES(2, 'C')
INSERT INTO WBank.AccountType(AccountTypeID, AccountType)
VALUES(3, 'I')

SET IDENTITY_INSERT WBank.Locations OFF;

INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-1', '750 Timber Ridge Road', 'Sacramento', 'California')
INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-2', '12 Hull Street', 'Richmond', 'Virginia')
INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-3', '75 Monument Road', 'Washington', 'DC')
INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-4', '245 Rain Street', 'Seatle', 'Washington')
INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-5', '7 Sunset Ridge', 'El Paso', 'Texas')
INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-6', '34 Central Drive', 'Las Vegas', 'Nevada')
INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-7', '4976 Bubby Drive', 'Austin', 'Texas')
INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-8', '2737 Lynch Street', 'San Francisco', 'California')
INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-9', '3095 Rowes Lane', 'Paducah', 'Kentucky')
INSERT INTO WBank.Locations(LocationCode, Address, City, State)
VALUES('L-10', '3741 Summit Park Avenue', 'Troy', 'Michigan')

SET IDENTITY_INSERT WBank.Deposits OFF;


INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(1, 2, 3, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(2, 1, 4, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(3, 1, 4, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(4, 4, 6, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(4, 7, 8, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(5, 4, 6, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(6, 3, 5, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(7, 8, 4, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(7, 23, 14, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(8, 8, 17, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(9, 2, 17, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(10, 23, 1, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(1, 1, 21, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(2, 4, 22, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.Deposits(LocationID, EmployeeID, CustomerID, DepositDate, DepositAmount)
VALUES(3, 5, 15, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))

SET IDENTITY_INSERT WBank.Withdrawals OFF;

INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(1, 23, 25, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(2, 4, 5, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 0)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(3, 17, 19, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(4, 15, 5, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(5, 13, 13, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 0)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(6, 1, 1, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(1, 25, 25, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(10, 20, 10, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(9, 18, 18, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 0)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(2, 7, 17, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(4, 5, 13, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 0)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(8, 4, 7, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(5, 12, 13, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(8, 13, 1, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)
INSERT INTO WBank.Withdrawals(LocationID, EmployeeID, CustomerID, WithdrawalDate, WithdrawalAmount, WithdrawalSuccessful)
VALUES(7, 11, 21, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100), 1)


SET IDENTITY_INSERT WBank.CheckCashing OFF;

INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(1, 4, 5, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(2, 7, 13, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(3, 8, 15, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(4, 7, 19, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(5, 4, 21, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(6, 7, 16, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(7, 13, 23, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(1, 18, 8, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(10, 10, 10, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(9, 9, 19, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(8, 13, 5, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(9, 16, 24, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(6, 3, 11, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(4, 14, 14, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))
INSERT INTO WBank.CheckCashing(LocationID, EmployeeID, CustomerID, CheckCashingDate, CheckCashingAmount)
VALUES(8, 17, 4, (DATEDIFF(day, ROUND(RAND()*10, 0), GETDATE())), (RAND() *100))


/*

--Add FK Constraints

ALTER TABLE production.products
  ADD  
   FOREIGN KEY (category_id) REFERENCES production.categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY (brand_id) REFERENCES production.brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE sales.staffs 
	ADD FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	   FOREIGN KEY (manager_id) REFERENCES sales.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION

ALTER TABLE sales.orders 
  ADD
	FOREIGN KEY (customer_id) REFERENCES sales.customers (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES sales.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION


ALTER TABLE sales.order_items 
ADD 
	FOREIGN KEY (order_id) REFERENCES sales.orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE production.stocks 
ADD
	FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE


*/

ALTER TABLE WBank.Customers
	ADD
		FOREIGN KEY (AccountTypeID) REFERENCES WBank.AccountType(AccountTypeID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE WBank.Deposits
	ADD
		FOREIGN KEY (LocationID) REFERENCES WBank.Locations(LocationID) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (EmployeeID) REFERENCES WBank.Employees(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (CustomerID) REFERENCES WBank.Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE WBank.Withdrawals
	ADD
		FOREIGN KEY (LocationID) REFERENCES WBank.Locations(LocationID) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (EmployeeID) REFERENCES WBank.Employees(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (CustomerID) REFERENCES WBank.Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE WBank.CheckCashing
	ADD
		FOREIGN KEY (LocationID) REFERENCES WBank.Locations(LocationID) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (EmployeeID) REFERENCES WBank.Employees(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (CustomerID) REFERENCES WBank.Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE

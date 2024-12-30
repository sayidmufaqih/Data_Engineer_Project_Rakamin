CREATE TABLE DimBranch (
	BranchId INT PRIMARY KEY,
	BranchName VARCHAR (50) NOT NULL,
	BranchLocation VARCHAR (50) NOT NULL
)

CREATE TABLE DimCustomer(
	CustomerId INT PRIMARY KEY,
	CustomerName VARCHAR(50) NOT NULL,
	Address VARCHAR(MAX) NOT NULL,
	CityName VARCHAR(50) NOT NULL,
	StateName VARCHAR (50) NOT NULL,
	Age VARCHAR(3) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	Email VARCHAR(50) NOT NULL
)

CREATE TABLE DimAccount(
	AccountId INT PRIMARY KEY,
	CustomerId INT NOT NULL FOREIGN KEY REFERENCES DimCustomer(CustomerId),
	AccountType VARCHAR (10) NOT NULL,
	Balance INT NOT NULL,
	DateOpened DATETIME2 (0) NOT NULL,
	Status VARCHAR(10) NOT NULL
)

CREATE TABLE FactTransaction(
	TransactionId INT PRIMARY KEY,
	AccountId INT NOT NULL FOREIGN KEY REFERENCES DimAccount(AccountId),
	TransactionDate DATETIME2(0) NOT NULL,
	Amount INT NOT NULL,
	TransactionType VARCHAR (50) NOT NULL,
	BranchId INT NOT NULL FOREIGN KEY REFERENCES DimBranch(BranchId)
)

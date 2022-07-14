CREATE TABLE Dim_Customer(
CustomerID varchar(50) PRIMARY KEY,
CustomerDesc varchar(50),
)

CREATE TABLE Dim_Machine(
MachineID varchar(25) PRIMARY KEY,
MachineDesc varchar(50),
DepartmentName varchar(25)
)

CREATE TABLE Dim_Employee(
EmployeeID VARCHAR(25) PRIMARY KEY,
EmployeeName VARCHAR(100) NOT NULL,
EmployeeEmail VARCHAR(50),
EmployeeTitle VARCHAR(50) 
)

CREATE TABLE Dim_Job(
JobNum VARCHAR(10) PRIMARY KEY,
JobCreDate Date,
-- unfinished
)
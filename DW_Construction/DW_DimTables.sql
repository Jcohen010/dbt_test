CREATE TABLE Dim_Customer(
CustomerID varchar(50) PRIMARY KEY,
CustomerDesc varchar(50),
)

CREATE TABLE Dim_Machine(
MachineID varchar(25) PRIMARY KEY,
MachineDesc varchar(50),
DepartmentID varchar(25) FOREIGN KEY REFERENCES Dim_Department.DepartmentID
)

CREATE TABLE Dim_Employee(
EmployeeID VARCHAR(25) PRIMARY KEY,
EmployeeName VARCHAR(100) NOT NULL,
EmployeeEmail VARCHAR(50),
EmployeeTitle VARCHAR(50) 
)


CREATE TABLE Dim_Shift(
ShiftID VARCHAR(25) PRIMARY KEY NOT NULL,
ShiftName VARCHAR(50)
)

CREATE TABLE Dim_Defect(
DefectID VARCHAR(25) PRIMARY KEY NOT NULL,
DefectDesc VARCHAR(50),
DepartmentID VARCHAR(50) FOREIGN KEY REFERENCES Dim_Department.DepartmentID
)

CREATE TABLE Dim_Department(
DepartmentID VARCHAR(50) PRIMARY KEY NOT NULL,
DepartmentDesc VARCHAR(50)
)


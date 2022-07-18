CREATE TABLE Fact_Run_Event(
ID int NOT NULL IDENTITY (1,1) PRIMARY KEY,
RunEventDate DATE, 
RunEventTime TIME, 
RunEventShift VARCHAR(10), 
JobID VARCHAR(20), 
ItemID VARCHAR(10),
JobItemID VARCHAR(15),
CustomerID Varchar(30), 
MachineID VARCHAR(30), 
EmployeeID VARCHAR(30), 
Quantity int, 
RunEventHours int,
DowntimeType VARCHAR(30), 
RunEventValue int
)

CREATE TABLE Fact_FinGood(
JobID VARCHAR(10),
ItemID Varchar(20),
CustomerID VARCHAR(25),
ProdOrdQty Int,
FinGoodQty Int, 
QtyUp Int,
-- unfinished
)

CREATE TABLE Fact_JobItem_Details(
JobID VARCHAR(10),
ItemID Varchar(20),
CustomerID VARCHAR(25),

)

CREATE TABLE Fact_Defect_Event(
JobID VARCHAR(25),
ItemID VARCHAR(25),
JobItemID VARCHAR(25),
DateFound DATE,
InspectShift VARCHAR(25), 
InspectGluer VARCHAR(25), 
DefectCode VARCHAR(25),
DefectDesc VARCHAR(25),
CaseQty Int, 
DefectiveSamples Int,
TotalSamples Int, 
OriginMachineID VARCHAR(25), 
Quantity INT
)
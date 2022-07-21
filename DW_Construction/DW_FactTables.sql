CREATE TABLE dbo.Fact_Run_Event(
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
);

CREATE TABLE dbo.Fact_JobItem_Details(
JobItemID VARCHAR(10),
JobID VARCHAR(10),
ItemID Varchar(20),
CustomerID VARCHAR(25),
ProdOrdQty Int,
FinGoodQty Int,
DefectiveQty Int, 
QtyUp Int
);

CREATE TABLE dbo.Fact_Defect_Event(
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
);

CREATE TABLE dbo.Fact_NonConformingMaterial(
NCRkey VARCHAR(25),
JobID VARCHAR(25),
CustomerID VARCHAR(25),
DateID DATE,
ReportedBy VARCHAR(25),
LocationofFinding VARCHAR(25),
OriginMachineID VARCHAR(25),
SuspectedQty INT,
UnitType VARCHAR(25),
DefectID VARCHAR(25),
Disposition VARCHAR(25),
)
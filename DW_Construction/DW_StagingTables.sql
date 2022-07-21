-- staging run event
CREATE TABLE dbo.Stage_Run_Event(
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

-- staging defective cases
CREATE TABLE dbo.Stage_Defect_Event(
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
);

-- staging jobcustomer
CREATE TABLE dbo.Stage_JobCustomer(
JobID VARCHAR(10),
CustomerID VARCHAR(25)
)

-- staging finishedgoods
CREATE TABLE dbo.Stage_FinGoods(
JobID VARCHAR(10),
ItemID VARCHAR(15),
CustomerID VARCHAR(30),
FinishedGoods INT,
FGCreDate Date
)

-- staging component (Binds JobID and ItemID through "unique component of job") Used to supply production order qty staging table with CPC)
CREATE TABLE dbo.Stage_Component(
JobID VARCHAR(10),
ComponentID VARCHAR(10),
ItemID VARCHAR(25)
)

-- staging production order qty (Provides OrderQty for all Items of a Job)
CREATE TABLE dbo.Stage_ProductionOrderQty(
JobID VARCHAR(10),
ComponentID VARCHAR(10),
ProdOrderQty Int
)


-- staging invoice
CREATE TABLE dbo.Staging_Invoice(
InvoiceID VARCHAR(25),
CustomerID VARCHAR(20),
InvoiceCreDate Date
)

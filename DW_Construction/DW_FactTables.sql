CREATE TABLE Fact_Run_Event(
ID int NOT NULL IDENTITY (1,1) PRIMARY KEY,

)

CREATE TABLE Fact_FinGood(
JobID VARCHAR(10),
ItemID Varchar(20),
CustomerID VARCHAR(25),
ProdOrdQty Int,
FinGoodQty Int,

-- unfinished
)

CREATE TABLE Fact_JobItem(
JobID VARCHAR(10),
ItemID Varchar(20),
CustomerID VARCHAR(25),

)
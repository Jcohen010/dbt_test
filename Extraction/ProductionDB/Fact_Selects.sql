DECLARE @Today DATE = GETDATE();
DECLARE @LowerBound DATE = DATEADD(day, -7, @Today);
DECLARE @UpperBound DATE = DATEADD(day, -1, @Today);

-- Fact_Run_Event
SELECT CostTransCreDate AS RunEventDate, CostTransCreTime AS RunEventTime, kShiftName AS RunEventShift, KJobCode AS JobNum, kAccCode AS CustomerID, QtyUp, kWorkcCode AS MachineID, CostTransCreUser AS EmployeeID, CostTransWCQty AS Quantity, CostTransHours AS RunEventHours, CostTransDownType AS DowntimeType, CostTransBaseVal AS RunEventValue
FROM CostTrans
WHERE RunEventDate BETWEEN @UpperBound AND @LowerBound;
-- Left Join to Fact_Job Customer and QtyUp

-- Staging_Job
WITH Customer AS (
SELECT kJobCode, kAccCode
FROM EstICust
-- WHERE CLAUSE FOR QUICK INDEXING/ CORRECT DATE RANGE
),
JobQuantity AS (
SELECT kJobCode, EstICompQtyOrdQty, kJobStatus
FROM CustICompQty
-- WHERE EstICmpType = "PRI" 
-- FOR QUICK INDEXING / CORRECT DATE RANGE (USE RECLOCKEDDATE)
)

SELECT JobIHead.KJobCode AS JobNum, JobIHead.JobIHeadCreDate AS JobCreDate, JobIHead.kJobStatus AS JobStatus, Customer.kAccCode As Customer 
FROM JobIHead 
INNER JOIN Customer ON Customer.kJobCode = kJobCode
INNER JOIN JobQuantity ON JobQuantity.kJobCode = kJobCode
WHERE kcoNum = "1" AND kJobCode <> NULL AND kJobStatus <> NULL AND JobIHeadCreDate > "03/11/2022" AND kEstIVersion = "1" 



-- Fact_Defective_Case



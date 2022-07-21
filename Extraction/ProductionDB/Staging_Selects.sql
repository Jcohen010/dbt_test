DECLARE @Today DATE = GETDATE();
DECLARE @LowerBound DATE = DATEADD(day, -7, @Today);
DECLARE @UpperBound DATE = DATEADD(day, -1, @Today);

-- Staging_Run_Event
SELECT CostTransCreDate AS RunEventDate, CostTransCreTime AS RunEventTime, kShiftName AS RunEventShift, KJobCode AS JobNum, kAccCode AS CustomerID, kWorkcCode AS MachineID, CostTransCreUser AS EmployeeID, CostTransWCQty AS Quantity, CostTransHours AS RunEventHours, CostTransDownType AS DowntimeType, CostTransBaseVal AS RunEventValue
FROM CostTrans
WHERE RunEventDate BETWEEN @UpperBound AND @LowerBound;

-- Staging Job_Details

-- WITH CustomerJob AS (
SELECT kJobCode, kAccCode
FROM EstICust
-- WHERE CLAUSE FOR QUICK INDEXING/ CORRECT DATE RANGE
-- ),
-- JobQuantity AS (
-- SELECT kJobCode, EstICompQtyOrdQty, kJobStatus
-- FROM CustICompQty

-- SELECT JobIHead.KJobCode AS JobNum, JobIHead.JobIHeadCreDate AS JobCreDate, JobIHead.kJobStatus AS JobStatus, Customer.kAccCode As Customer 
-- FROM JobIHead 
-- INNER JOIN Customer ON Customer.kJobCode = kJobCode
-- INNER JOIN JobQuantity ON JobQuantity.kJobCode = kJobCode/
-- WHERE kcoNum = "1" AND kJobCode <> NULL AND kJobStatus <> NULL AND JobIHeadCreDate > "03/11/2022" AND kEstIVersion = "1" 



-- Staging_Defective_Case



-- Staging invoices
SELECT kInvoiceNo, kAccCode, SLInvCreDate 
FROM SLInvHead


-- Staging JobItemFinishedGoods
SELECT kJobCode, kStckCode, kStckQuantity, RecLockedDate, StckMoveValue
FROM StckMovesVal
WHERE kcoNum = "1" AND kJobCode <> "" AND StckMoveType = "REC-FIN" AND RecLockedDate > @LowerBound 

-- Staging component
SELECT kAccCode, kCompNum, EstICmpName
FROM EstIComponent
WHERE kcoNum = "1" AND EstICmpName <> "" AND kJobCode <> "" AND RecLockedDate > @LowerBound

-- Staging ProductionOrderQty
SELECT kAccCode, kCompNo, EstICompYieldQty
FROM EstICompQty
WHERE kcoNum = "1" AND kJobCode <> "" AND RecLockedDate > @LowerBound
DECLARE @Today DATE = GETDATE();
DECLARE @LowerBound DATE = DATEADD(day, -7, @Today);
DECLARE @UpperBound DATE = DATEADD(day, -1, @Today);

-- Staging_Run_Event
SELECT CostTransCreDate AS RunEventDate, CostTransCreTime AS RunEventTime, kShiftName AS RunEventShift, KJobCode AS JobNum, kAccCode AS CustomerID, kWorkcCode AS MachineID, CostTransCreUser AS EmployeeID, CostTransWCQty AS Quantity, CostTransHours AS RunEventHours, CostTransDownType AS DowntimeType, CostTransBaseVal AS RunEventValue
FROM CostTrans
WHERE RunEventDate BETWEEN @UpperBound AND @LowerBound;



-- Staging_Defective_Case



-- Staging invoices
SELECT kInvoiceNo, kAccCode, SLInvCreDate 
FROM SLInvHead


-- Staging JobItemFinishedGoods
SELECT kJobCode, kStckCode, kStckQuantity, RecLockedDate, StckMoveValue
FROM StckMovesVal
WHERE kcoNum = "1" AND kJobCode <> NULL AND StckMoveType = "REC-FIN" AND RecLockedDate > @LowerBound 

-- Staging component
SELECT kJobCode, kCompNum, EstICmpName
FROM EstIComponent
WHERE kcoNum = "1" AND EstICmpName <> NULL AND kJobCode <> NULL AND RecLockedDate > @LowerBound

-- Staging ProductionOrderQty
SELECT kJobCode, kCompNo, EstICompYieldQty
FROM EstICompQty
WHERE kcoNum = "1" AND kJobCode <> NULL AND RecLockedDate > @LowerBound
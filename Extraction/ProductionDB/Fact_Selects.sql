DECLARE @Today DATE = GETDATE();
DECLARE @LowerBound DATE = DATEADD(day, -7, @Today);
DECLARE @UpperBound DATE = DATEADD(day, -1, @Today);

-- Fact_Run_Event
SELECT CostTransCreDate AS RunEventDate, CostTransCreTime AS RunEventTime, kShiftName AS RunEventShift, KJobCode AS JobNum, kAccCode AS CustomerID, QtyUp, kWorkcCode AS MachineID, CostTransCreUser AS EmployeeID, CostTransWCQty AS Quantity, CostTransHours AS RunEventHours, CostTransDownType AS DowntimeType, CostTransBaseVal AS RunEventValue
FROM CostTrans
WHERE CostTransCreDate BETWEEN @UpperBound AND @LowerBound;
-- Left Join to Fact_Job for QtyDies



-- Fact_Defective_Case



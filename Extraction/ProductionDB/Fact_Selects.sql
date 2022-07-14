-- Fact_Run_Event
SELECT CostTransCreDate AS RunEventDate, CostTransCreTime AS RunEventTime, kShiftName AS RunEventShift, KJobCode AS JobNum, QtyUp, kWorkcCode AS MachineID, CostTransCreUser AS EmployeeID, CostTransWCQty AS Quantity, CostTransHours AS RunEventHours, CostTransDownType AS DowntimeType, CostTransBaseVal AS RunEventValue
FROM CostTrans
-- WHERE Date is in last week
-- Left Join to Fact_Job for QtyDies



-- Fact_Defective_Case




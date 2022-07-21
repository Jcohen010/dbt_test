-- Fact_JobItem_Det 
WITH FinGoodsAggr AS (
SELECT * 
FROM StckMovesVal
GROUP BY kJobCode, kStckCode
)

SELECT 
J1.kJobCode + J1.EstICmpName AS JobItemID,
J1.kJobCode AS JobID, 
J1.EstICmpName AS ItemID, 
F1.kAccCode AS CustomerID,
J2.EstICompYieldQty AS ProdOrderQty,
F1.kStckQuantity AS FinGoodQty
-- DefectiveQty
-- QtyUp
FROM EstIComponent AS J1
LEFT JOIN EstICompQty AS J2
ON J1.JobComponentKey = J2.JobComponentKey
LEFT JOIN FinGoodsAggr AS F1
ON J1.JobItemID = F1.JobItemID


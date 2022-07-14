-- Declare Date Variables used in Dim Table updates Queries
DECLARE @Today DATE = GETDATE();
DECLARE @LowerBound DATE = DATEADD(day, -7, @Today);
DECLARE @UpperBound DATE = DATEADD(day, -1, @Today);

-- Dim_Customer
SELECT kAccCode AS CustomerCode, AccCustName AS CustomerName
FROM AccCust
WHERE kcoNum < 15 AND RecInactive = "no" AND AccCustStatus = "L";

-- Dim_Machine
SELECT kWorkcCode AS MachineID, SysWorkcDesc AS MachineDesc, kDeptCode AS DepartmentName
FROM SysWorkCentre
WHERE RecInactive = "no";

-- Dim_Employee
SELECT kuser AS EmployeeID, SysUserDesc AS EmployeeName, SysUserEmail AS EmployeeEmail, SysUserTitle AS EmployeeTitle
FROM SysUser
WHERE ReInactive = "no" AND SysUserEmpActive = "yes";





-- Dim_Job
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


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

-- Dim_Shift
SELECT kShiftName 
FROM PrdShiftDets


-- Dim_Department
SELECT kDeptCode, kDeptDesc
FROM SysDepartment


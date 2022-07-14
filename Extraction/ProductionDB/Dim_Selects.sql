-- Dim_Customer
SELECT kAccCode AS CustomerCode, AccCustName AS CustomerName
FROM AccCust
WHERE kcoNum < 15 AND RecInactive = "no" AND AccCustStatus = "L"

-- Dim_Machine
SELECT kWorkcCode AS MachineID, SysWorkcDesc AS MachineDesc, kDeptCode AS DepartmentName
FROM SysWorkCentre
WHERE RecInactive = "no" 

-- Dim_Employee
SELECT kuser AS EmployeeID, SysUserDesc AS EmployeeName, SysUserEmail AS EmployeeEmail, SysUserTitle AS EmployeeTitle
FROM SysUser
WHERE ReInactive = "no" AND SysUserEmpActive = "yes"

-- Dim_Job




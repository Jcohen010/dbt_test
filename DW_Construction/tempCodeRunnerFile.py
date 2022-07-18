from codecs import utf_8_encode
import pandas as pd
from pandasql import sqldf
mysql = lambda q: sqldf(q, globals())

fact_rundtypes = {"JobID":str, "ItemID":str}
fact_defecttypes = {"JobNum" : str}

fact_run_event = pd.read_csv("Fact_Run_Event (TEST).csv", header = 0, encoding = 'unicode_escape', engine ='python' )
fact_defective_case = pd.read_csv("Fact_Defective_Case (TEST).csv", header = 0, encoding = 'unicode_escape', engine ='python', dtype= str)

fact_run_event = fact_run_event.astype(fact_rundtypes)
fact_defective_case = fact_defective_case.astype(fact_defecttypes)

print(mysql(
"""
WITH runbymachine AS(
SELECT F.JobItem, F.MachineID, F.DepartmentID, Sum(Quantity) AS Quantity
FROM fact_run_event as F
GROUP BY MachineID, JobID)

SELECT D.JobItem, D.DateFound,D.InspectShift, D.InspectGluer, D.DefectCode, D.DefectDesc, D.CaseQty, D.DefectiveSamples, D.TotalSamples, O.MachineID AS OriginMachineID, O.Quantity
FROM fact_defective_case AS D
INNER JOIN runbymachine AS O
ON O.JobItem = D.JobItem
"""))



from codecs import utf_8_encode
import pandas as pd
from pandasql import sqldf
mysql = lambda q: sqldf(q, globals())

fact_rundtypes = {"JobID":str, "ItemID":str}

fact_run_event = pd.read_csv("Fact_Run_Event (TEST).csv", header = 0, encoding = 'unicode_escape', engine ='python' )
fact_defective_case = pd.read_csv("Fact_Defective_Case (TEST).csv", header = 0, encoding = 'unicode_escape', engine ='python', dtype= str)

fact_run_event = fact_run_event.astype(fact_rundtypes)

print(mysql(
"""SELECT JobID, MachineID, DepartmentID, EmployeeID, Quantity 
FROM fact_run_event
GROUP BY MachineID"""))

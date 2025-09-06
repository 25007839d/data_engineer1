# exporting
from reading_writing2 import df
from openpyxl.workbook import Workbook

df.to_csv("out.csv")
df.to_json("out.json")
df.to_excel("out.xlsx")

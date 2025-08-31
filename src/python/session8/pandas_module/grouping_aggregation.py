# Grouping & Aggregation
from reading_writing2 import df

df.groupby("Name")["Age"].mean()
df.groupby("Name").agg({"Age": "max"})



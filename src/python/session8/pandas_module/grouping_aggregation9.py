# Grouping & Aggregation
from reading_writing2 import df

df.groupby("name")["salary"].mean()
df.groupby("name").agg({"salary": "max"})

print(df.head())

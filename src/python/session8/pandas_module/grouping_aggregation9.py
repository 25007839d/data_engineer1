# Grouping & Aggregation
from reading_writing2 import df

# df = df.groupby("name")["salary"].mean()
df = df.groupby("name").agg({"salary": "mean"})

print(df.head())

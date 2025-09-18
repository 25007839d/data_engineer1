# Merging & Joining (SQL style)


import pandas as pd

# First table
df1 = pd.DataFrame({
    "id": [1, 2, 3],
    "name": ["Alice", "Bob", "Charlie"]
})

# Second table
df2 = pd.DataFrame({
    "id": [1, 2, 4],
    "salary": [5000, 6000, 7000]
})

print("Table 1:\n", df1)
print("\nTable 2:\n", df2)

# merge() → SQL-style sql_joins.sql
# Works like SQL JOIN (INNER, LEFT, RIGHT, OUTER)
# You specify keys/columns to join on


result = pd.merge(df1, df2, on="id", how="inner")
print(result)


# join() → Join on index (default)
# Simpler than merge()
# Works on row indexes (or on a column if you set it as index)

df3 = pd.DataFrame({"salary": [5000, 6000, 7000]}, index=[1, 2, 4])
df4 = pd.DataFrame({"name": ["Alice", "Bob", "Charlie"]}, index=[1, 2, 3])

result = df4.join(df3, how="outer")
print(result)

# df = pd.read_csv("employees.csv", index_col="Name")
# print(df.head())



# concat() → Stacking DataFrames
# Just glues DataFrames together (row-wise or column-wise).
# Doesn’t require keys, just sticks them end-to-end.

df5 = pd.DataFrame({"id": [1, 2], "name": ["Alice", "Bob"]})
df6 = pd.DataFrame({"id": [3, 4], "name": ["Charlie", "David"]})

# Row-wise concat (like UNION ALL in SQL)
result = pd.concat([df5, df6])
print(result)

# Column-wise concat
result = pd.concat([df5, df6], axis=1)
print(result)

# String Operations

from reading_writing2 import df

df["name"] = df["name"].str.upper()

df1 =df["name"].str.contains("a")
print(df1)


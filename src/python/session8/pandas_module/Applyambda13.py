# lambda

from reading_writing2 import df
df["s"] = df["salary"].apply(lambda x: x*2)
print(df[["salary","s"]])
# Sorting

from reading_writing2 import df

df = df.sort_values("salary")                     # ascending
df = df.sort_values("salary", ascending=False)    # descending
print(df["salary"])


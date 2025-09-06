from reading_writing2 import df
import pandas as pd

#Reshapes data: turns unique values of a column into columns.
import pandas as pd

df = pd.DataFrame({
    "name": ["A", "A", "B", "B", "C"],
    "dept": ["HR", "IT", "HR", "IT", "HR"],
    "salary": [1000, 1200, 1100, 1300, 1250],
    "bonus": [100, 200, 150, 250, 180]
})

# multiple columns in values
pt = pd.pivot_table(
    df,
    values=["salary", "bonus"],   # 👈 multiple numeric columns
    index="name",
    aggfunc="mean"
)

print(pt)

# values="salary" → you want to aggregate the salary column.
#
# index="name" → you group by name.
#
# we didn’t specify aggfunc, so Pandas uses the default: aggfunc="mean".

#Used to compute frequency tables (counts).
# crosstab
# Great for categorical data comparisons.

# df=pd.crosstab(df["country"], df["salary"])
#
# print(df)
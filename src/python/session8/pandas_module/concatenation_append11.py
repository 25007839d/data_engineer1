import pandas as pd

df1 = pd.DataFrame({"A": [1, 2], "B": [3, 4]})
df2 = pd.DataFrame({"A": [5, 6], "B": [7, 8]})

# Deprecated
# df3 = df1.append(df2)
# print(df3)
 # or new way

df3 = pd.concat([df1, df2])
print(df3)

# Use pd.concat([df1, df2], ignore_index=True) instead of append.
#
# append is just a wrapper around concat and is removed in pandas 2.0+.

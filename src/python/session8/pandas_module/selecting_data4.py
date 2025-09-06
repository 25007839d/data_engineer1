# Selecting Data
from reading_writing2 import df

# print(df.head())
# # ✅ By column
# print(df["name"])
# print(df[["name","salary"]])

# ✅ By row
print(df.loc[0])        # by index label
print(df.iloc[0])       # by position
# .loc[] → label-based, end inclusive.
# .iloc[] → position-based, end exclusive.
# ✅ Conditional selection
print(df[df["salary"] > 3000])


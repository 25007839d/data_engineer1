# Selecting Data
from reading_writing2 import df

# ✅ By column
print(df["Name"])
print(df[["Name","salary"]])

# ✅ By row
print(df.loc[0])        # by index label
print(df.iloc[0])       # by position

# ✅ Conditional selection
print(df[df["salary"] > 3000])


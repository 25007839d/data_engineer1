# from reading_writing2 import df
from adding_modifying_columns5 import df

# axis=0 → Refers to rows
# axis=1 → Refers to columns

# inplace=False (default) → Returns a new DataFrame (original stays the same).
# inplace=True → Modifies the original DataFrame directly (no need to reassign).


# df.drop(["Age+5","Age"], axis=1, inplace=True)   # drop column

df.drop(0, axis=0, inplace=True)          # drop row
print(df)


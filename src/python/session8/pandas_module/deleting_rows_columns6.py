from reading_writing2 import df

# axis=0 → Refers to rows
# axis=1 → Refers to columns

# inplace=False (default) → Returns a new DataFrame (original stays the same).
# inplace=True → Modifies the original DataFrame directly (no need to reassign).

df.drop("Salary", axis=1, inplace=True)   # drop column
df.drop(0, axis=0, inplace=True)          # drop row



from reading_writing2 import df

# Adding / Modifying Columns

a =10


df["Age"] =df['salary']   # add new
df["Age+5"] = df["Age"] - 5 *2          # derived

df = df[df["Age"] > 55]


from pandas import read_csv, read_excel

# What is a DataFrame?

# A DataFrame is a 2D data structure (like a table in Excel or SQL) provided by the pandas library in Python.

# Reading & Writing Data
df = read_csv("data/department.csv")        # Read CSV
df.to_csv("data/output.csv", index=False)  # Save CSV

# df = read_excel("data/123.xlsx")     # Read Excel
# df.to_excel("output.xlsx", index=False)

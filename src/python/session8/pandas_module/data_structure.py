
import pandas as pd

# Pandas Data Structures

#Works with Series (1D) and DataFrame (2D)

 #Series (1D)
s = pd.Series([10, 20, 30], index=["a", "b", "c"])
print(s)

# DataFrame (2D)
data = {"Name": ["Alice", "Bob", "Charlie"], "Age": [25, 30, 35]}
df = pd.DataFrame(data)
print(df)


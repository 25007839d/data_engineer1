
import pandas as pd

# Pandas Data Structures

#Works with Series (1D) and DataFrame (2D)

 #Series (1D) created a Pandas Series with custom indexes.
s = pd.Series([10, 20, 30], index=["a", "b", "c"])
print(s["a"])

# default index

import pandas as pd

s = pd.Series([10, 20, 30])
print(s)

# DataFrame (2D)
data = {"Name": ["Alice", "Bob", "Charlie"], "Age": [25, 30, 35]}
df = pd.DataFrame(data)
print(df)


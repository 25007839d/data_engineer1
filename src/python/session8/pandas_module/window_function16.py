# window function
from reading_writing2 import df


df["rolling_mean"] = df["salary"].rolling(2).mean()
#Rolling Mean (Moving Average)

print('#Rolling Mean (Moving Average 3)')
df["Rolling_Mean"] = df["salary"].rolling(window=3).mean()
print(df)

#Like SQL RANK, DENSE_RANK, ROW_NUMBER.

print('#Like SQL RANK, DENSE_RANK, ROW_NUMBER.')
df["Rank"] = df["salary"].rank(method="dense", ascending=False)
print(df)


# date
import pandas as pd
# empty df


df = pd.DataFrame()
print(df)

# adding date column
df["date"] = pd.to_datetime(["2025-01-01", "2025-02-01", "2025-03-01"])

# extracting year,month,day
print('# extracting year,month,day')
print(df["date"].dt.year)   # extract year
print(df["date"].dt.month)  # extract month
print(df["date"].dt.day)    # extract day

# filter rows after Feb 2025
print('# filter rows after Feb 2025')
print(df[df["date"] > "2025-02-01"])

# some timestamp
df["timestamp"] = pd.to_datetime([
    "2025-01-01 10:30:00",
    "2025-02-01 12:45:00",
    "2025-03-01 18:20:00"
])

# print(df)

# extract parts
print('# just date part')
print(df["timestamp"].dt.date)    # just date part
print('# just time part')
print(df["timestamp"].dt.time)    # just time part

# filter by time
print('filter by time')
print(df[df["timestamp"] > "2025-02-01"])

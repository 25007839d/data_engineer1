from reading_writing2 import df

# Handling Missing Data

df.dropna()                # drop missing
df.fillna('unknown')               # replace with 0
df["Age"].fillna(df["Age"].mean(), inplace=True)  # replace with mean



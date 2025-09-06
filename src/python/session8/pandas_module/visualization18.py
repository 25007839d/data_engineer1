# Visualization(with matplotlib)



import pandas as pd
import matplotlib.pyplot as plt

# Sample DataFrame
df = pd.DataFrame({
    "salary": [1000, 2000, 3000, 4000, 5000],
    "bonus":  [100, 200, 300, 400, 500],
    "age":    [25, 30, 35, 40, 45]
})

# 1. Multiple histograms on same plot
df[["salary", "bonus"]].plot(kind="hist", alpha=0.5, bins=10, title="Histograms of Salary & Bonus")
plt.show()

# 2. Separate histograms (subplots)
df[["salary", "bonus"]].plot(kind="hist", subplots=True, layout=(2,1), bins=10, title="Separate Histograms")
plt.show()

# 3. Line plot for multiple columns
df[["salary", "bonus", "age"]].plot(title="Line Plot of Salary, Bonus & Age")
plt.show()

# 4. Boxplot for multiple columns
df[["salary", "bonus"]].plot(kind="box", title="Boxplot of Salary & Bonus")
plt.show()

# 5. Scatter plot between two columns
df.plot(x="salary", y="bonus", kind="scatter", title="Scatter Plot: Salary vs Bonus")
plt.show()

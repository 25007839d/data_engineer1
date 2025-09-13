import pandas as pd
import matplotlib.pyplot as plt

# Create a sample DataFrame
data = {
    "Product": ["Laptop", "Mobile", "Tablet", "Headphone", "Camera"],
    "Sales": [120, 300, 180, 90, 150]
}
df = pd.DataFrame(data)
print(df)
# Plot Bar Graph
plt.bar(df["Product"], df["Sales"], edgecolor="black",)


plt.title("Product Sales")
plt.xlabel("Product")
plt.ylabel("Sales Units")
# plt.show()

import matplotlib.pyplot as plt


# Create pie chart
plt.figure(figsize=(6,6))
plt.pie(
     df["Sales"],
    labels=df["Product"],
    autopct='%1.1f%%',   # show percentages
    startangle=140,      # rotate start
    colors=["#ff9999", "#66b3ff", "#99ff99", "#ffcc99", "#c2c2f0"],  # custom colors
    explode=[0, 0.1, 0, 0, 0]  # highlight "Mobile" (highest sales)
)
plt.title("Product Sales Distribution")
plt.show()

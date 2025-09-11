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
plt.bar(df["Product"], df["Sales"], color="skyblue", edgecolor="black")

plt.title("Product Sales")
plt.xlabel("Product")
plt.ylabel("Sales Units")
plt.show()

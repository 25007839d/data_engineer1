from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType
from pyspark.sql.functions import col, sum, avg, max, min, mean, count, last, kurtosis, sumDistinct
from pyspark.sql.functions import *
#  Start Spark session
spark = SparkSession.builder.appName("GroupByAggregations").getOrCreate()

#  Schema
schema = StructType([
    StructField("employee_name", StringType(), True),
    StructField("department", StringType(), True),
    StructField("state", StringType(), True),
    StructField("salary", IntegerType(), True),
    StructField("bonus", IntegerType(), True)
])

#  Data
data = [
    ("James", "Sales", "NY", 3000, 500),
    ("Michael", "Sales", "CA", 4600, 700),
    ("Robert", "Sales", "CA", 4100, 400),
    ("Maria", "Finance", "CA", 3000, 400),
    ("Raman", "Finance", "DE", 3300, 200),
    ("Scott", "Finance", "NY", 3900, 300),
    ("Jen", "Finance", "NY", 3900, 350),
    ("Jeff", "Marketing", "CA", 3000, 200),
    ("Kumar", "Marketing", "NY", 2000, 300)
]

#  Create DataFrame
df = spark.createDataFrame(data, schema)
print("📌 Original DataFrame:")
df.show(truncate=False)

# ===================================================
#  GROUPBY EXAMPLES
# ===================================================

# 1. Sum of salary per department
print("📌 Sum of salary per department:")
df.groupBy("department").sum("salary").show(truncate=False)

# 2. GroupBy on multiple columns (department + state)
print("📌 Sum of salary and bonus per department/state:")
df.groupBy("department","state").sum("salary","bonus").show(truncate=False)

# 3. Count rows per department
print("📌 Count of employees per department:")
df.groupBy("department").count().show(truncate=False)

# 4. Mean / Avg salary per department
print(" Average salary per department:")
df.groupBy("department").mean("salary").show(truncate=False)
df.groupBy("department").avg("salary").show(truncate=False)

# 5. Max / Min salary per department
print(" Maximum salary per department:")
df.groupBy("department").max("salary").show(truncate=False)

print(" Minimum salary per department:")
df.groupBy("department").min("salary").show(truncate=False)

# ===================================================
# 🔹 AGG EXAMPLES
# ===================================================

print(" Multiple aggregations using agg():")
df.groupBy("department").agg(
    sum("salary").alias("total_salary"),
    avg("bonus").alias("avg_bonus"),
    max("salary").alias("max_salary"),
    min("salary").alias("min_salary"),
    count("*").alias("emp_count")
).show(truncate=False)

# ===================================================
# 🔹 PIVOT EXAMPLE
# ===================================================

print("📌 Pivot: salary distribution by state within each department:")
df.groupBy("department") \
  .pivot("state") \
  .sum("salary") \
  .show(truncate=False)


# ================
# Aggregate / Statistical functions

# Returns the last value of the 'salary' column
df.select(last("salary")).show(truncate=False)

# Computes the kurtosis of 'salary' column (measure of "tailedness" of distribution)
df.select(kurtosis("salary")).show(truncate=False)

# Returns the maximum value in 'salary' column
df.select(max("salary")).show(truncate=False)

# Returns the minimum value in 'salary' column
df.select(min("salary")).show(truncate=False)

# Computes the mean (average) of 'salary' column
df.select(mean("salary")).show(truncate=False)

# Computes the skewness of 'salary' column (measure of asymmetry)
df.select(skewness("salary")).show(truncate=False)

# Computes standard deviations of 'salary' column
# stddev() / stddev_samp() -> sample standard deviation
# stddev_pop() -> population standard deviation
df.select(stddev("salary"), stddev_samp("salary"), stddev_pop("salary")).show(truncate=False)

# Computes the sum of all values in 'salary' column
df.select(sum("salary")).show(truncate=False)

# Computes the sum of distinct values in 'salary' column
df.select(sumDistinct("salary")).show(truncate=False)

# Computes variance of 'salary' column
# variance() / var_samp() -> sample variance
# var_pop() -> population variance
df.select(variance("salary"), var_samp("salary"), var_pop("salary")).show(truncate=False)

from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

# Start Spark session
spark = SparkSession.builder.appName("UnionExample").getOrCreate()

# Define schema
schema = StructType([
    StructField("emp_name", StringType(), True),
    StructField("department", StringType(), True),
    StructField("salary", IntegerType(), True)
])

# DataFrame 1
data1 = [
    ("James", "Sales", 3000),
    ("Michael", "Finance", 4000),
    ("Maria", "Finance", 3500)
]

df1 = spark.createDataFrame(data1, schema)

# DataFrame 2
data2 = [
    ("Robert", "Sales", 4100),
    ("Maria", "Finance", 3500),  # duplicate row
    ("Jen", "Marketing", 4500)
]

df2 = spark.createDataFrame(data2, schema)

# Show individual DataFrames
print("DataFrame 1:")
df1.show(truncate=False)

print("DataFrame 2:")
df2.show(truncate=False)

# Union without removing duplicates (like unionAll)
unionDF = df1.union(df2)
print("Union (keeps duplicates):")
unionDF.show(truncate=False)

# Union with removing duplicates
distinctDF = df1.union(df2).distinct()
print("Union with distinct (removes duplicates):")
distinctDF.show(truncate=False)

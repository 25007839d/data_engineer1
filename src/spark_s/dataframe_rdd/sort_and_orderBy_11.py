from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType
from pyspark.sql.functions import col

spark = SparkSession.builder.appName("SortingExample").getOrCreate()

# Schema
schema = StructType([
    StructField("employee_name", StringType(), True),
    StructField("department", StringType(), True),
    StructField("state", StringType(), True),
    StructField("salary", IntegerType(), True)
])

# Data
data = [
    ("James", "Sales", "NY", 3000),
    ("Michael", "Sales", "CA", 4600),
    ("Robert", "Sales", "CA", 4100),
    ("Maria", "Finance", "CA", 3000),
    ("Raman", "Finance", "DE", 3300),
    ("Scott", "Finance", "NY", 3900),
    ("Jen", "Finance", "NY", 3900),
    ("Jeff", "Marketing", "CA", 3000),
    ("Kumar", "Marketing", "NY", 2000)
]

df = spark.createDataFrame(data, schema)
df.show(truncate=False)

# 1. Sort with ascending and descending on different columns
# department ascending, state descending
df.sort("department", "state", ascending=[True, False]).show(truncate=False)

# 2. Using sort() (default is ascending)
df.sort("department","state").show(truncate=False)
df.sort(col("department"), col("state")).show(truncate=False)

# 3. Using orderBy() (same as sort)
df.orderBy("department","state").show(truncate=False)
df.orderBy(col("department"), col("state")).show(truncate=False)

# Mixed Asc/Desc with orderBy
# department ascending, state descending
df.orderBy(col("department").asc(), col("state").desc()).show(truncate=False)

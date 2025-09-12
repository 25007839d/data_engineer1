"""PySpark distinct() transformation is used to drop/remove the duplicate rows (all columns)
from DataFrame and dropDuplicates() is used to drop rows based on selected (one or multiple)
columns. distinct() and dropDuplicates() returns a new DataFrame."""

from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

spark = SparkSession.builder.appName("DistinctVsDropDuplicates").getOrCreate()

# Schema
schema = StructType([
    StructField("name", StringType(), True),
    StructField("gender", StringType(), True),
    StructField("salary", IntegerType(), True),
    StructField("state", StringType(), True)
])

# Data with duplicates
data = [
    ("James", "M", 3000, "NY"),
    ("Michael", "M", 4000, "OH"),
    ("Maria", "F", 4000, "CA"),
    ("James", "M", 3000, "NY"),   # duplicate row
    ("Jen", "F", 4500, "NY"),
    ("Maria", "F", 4000, "CA"),   # duplicate row
    ("Kumar", "M", 6000, "TX")
]

df = spark.createDataFrame(data, schema)
print("Original count: " + str(df.count()))
df.show(truncate=False)

# Applying distinct() to remove duplicate rows
distinctDF = df.distinct()
print("Distinct count: " + str(distinctDF.count()))
distinctDF.show(truncate=False)

# Applying dropDuplicates() to remove duplicates
df2 = df.dropDuplicates()
print("Distinct count: " + str(df2.count()))
df2.show(truncate=False)

# Applying dropDuplicates() to remove duplicates on specific column
df2 = df.dropDuplicates(['salary'])
print("Distinct count: " + str(df2.count()))
df2.show(truncate=False)


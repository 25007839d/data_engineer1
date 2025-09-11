from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

# Start Spark session
spark = SparkSession.builder.master("local[1]") \
    .appName("FillNAExample").getOrCreate()

# Sample DataFrame with nulls
schema = StructType([
    StructField("country", StringType(), True),
    StructField("population", IntegerType(), True),
    StructField("area", IntegerType(), True)
])

data = [
    ("USA", 331000000, 9834000),
    ("India", None, 3287000),
    ("Germany", 83000000, None),
    ("France", None, None)
]

df = spark.createDataFrame(data, schema)

print("Original DataFrame with nulls:")
df.show()

# Replace 0 for nulls in all integer columns
print("Fill all nulls with 0:")
df.na.fill(0).show()

# Replace 0 for nulls only in 'population' column
print("Fill nulls in 'population' column only:")
df.na.fill(value=0, subset=["population"]).show()

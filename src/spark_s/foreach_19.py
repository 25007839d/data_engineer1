from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, IntegerType

# Start Spark session
spark = SparkSession.builder.master("local[1]") \
    .appName("ForeachAccumulatorExample").getOrCreate()

# Sample DataFrame
schema = StructType([StructField("Seqno", IntegerType(), True)])
data = [(1,), (2,), (3,), (4,)]
df = spark.createDataFrame(data, schema)

# Create an accumulator
accum = spark.sparkContext.accumulator(0)

# Use foreach() to update accumulator
df.foreach(lambda x: accum.add(int(x.Seqno)))

# Access accumulator value from driver
print("Sum of Seqno using accumulator:", accum.value)

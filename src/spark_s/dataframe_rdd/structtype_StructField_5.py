from pyspark.sql import SparkSession
from pyspark.sql.types import StructType,StructField, StringType, IntegerType

schema = StructType([
    StructField("firstname",StringType(),True),
    StructField("middlename",StringType(),True),
    StructField("lastname",StringType(),True),
    StructField("id", StringType(), True),
    StructField("gender", StringType(), True),
    StructField("salary", IntegerType(), True)
  ])
data = [
    ("Ritu", "K", "Sharma", "1", "F", 50000),
    ("Sam", None, "Verma", "2", "M", 60000),
    ("Anita", "M", "Patel", "3", "F", 75000),
    ("Raj", None, "Singh", "4", "M", 80000),
    ("Pooja", "S", "Mehta", "5", "F", 55000)
]
spark = SparkSession.builder.appName("SchemaExample").getOrCreate()
# Create DataFrame
df = spark.createDataFrame(data, schema)
df.show(truncate=False)
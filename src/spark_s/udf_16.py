from pyspark.sql.functions import udf, col
from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

spark = SparkSession.builder.appName("UnionByNameExample").getOrCreate()

# DataFrame 1
schema1 = StructType([
    StructField("emp_name", StringType(), True),
    StructField("department", StringType(), True),
    StructField("salary", IntegerType(), True)
])

data1 = [
    ("James", "Sales", 3000),
    ("Michael", "Finance", 4000)
]

df = spark.createDataFrame(data1, schema1)

# Define Python function
def upperCase(text):
    return text.upper() if text else None

# Convert to UDF
upperCaseUDF = udf(lambda z: upperCase(z), StringType())

# Apply UDF to DataFrame
df.withColumn("New_Name", upperCaseUDF(col("emp_name"))).show(truncate=False)
 
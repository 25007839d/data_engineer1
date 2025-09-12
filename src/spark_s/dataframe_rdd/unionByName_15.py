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

df1 = spark.createDataFrame(data1, schema1)

# DataFrame 2 with columns in different order and extra column
schema2 = StructType([
    StructField("salary", IntegerType(), True),
    StructField("department", StringType(), True),
    StructField("emp_name", StringType(), True),
    StructField("bonus", IntegerType(), True)  # extra column
])

data2 = [
    (4100, "Sales", "Robert", 500),
    (3500, "Finance", "Maria", 300)
]

df2 = spark.createDataFrame(data2, schema2)

# Union by name, allowing missing columns
df3 = df1.unionByName(df2, allowMissingColumns=True)

# Show result
df3.printSchema()
df3.show(truncate=False)

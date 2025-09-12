from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, DoubleType
from pyspark.sql.functions import col

# 1️⃣ Create SparkSession
spark = SparkSession.builder.appName("PySpark CSV").getOrCreate()

# 2️⃣ Read CSV (basic)
df = spark.read.csv("path/zipcodes.csv")
df.printSchema()

# 3️⃣ Read with header + inferSchema
df = spark.read.option("header", True).option("inferSchema", True).csv("path/zipcodes.csv")
df.show(5)

# 4️⃣ Read multiple files & folder
df_multi = spark.read.csv("file1.csv,file2.csv")
df_folder = spark.read.csv("path/to/folder")

# 5️⃣ Read with options
df_opt = spark.read.options(
    header="True",
    inferSchema="True",
    delimiter=",",
    nullValue="NA",
    dateFormat="yyyy-MM-dd"
).csv("path/zipcodes.csv")

# 6️⃣ Read with custom schema
schema = StructType([
    StructField("RecordNumber", IntegerType(), True),
    StructField("Zipcode", IntegerType(), True),
    StructField("City", StringType(), True),
    StructField("State", StringType(), True),
    StructField("Lat", DoubleType(), True),
    StructField("Long", DoubleType(), True)
])
df_schema = spark.read.option("header", True).schema(schema).csv("path/zipcodes.csv")
df_schema.printSchema()

# 7️⃣ Transformations
df_filter = df_schema.filter(col("State") == "CA").select("Zipcode","City")
df_group = df_schema.groupBy("State").count()
df_new = df_schema.withColumn("Zip_Len", col("Zipcode").cast("string").substr(1,5))

# 8️⃣ Write DataFrame to CSV
df_new.write.mode("overwrite").option("header", True).csv("output/zipcodes")

spark.stop()

# 📌 PySpark JSON Example – Read, Write, Schema, SQL
from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, BooleanType, DoubleType

# 1️⃣ Create SparkSession
spark = SparkSession.builder \
    .master("local[1]") \
    .appName("PySparkJSONExample") \
    .getOrCreate()

# 2️⃣ Read a single JSON file
df = spark.read.json("resources/zipcodes.json")
df.printSchema()
df.show(truncate=False)

# 3️⃣ Read Multiline JSON file
multiline_df = spark.read.option("multiline", "true") \
    .json("resources/multiline-zipcode.json")
multiline_df.show(truncate=False)

# 4️⃣ Read Multiple JSON files
df_multi = spark.read.json([
    "resources/zipcode1.json",
    "resources/zipcode2.json"
])
df_multi.show(truncate=False)

# 5️⃣ Read All JSON files from a Folder
df_all = spark.read.json("resources/*.json")
df_all.show(truncate=False)

# 6️⃣ Define Custom Schema for JSON
schema = StructType([
    StructField("RecordNumber", IntegerType(), True),
    StructField("Zipcode", IntegerType(), True),
    StructField("ZipCodeType", StringType(), True),
    StructField("City", StringType(), True),
    StructField("State", StringType(), True),
    StructField("LocationType", StringType(), True),
    StructField("Lat", DoubleType(), True),
    StructField("Long", DoubleType(), True),
    StructField("Xaxis", IntegerType(), True),
    StructField("Yaxis", DoubleType(), True),
    StructField("Zaxis", DoubleType(), True),
    StructField("WorldRegion", StringType(), True),
    StructField("Country", StringType(), True),
    StructField("LocationText", StringType(), True),
    StructField("Location", StringType(), True),
    StructField("Decommisioned", BooleanType(), True),
    StructField("TaxReturnsFiled", StringType(), True),
    StructField("EstimatedPopulation", IntegerType(), True),
    StructField("TotalWages", IntegerType(), True),
    StructField("Notes", StringType(), True)
])
df_with_schema = spark.read.schema(schema).json("resources/zipcodes.json")
df_with_schema.printSchema()
df_with_schema.show(truncate=False)

# 7️⃣ Create SQL View on JSON file
spark.sql("""
    CREATE OR REPLACE TEMPORARY VIEW zipcodeView
    USING json
    OPTIONS (path "resources/zipcodes.json")
""")
spark.sql("SELECT City, State, Zipcode FROM zipcodeView").show(truncate=False)

# 8️⃣ Write DataFrame to JSON (default mode = errorIfExists)
df.write.json("/tmp/spark_output/zipcodes.json")

# 9️⃣ Write JSON with Options (compression, date format, overwrite)
df.write \
  .mode("overwrite") \
  .option("compression", "gzip") \
  .option("dateFormat", "yyyy-MM-dd") \
  .json("/tmp/spark_output/zipcodes_compressed.json")

# 🔟 Demonstrate Save Modes
df.write.mode("append").json("/tmp/spark_output/json_append")   # Append
df.write.mode("overwrite").json("/tmp/spark_output/json_over") # Overwrite
df.write.mode("ignore").json("/tmp/spark_output/json_ignore")   # Ignore if exists
# df.write.mode("error").json("/tmp/spark_output/json_error")   # Error if exists (default)

# 1️⃣1️⃣ Read JSON from a Python string (RDD example)
json_object = '{"name": "Cinthia", "age": 20}'
df_from_string = spark.read.json(spark.sparkContext.parallelize([json_object]))
df_from_string.show(truncate=False)

spark.stop()

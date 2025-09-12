from pyspark.sql import SparkSession, Row
from pyspark.sql.types import MapType, StringType
from pyspark.sql.functions import from_json, to_json, col, json_tuple, get_json_object, schema_of_json, lit

# Start Spark session
spark = SparkSession.builder.appName("JSONExample").getOrCreate()

# ----------------------------
# Sample DataFrame with JSON string column
# ----------------------------
jsonString = """{"Zipcode":704,"ZipCodeType":"STANDARD","City":"PARC PARQUE","State":"PR"}"""
df = spark.createDataFrame([(1, jsonString)], ["id", "value"])

print("Original DataFrame:")
df.show(truncate=False)

# ----------------------------
# Convert JSON string column to MapType
# ----------------------------
df2 = df.withColumn("value", from_json(df.value, MapType(StringType(), StringType())))
print("DataFrame after converting JSON string to MapType:")
df2.printSchema()
df2.show(truncate=False)

# ----------------------------
# Convert MapType column back to JSON string
# ----------------------------
df2.withColumn("value", to_json(col("value"))).show(truncate=False)

# ----------------------------
# Extract fields using json_tuple
# ----------------------------
df.select(
    col("id"),
    json_tuple(col("value"), "Zipcode", "ZipCodeType", "City")
).toDF("id", "Zipcode", "ZipCodeType", "City").show(truncate=False)

# ----------------------------
# Extract field using get_json_object
# ----------------------------
df.select(
    col("id"),
    get_json_object(col("value"), "$.ZipCodeType").alias("ZipCodeType")
).show(truncate=False)

# ----------------------------
# Infer schema from JSON string
# ----------------------------
schemaStr = spark.range(1) \
    .select(schema_of_json(lit("""{"Zipcode":704,"ZipCodeType":"STANDARD","City":"PARC PARQUE","State":"PR"}"""))) \
    .collect()[0][0]

print("Inferred JSON Schema:", schemaStr)

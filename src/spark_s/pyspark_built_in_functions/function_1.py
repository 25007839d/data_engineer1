from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.functions import countDistinct
from pyspark.sql.types import *
from pyspark.sql.window import Window

# ---------------------------------------
# Spark Session
# ---------------------------------------
spark = SparkSession.builder.appName("PySparkFunctionsDemo").getOrCreate()

# ---------------------------------------
# Sample Data
# ---------------------------------------
data = [
    (1, "James", "M", 60000, "2025-09-11", "Hello World", [1, 2, 3], {"a": 1, "b": 2}),
    (2, "Maria", "F", 50000, "2025-08-01", "Spark SQL", [4, 5], {"c": 3}),
    (3, "Robert", None, 40000, "2025-07-15", "PySpark Example", [], {"d": 4}),
]
df = spark.createDataFrame(data, ["id", "name", "gender", "salary", "date", "text", "numbers", "map_col"])
df.show(truncate=False)

# ======================================================
# CONDITIONAL & EXPRESSIONS
# ======================================================
# when() → conditional column
df.withColumn("gender_full", when(col("gender")=="M","Male")
                               .when(col("gender")=="F","Female")
                               .otherwise("Unknown")).show()

# expr() → SQL expressions
df.withColumn("gender_expr", expr("CASE WHEN gender='M' THEN 'Male' WHEN gender='F' THEN 'Female' ELSE 'Unknown' END")).show()

# lit() → add literal value
df.withColumn("country", lit("USA")).show()

# ======================================================
# STRING FUNCTIONS
# ======================================================
df.withColumn("split_words", split(col("text"), " ")).show()                     # split string
df.withColumn("concat_ws", concat_ws("-", col("name"), col("gender"))).show()    # join with delimiter
df.withColumn("substring", substring(col("text"), 1, 5)).show()                  # substring
df.withColumn("translate", translate(col("text"), "aeiou", "12345")).show()      # replace characters
df.withColumn("regex_replace", regexp_replace(col("text"), "Spark", "BigData")).show()  # regex replace
df.withColumn("overlay", overlay(col("text"), lit("XXX"), 1, 5)).show()  # overlay text

# ======================================================
# DATE & TIME FUNCTIONS
# ======================================================
df.withColumn("to_timestamp", to_timestamp(col("date"), "yyyy-MM-dd")).show()   # string → timestamp
df.withColumn("to_date", to_date(col("date"), "yyyy-MM-dd")).show()             # string → date
df.withColumn("date_format", date_format(col("date"), "dd-MM-yyyy")).show()     # format date
df.withColumn("datediff", datediff(current_date(), col("date"))).show()         # diff in days
df.withColumn("months_between", months_between(current_date(), col("date"))).show() # diff in months

# ======================================================
# ARRAY FUNCTIONS
# ======================================================
df.withColumn("explode", explode(col("numbers"))).show()                           # flatten array
df.withColumn("array_contains_2", array_contains(col("numbers"), 2)).show()        # check element
df.withColumn("new_array", array(lit(10), lit(20), lit(30))).show()                # create array

# ======================================================
# AGGREGATIONS & MAP FUNCTIONS
# ======================================================
df.agg(collect_list("name"), collect_set("gender")).show()                         # collect values
df.select(create_map(
    lit("id"), col("id").cast("string"),   # ensure values are string
    lit("name"), col("name")
).alias("map_col")).show(truncate=False)  # create map
df.select(map_keys(col("map_col")), map_values(col("map_col"))).show(truncate=False)         # map keys & values
df.select(struct(col("id"), col("name"), col("salary")).alias("struct_col")).show(truncate=False)  # struct column

df.select(countDistinct("gender")).show()                                          # distinct count
df.agg(sum("salary").alias("sum_salary"), avg("salary").alias("avg_salary")).show() # sum & avg

# ======================================================
# WINDOW FUNCTIONS
# ======================================================
windowSpec = Window.orderBy("salary")

df.withColumn("row_number", row_number().over(windowSpec)) \
  .withColumn("rank", rank().over(windowSpec)) \
  .withColumn("dense_rank", dense_rank().over(windowSpec)) \
  .withColumn("percent_rank", percent_rank().over(windowSpec)) \
  .show()



# ======================================================
# JSON FUNCTIONS
# ======================================================
json_str = """{"Zipcode":704,"ZipCodeType":"STANDARD","City":"NY","State":"NY"}"""
json_df = spark.createDataFrame([(1, json_str)], ["id","value"])

# from_json() → parse JSON
json_df2 = json_df.withColumn("value", from_json(col("value"), MapType(StringType(), StringType())))
json_df2.show(truncate=False)

# to_json() → convert to JSON string
json_df2.withColumn("back_to_json", to_json(col("value"))).show(truncate=False)

# json_tuple() → extract fields
json_df.select(col("id"), json_tuple(col("value"), "Zipcode", "City")).show()

# get_json_object() → extract using path
json_df.select(get_json_object(col("value"), "$.City").alias("city")).show()

# schema_of_json() → get schema
schema_str = spark.range(1).select(schema_of_json(lit(json_str))).collect()[0][0]
print("Schema of JSON:", schema_str)

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, year, month, next_day, weekofyear, current_date, \
    date_format, to_date, datediff, trunc, to_timestamp
from pyspark.sql.types import StructType, StructField, StringType

# Start Spark session
spark = SparkSession.builder.master("local[1]") \
    .appName("DateTimeFunctionsExample").getOrCreate()

# Sample DataFrame with date strings
schema = StructType([StructField("input", StringType(), True)])
data = [("2025-09-11",), ("2024-12-25",), ("2023-01-01",)]
df = spark.createDataFrame(data, schema)

# ----------------------------
# Extract year, month, next day (Sunday), week of year
# ----------------------------
df.select(
    col("input"),
    year(col("input")).alias("year"),            # Extract year from date
    month(col("input")).alias("month"),          # Extract month from date
    next_day(col("input"), "Sunday").alias("next_day"),  # Next Sunday after date
    weekofyear(col("input")).alias("weekofyear")         # Week number of the year
).show(truncate=False)

# ----------------------------
# Current date
# ----------------------------
df.select(current_date().alias("current_date")).show(1)

# ----------------------------
# date_format(): format date into specified string pattern
# ----------------------------
df.select(
    col("input"),
    date_format(col("input"), "MM-dd-yyyy").alias("date_format")  # Format date
).show(truncate=False)

# ----------------------------
# to_date(): convert string to DateType with specified format
# ----------------------------
df.select(
    col("input"),
    to_date(col("input"), "yyyy-MM-dd").alias("to_date")  # Convert to DateType
).show(truncate=False)

# ----------------------------
# datediff(): difference in days between two dates
# ----------------------------
df.select(
    col("input"),
    datediff(current_date(), col("input")).alias("datediff")  # Days between today and input
).show(truncate=False)

# ----------------------------
# trunc(): truncate date to month or year
# ----------------------------
df.select(
    col("input"),
    trunc(col("input"), "Month").alias("Month_Trunc"),  # Truncate to first day of month
    trunc(col("input"), "Year").alias("Year_Trunc")     # Truncate to first day of year
).show(truncate=False)

# ----------------------------
# to_timestamp(): convert string to timestamp type
# ----------------------------
df2 = df  # Using same df for timestamp example
df2.select(
    col("input"),
    to_timestamp(col("input"), "yyyy-MM-dd").alias("to_timestamp")  # Convert to TimestampType
).show(truncate=False)

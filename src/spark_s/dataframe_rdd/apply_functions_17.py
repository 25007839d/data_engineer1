from pyspark.sql import SparkSession
from pyspark.sql.functions import upper, col

# Start Spark session
spark = SparkSession.builder.appName("ColumnFunctionExample").getOrCreate()

# Sample DataFrame
data = [(1, "James"), (2, "Maria"), (3, "Michael")]
df = spark.createDataFrame(data, ["Seqno", "Name"])

# Apply function using withColumn
df.withColumn("Upper_Name", upper(col("Name"))).show(truncate=False)

# Apply function using select
df.select("Seqno", "Name", upper(col("Name")).alias("Upper_Name")).show(truncate=False)

# Apply function using SQL
df.createOrReplaceTempView("TAB")
spark.sql("SELECT Seqno, Name, UPPER(Name) AS Upper_Name FROM TAB").show(truncate=False)

#  PySpark Parquet Example – Read, Write, Partition, SQL
from pyspark.sql import SparkSession

# 1️⃣ Create Spark Session
spark = SparkSession.builder.appName("parquetFile").getOrCreate()

# 2️⃣ Create Sample DataFrame
data = [
    ("James", "", "Smith", "36636", "M", 3000),
    ("Michael", "Rose", "", "40288", "M", 4000),
    ("Robert", "", "Williams", "42114", "M", 4000),
    ("Maria", "Anne", "Jones", "39192", "F", 4000),
    ("Jen", "Mary", "Brown", "", "F", -1)
]
columns = ["firstname", "middlename", "lastname", "dob", "gender", "salary"]
df = spark.createDataFrame(data, columns)

# 3️⃣ Write DataFrame to Parquet
df.write.mode("overwrite").parquet("/tmp/output/people.parquet")

# 4️⃣ Read Parquet back into DataFrame
parDF1 = spark.read.parquet("/tmp/output/people.parquet")
parDF1.printSchema()
parDF1.show(truncate=False)

# 5️⃣ SQL on Parquet Data
parDF1.createOrReplaceTempView("ParquetTable")
sqlDF = spark.sql("SELECT * FROM ParquetTable WHERE salary >= 4000")
sqlDF.show(truncate=False)

# 6️⃣ Create a Temp View directly on Parquet file
spark.sql("""
    CREATE TEMPORARY VIEW PERSON
    USING parquet
    OPTIONS (path "/tmp/output/people.parquet")
""")
spark.sql("SELECT * FROM PERSON").show()

# 7️⃣ Partition Data while Writing
df.write.partitionBy("gender", "salary") \
    .mode("overwrite") \
    .parquet("/tmp/output/people2.parquet")

# 8️⃣ Read Partitioned Parquet Data (gender=M)
parDF2 = spark.read.parquet("/tmp/output/people2.parquet/gender=M")
parDF2.show(truncate=False)

# 9️⃣ Create Temp View on Partitioned Parquet
spark.sql("""
    CREATE TEMPORARY VIEW PERSON2
    USING parquet
    OPTIONS (path "/tmp/output/people2.parquet/gender=F")
""")
spark.sql("SELECT * FROM PERSON2").show()

# 🔟 Different Save Modes Examples
df.write.mode("append").parquet("/tmp/output/people_append.parquet")   # Append
df.write.mode("overwrite").parquet("/tmp/output/people_over.parquet") # Overwrite
df.write.mode("ignore").parquet("/tmp/output/people_ignore.parquet")   # Ignore if exists
# df.write.mode("error").parquet("/tmp/output/people_error.parquet")   # Raise error if exists

spark.stop()

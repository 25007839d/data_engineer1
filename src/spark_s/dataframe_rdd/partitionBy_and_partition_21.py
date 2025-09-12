from pyspark.sql import SparkSession

# Start Spark session
spark = SparkSession.builder.master("local[1]") \
    .appName("DataFramePartitionExample").getOrCreate()

# Sample DataFrame
data = [("James", "Sales", 3000),
        ("Michael", "Sales", 4600),
        ("Maria", "Finance", 4000),
        ("Raman", "Finance", 3300),
        ("Jen", "Marketing", 3900)]

columns = ["employee", "department", "salary"]

df = spark.createDataFrame(data, columns)

# ===================================================
# 1. In-Memory Partitions (Parallelism)
# ===================================================
print("Initial number of partitions:", df.rdd.getNumPartitions())

# Repartition DataFrame into 3 partitions
df_repartitioned = df.repartition(3)
print("Number of partitions after repartition:", df_repartitioned.rdd.getNumPartitions())

# Apply a transformation to see parallel execution
print("In-memory partitions output:")
df_repartitioned.foreach(lambda row: print(row))

# ===================================================
# 2. Writing DataFrame with partitionBy() (Disk)
# ===================================================
output_path = "/tmp/employees_partitioned"

df.write.partitionBy("department").format("parquet").mode("overwrite").save(output_path)
print(f"DataFrame written to {output_path} partitioned by 'department'")

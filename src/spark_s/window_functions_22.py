from pyspark.sql import SparkSession
from pyspark.sql.functions import row_number, rank, dense_rank, lag, lead, sum, avg
from pyspark.sql.window import Window

# Start Spark session
spark = SparkSession.builder.master("local[1]") \
    .appName("WindowFunctionsExample").getOrCreate()

# Sample DataFrame
data = [
    ("James", "Sales", 3000),
    ("Michael", "Sales", 4600),
    ("Robert", "Sales", 4100),
    ("Maria", "Finance", 3000),
    ("Raman", "Finance", 3300),
    ("Scott", "Finance", 3900)
]

columns = ["employee", "department", "salary"]

df = spark.createDataFrame(data, columns)

# Define window specification: partition by department and order by salary
windowSpec = Window.partitionBy("department").orderBy("salary")

# ----------------------------
# Ranking Functions
# ----------------------------

# row_number(): unique sequential number within each partition
df = df.withColumn("row_number", row_number().over(windowSpec))

# rank(): assigns ranking with gaps for ties
df = df.withColumn("rank", rank().over(windowSpec))

# dense_rank(): assigns ranking without gaps for ties
df = df.withColumn("dense_rank", dense_rank().over(windowSpec))

# ----------------------------
# Analytic Functions
# ----------------------------

# lag(): value of previous row within the window
df = df.withColumn("prev_salary", lag("salary", 1).over(windowSpec))

# lead(): value of next row within the window
df = df.withColumn("next_salary", lead("salary", 1).over(windowSpec))

# ----------------------------
# Aggregate Functions
# ----------------------------

# sum() and avg() over window partition
df = df.withColumn("sum_salary_dept", sum("salary").over(windowSpec))
df = df.withColumn("avg_salary_dept", avg("salary").over(windowSpec))

# Show final DataFrame
df.show(truncate=False)

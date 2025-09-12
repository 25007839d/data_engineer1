from pyspark.sql import SparkSession

# Step 1: Create Spark Session and include MySQL JDBC connector jar
spark = SparkSession.builder \
    .appName("PySpark JDBC Example") \
    .config("spark.jars", "mysql-connector-java-8.0.13.jar") \
    .getOrCreate()

# Database connection properties
jdbc_url = "jdbc:mysql://localhost:3306/emp"
user = "root"
password = "root"
driver = "com.mysql.cj.jdbc.Driver"

# -------------------------------
# 1. Read Full Table using jdbc()
# -------------------------------
df1 = spark.read.jdbc(
    url=jdbc_url,
    table="employee",
    properties={"user": user, "password": password, "driver": driver}
)
print("Full Table Data:")
df1.show()

# -------------------------------
# 2. Read Full Table using format("jdbc")
# -------------------------------
df2 = spark.read.format("jdbc") \
    .option("url", jdbc_url) \
    .option("driver", driver) \
    .option("dbtable", "employee") \
    .option("user", user) \
    .option("password", password) \
    .load()
print("Full Table using format(jdbc):")
df2.show()

# -------------------------------
# 3. Read with SQL Query (specific columns + condition)
# -------------------------------
df3 = spark.read.format("jdbc") \
    .option("url", jdbc_url) \
    .option("driver", driver) \
    .option("query", "SELECT id, age FROM employee WHERE gender = 'M'") \
    .option("user", user) \
    .option("password", password) \
    .load()
print("Specific Columns with Condition:")
df3.show()

# -------------------------------
# 4. Read Table in Parallel (partitioned read)
# -------------------------------
df4 = spark.read.format("jdbc") \
    .option("url", jdbc_url) \
    .option("driver", driver) \
    .option("dbtable", "employee") \
    .option("user", user) \
    .option("password", password) \
    .option("numPartitions", 5) \
    .option("fetchsize", 20) \
    .load()
print("Parallel Read Example:")
df4.show()

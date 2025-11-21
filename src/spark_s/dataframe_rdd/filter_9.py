from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

spark = SparkSession.builder.appName("FilterExample").getOrCreate()

# Nested schema for name
schema = StructType([
    StructField("name", StructType([
        StructField("firstname", StringType(), True),
        StructField("middlename", StringType(), True),
        StructField("lastname", StringType(), True)
    ])),
    StructField("id", StringType(), True),
    StructField("gender", StringType(), True),
    StructField("salary", IntegerType(), True),
    StructField("state", StringType(), True)
])

# Sample data
data = [
    (("James",  "A", "Smith"),   "1", "M", 3000, "NY"),
    (("Michael","B", "Williams"),"2", "M", 4000, "OH"),
    (("Maria",  "C", "Jones"),   "3", "F", 4000, "CA"),
    (("Jen",    None,"Brown"),   "4", "F", 4500, "DE"),
    (("Jeff",   "D", "Williams"),"5", "M", 5000, "NH"),
    (("Kumar",  "E", "Patel"),   "6", "M", 6000, "TX")
]

# Create DataFrame
df = spark.createDataFrame(data, schema)
df.show(truncate=False)
df.printSchema()


df.filter(df.name.lastname == "Williams").show()
df.filter(df.state.startswith("N")).show()
df.filter(df.state.endswith("H"))\
    .show()

#contains
df.filter(df.state.contains("H")).show()

# Filter IS IN List values
li=["OH","CA","DE"]
df.filter(df.state.isin(li)).show()

# Filter using OR operator
df.filter( (df.state  == "OH") | (df.gender  == "M") ).show(truncate=False)

# Filter multiple conditions
df.filter( (df.state  == "OH") & (df.gender  == "M") )\
    .show(truncate=False)

# Using SQL col() function
from pyspark.sql.functions import col
df.filter(col("state") == "OH") \
    .show(truncate=False)


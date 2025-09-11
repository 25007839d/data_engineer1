# In order to create an empty PySpark DataFrame manually with schema ( column names & data types)
# first, Create a schema using StructType and StructField .
#Create Schema
from pyspark.sql.types import StructType,StructField, StringType
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder
    .appName("SparkByExamples.com")
    .config("spark.driver.extraJavaOptions", "--enable-native-access=ALL-UNNAMED")
    .config("spark.executor.extraJavaOptions", "--enable-native-access=ALL-UNNAMED")
    .getOrCreate()
)

schema = StructType([
  StructField('firstname', StringType(), True),
  StructField('middlename', StringType(), True),
  StructField('lastname', StringType(), True)
  ])

"""Now use the empty RDD created above and pass it to createDataFrame() of SparkSession along with 
the schema for column names & data types."""
from Create_Empty_1 import emptyRDD

#Create empty DataFrame from empty RDD
df = spark.createDataFrame(emptyRDD,schema)
df.printSchema() # This yields below schema of the empty DataFrame.

# Create Empty DataFrame with Schema (StructType)

#Convert empty RDD to Dataframe by  using toDF().
df1 = emptyRDD.toDF(schema)
df1.printSchema()

# Create empty DataFrame directly.
df2 = spark.createDataFrame([], schema)
df2.printSchema()

# Create Empty DataFrame without Schema (no columns)
"""To create empty DataFrame without schema (no columns) just create a empty schema
 and use it while creating PySpark DataFrame."""


df3 = spark.createDataFrame([], StructType([]))
df3.printSchema()

# Question? why empty DF
# It’s commonly used in scenarios where you want to set up a structure first and fill it later


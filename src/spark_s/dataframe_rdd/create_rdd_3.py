from pyspark.sql import SparkSession

spark = SparkSession.builder.appName('de').getOrCreate()

dept = [("Finance",10),("Marketing",20),("Sales",30),("IT",40)]

rdd = spark.sparkContext.parallelize(dept)
print(rdd.collect())

# Convert PySpark RDD to DataFrame Using rdd.toDF() function
df = rdd.toDF()
df.printSchema()
df.show(truncate=False) # using truncate=False, Does not truncate column values → prints full content, no matter how long.

# By default, toDF() function creates column names as “_1” and “_2”

#passing column and creating rdd to df
deptColumns = ['dept','dept_id']
df2 = rdd.toDF(deptColumns)
df2.printSchema()
df2.show(truncate=False)

#Using PySpark createDataFrame() function

"""SparkSession class provides createDataFrame() method to create DataFrame and
 it takes rdd object as an argument."""

deptDF = spark.createDataFrame(rdd, schema = deptColumns)
deptDF.printSchema()
deptDF.show(truncate=False)

#Using createDataFrame() with StructType schema

"""When you infer the schema, by default the datatype of the columns is derived from the data
 and set’s nullable to true for all columns. We can change this behavior by supplying schema
  using StructType – where we can specify a column name, data type and nullable for each field/column."""

from pyspark.sql.types import StructType,StructField, StringType
deptSchema = StructType([
    StructField('dept_name', StringType(), True),
    StructField('dept_id', StringType(), True) #nullable=True The column can contain NULL values
])
deptDF1 = spark.createDataFrame(rdd, schema = deptSchema)
deptDF1.printSchema()
deptDF1.show(truncate=False)

# Convert PySpark Dataframe to Pandas DataFrame
"""PySpark DataFrame provides a method toPandas() to convert it to Python Pandas DataFrame.
toPandas() results in the collection of all records in the PySpark DataFrame to the driver 
program and should be done only on a small subset of the data. running on larger dataset’s 
results in memory error and crashes the application. To deal with a larger dataset,
 you can also try increasing memory on the driver."""

pandasDF = deptDF1.toPandas()
print(pandasDF)

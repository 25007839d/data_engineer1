"""PySpark RDD/DataFrame collect() is an action operation that is used to retrieve all the elements of
the dataset (from all nodes) to the driver node. We should use the collect() on smaller dataset usually
after filter(), group() e.t.c. Retrieving larger datasets results in OutOfMemory error."""


from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("CreateDF").getOrCreate()

# Sample data as Python list of tuples
data = [("Ritu", 25), ("Sam", 30), ("Anita", 28)]

# Convert to DataFrame (Spark infers schema)
df = spark.createDataFrame(data, ["name", "age"])

df.show(2,truncate=False)

dataCollect = df.collect()
print(dataCollect)

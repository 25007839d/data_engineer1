from src.spark_s.structtype_StructField_5 import spark

data=[("James",23),("Ann",40)]

df=spark.createDataFrame(data).toDF("name.fname","gender")
df.printSchema()

# Using DataFrame object (df)
df.select(df.gender).show()
df.select(df["gender"]).show()

#Accessing column name with dot (with backticks)
df.select(df["`name.fname`"]).show()

#Using SQL col() function
from pyspark.sql.functions import col
df.select(col("gender")).show()

#Accessing column name with dot (with backticks)
df1 = df.select(col("`name.fname`")).show()

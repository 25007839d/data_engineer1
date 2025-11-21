"""PySpark withColumn() is a transformation function of DataFrame which is used to change the value,
 convert the datatype of an existing column, create a new column, and many more."""

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, lit
from pyspark.sql.types import StructType,StructField, StringType, IntegerType

schema = StructType([
    StructField("firstname",StringType(),True),
    StructField("middlename",StringType(),True),
    StructField("lastname",StringType(),True),
    StructField("id", StringType(), True),
    StructField("gender", StringType(), True),
    StructField("salary", StringType(), True)
  ])
data = [
    ("Ritu", "K", "Sharma", "1", "F", '50000'),
    ("Sam", None, "Verma", "2", "M", '60000'),
    ("Anita", "M", "Patel", "3", "F", '75000'),
    ("Raj", None, "Singh", "4", "M", '80000'),
    ("Pooja", "S", "Mehta", "5", "F", '55000')
]
spark = SparkSession.builder.appName("SchemaExample").getOrCreate()
# Create DataFrame

df = spark.createDataFrame(data=data, schema = schema)
df.printSchema()
df.show()

df2 = df.withColumn("salary",col("salary").cast("Integer"))
df2.printSchema()
df2.show()


df3 = df.withColumn("salary_new",col("salary")*100)
df3.printSchema()
df3.show()


df4 = df.withColumn("CopiedColumn", col("salary") * -1)
df4.printSchema()

df5 = df.withColumn("Country", lit("USA")) #lit() → stands for literal, used to add constants into a column expression.
df5.printSchema()

df6 = df.withColumn("Country", lit("USA")).withColumn("anotherColumn", lit("anotherValue")).withColumn("state",lit("xyz"))
df6.printSchema()

#withColumnRenamed

df.withColumnRenamed("gender", "sex").show()

df4.drop("CopiedColumn").show()




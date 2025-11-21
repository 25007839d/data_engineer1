# Create an empty RDD by using emptyRDD() of SparkContext for example spark.sparkContext.emptyRDD().
import  pyspark
from pyspark.sql import SparkSession
from pyspark.sql import SparkSession

import pandas as pd
spark = (
    SparkSession.builder
    .appName("de")
    .getOrCreate()
)


#Creates Empty RDD
emptyRDD = spark.sparkContext.emptyRDD()
print(emptyRDD)

# Alternatively you can also get empty RDD by using spark.sparkContext.parallelize([]).
#Creates Empty RDD using parallelize
rdd2= spark.sparkContext.parallelize([1,3,4,5])
print(rdd2.collect())

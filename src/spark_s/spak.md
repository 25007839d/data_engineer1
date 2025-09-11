# PySpark DataFrame
SparkSession is a unified entry point for Spark applications; it was introduced in Spark 2.0.
It acts as a connector to all Spark’s underlying functionalities, including RDDs, DataFrames, 
and Datasets, providing a unified interface to work with structured data processing. 
It is one of the very first objects you create while developing a Spark SQL application. 
As a Spark developer, you create a SparkSession using the SparkSession.builder() method

# 1 Create Empty RDD in PySpark
Create an empty RDD by using emptyRDD() of SparkContext for example spark.sparkContext.emptyRDD().

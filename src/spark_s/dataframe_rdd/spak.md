# PySpark DataFrame
SparkSession is a unified entry point for Spark applications; it was introduced in Spark 2.0.
It acts as a connector to all Spark’s underlying functionalities, including RDDs, DataFrames, 
and Datasets, providing a unified interface to work with structured data processing. 
It is one of the very first objects you create while developing a Spark SQL application. 
As a Spark developer, you create a SparkSession using the SparkSession.builder() method

# 1 Create Empty RDD in PySpark
Create an empty RDD by using emptyRDD() of SparkContext for example spark.sparkContext.emptyRDD().

# 2 Create Empty DataFrame with Schema (StructType) 
We can define the schema of your dataset up front by creating an empty DataFrame.
Useful in ETL pipelines where the schema is known but data arrives later.

# 3 Create PySpark RDD
## What is sparkContext.parallelize()?

In Spark, RDD (Resilient Distributed Dataset) is the fundamental data structure.
If we already have a Python list (or any collection) in the driver program’s memory, 
you can distribute (parallelize) it into an RDD using sc.parallelize() (where sc = SparkContext).

No schema, just raw data. Executes line by line transformations
## Why “parallelize”?

The Python list exists only in driver memory (your local machine).
When you call sc.parallelize(data), Spark splits the list into partitions and distributes
those partitions across the Spark cluster.
This means the data is now parallelized and can be processed by worker nodes in parallel.

## How Partitioning Works

`rdd = sc.parallelize(data, 3)  # force 3 partitions
print(rdd.glom().collect())`
Output:
[[1, 2], [3, 4], [5]]

# 4 show()
PySpark DataFrame show() is used to display the contents of the DataFrame in a Table Row and 
Column Format. By default, it shows only 20 Rows, and the column values are truncated at 20 characters.

# 5 StructType & StructField
When you infer the schema, by default the datatype of the columns is derived from the data
and set’s nullable to true for all columns. We can change this behavior by supplying schema
using StructType – where we can specify a column name, data type and nullable for each field/column.

# 6 Column class and select  
# 7 RDD/DataFrame collect()
PySpark RDD/DataFrame collect() is an action operation that is used to retrieve all the 
elements of the dataset (from all nodes) to the driver node. We should use the collect() 
on smaller dataset usually after filter(), group() e.t.c. Retrieving larger datasets results 
in OutOfMemory error.

# 8 withColumn() withColumnRenamed() 
PySpark withColumn() is a transformation function of DataFrame which is used to change
the value, convert the datatype of an existing column, create a new column, and many more. 

# 9 filter()
# 10 dropDuplicates() and distinct()
PySpark distinct() transformation is used to drop/remove the duplicate rows (all columns) 
from DataFrame and dropDuplicates() is used to drop rows based on selected (one or multiple) 
columns. distinct() and dropDuplicates() returns a new DataFrame.

# 11 sort() and  orderBy()
We can use either sort() (Mainly used as a shorthand.)or orderBy()(Mainly used for both order)
function of PySpark DataFrame to sort DataFrame by ascending or descending order based on 
single or multiple columns. Both methods take one or more columns as arguments and return
a new DataFrame after sorting.

# 12 Aggregation Function with GroupBy() Transformation
Similar to SQL GROUP BY clause, PySpark groupBy() transformation that is used to group rows 
that have the same values in specified columns into summary rows. It allows you to perform
aggregate functions on groups of rows, rather than on individual rows.

# 13 join()
A join in Spark is a transformation that combines two DataFrames or Datasets based on a 
common key or condition. It allows you to merge data from multiple sources, similar to 
SQL JOINs, producing a new DataFrame with rows that satisfy the join condition.

# 14 union() and unionAll()
PySpark union() and unionAll() transformations are used to merge two or more DataFrame’s of
the same schema or structure.

# 15 unionByName()

In PySpark, unionByName() is a more flexible version of union() because it merges
DataFrames based on column names rather than positions.

## Purpose:

Combine two DataFrames by matching column names.
Useful when DataFrames have columns in different orders or some missing columns.

| Method          | Behavior                                                                                                             |
| --------------- | -------------------------------------------------------------------------------------------------------------------- |
| `union()`       | Merges DataFrames **by column position**, schemas must match exactly.                                                |
| `unionByName()` | Merges DataFrames **by column name**, order does not matter. Supports missing columns if `allowMissingColumns=True`. |

# 16 UDF (User Defined Function)
In PySpark, a UDF (User Defined Function) allows you to apply custom Python functions to 
columns of a DataFrame.

# 17 apply functions
In PySpark, you can apply a function to a column in multiple ways:
withColumn(), select(), or sql().

## Notes:

withColumn() → modifies/adds a column.
select() → creates a new DataFrame with transformed columns.
sql() → useful for complex SQL-based transformations.

# 18 map and flat_map
**The map()** in PySpark is a transformation function that is used to apply a function/lambda 
to each element of an RDD (Resilient Distributed Dataset) and return a new RDD consisting 
of the result.

**PySpark flatMap()** is a transformation operation that flattens the RDD/DataFrame 
(array/map DataFrame columns) after applying the function on every element and returns 
a new PySpark RDD/DataFrame.

# 19 foreach()
foreach() is an action that applies a function to each element of an RDD or DataFrame.
It does not return a value; the function is executed for its side effects.

## Useful for:
Updating accumulators
Writing data to external storage
Logging

# 20 fillna()
In PySpark,fillna() from DataFrame class or fill() from DataFrameNaFunctions is used to
replace NULL/None values on all or selected multiple columns with either zero(0), empty
string, space, or any constant literal values.

# 21 partitionBy()

## What is a Partition in PySpark?
A partition is a chunk of data that Spark processes in parallel.
When you create a DataFrame, Spark splits the data into multiple partitions in memory.

### Advantages of partitions:
* Enables parallel processing for transformations.
* Reduces memory overhead for large datasets.
* Improves performance on distributed operations.

## What is partitionBy()?
partitionBy() is a method of DataFrameWriter used when writing a DataFrame to disk.
It splits the dataset into folders/files based on one or more column values.
Each unique value of the partition column creates a separate folder.

# 22 Window functions

## What are PySpark Window Functions?
Window functions perform calculations across a set of rows related to the current row.
Unlike regular aggregations, they return a value for every input row.

### PySpark supports three types of window functions:

* Ranking functions – e.g., row_number(), rank(), dense_rank()
* Analytic functions – e.g., lag(), lead()
* Aggregate functions – e.g., sum(), avg() used over a window

# 23 PySpark Date and Timestamp
PySpark Date and Timestamp Functions are supported on DataFrame and SQL queries and they work
similarly to traditional SQL, Date and Time are very important if you are using PySpark for ETL.

 Most of all these functions accept input as, Date type, Timestamp type, or String.
 If a String used, it should be in a default format that can be cast to date.
*     DateType default format is yyyy-MM-dd 
*     TimestampType default format is yyyy-MM-dd HH:mm:ss.SSSS
*     Returns null if the input is a string that can not be cast to Date or Timestamp.

| Function                      | Description                                       |
| ----------------------------- | ------------------------------------------------- |
| `year()`                      | Extracts year from date                           |
| `month()`                     | Extracts month from date                          |
| `next_day(date, day)`         | Returns the next specified weekday after the date |
| `weekofyear()`                | Returns the week number of the year               |
| `current_date()`              | Returns today’s date                              |
| `date_format()`               | Formats a date as a string with the given pattern |
| `to_date()`                   | Converts string to DateType                       |
| `datediff(end, start)`        | Returns the difference in days between two dates  |
| `trunc(date, "Month"/"Year")` | Truncates date to first day of month or year      |
| `to_timestamp()`              | Converts string to TimestampType                  |

# 24 json function
In PySpark, the JSON functions allow you to work with JSON data within DataFrames.
These functions help you parse, manipulate, and extract data from JSON columns or strings. 
These functions can also be used to convert JSON to a struct, map type, etc.

| Function                                  | Description                                                    |
| ----------------------------------------- | -------------------------------------------------------------- |
| `from_json(column, schema)`               | Converts a JSON string column to **MapType** or **StructType** |
| `to_json(column)`                         | Converts a MapType/StructType column back to **JSON string**   |
| `json_tuple(column, field1, field2, ...)` | Extracts multiple fields from JSON string as separate columns  |
| `get_json_object(column, jsonPath)`       | Extracts a single field from JSON string using **JSON path**   |
| `schema_of_json(lit(jsonStr))`            | Infers the **schema of a JSON string** dynamically             |


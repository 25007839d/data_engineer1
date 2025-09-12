# 1 PySpark CSV Read & Write

## Why?

* PySpark can handle huge CSV files (GBs to PBs).
* Runs in parallel across clusters → faster than Pandas.
* Flexible: can infer schema, set custom schema, handle headers, delimiters, nulls, quotes, dates.

# 2 PySpark parquet Read & Write 

Pyspark SQL provides support for both reading and writing Parquet files that automatically 
capture the schema of the original data, It also reduces data storage by 75% on average. 
Pyspark by default supports Parquet in its library hence we don’t need to add any dependency
libraries.

# 3 PySpark json Read & Write
To read JSON files into a PySpark DataFrame, users can use the json() method from the 
DataFrameReader class. This method parses JSON files and automatically infers the schema,
making it convenient for handling structured and semi-structured data.

# 4 PySpark  Read from database
To query a database table using JDBC in PySpark, you need to establish a connection to
the database, specify the JDBC URL, and provide authentication credentials if required. 
PySpark’s read.jdbc() method facilitates this process.
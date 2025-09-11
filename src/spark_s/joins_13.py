from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, IntegerType

# Start Spark session
spark = SparkSession.builder.appName("JoinExamples").getOrCreate()

# Employee DataFrame
empSchema = StructType([
    StructField("emp_id", IntegerType(), True),
    StructField("emp_name", StringType(), True),
    StructField("emp_dept_id", IntegerType(), True),
    StructField("salary", IntegerType(), True)
])

empData = [
    (1, "James", 101, 3000),
    (2, "Michael", 102, 4000),
    (3, "Robert", 103, 4000),
    (4, "Maria", 101, 5000),
    (5, "Jen", None, 2000)   # Employee without department
]

empDF = spark.createDataFrame(empData, empSchema)

# Department DataFrame
deptSchema = StructType([
    StructField("dept_id", IntegerType(), True),
    StructField("dept_name", StringType(), True)
])

deptData = [
    (101, "Sales"),
    (102, "Finance"),
    (104, "Marketing")   # Dept without employee
]

deptDF = spark.createDataFrame(deptData, deptSchema)

print("Employee Data:")
empDF.show()

print("Department Data:")
deptDF.show()

# Join Examples

# 1. Inner Join (default)
print("INNER JOIN")
empDF.join(deptDF, empDF.emp_dept_id == deptDF.dept_id, "inner").show()

# 2. Left Join
print("LEFT JOIN")
empDF.join(deptDF, empDF.emp_dept_id == deptDF.dept_id, "left").show()

# 3. Right Join
print("RIGHT JOIN")
empDF.join(deptDF, empDF.emp_dept_id == deptDF.dept_id, "right").show()

# 4. Full Outer Join
print("FULL OUTER JOIN")
empDF.join(deptDF, empDF.emp_dept_id == deptDF.dept_id, "outer").show()

# 5. Left Semi Join (only left matching rows)
print("LEFT SEMI JOIN")
empDF.join(deptDF, empDF.emp_dept_id == deptDF.dept_id, "left_semi").show()

# 6. Left Anti Join (only left non-matching rows)
print("LEFT ANTI JOIN")
empDF.join(deptDF, empDF.emp_dept_id == deptDF.dept_id, "left_anti").show()

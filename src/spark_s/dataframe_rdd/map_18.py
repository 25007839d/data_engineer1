from pyspark.sql import SparkSession

# Start Spark session
spark = SparkSession.builder.master("local[1]") \
    .appName("RDDFlatMapExample").getOrCreate()

# Sample data: list of sentences
data = ["Project Gutenberg’s Alice’s Adventures in Wonderland",
        "Project Gutenberg’s Adventures in Wonderland",
        "Project Gutenberg’s"]

# Create RDD from list
rdd = spark.sparkContext.parallelize(data)

# 1. map() transformation: convert each sentence to (sentence, 1)
rdd_mapped = rdd.map(lambda x: (x, 1))
print("After map():")
for element in rdd_mapped.collect():
    print(element)

# 2. flatMap() transformation: split each sentence into words
rdd_flat_mapped = rdd.flatMap(lambda x: x.split(" "))
print("\nAfter flatMap():")
for element in rdd_flat_mapped.collect():
    print(element)

# 3. Map each word to (word, 1) for word count
word_mapped = rdd_flat_mapped.map(lambda x: (x, 1))

# 4. reduceByKey() to count occurrences of each word
word_count_rdd = word_mapped.reduceByKey(lambda a, b: a + b)
print("\nWord Count:")
for element in word_count_rdd.collect():
    print(element)

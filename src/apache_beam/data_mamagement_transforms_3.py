import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam import window

if __name__ == '__main__':
    options = PipelineOptions()
    with beam.Pipeline(options=options) as p:

        # -----------------------
        # 1. Create: PCollection from in-memory list
        # -----------------------
        in_memory_data = p | "Create In-Memory Data" >> beam.Create([
            ("Alice", "HR", 50000),
            ("Bob", "Finance", 60000),
            ("Charlie", "IT", 55000)
        ])

        in_memory_data | "Print In-Memory" >> beam.Map(print)

        # -----------------------
        # 2. Read CSV
        # -----------------------
        employees = (
            p
            | "Read CSV" >> beam.io.ReadFromText("data/employees.csv", skip_header_lines=1)
            | "Split CSV" >> beam.Map(lambda line: line.split(","))
        )

        # -----------------------
        # 3. Flatten: Merge in-memory data and CSV data
        # -----------------------
        # For flatten, we need PCollections of same structure
        csv_as_tuple = employees | "CSV to Tuple" >> beam.Map(lambda x: (x[1], x[5], int(x[4])))
        merged = (
            (in_memory_data, csv_as_tuple)
            | "Flatten PCollections" >> beam.Flatten()
            | "Print Flatten" >> beam.Map(print)
        )

        # -----------------------
        # 4. Partition: Split employees into two groups based on salary > 60000
        # -----------------------
        def partition_fn(element, num_partitions):
            return 0 if element[2] <= 60000 else 1  # 0 = <=60k, 1 = >60k

        partitions = merged | "Partition Salary" >> beam.Partition(partition_fn, 2)

        partitions[0] | "Print <=60k" >> beam.Map(print)
        partitions[1] | "Print >60k" >> beam.Map(print)

        # -----------------------
        # 5. Reshuffle: Break fusion
        # -----------------------
        reshuffled = (
            employees
            | "Reshuffle Data" >> beam.Reshuffle()
            | "Print Reshuffled" >> beam.Map(print)
        )

        # -----------------------
        # 6. WindowInto: Fixed windows of 1 minute
        # -----------------------
        windowed = (
            employees
            | "Assign Window" >> beam.WindowInto(window.FixedWindows(60))
            | "Print Windowed" >> beam.Map(print)
        )

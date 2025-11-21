import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions

# ---------------------------
# 1. Composite Transform
# ---------------------------
class FormatEmployeeInfo(beam.PTransform):
    def expand(self, pcoll):
        return (
            pcoll
            | "Select Name and Dept" >> beam.Map(lambda x: (x[1], x[5]))
            | "Add Dept Prefix" >> beam.Map(lambda x: (x[0], f"Dept-{x[1]}"))
        )

# ---------------------------
# 2. Side Input DoFn
# ---------------------------
class AdjustSalary(beam.DoFn):
    def process(self, element, bonus_dict):
        # bonus_dict is passed as side input
        name, dept, salary = element[1], element[5], int(element[4])
        bonus = bonus_dict.get(dept, 0)
        yield (name, dept, salary + bonus)

# ---------------------------
# 3. Side Output DoFn
# ---------------------------
class SplitBySalary(beam.DoFn):
    def process(self, element):
        if element[2] > 60000:
            yield beam.pvalue.TaggedOutput("high_salary", element)
        else:
            yield beam.pvalue.TaggedOutput("low_salary", element)

# ---------------------------
# Pipeline
# ---------------------------
if __name__ == '__main__':
    options = PipelineOptions()
    with beam.Pipeline(options=options) as p:

        # Read CSV
        employees = (
            p
            | "Read CSV" >> beam.io.ReadFromText("data/employees.csv", skip_header_lines=1)
            | "Split CSV" >> beam.Map(lambda line: line.split(","))
        )

        # -----------------------
        # Composite Transform
        # -----------------------
        formatted = employees | "Format Employee Info" >> FormatEmployeeInfo()
        formatted | "Print Composite Transform" >> beam.Map(print)

        # -----------------------
        # Side Input Example
        # -----------------------
        # Bonus per department
        bonus_dict = {"HR": 5000, "Finance": 7000, "IT": 6000, "Sales": 8000, "Marketing": 7500}
        adjusted_salary = (
            employees
            | "Adjust Salary with Side Input" >> beam.ParDo(AdjustSalary(), bonus_dict)
            | "Print Adjusted Salary" >> beam.Map(print)
        )

        # -----------------------
        # Side Output Example
        # -----------------------
        split_result = (
            employees
            | "Split By Salary" >> beam.ParDo(SplitBySalary()).with_outputs("high_salary", "low_salary")
        )

        split_result.high_salary | "Print High Salary" >> beam.Map(print)
        split_result.low_salary  | "Print Low Salary"  >> beam.Map(print)

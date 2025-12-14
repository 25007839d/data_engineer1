import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
from transforms import parse_employee, parse_department, left_join

def run():
    options = PipelineOptions(save_main_session=True)
    with beam.Pipeline(options=options) as p:

        employees = (
            p
            | "Read Employees" >> beam.io.ReadFromText(
                options.view_as(PipelineOptions).input_employees,
                skip_header_lines=1
            )
            | "Parse Employees" >> beam.Map(parse_employee)
            | "Filter Active" >> beam.Filter(lambda x: x["is_active"] == "Y")
        )

        departments = (
            p
            | "Read Departments" >> beam.io.ReadFromText(
                options.view_as(PipelineOptions).input_departments,
                skip_header_lines=1
            )
            | "Parse Departments" >> beam.Map(parse_department)
        )

        joined = left_join(employees, departments)

        (
            joined
            | "To CSV" >> beam.Map(
                lambda x: f'{x["emp_id"]},{x["emp_name"]},{x["dept_id"]},{x["salary"]},{x.get("dept_name","")},{x.get("location","")}'
            )
            | "Write Output" >> beam.io.WriteToText(
                options.view_as(PipelineOptions).output_path,
                file_name_suffix=".csv",
                shard_name_template="-SS"
            )
        )

if __name__ == "__main__":
    run()

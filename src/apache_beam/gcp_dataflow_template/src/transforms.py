import apache_beam as beam

def parse_employee(line):
    emp_id, emp_name, dept_id, salary, is_active = line.split(",")
    return {
        "emp_id": emp_id.strip(),
        "emp_name": emp_name.strip(),
        "dept_id": dept_id.strip(),
        "salary": int(salary.strip()),
        "is_active": is_active.strip()
    }

def parse_department(line):
    dept_id, dept_name, location = line.split(",")
    return {
        "dept_id": dept_id.strip(),
        "dept_name": dept_name.strip(),
        "location": location.strip()
    }

def left_join(employees, departments):
    emp_kv = employees | beam.Map(lambda x: (x["dept_id"], x))
    dept_kv = departments | beam.Map(lambda x: (x["dept_id"], x))

    return (
        {"emp": emp_kv, "dept": dept_kv}
        | beam.CoGroupByKey()
        | beam.FlatMap(flatten)
    )

def flatten(element):
    _, groups = element
    dept = groups["dept"][0] if groups["dept"] else {}
    for emp in groups["emp"]:
        yield {**emp, "dept_name": dept.get("dept_name",""), "location": dept.get("location","")}

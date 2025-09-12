import csv
import json
import os

csv_file = "data.csv"
json_file = "data.json"

if os.path.exists(csv_file):
    data = []

    # --- Open CSV ---
    f = open(csv_file, mode='r')
    csv_reader = csv.DictReader(f)
    for row in csv_reader:
        data.append(row)
    f.close()  # ✅ close CSV file

    # --- Write JSON ---
    f = open(json_file, mode='w')
    json.dump(data, f, indent=4)
    f.close()  # ✅ close JSON file

    print(f"✅ {csv_file} successfully converted to {json_file}")
else:
    print(f"❌ File not found: {csv_file}")

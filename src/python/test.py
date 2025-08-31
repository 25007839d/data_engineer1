# Fibonacci series
n = 1000
a = 0
b = 1


# fibo = 0,1,1,2,3,5....

for _ in range(1000):
    # print(c)
    # a = b
    # b = c
    # c= a+b
    # a , b = b, a+b
    a =b
    b =a+b
    # c = a+b
    # print('a',a)
    # print('b',b)

    # if b > 1001:
    #     break
    # print('its a fibon number',b)




# Global variable
x = 10   # global variable


def update_global():
    # global x   # tell Python to use global x
    x=10
    x = x + 5
    print('internal',x)
update_global()
print('external',x)   # Output: 15


# read file and apply transform
#  HW
import csv
import json
import os

csv_file = r"C:\Users\RITU\PycharmProjects\data_engineer1\python\session8\pandas_module\data\department.csv"
json_file = "data.json"

if os.path.exists(csv_file):
    data = []

    # --- Open CSV ---
    f = open(csv_file, mode='r')
    csv_reader = csv.DictReader(f)
    for row in csv_reader:
        d = {}
        d['city'] = row['city'].upper()
        d['dept_id'] = row['dept_id']
        d['dept_name'] = row['name'].upper()

        print(d)
        data.append(d)
    f.close()  # ✅ close CSV file

    # --- Write JSON ---
    f = open(json_file, mode='w')
    json.dump(data, f, indent=4)
    f.close()  # ✅ close JSON file

    print(f"✅ {csv_file} successfully converted to {json_file}")
else:
    print(f"❌ File not found: {csv_file}")




import argparse

# Step 1: Create parser
parser = argparse.ArgumentParser(description="Simple Argument Parser Example")

# Step 2: Add arguments
parser.add_argument("--name", type=str, help="Enter your name")
parser.add_argument("--age", type=int, help="Enter your age")

# Step 3: Parse arguments
args = parser.parse_args()

# Step 4: Use arguments
print(f"Hello, {args.name}! You are {args.age} years old.")


# kwargs
def show_details(**kwargs):
    print(kwargs)     # kwargs is a dictionary
    for key, value in kwargs.items():
        print(f"{key} = {value}")

show_details(name="Rahul", age=25, city="Delhi")

# args
def add_numbers(*args):

    li = list(args)
    print(type(li))          # args is a tuple
    return sum(args)

print(add_numbers(1, 2, 3, 4))   # 10

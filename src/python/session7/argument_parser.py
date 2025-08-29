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


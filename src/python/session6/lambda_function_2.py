# 1. Simple Lambda
square = lambda x: x * x
print(square(5))   # Output: 25

# 2. Lambda with Multiple Arguments
add = lambda a, b: a + b
print(add(10, 20))   # Output: 30

# 3. Using Lambda with map()
nums = [1, 2, 3, 4, 5]
squares = list(map(lambda x: x**2, nums))
print(squares)   # Output: [1, 4, 9, 16, 25]

# 4. Using Lambda with filter()
nums = [10, 15, 20, 25, 30]
even_nums = list(filter(lambda x: x % 2 == 0, nums))
print(even_nums)   # Output: [10, 20, 30]



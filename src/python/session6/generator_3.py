# Normal function (returns a list - consumes memory):
def get_squares(n):
    result = []
    for i in range(n):
        result.append(i*i)
    return result

print(get_squares(5))   # [0, 1, 4, 9, 16]


# Generator (returns values one by one):
def get_squares_gen(n):
    for i in range(n):
        yield i*i

gen = get_squares_gen(5)
print(next(gen))  # 0
print(next(gen))  # 1
print(list(gen))  # [4, 9, 16]


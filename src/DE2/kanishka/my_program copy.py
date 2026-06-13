# 1. Print “Hello Python”
print("Hello Python")

# 2. Add two numbers entered by user
a = int(input("\nEnter first number: "))
b = int(input("Enter second number: "))
print("Sum =", a + b)

# 3. Find square of a number
num = int(input("\nEnter number: "))
print("Square =", num ** 2)

# 4. Swap two numbers
x = int(input("\nEnter first number: "))
y = int(input("Enter second number: "))
x, y = y, x
print("After swap:", x, y)

# 5. Calculate simple interest
p = float(input("\nEnter principal: "))
r = float(input("Enter rate: "))
t = float(input("Enter time: "))
si = (p * r * t) / 100
print("Simple Interest =", si)

# 6. Area of circle
radius = float(input("\nEnter radius: "))
area = 3.14 * radius ** 2
print("Area =", area)

# 7. Celsius to Fahrenheit
c = float(input("\nEnter temperature in Celsius: "))
f = (c * 9/5) + 32
print("Fahrenheit =", f)

# 8. Even or odd
n = int(input("\nEnter number: "))
if n % 2 == 0:
    print("Even")
else:
    print("Odd")

# 9. Largest of two numbers
a = int(input("\nEnter first number: "))
b = int(input("Enter second number: "))
print("Largest =", max(a, b))

# 10. Largest of three numbers
a = int(input("\nEnter first number: "))
b = int(input("Enter second number: "))
c = int(input("Enter third number: "))
print("Largest =", max(a, b, c))


# ================= DATA TYPES =================

# 11. Print datatype
x = 10
y = 10.5
z = "Hello"
print("\nDatatypes:", type(x), type(y), type(z))

# 12. Integer, float, complex
a = 5
b = 5.5
c = 2 + 3j
print(a, b, c)

# 13. Real and imaginary part
comp = 4 + 5j
print("Real:", comp.real, "Imaginary:", comp.imag)

# 14. Boolean operations
print(True and False)
print(True or False)

# 15. type() function
print(type(100))


# ================= STRING PROGRAMS =================

# 16. Uppercase
s = input("\nEnter string: ")
print(s.upper())

# 17. Lowercase
print(s.lower())

# 18. Length of string
print("Length =", len(s))

# 19. Count characters
print("Characters =", len(s))

# 20. Check word exists
word = input("Enter word to search: ")
print(word in s)

# 21. Reverse string
print("Reversed =", s[::-1])

# 22. Replace word
old = input("Enter word to replace: ")
new = input("Enter new word: ")
print(s.replace(old, new))


# ================= LIST PROGRAMS =================

# 23. Create list
lst = [1, 2, 3, 4, 5]
print("\nList:", lst)

# 24. Append
lst.append(6)
print(lst)

# 25. Insert
lst.insert(2, 10)
print(lst)

# 26. Remove
lst.remove(10)
print(lst)

# 27. Sort
lst.sort()
print(lst)

# 28. Reverse
lst.reverse()
print(lst)

# 29. Count element
print(lst.count(2))

# 30. Largest in list
print("Max =", max(lst))


# ================= TUPLE PROGRAMS =================

# 31. Create tuple
t = (1, 2, 3, 4, 5)
print("\nTuple:", t)

# 32. Count occurrences
print(t.count(2))

# 33. Index of element
print(t.index(3))


# ================= DICTIONARY =================

# 34. Create dictionary
student = {"name": "Kanishka", "age": 20, "course": "CS"}
print("\nStudent:", student)

# 35. Add key-value
student["city"] = "Delhi"
print(student)

# 36. Display keys and values
print(student.keys())
print(student.values())


# ================= LOOPS =================

# 37. While loop 1–10
i = 1
while i <= 10:
    print(i, end=" ")
    i += 1

# 38. For loop 1–10
print("\n")
for i in range(1, 11):
    print(i, end=" ")

# 39. Even numbers 1–20
print("\n")
for i in range(1, 21):
    if i % 2 == 0:
        print(i, end=" ")

# 40. Multiplication table
num = int(input("\nEnter number for table: "))
for i in range(1, 11):
    print(num, "x", i, "=", num * i)

# 41. Sum 1 to n
n = int(input("\nEnter n: "))
print("Sum =", sum(range(1, n + 1)))

# 42. Reverse using range
for i in range(10, 0, -1):
    print(i, end=" ")

# 43. Break example
for i in range(1, 6):
    if i == 3:
        break
    print(i)

# 44. Continue example
for i in range(1, 6):
    if i == 3:
        continue
    print(i)


# ================= ARRAY =================

# 45. Create array
import array
arr = array.array('i', [1, 2, 3, 4])
print("\nArray:", arr)

# 46. Insert element
arr.append(5)
print(arr)

# 47. Display array
for i in arr:
    print(i, end=" ")



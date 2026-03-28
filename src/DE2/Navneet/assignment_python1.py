print("Hellow world") #Print hellow world

number1 = int(input("Enter first number")) #addition of two number
number2 = int(input("Enter second number"))
c = number1 + number2
print(c)

number = int(input("Enter a number")) #multiplacation
c=number*number
print(c)

a = int(input("Enter value of a  number")) #wping of two number
b = int(input("Enter value of b number"))
temp=a
a=b
b=temp
print("after swping a",a)
print("after swaping b",b)

p = int (input("Enter  value of P")) # area of circle
r = float(input("Enter value of R"))
t = float(input("Enter value of t"))
SI = p*r*t/100
print("Simple interst", SI)

number = int(input("Enter  a number"))# print even odd number
if number % 2 == 0:
    print("even number")
else:
    print("odd number")

number1 = int(input("Enter the first number"))# check grater less
number2 = int(input("Enter second number"))
if number1 > number2:
    print("number firest is grater", number1)
else:
    print(" number second is grater", number2)
    
a = 5 #check data type
b = 'Dinesh'
c = 2.30
d = 3 + 4j
e = True
i = [1,2,4,5,'ramesh']
j = {3,6,7,8,3}
h = (2,4,7,9,)
z = {"a": 1, "b": 2} 
print(type(a))
print(type(b))
print(type(c))
print(type(d))
print(type(e))
print(type(i))
print(type(j))
print(type(h))
print(type(z))

a = 5 + 7j # check real & imagery
print("real part",a.real)
print("imaginery part", a.imag)


a = True
b = False
print("Value of a:", a)
print("Value of b:", b)

text = input("Enter a string: ")
uppercase_text = text.upper()
print("Uppercase string:", uppercase_text)


text = input("Enter a string: ")
Lowercase_text = text.lower()
print("Lowerrcase string:", Lowercase_text)

text = input("Enter a string: ") # count lenth
length = len(text)
print("Length of the string is:", length)


text = input("Enter a string: ")
count = len(text)
print("Number of characters:", count)

text = input("Enter a string: ")
word = input("Enter the word to search: ")
if word in text:
    print("Word exists in the string")
else:
    print("Word does not exist in the string")



text = input("Enter a string: ") # reverse string
reversed_text = text[::-1]
print("Reversed string:", reversed_text)

text = input("Enter a string: ")
old_word = input("Enter the word to replace: ")
new_word = input("Enter the new word: ")

updated_text = text.replace(old_word, new_word) #replace word
print("Updated string:", updated_text)

numbers = []
for i in range(5):
    num = int(input(f"Enter number {i+1}: "))
    numbers.append(num)
print("List of numbers:", numbers)
##############
numbers = []
# Adding elements
numbers.append(10)
numbers.append(20)
numbers.append(30)
numbers.append(40)
numbers.append(50)
print("List after adding elements:", numbers)
#Inserting element 
numbers = [10, 20, 30, 40, 50]
# Taking input
element = int(input("Enter element to insert: "))
position = int(input("Enter position (index): "))
numbers.insert(position, element)
print("Updated list:", numbers)
#sorting list
list1 = [9,2,3,5,7]
list.sort(list1)
print(list1)
#reverse list
list1 = [9,2,3,5,7]
list.reverse(list1)
print(list1)
#count number occerance element
num= [3,4,8,3,6,8,3,2]
temp = 3
count = num.count(temp)
print("temp appears", count)
#printlargestnumber
num = [10, 45, 23, 89, 67]
largest = num[0]
for i in num:
    if i > largest:
        largest = i
print("Largest number is:", largest)
#creat tuple
a = int(input("Enter element 1: "))
b = int(input("Enter element 2: "))
c = int(input("Enter element 3: "))
d = int(input("Enter element 4: "))
e = int(input("Enter element 5: "))
t = (a, b, c, d, e)
print("Tuple is:", t)
# number of occerance element
t = (10, 20, 10, 30, 10, 40)
value = 10
result = t.count(value)
print("Value appears", result)
#search element
t = (10, 20, 30, 40, 50)
x = int(input("Enter element to find index: "))
if x in t:
    print("Index is:", t.index(x))
else:
    print("Element not found")

#create dic
student = {
    "name": "Navneet",
    "roll_no": 101,
    "class": "10th",
    "marks": 85
}
print(student)
#add new value in dic
student = {
    "name": "Navneet",
    "roll_no": 101
}
student["marks"] = 90
print(student)
#pint 1-10
i = 1
while i <= 10:
    print(i)
    i = i+1
#
for i in range(1,11):
    print(i)

# print even
for i in range(1, 21):
    if i % 2 == 0:
        print(i)
#
num = int(input("Enter a number: "))
for i in range(1, 11):
    print(num, "x", i, "=", num * i)

#
n = int(input("Enter a number: "))
sum = 0
for i in range(1, n + 1):
    sum += i
print(sum)

n = int(input("Enter a number: "))
for i in range(n, 0, -1):
    print(i)

#   
for i in range(1, 11):
    if i == 6:
        break   
    print(i)

#
for i in range(1, 11):
     if i == 6:
      continue
     print(i)

# pattern
for i in range(1, 7):
    for j in range(i):
        print("#", end=" ")
    print()
aa=10



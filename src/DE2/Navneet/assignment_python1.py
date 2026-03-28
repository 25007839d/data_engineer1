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

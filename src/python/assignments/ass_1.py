# 1.	Python program to add two numbers
# def add(a,b):
#     c=a+b
#     return c
# b=add(4,7)
# print(b)

# def decor1(func):
#     def inner():
#         x=func()
#         return x*10
#     return inner
# def decore2(func):
#     def inner():
#         x=func()
#         return x*2
#     return inner
# @decore2
# @decor1
# def add():
#     return 10
# print(add())
#====adding 2 number with decorator
# def double_deco(fun):
#    def inner(x, y):
#       print("****************")
#       result = fun(x, y)   # call dash_deco wrapped function
#       print("****************")
#       return result
#    return inner
#
# def dash_deco(fun):
#    def inner(x, y):
#       print("======start=======")
#       result = fun(x, y)
#       print(result)                # ✅ print result in between
#       print("======end=======")
#       return result
#    return inner
#
# @double_deco
# @dash_deco
# def add(x, y):
#    return x + y
#
# a = add(4, 6)

#==========generator function with yield
# def gen(n):
#     for i in n:
#         yield i
# n=[2,3,4,5]
# ob=gen(n)
# print(next(ob))
# print(next(ob))
# print(next(ob))



# 2.	Maximum of two numbers in Python
# a= int(input("enter"))
# b=int(input("enter"))
# if a>b:
#     print("a is greater")
# else:
#     print("b is greater")



# 3.	Python Program for factorial of a number
# fact=1
# n=int(input("enter"))
# for i in range(1,n+1):
#     fact=fact*i
# print(fact)

# 4.	Python Program for simple interest
# p=100
# i=8
# r=2
# s=(p*i*r)/100
# print(s)




# 5.	Python Program for compound interest
# 6.	Python Program to check Armstrong Number
# num=int(input("enter"))
# temp=num
# rem=0
# sum=0
# while temp>0:
#     rem=temp%10
#     sum=sum+rem**3
#     temp=temp//10
# if sum==num:
#     print("This is a armstrong num")
# else:
#     print("This is not a armstrong no")


# 7.	Python Program for Program to find area of a circle
# 8.	Python program to print all Prime numbers in an Interval
# a = 10
#
# p =0
# for i in range(2,a+1):
#    if i % 2 == 0:
#       p =1
#       break
#
# if p ==1:
#       print('number is not a prime',a)
# else:
#       print('its a prime number', a)

# 9.	Python program to check whether a number is Prime or not
# num=int(input("enter"))
# count=0
# for i in range(1,num+1):
#     if num%i==0:
#         count=count+1
# if count==2:
#     print("This is a prime number")
# else:
#     print("This is not a prime no")



# 10.	Python Program for n-th Fibonacci number
# num=int(input("enter"))

# x=0
# y=1
# z=0
# while num>=z:
#     x=y
#     y=z
#     z=x+y
#     print(y)


# 11.	Python Program for How to check if a given number is Fibonacci number?
#
# n = 10
# a=0
# b=1
#
# c=0
# for _ in range(n):
#     a,b = b,a+b
#     if n==b:
#
#             c= 1
# if c ==1:
#         print('its a fibonachi number')
# else:
#     print('its not a fibon achi number')
# 12.	Python Program for n\’th multiple of a number in Fibonacci Series
# 13.	Program to print ASCII Value of a character
# we have to use ord() for character

# ch="h"
# print(ord(ch))
# sp="@"
# print(ord(sp))




# 14.	Python Program for Sum of squares of first n natural numbers
# sum=0
# for i in range(1,4+1):
#     sum=sum+i**2
# print(sum)



# 15.	Python Program for cube sum of first n natural numbers
# List Programs:

# sum=0
# for i in range(1,3+1):
#     sum=sum+i**3
# print(sum)

# 16.	Python program to interchange first and last elements in a list
# l=[4,6,8,9,5]
# l[0],l[-1]=l[-1],l[0]
# print(l)
#
# f_ele=l.pop(0)
# s_ele=l.pop(3-1)
# l.insert(0,s_ele)
# l.insert(3,f_ele)
# print(l)

# 17.	Python program to swap two elements in a list
# 18.	Python | Ways to find length of list
l=[2,3,4,5,6]
# ln=len(l)
# print(ln)

# ===with for loop

count = 0
for _ in l:
    count +=1

print(f"length of list is {count}")

# 19.	Python | Ways to check if element exists in list
# n=int(input("enter"))
# l=[2,3,4,5,6]
# if n in l:
#     print("num is in list")
# else:
#     print("num is not in list")




# 20.	Different ways to clear a list in Python
# l=[2,3,4,]
# m=l.clear()
# print(m)

#2nd way
# l= []

# 3rd way
# for _ in range(len(l)):
#     l.pop()
# print(l)

# 21.	Python | Reversing a List
l=[2,3,4,]
# new=[]
# l2=len(l)
# for i in range(l2):
#     new.append(l[l2-1])
#     l2=l2-1
# print(new)

# 2nd way
print(l[::-1])

# 22.	Python program to find sum of elements in list
# l=[2,3,4,]
# sum=0
# for i in l:
#     sum=sum+i
# print(sum)



# 23.	Python | Multiply all numbers in the list
# l=[2,3,4,]
# mul=1
# for i in l:
#     mul *= i
# print(mul)



# 24.	Python program to find smallest number in a list
# l=[2,3,4,6,4]
# n=min(l)
# print(n)
# l.sort(reverse=True)
# print(l)
# n=[]
# for i in l:
#     n.append(i)
# print(min(n))
# print(max(n))

#2nd way
# l = [3,7,6,1,7,5,458,25,7,5]
# a=0
# b=0
# c=0
# for i in l:
#     if i>a:
#         b=a
#         a=i
#     elif b<i and i!=b and b<a:
#         b=i
#
# print("max number in a list",a)
# print("2max number in a list",b)




# 25.	Python program to find largest number in a list
# new=[]
# for i in l:
#     new.append(i)
# print(max(new))



# 26.	Python program to find second largest number in a list
# 27.	Python program to find N largest elements from a list
# l=[2,3,9,7,6,4]
#
# l.sort()
# print(l)
# print(l[-2])

# 2nd way
#2nd way
# l = [3,7,6,1,7,5,458,25,7,5]
# a=0
# b=0
# c=0
# for i in l:
#     if i>a:
#         b=a
#         a=i
#     elif b<i and i!=b and b<a:
#         b=i
#
# print("max number in a list",a)
# print("2max number in a list",b)

# 28.	Python program to print even numbers in a list
# l=[2,3,9,7,6,4]
# k=[]
# for i in l:
#     if i%2==0:
#         k.append(i)
# print(k)




# 29.	Python program to print odd numbers in a List

# l=[2,3,9,7,6,4]
# k=[]
# for i in l:
#     if i%2!=0:
#         k.append(i)
# print(k)


# 30.	Python program to print all even numbers in a range
# for i in range(1,20+1):
#     if i%2==0:
#         print(i)

# 31.	Python program to print all odd numbers in a range
# for i in range(1,20+1):
#     if i%2!=0:
#         print(i)

# 32.	Python program to print positive numbers in a list
# l=[3,4,5,0,-7,-8]
# d=[i for i in l if i>=0]

# in a set
# ne= {i for i in l if i>0}

# in a duct
# di = {i:i for i in l if i>0}
# print(d)
# print(ne)
# print(di)
#
# f=list(filter(lambda x:x>=0,l))
# print(f)

# 33.	Python program to print negative numbers in a list
# l=[3,4,5,0,-7,-8]
# d=[i for i in l if i<0]
# print(d)
# f=list(filter(lambda x:x<0,l))
# print(f)


# 34.	Python program to print all positive numbers in a range
# n= []
# for i in range(-10,20):
#     print(i)
#     if i >0:
#         n.append(i)
#
# print(n)
# 35.	Python program to print all negative numbers in a range
# 36.	Remove multiple elements from a list in Python
# l=[2,2,4,5,7,9]
# m=set(l)
# print(m)



# 37.	Python – Remove empty List from List
# l=[2,2,4,5,7,9,[]]
# n=[]
# for i in l:
#     if i == []:
#         pass
#     else:
#         n.append(i)

# or 2nd method
# l.remove([])

# print(n)
# print(l)


# 38.	Python | Cloning or Copying a list
# l=[2,5,8,6,9]
# n=[]
# for i in l:
#     n.append(i%2==0)
#     n.append(i**2)
#     n.append(i**3)
#
# print(n)


# 39.	Python | Count occurrences of an element in a list
# l=[2,5,8,6,9,3,3]
# ln=[]
# for i in l:
#     ln.append(i)
# t=ln.count(3)
# print(t)

# 2nd method, all element count
# di = {}
# for i in l:
#     if i in di.keys():
#         di[i] +=1
#     else:
#         di[i]= 1
#
# print(di)

# 40.	Python | Remove empty tuples from a list
# l=[2,2,4,5,7,9,()]
# n=[]
# for i in l:
#     n.append(i)
# n.remove(())
# print(n)


# 41.	Python | Program to print duplicates from a list of integers
# from collections import Counter
l=[2,2,4,5,7,9,9]
# d=Counter(l)
#
# n=[i for i in l if d[i]>1]
# print(n)

# 2nd method
# new=[]
# for i in l:
#     n=l.count(i)
#     if n>1:
#             new.append(i)
# print(new)

# 3rd meth
#
# di = {}
# new_l =[]
# for i in l:
#     if i in di.keys():
#         new_l.append(i)
#     else:
#         di[i]= 1
# print(new_l)



# 42.	Python program to find Cumulative sum of a list
# l=[2,2,4,5,7,9,9]
# n=[]
# cum=0
#
# for i in l:
#     cum=cum+i
#
#     n.append(cum)
# print(n)




# 43.	Python | Sum of number digits in List

# 44.	Break a list into chunks of size N in Python
# 45.	Python | Sort the values of first list using second lis
# l=[2,3,9,4,5,7]
# m=[]
# for i in l:
#     m.append(i)
# m.sort()
# print(m)


# String Programs:
# 1.	Python program to check if a string is palindrome or not
#
# s=(input("enter"))
#
# n_s =''
# count = 1
#
# for i in s:
#     n_s = n_s + s[-count]
#     count  +=1
# if n_s==s:
#     print("this is a palidrom")
# else:
#     print("this is not a")




# 2.	Python program to check whether the string is Symmetrical or Palindrome
# s=input("enter")
#
#
# n_s =''
# count = 1
#
# for i in s:
#     n_s = n_s + s[-count]
#     count  +=1
# if n_s==s:
#     print("this is a palidrom")
# else:
#     print("this is not a")

# Symmetrical
# h_l = round(len(s)/2)
#
# f_h_s = s[:h_l]
# l_h_s = s[h_l::]
#
# print(h_l)
# print(f_h_s)
# print(l_h_s)
#
# if f_h_s == l_h_s:
#     print('its a Symmetrical ')
# else:
#     print('not Symmetrical')

# 4.	Ways to remove i’th character from string in Python
# s='fghfgh'
# for i in s:
#     if i=='h':
#         break
#     print(i)



# 5.	Python | Check if a Substring is Present in a Given String
# t=input("enter")
# s='this is my friend'
# if t in s:
#     print("this is in s")
# else:
#     print("this is not in ")


# 6.	Python – Words Frequency in String Shorthands

# s='dfghjghj'
# j=''
# for i in s:
#     j=j+i
# b=j.count('g')
# print(b)
# d={}
# for i in s:
#     if i in d.keys():
#         d[i]=d[i]+1
#     else:
#         d[i]=1
# print(d)



# 7.	Python – Convert Snake case to Pascal case
# 8.	Find length of a string in python (4 ways)
# s='fghjfghj'
# l=len(s)
# print(l)

# 9.	Python program to print even length words in a string
# s='this is my boll'
# sp=s.split(" ")
# print(sp)
# for i in sp:
#     print(i)
# l=len(sp)
# for i in range(l):
#     print(i)

# 10.	Python program to accept the strings which contains all vowels





# 11.	Python | Count the Number of matching characters in a pair of string
# 12.	Remove all duplicates from a given string in Python
# from collections import Counter
# s='dfghjghjgh'
# l=len(s)
# k=Counter(s)
# print(k)
# n=[i for i in s if k[i]>1]
# print(n)


# 13.	Python – Least Frequent Character in String

# s ='djbfjdjgjssgjj'
# d={}
# for i in s:
#     if i in d.keys():
#         d[i]=d[i]+1
#     else:
#         d[i]=1
#
# min_ch = [i for i,k in d.items() if k == min(d.values())]
# print('min fre char is', min_ch)

# 14.	Python | Maximum frequency character in String
# s ='djbfjdjgjssgjj'
# d={}
# for i in s:
#     if i in d.keys():
#         d[i]=d[i]+1
#     else:
#         d[i]=1
#
# min_ch = [i for i,k in d.items() if k == max(d.values())]
# print('max fre char is', min_ch)
# 15.	Python | Program to check if a string contains any special character
# import re
# my_str=input("enter")
#
# regex=re.compile('[@_!#%^&*()?/{}~:]')
# if (regex.search(my_str)==None):
#     print("str does not have any special character")
# else:
#     print("contains special character")


# 17.	Find words which are greater than given length k

# Program to find words greater than length k

# # take input
# s = input("Enter a string: ")
# k = int(input("Enter the length k: "))
#
# # split string into words
# words = s.split()
#
# # filter words whose length > k
# result = [word for word in words if len(word) > k]
#
# print(f"Words greater than length {k}:", result)





# 18.	Python program for removing i-th character from a string

# str='geekforgeek'
# new=''
# l=len(str)
# for i in range(l):
#     if i!=6:
#         new=new+str[i]
# print(new)



# 19.	Python program to split and join a string
# s='tjlkjkl@hk'
# n=s.split("@")
#
# c=''.join(n)
# print(c)

# 21.	Python program to find uncommon words from two Strings.
# s='geek for geek'
# s2='learning from geeks for geeks'
# count={}
# for i in s.split():
#     count[i]=count.get(i,0)+1
# for i in s2.split( ):
#     count[i]=count.get(i,0)+1
# v=[i for i in count if count[i]==1]
# print(v)



# 22.	Python – Replace duplicate Occurrence in String.

# sam_list = [11, 13, 15, 16, 13, 15, 16, 11]
# print ("The list is: " + str(sam_list))
# result = []
# for i in sam_list:
#     if i not in result:
#         result.append(i)
# print ("The list after removing duplicates : " + str(result))
#
# s='he is my friend he loves me'
# n=s.split(' ')
# re=''
# for i in n:
#     if i not in re:
#         re=re+' '+str(i)
# print(re)


# 23.	Python – Replace multiple words with K

# test_str = 'Geeksforgeeks is best for geeks and CS'
#
# print("The original string is : " + str(test_str))
#
# word_list = ["best", 'CS', 'for']
#
# repl_wrd = 'gfg'
# res = ' '.join([repl_wrd if idx in word_list else idx for idx in test_str.split()])
#
# print("String after multiple replace : " + str(res))


# 25.	Python | Check for URL in a String
# import re
# string = 'My Profile: https://auth.geeksforgeeks.org/user/Chinmoy%20Lenka/articles in the portal of https://www.geeksforgeeks.org/'
#
#
# regex = r"(?i)\b((?:https?://|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))"
# url = re.findall(regex, string)
# s= [x[0] for x in url]
#
# print("Urls: ", s)


# 26.	Execute a String of Code in Python


# 27.	String slicing in Python to rotate a string
# 28.	String slicing in Python to check if a string can become empty by recursive deletion


# 29.	Python Counter| Find all duplicate characters in string
# 30.	Python – Replace all occurrences of a substring in a string
# Dictionary Programs:
# 1.	Python – Extract Unique values dictionary values
test_dict = {"Gfg": [6, 7, 4, 6],
             "is": [8, 9, 5],
             "for": [2, 5, 3, 7],
             "Geeks": [6, 8, 5, 2]}

res=list(set().union(*test_dict.values()))
# print(test_dict.values())
print(res)


# 2.	Python program to find the sum of all items in a dictionary
# test_dict = {"Gfg": [6, 7, 4, 6],
#              "is": [8, 9, 5],
#              "for": [2, 5, 3, 7],
#              "Geeks": [6, 8, 5, 2]}
# n=[]
# for i in test_dict.values():
#     print(sum(i))



# 3.	Python | Ways to remove a key from dictionary
# test_dict = {"Gfg": [6, 7, 4, 6],
#              "is": [8, 9, 5],
#              "for": [2, 5, 3, 7],
#              "Geeks": [6, 8, 5, 2]}
# del test_dict['Geeks']
# print(test_dict)


# 4.	Ways to sort list of dictionaries by values in Python – Using itemgetter

# test_dict = {"Gfg": [6, 7, 4, 6],
#              "is": [8, 9, 5],
#              "for": [2, 5, 3, 7],
#              "Geeks": [6, 8, 5, 2]}
# d=sorted(test_dict.values())
# n=sorted(test_dict.keys())
# print(n)
# print(d)





# 5.	Ways to sort list of dictionaries by values in Python – Using lambda function
# Initializing list of dictionaries
# list = [{"name": "Nandini", "age": 20},
#        {"name": "Manjeet", "age": 20},
#        {"name": "Nikhil", "age": 19}]
#
# test_dict2=sorted(list,key=lambda x:x["age"])
# print(test_dict2)
#
#
# # 6.	Python | Merging two Dictionaries
# d={1:'ram',2:'mona'}
# d1={4:'raja',6:'lala'}
# d.update(d1)
# print(d)


# 7.	Python – Convert key-values list to flat dictionary
from itertools import product
#
# test_dict = {'month': [1, 2, 3],
#              'name': ['Jan', 'Feb', 'March']}
#
# res = dict(zip(test_dict['month'],test_dict['name']))
# print("Flattened dictionary : " + str(res))



# 8.	Python – Insertion at the beginning in OrderedDict

# from collections import OrderedDict
#
# iniordered_dict = OrderedDict([('akshat', '1'), ('nikhil', '2')])
#
# iniordered_dict.update({'manjeet': '3'})
#
# print("Resultant Dictionary : " + str(iniordered_dict))

# 9.	Python | Check order of character in string using OrderedDict( )

# from collections import OrderedDict
# def checkOrder(string, pattern):
#     dic = OrderedDict.fromkeys(string)
#     ptr = 0
#     for key,value in dic.items():
#         if (key == pattern[ptr]):
#             ptr = ptr + 1
#         if (ptr == (len(pattern))):
#             return 'True'
#     return 'False'
#
# string = 'Study tonight'
# pattern = 'stu'
# print (checkOrder(string,pattern))
#
# string2= 'Welcome'
# pattern2= 'cm'
# print (checkOrder(string2,pattern2))



# 10.	Dictionary and counter in Python to find winner of election

# votes = {}

# for i in range(5):
#     candidate = input("Enter the name of the candidate:")
#     number_votes = int(input('Enter the number of votes:'))
#     votes[candidate] = number_votes
#
# total_votes = sum(votes.values())
# max_votes = max(votes.values())
#
# for key, value in votes.items():
#     if value == max_votes:
#         winner_name = key
#         break

# print("{} is the winner with a total of {} votes".format(winner_name, max_votes))

# 11.	Python – Append Dictionary Keys and Values ( In order ) in dictionary



# 12.	Python | Sort Python Dictionaries by Key or Value

# Creates a sorted dictionary (sorted by key)
from collections import OrderedDict

# dict = {'ravi': '10', 'rajnish': '9',
#         'sanjeev': '15', 'yash': '2', 'suraj': '32'}
# d=sorted(dict.keys())
# d2=sorted(dict.items())
# print(d2)
# print(d)

# 13.	Python – Sort Dictionary key and values List
my_dict = {'Hi': [1, 6, 3],
   'there': [2, 9, 6],
   'Mark': [16, 7]}
# g=sorted(my_dict.keys())
# m=sorted(my_dict.values())
# print(m)
# print(g)

# my_result = dict()
# for key in sorted(my_dict):
#    my_result[key] = sorted(my_dict[key])
#
# print("The sorted dictionary is : " )
# print(my_result)

# 14.	Handling missing keys in Python dictionaries

# 15.	Python dictionary with keys having multiple inputs
# 16.	Print anagrams together in Python using List and Dictionary
# 17.	K’th Non-repeating Character in Python using List Comprehension and OrderedDict
# 18.	Check if binary representations of two numbers are anagram
# 19.	Python Counter to find the size of largest subset of anagram words
# 20.	Python | Remove all duplicates words from a given sentence
# 21.	Python Dictionary to find mirror characters in a string
# 22.	Counting the frequencies in a list using dictionary in Python
# 23.	Python | Convert a list of Tuples into Dictionary
# 24.	Python counter and dictionary intersection example (Make a string using deletion and rearrangement)
# 25.	Python dictionary, set and counter to check if frequencies can become same
# 26.	Scraping And Finding Ordered Words In A Dictionary using Python
# 27.	Possible Words using given characters in Python
# 28.	Python – Keys associated with Values in Dictionary
# Tuple Programs:
# 1.	Python program to Find the size of a Tuple
# 2.	Python – Maximum and Minimum K elements in Tuple
# 3.	Create a list of tuples from given list having number and its cube in each tuple
# 4.	Python – Adding Tuple to List and vice – versa
# 5.	Python – Closest Pair to Kth index element in Tuple
# 6.	Python – Join Tuples if similar initial element
# 7.	Python – Extract digits from Tuple list
# 8.	Python – All pair combinations of 2 tuples
# 9.	Python – Remove Tuples of Length K
# 10.	Sort a list of tuples by second Item
# 11.	Python program to Order Tuples using external List
# 12.	Python – Flatten tuple of List to tuple
# 13.	Python – Convert Nested Tuple to Custom Key Dictionary
# Searching and Sorting Programs:
# 1.	Python Program for Binary Search (Recursive and Iterative)
# 2.	Python Program for Linear Search
# 3.	Python Program for Insertion Sort
# 4.	Python Program for Recursive Insertion Sort
# 5.	Python Program for QuickSort
# 6.	Python Program for Iterative Quick Sort
# 7.	Python Program for Selection Sort
# 8.	Python Program for Bubble Sort
# 9.	Python Program for Merge Sort
# 10.	Python Program for Iterative Merge Sort
# 11.	Python Program for Heap Sort
# 12.	Python Program for Counting Sort
# 13.	Python Program for ShellSort
# 14.	Python Program for Topological Sorting
# 15.	Python Program for Radix Sort
# 16.	Python Program for Binary Insertion Sort
# 17.	Python Program for Bitonic Sort
# 18.	Python Program for Comb Sort
# 19.	Python Program for Pigeonhole Sort
# 20.	Python Program for Cocktail Sort
# 21.	Python Program for Gnome Sort
# 22.	Python Program for Odd-Even Sort / Brick Sort
# 23.	Python Program for BogoSort or Permutation Sort
# 24.	Python Program for Cycle Sort
# 25.	Python Program for Stooge Sort
# Functions
# 1.	Write a Python function to find the Max of three numbers
# 2.	Write a Python function to sum all the numbers in a list.
# Sample List : (8, 2, 3, 0, 7)
# Expected Output : 20
# 3.	 Write a Python function to multiply all the numbers in a list.
# Sample List : (8, 2, 3, -1, 7)
# Expected Output : -336
# 4.	Write a Python program to reverse a string.
# Sample String : "1234abcd"
# Expected Output : "dcba4321"
# 5.	Write a Python function to calculate the factorial of a number (a non-negative integer). The function accepts the number as an argument.
# 6.	Write a Python function to check whether a number falls in a given range
# 7.	 Write a Python function that accepts a string and calculate the number of upper case letters and lower case letters.
# Sample String : 'The quick Brow Fox'
# Expected Output :
# No. of Upper case characters : 3
# No. of Lower case Characters : 12
# 8.	 Write a Python function that takes a list and returns a new list with unique elements of the first list.
# Sample List : [1,2,3,3,3,3,4,5]
# Unique List : [1, 2, 3, 4, 5]
# 9.	Write a Python function that takes a number as a parameter and check the number is prime or not
# 10.	Write a Python function that checks whether a passed string is palindrome or not
# 11.	Write a Python function to check whether a string is a pangram or not Note : Pangrams are words or sentences containing every letter of the alphabet at least once.
# For example : "The quick brown fox jumps over the lazy dog"
# 12.	Write a Python program that accepts a hyphen-separated sequence of words as input and prints the words in a hyphen-separated sequence after sorting them alphabetically.
# Sample Items : green-red-yellow-black-white
# Expected Result : black-green-red-white-yellow
# 13.	 Write a Python function to create and print a list where the values are square of numbers between 1 and 30 (both included).
# 14.	Write a Python program to access a function inside a function
# 15.	Write a Python program to detect the number of local variables declared in a function

# l=[1,2,3,4,6,8,10]
# a=list(filter(lambda x:x**2%3==0,l))
# print(a)

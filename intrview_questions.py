# 2nd higest number in a list
# li1 = [2,3,6,4,3]
# set_n = list(set(li1))
# print('second highest number is', set_n[-2])

# 2nd method

# list=[2,7,2,3,5,7,5,3,7,8,1,2,5,8]
# a = 0
# b = 0
# for i in list:
#        if i>a:
#            b = a
#            a = i
#        if i>b and a>b and i<a:
#            b = i
# print(a,b)

# 3rd max

# numbers = [10, 25, 4, 78, 90, 56]
# first_max = max(numbers)      # Find highest
# numbers.remove(first_max)     # Remove highest
# second_max = max(numbers)     # Find next highest
# print("Second highest number:", second_max)

# 4th meth
# numbers = [10, 25, 4, 78, 90, 90, 56]
# Remove duplicates, sort in descending order, pick 2nd element
# second_highest = sorted(set(numbers), reverse=True)[1]
# print("Second highest number:", second_highest)

# reverse a list\
a = [2,3,5,4,6,1,3]
len = len(a)
n_list = []
# for i in range(1,len+1):
#     n_list.append(a[-i])
#
# print(n_list)

for i in range(len):
    n_list.append(a[len-1])
    len=len-1
print(n_list)

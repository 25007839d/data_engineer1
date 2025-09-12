# str(s) and repr(s)?

# a = input(str('plz enter the path/query'))
#
# print(str(a))
#
# print(repr(a))

# lower=2
# upper=100
# for num in range(lower,upper+1):
#     if num > 1:
#       for i in range(2,num): # want to understand
#           if num%i==0:
#               break
#       else:
#           print(num)

import copy
obj = [1,3,2,5]
shallow = copy.copy(obj)

import copy
deep = copy.deepcopy(obj)
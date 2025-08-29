# ====adding 2 number with decorator

def double_deco(fun):
   def inner(x, y):
      print("****************")
      result = fun(x, y)   # call dash_deco wrapped function
      print("****************")
      return result
   return inner

def dash_deco(fun):
   def inner(x, y):
      print("======start=======")
      result = fun(x, y)
      print(result)                # ✅ print result in between
      print("======end=======")
      return result
   return inner

@double_deco
@dash_deco
def add(x, y):
   return x + y

a = add(4, 6)
"""Global variables are public variables that are defined in the global scope. To use the variable in
the global scope inside a function, we use the global keyword.
Ex:-"""
x = 10   # global variable

def update_global():
    global x   # tell Python to use global x
    x = x + 5

update_global()
print(x)   # Output: 15

"""Protected attributes are attributes defined with an underscore prefixed to their identifier eg. _sara. 
They can still be accessed and modified from outside the class they are defined in but a responsible developer 
should refrain from doing so. 
Ex:-"""
class Employee:
    def __init__(self, name, salary):
        self._salary = salary   # protected attribute
        self.name = name

emp = Employee("Ritu", 50000)
print(emp._salary)   # ⚠️ works, but should be avoided


"""Private attributes are attributes with double underscore prefixed to their identifier eg. __ansh. 
They cannot be accessed or modified from the outside directly and will result in an AttributeError if
 such an attempt is made."""

class Student:
    def __init__(self, name, marks):
        self.__marks = marks   # private attribute
        self.name = name

    def get_marks(self):   # getter method
        return self.__marks

stu = Student("Dushyant", 95)

# print(stu.__marks)   # ❌ AttributeError
print(stu.get_marks())   # ✅ 95

# But still accessible with name-mangling:
print(stu._Student__marks)  # ⚠️ 95


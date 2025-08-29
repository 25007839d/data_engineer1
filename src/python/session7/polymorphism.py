# 1. Polymorphism with Functions/Methods
# Different classes can have methods with the same name, but their behavior depends on the object.
class Dog:
    def sound(self):
        return "Bark"

class Cat:
    def sound(self):
        return "Meow"

# Polymorphism: same method name, different behavior
for animal in [Dog(), Cat()]:
    print(animal.sound())



# Polymorphism with Inheritance (Method Overriding)
# Child class overrides parent class method.
class Animal:
    def move(self):
        print("Animals can move")

class Dog(Animal):
    def move(self):
        print("Dogs can run and walk")

obj1 = Animal()
obj2 = Dog()

obj1.move()  # Animals can move
obj2.move()  # Dogs can run and walk


# Polymorphism with Functions (Duck Typing)
# Python uses duck typing:
#  "If it looks like a duck and quacks like a duck, it’s a duck."
 # You don’t care about the object’s type, just whether it implements the required method.
class Duck:
    def swim(self):
        print("Duck swims in the pond")
class Fish:
    def swim(self):
        print("Fish swims in the river")
def make_it_swim(obj):
    obj.swim()

make_it_swim(Duck())  # Duck swims in the pond
make_it_swim(Fish())  # Fish swims in the river


# Operator Overloading (Built-in Polymorphism)
# Python lets you redefine operators for custom classes.
class Book:
    def __init__(self, pages):
        self.pages = pages
    def __gt__(self, other):   # Greater than dunder method/magic method
        return self.pages > other.pages
b1 = Book(120)
b2 = Book(200)

print(b1 > b2)   # False
print(b2 > b1)   # True




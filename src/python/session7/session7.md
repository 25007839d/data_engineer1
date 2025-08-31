# **Directory**

os module – This module is used to perform simple operation on directories. 
This module represents operating system dependent functionality.
import os

# **Exception**

An exception is a runtime error which can be handled by the programmer. 
All exceptions are represented as classes in Python.

**Type of Exception:-** 
1. Built-in Exception – Exceptions which are already available in Python Language. The base class for all built-in exceptions is BaseException class.
2. User Defined Exception – A programmer can create his own exceptions, called user-defined exceptions. 

**Need of Exception Handling**
1. When an exception occurs, the program terminates suddenly.
2. Suddenly termination of program may corrupt the program.
3. Exception may cause data loss from the database or a file.

**User Defined Exception**
A programmer can create his own exceptions, called user-defined exceptions or Custom Exception. 
Creating Exception Class using Exception Class as a Base Class
1. Raising Exception
2. Handling Exception

* try → risky code
* except → handles error
* else → runs if no error
* finally → always runs

# Logging
1. Logging is a way to track events that happen while your program runs.
2. Instead of using print(), you use the logging module, which gives you more control, 
levels, and formatting.
3. Useful for debugging, auditing, error tracking.

**Level   -Use Case**
DEBUG   -Detailed info (development, troubleshooting)
INFO    -General info about program execution
WARNING -Something unexpected but not breaking
ERROR   -A serious problem occurred
CRITICAL-Very serious error, program may not continue


# OPPS

1. Abstractions
2. Encapsulations
3. Inheritance
4. Polymorphism 
 
# What is Polymorphism?

Polymorphism = “one name, many forms”.
It allows the same function/method/operator to behave differently based on the object or input type.
In Python, polymorphism is not strictly enforced (like Java/C++), because Python is dynamically typed.

1. **Polymorphism with Functions/Methods**
Different classes can have methods with the same name, but their behavior depends on the object.

2. **Polymorphism with Inheritance (Method Overriding)**
Child class overrides parent class method.

3. **Polymorphism with Functions (Duck Typing)**
Python uses duck typing:
 "If it looks like a duck and quacks like a duck, it’s a duck."
 You don’t care about the object’s type, just whether it implements the required method.

4. **Operator Overloading (Built-in Polymorphism)**
Python lets you redefine operators for custom classes.


# What is super() method?

1. super() is used to call methods from a parent (super) class inside a child class.
2. Commonly used in inheritance to extend or reuse parent methods without rewriting them,
Avoids duplicating parent code.


#  What is a Decorator?
1. A decorator is a special function that adds extra functionality to another function without
modifying its source code.
2. It uses the @decorator_name syntax.
3. Decorators are heavily used in frameworks like Flask, Django, FastAPI.

# argparse
It is used to handle command-line arguments for Python scripts 
(like python script.py --name John --age 25)
How to Run in terminal/command prompt:

[//]: # (Open CMD )
# python argument_parser.py --name Alice --age 30


1. *args → Non-keyworded (Positional arguments
Collects extra positional arguments into a tuple.

2. **kwargs → Keyworded arguments
Collects extra keyword arguments into a dictionary.
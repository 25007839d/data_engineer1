# Built-in Exception

# print(10 / 0)


try:
    print(10 / 0)
except Exception as e:
    print("⚠️ Error:", e)



try:
    x = 5 / 1
except ZeroDivisionError:
    print("❌ Cannot divide by zero")
else:
    print("✅ Division successful:", x)
finally:
    print("🔚 Done")


"""try → risky code
except → handles error
else → runs if no error
finally → always runs"""

#
# We can create our own exception by creating a sub class to built-in Exception class.
class AgeTooSmallError(Exception):
    """Raised when the age is below 18"""
    def __init__(self, age, message="Age must be at least 18"):
        self.age = age
        self.message = message
        super().__init__(self.message)

# Usage
def register(age):
    if age < 18:
        raise AgeTooSmallError(age) # need to raise exception with raise keyword
    else:
        print("Registration successful")

try:
    register(15)
except AgeTooSmallError as e:  # handling the exception
    print(f"Error: {e} (You entered {e.age})")

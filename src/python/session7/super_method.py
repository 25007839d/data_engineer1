class A:
    def display(self):
        print("Class A")

class B(A):
    def display(self):
        print("Class B")
        super().display()

class C(B):
    def display(self):
        print("Class C")
        super().display()

c = C()
c.display()



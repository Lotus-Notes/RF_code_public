

class Animal:

    location = "East Boston"

    def __init__(self, name):
        self.name = name

    def speak(self):
        print("Animal sound, go!")

class dog(Animal):  #this is how inheritance is done in Python
    def speak(self):
        super().speak() # super() gets instance of parent class 
        print(f"{self.name} says woof")
        #speak = "woof"

a = dog("Striker")
a.speak()
#a.speak()

class Employee:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    @property # @property is a function that acts like a property or attribute of a class
    def first_name(self):
        return self.name.split(" ")[0]

    @property
    def last_name(self):
        return self.name.split(" ")[1]

    @first_name.setter #name of setter must match a @property.
    def first_name(self, first):
        l = self.name.split(" ")
        new_first_name = f"{first} {l[1]}"
        self.name = new_first_name

    @last_name.setter
    def last_name(self, last):
        l = self.name.split(" ")
        new_last_name = f"{l[0]} {last}"
        self.name = new_last_name

e = Employee("Jack Doe", 3544)
# print(e.first_name()) # also works for e.last_name()
print(e.first_name)
e.first_name = "John"
print(e.name)

e.last_name = "Boyle"
print(e.name)


#e.projects = 6

#print(e.projects)




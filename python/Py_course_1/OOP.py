# Object Oriented Programming Language

# class: a blueprint or template. Eg. form for an exam that contains name, age, electives, etc.
# object: specific instance created from the template (class). Eg. form wich contains the data for John Doe

class employee:
   
    company = "Asus" # this is a class attribute

    def __init__(self, salary, name, bond, company):
        self.salary = salary # create an instance attribute of name salary and assign it with salary
        self.name = name # same with name
        self.bond = bond # same with bond
        self.company = company # same with company 

    def get_info(self):
        print(f"Employee Name: {self.name} \nSalary: {self.salary} \nBond: {self.bond} years")

    def get_salary(self): # self is important here because self is a way to reference the object of the class that is being created
       return self.salary 

e3 = employee(85000, "John Doe", 4, "Dynotime")
e3.get_info()
print(e3.company)

print(employee.company) # this will always print the class attribute

e1 = employee(32000, "Jane Doe", 3, "Tesla")
print(e1.company) # will always print instance attribute whenever present


# object introspection
# print(dir(e1))



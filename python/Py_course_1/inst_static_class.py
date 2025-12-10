class Employee:
    company = "HP"
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    #Instance Method (default) 
    def print_info(self):
        print(f"The name is {self.name} and the salary is {self.salary}")

    #Static Method
    @staticmethod
    def sum(a, b):
        return a+b

    #Class method
    @classmethod
    def print_company(cls):
        print(cls.company)

    @classmethod
    def change_company(cls, new_company):
        cls.company = new_company

e1 = Employee("Jack", 80000)
e2 = Employee("Jill", 100000)

print(Employee.company)
e1.print_info()
e2.print_info()

print(e2.sum(4, 23))

print(Employee.company)
e1.print_company()
e1.change_company("Acer")
e1.print_company()
print(Employee.company)



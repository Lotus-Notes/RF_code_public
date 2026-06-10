# Object Oriented Programming Language

# class: a blueprint or template. Eg. form for an exam that contains name, age, electives, etc.
# object: specific instance created from the template (class). Eg. form wich contains the data for John Doe

class employee:
    company = "HP"
    
    def get_salary(self): # self is important here because self is a way to reference the object of the class that is being created
        return 100000


e1 = employee() # an object of class employee is created here
print(e1.get_salary()) # employee (e) get_salary method is called

e2 = employee()
print(e2.get_salary()) # function (method) within class
print(e2.company)      # attribute within class 


#------------------------------------------------------------------


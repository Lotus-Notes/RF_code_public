def sum(a, b):
    # a and b are local variables
    c = a+b
    z = 1 # local version of z, destroyed after function is returned
    print(z)
    return c

def greet():
    z = 32 # local variable in greet() funciton
    print("Hello")


z = 8 # z is a global variable
print(z)
print(f"The sum of 4 and 6 is {sum(4,6)}")
print(z)


# ------------------
# Now I can call or create a global variable within a function like this:

def sum2(a, b):
    '''This is a docstring for a function'''
    print("Summing these two variables...")
    c = a+b
    global z # please modify global z
    z = 0    # this will refer to the global z and not create a local variable
    return c

z = 3               # depends on when sum2() function is called with global z parameter
print(sum2(2,3))
z = 3               # depends on when sum2() function is called with global z parameter
print(z)
print(sum2.__doc__) # prints the docstring for the sum2() function above

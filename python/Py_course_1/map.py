### map ###
numbers = [1, 2, 3, 4, 5]
print(numbers)

def square(x):
    return x*x

new = list(map(square, numbers)) # maps the function 'square' to 'numbers' but returns a map object.  typecast to (list) to see the list
print(new)

### can also use lambda functions like this:

new2 = list(map(lambda x: x*x, numbers))


# -----------------------------------
### filter ###

def is_greater_than_9(x):
    if x>9:
        return True

    else:
        return False

a = [1, 3, 5, 234, 34, 43, 56, 9, 103, 93]

new = list(filter(is_greater_than_9, a))
print(new)

### can also use lambda functions for filters:

new3 = list(filter(lambda x: x>9, a))

# do not use lambda functions if they are not readable, make sure people can understand it


# -----------------------------------
### reduce ###
from functools import reduce
NUMBERS = [1, 2, 3, 4, 5]

def sum(a, b):
    return a + b

c = reduce(sum, NUMBERS)
print(c) # will return a single value: reduces the list by iterating through list 

# reduce function on NUMBERS
# [1, 2, 3, 4, 5]
# [3, 3, 4, 5]
# [6, 4, 5]
# [10, 5]
# [15]


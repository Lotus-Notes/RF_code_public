def sum(*args):
    # args will be a tuple of all the values passed to 'sum' function
    total = 0
    for item in args:
        total += item
    return total

print(sum(342, 2, 7, 9))


# --------------------------------
#kwargs is a dictionary with all the key value pairs which were passed to marks

def marks(**kwargs):
    for item in kwargs.keys():
        print(f"the marks of {item} are {kwargs[item]}")

marks(shubham=34, vikrant=54, jack=34, marie=90)

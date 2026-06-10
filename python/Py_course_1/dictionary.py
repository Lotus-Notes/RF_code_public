marks = {"harry": 34, "jack": 45, "lily": 94}

print(marks, type(marks))
print(marks["lily"])

marks["harry"] = 3

print(marks)

# -----------------------
### Dict Methods ###

names = marks.keys() # allocates the keys of marks the variable names
vals = marks.values() # allocates the values of marks to the variable val
itms = marks.items() # allocates the items of marks dict to variable itms

# you can also pop dicts:
marks.pop("harry") # will print the value for harry and pop it off the dictionary
print(marks)


# ----------------------------
### Dict Comprehensions ###

table_of_5 = {i: 5*i for i in range(1, 11)}

marks = [54, 23, 64, 93, 32]
mixed = [43, "hello", False, 4.2]

print(marks[2:4])
print(marks[2])
# print(mixed[4]) error index out of bound


### list methods ###

marks.append(63) # This will append the end of the list

marks.pop() # will remove the last element of the list (can assign to variable and append back)

extra_marks = [53, 23, 32]

marks.extend(extra_marks) # will add the argument (list - extra_marks) to the end of a list (marks)

marks.index(54) # you pass the value of the list and it tells you the index of that value (54 --> index 0)


# -----------
# List comprehenssions

a = 5
table = []

for i in range(1, 11):
    table.append(a*i)

print(table)

# single line
a = 1
table = [a*i for i in range(1, 11)]
print(table)


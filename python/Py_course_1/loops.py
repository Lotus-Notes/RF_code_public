##########################
print("for loop that prints i from 1 to 5")
for i in range(1, 6): # range function goes from 1 to 5 (1 to n-1) in this case
    print(i)

print("for loop that prints 5*i from 1 to 10")
for i in range(1, 11):
    print("5 *", i, "=", 5*(i))
    if (5*i)==35:
        print("hey that's my age!")
        break


##########################
print("while loop that prints 5*i from 1 to 5")
i = 1
while i<6:
    print("5 *", i, "=", 5*(i))
    i = i+1



##########################
for i in range(0, 20, 2):
    if i == 10:
        continue # continue says that when if statement is met, continue here instead of going through for loop
    print(i)

##########################
i = 3
if i == 12:
    pass # do nothing

# Functions in Python


#a = 4
#b = 2
#c = 1

#average = (a + b + c)/3
#print(average)

#a1 = 6
#b1 = 7
#c1 = 12

#average1 = (a1 + b1 + c1)/3
#print(average1)
num1 = int(input("Enter a number for (a): "))
num2 = int(input("Enter a number for (b): "))
num3 = int(input("Enter a number for (c): "))

def average(a, b, c):
    d = (a + b + c)/3
    return f"The average is: {d}"

sum = lambda a, b, c: a+b+c
prod = lambda a, b, c:a*b*c

print("\n")
print(f"The product of these numbers is {prod(num1,num2,num3)}")
print(f"The sum of these numbers is {sum(num1,num2,num3)}")
print(average(num1, num2, num3))
print("\n")




























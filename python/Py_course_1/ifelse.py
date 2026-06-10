age = int(input("Enter your age: ") )

if (age>16):
    print("you can drive") 
elif(age == 16):
    print("Lets schedule an interview")
else:
    print("you cannot drive")

match age:
    case 35:
        print("Hey we are the same age!") 
    case _:
        print("ok cool")
















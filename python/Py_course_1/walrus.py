# Walrus operator (:=)

def very_slow_func():
    print("something...")
    print("something...")
    print("something...")
    print("something...")
    print("something...")
    return 70

#a = very_slow_func()

if((a:=very_slow_func())>10):
    print(a)

else:
    print("its not greater than 10")

# -------------------------------------

while(data:=input("enter the value: ")):
    print(data)
    if data == "q":
        break


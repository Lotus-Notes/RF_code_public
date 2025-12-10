def divide(a, b):
    try:
        c = a/b
        print(c)
        return c

    except Exception as e:
        print(e)
        return None

    # this is always executed no matter if try completely executes or not
    finally:
        print("This is always executed")

a = int(input("enter a number (a): "))
b = int(input("enter a number (b): "))
divide(a,b)

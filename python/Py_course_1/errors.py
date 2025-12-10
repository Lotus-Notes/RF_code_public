while True:
    try:
        a = int(input("enter a number (a): "))
        b = int(input("enter a number (b): "))
        print(f"the sum is {a+b}")

    #except ValueError:
    #    print("Please dont perform bad typecasts")

    except ZeroDivisionError:
        print("Hey dont divide by 0")
    
    except Exception as e:
        raise ValueError("you didn't input a number you dummy", e)


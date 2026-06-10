def repeat(n):
    def decorator(func):
        def wrapper(a):
            for i in range(n):
                func(a)
        return wrapper
    return decorator

@repeat(8)
def say_hello(a):
    print(f"Hello {a}")

say_hello("Striker")

'''
def decorator(func)
    def wrapper(a):
        for i in range(n):
                say_hello(a)
    return wrapper
return decorator

'''

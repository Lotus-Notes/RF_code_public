'''
    Two types of modules in Python:
    1. Built-in modules
    2. external modules
'''
# Built-in modules
# https://docs.python.org/3/py-modindex.html

#import os
#import math

#import mymodule
#import pandas as pd
import numpy as np
'''
print(math.sqrt(16))
mymodule.hello()
'''

# External modules
B = 5+5j
A = 10-25j

print(f"The real part of {A} is {np.real(A)} and the imaginary part of {A} is {np.imag(A)}")
print("\n")
print(f"The magnitude of {A} is {np.abs(A)} and the angle is {np.angle(A, deg=True)} degrees")


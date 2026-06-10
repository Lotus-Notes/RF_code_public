import mymodule
#import numpy as np

A = complex(input("Enter a complex number: "))

print(f"The complex number in cartesean form: {A}")

X = mymodule.phasor(A)

mag = f"{X[0]:.3g}"
phase = f"{X[1]:.3g}"

print(f"The magnitude of {A} is {mag} and the angle is {phase} degrees")
'''
print("\n")
print(type(X[0]))
print(type(X[1]))
print("\n")
print(type(mag))
print(type(phase))
'''

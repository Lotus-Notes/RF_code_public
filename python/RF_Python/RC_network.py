import numpy as np
import Py_course_1.mymodule

R = 1 #ohms
C = 1e-12 # pF

f = 1e9 
w = 2*np.pi*f

X_C = -1j*(1/(w*C))

Z = (R*X_C)/(R+X_C)

### ABCD Parameters for series component ###

A = 1
B = Z
C = 0
D = 1

### Convert ABCD to S-parameters ###
Z0 = 50

S11 = (A+(Z/Z0)-(C*Z0)-D)/(A+(Z/Z0)+(C*Z0)+D)
#print(S11)
'''
s11 = Py_course_1.mymodule.phasor(S11)
mag = f"{s11[0]:.3g}"
phase = f"{s11[1]:.3g}"
print(f"The magnitude of s11 is {mag} and the angle is {phase} degrees")
'''
#S11 = Z/(Z+2*Z0)
#s11 = Py_course_1.mymodule.phasor(S11)
#mag = f"{s11_test[0]:.3g}"
#phase = f"{s11_test[1]:.3g}"
#print(f"The magnitude of s11 is {mag} and the angle is {phase} degrees")

S11 = Z/(Z+2*Z0)
S12 = (2*Z0)/(2*Z0 + Z)
S21 = S12
S22 = S11

s11 = Py_course_1.mymodule.phasor(S11)
s12 = Py_course_1.mymodule.phasor(S12)
s21 = Py_course_1.mymodule.phasor(S21)
s22 = Py_course_1.mymodule.phasor(S22)


mag = f"{s11[0]:.3g}"
phase = f"{s11[1]:.3g}"
print(f"The magnitude of s11 is {mag} and the angle is {phase} degrees")

mag = f"{s12[0]:.3g}"
phase = f"{s12[1]:.3g}"
print(f"The magnitude of s12 is {mag} and the angle is {phase} degrees")

mag = f"{s21[0]:.3g}"
phase = f"{s21[1]:.3g}"
print(f"The magnitude of s21 is {mag} and the angle is {phase} degrees")

mag = f"{s22[0]:.3g}"
phase = f"{s22[1]:.3g}"
print(f"The magnitude of s22 is {mag} and the angle is {phase} degrees")


### Poles-Zeros ###

from scipy import signal
import matplotlib.pyplot as plt

num = [R] # R in the numerator. Single value is constant, s+1 would be [1, 1]...
den = [R*C, 1] # pole (sRC + 1)

# Transfer function
H = signal.TransferFunction(num, den)

# Poles and Zeros
poles = H.poles
zeros = H.zeros

print(f"The network has zeros at {zeros}")
print(f"The network has poles at {poles}")

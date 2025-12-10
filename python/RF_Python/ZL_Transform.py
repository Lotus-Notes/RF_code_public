import numpy as np

############### Zload to series Zopt ####################

Z = 20 + 1j*45

Y = 1/Z

G = np.real(Y)
B = np.imag(Y)

Rp = 1/G
Xp = 1/B
Zp = Rp + 1j*Xp

print(f"The series impedance is {Z}")
print(f"The equivalent parallel load impedance is: {Zp}")

freq = 10E9
fingers = 4
Wg = 100 # in microns
periph = fingers*Wg
periph_mm = periph/1000

Ropt_mm = Rp*periph_mm

Copt = B/(2*np.pi*freq)
#print(f"Copt: {Copt} [F]")

Copt_pF = Copt/1E-12
#.print(f"Copt: {Copt_pF} [pF]")

Copt_pFmm = Copt_pF/periph_mm

print(f"Ropt: {Ropt_mm} [Ohms*mm]")
print(f"Copt: {Copt_pFmm} [pF/mm]")

############### Zopt to series Zload ####################
#%%
freq = 10E9
fingers = 10
Wg = 100 # in microns
periph = fingers*Wg
periph_mm = periph/1000

Ropt_mm = 30 # Ohms*mm
Copt_pFmm = -0.2 # pF/mm

Ropt = 30/periph_mm
Copt_pF = Copt_pFmm*periph_mm

Copt = Copt_pF*1E-12
Bp = 2*np.pi*freq*Copt
Xp = 1/Bp
Rp = Ropt

Rs = (Rp*(Xp**2))/((Rp**2)+(Xp**2))
Xs = (Xp*(Rp**2))/((Rp**2)+(Xp**2))

Zs = Rs + 1j*Xs



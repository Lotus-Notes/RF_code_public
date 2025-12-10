import numpy as np
import skrf as rf


def hello():
    print("hello world")


def phasor(Z):
    """
        Returns the phasor form of a complex number.

        Parameters:
        Z (complex): complex number (a + bj)

        a : The real part of the complex number
        b : The imaginary part of the complex number

        Returns:
        list(numpy.float64): The magnitude Z[0] and phase Z[1] of a complex number.
    """
    mag = np.abs(Z)
    #Mag = f"{mag:.3g}"

    phase = np.angle(Z, deg=True)
    #Phase = f"{phase:.3g}"

    #return [Mag, Phase] round vlaues but makes them strings
    return [mag, phase] #type: numpy.float64

def Gamma(ZL, Z0):
    """
        Returns the reflection coefficient from a system impedance (Z0)
        and a load impedance (ZL)

        Parameters:
        Z0: System Impedance
        ZL: can either be purely real/imag or complex number
        
        Returns: Complex number Gamma
    """
    
    gamma = (ZL-Z0)/(ZL+Z0)

    return gamma

def Gam_to_ZL(Gamma, Z0):

    ZL = Z0*(1+Gamma)/(1-Gamma)

    return ZL

def Z_ser_to_parl(Zs):

    Ys = 1/Zs
    G = np.real(Ys)
    B = np.imag(Ys)

    Rp = 1/G
    Xp = 1/B

    Zp = Rp + 1j*Xp

    return Zp

def Zopt_to_ZL(Ropt_mm, Copt_pFmm, freq, fingers, Wg):
    
    periph = fingers*Wg
    periph_mm = periph/1000

    Ropt = Ropt_mm/periph_mm
    
    Copt_pF = Copt_pFmm*periph_mm
    Copt = Copt_pF*1E-12
    
    Bp = 2*np.pi*freq*Copt
    Xp = 1/Bp
    
    Rs = (Ropt*(Xp**2))/((Ropt**2)+(Xp**2))
    Xs = (Xp*(Ropt**2))/((Ropt**2)+(Xp**2))

    Zs = Rs + 1j*Xs

    return Zs


## ------ Build Scikit-RF Network from series impedance ZL ------- #

def build_nets_from_zl(zl, freq_obj, Z0, freq_key="freq"):
    f_ref = np.asarray(freq_obj.f, dtype=float)
    npts = f_ref.size
    nets = {}
    
    for m, rows in zl.items():
        by_f = {float(r[freq_key]): r["Zload"] for r in rows}
        
        try:
            z_vec = np.array([by_f[f] for f in f_ref], dtype=complex) 
        
        except KeyError as e:
            missing = sorted(set(f_ref) - set(by_f))
            raise ValueError(
                f"Wg={m}: missing {len(missing)} frequency point(s). "
                f"Example missing: {missing[:5]}"
            ) from e
    
    z_arr = z_vec.reshape(npts, 1, 1)
    nets[m] = rf.Network(frequency=freq_obj, z=z_arr, z0=Z0)
    
    return nets











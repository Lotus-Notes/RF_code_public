%% Anderson T-line and Coax calculator

%% Coax

a = 1.0414e-3; %1mm inner conductor radius
b = 4.75e-3; %4mm outter conductor radius

mu_0 = 4*pi*10^(-7);
ep_0 = 8.854e-12;
ep_r = 1.0006; %relative Permativity of dielectric material

neta = sqrt(mu_0 / (ep_0 * ep_r) );

z0 = (log(b/a)/(2*pi))*neta
fc = (1/(pi*(a+b)*sqrt(mu_0*ep_0*ep_r)))

%% Cut-off Freqs

%air dielectric
lambda_c_air = pi*((a+b)/2);

%arbitrary dielectric
mu_r = 1;
lambda_c_di = (pi*((a+b)/2))*(sqrt(mu_r*ep_r));

fc = c/lambda_c_di;

%for connector size in inches
%units are in GHz.
fc = 7.51393/((a+b)*sqrt(ep_r));
%%
%for connector size in mm
%units are in GHz.
a = 1;
b = 4; 
ep_r = 1.2;
fc = 190.85/((a+b)*sqrt(ep_r));

%% Smith Chart Gamma
a = 0.6;
b = 0.4
zn = 0.2 + 0.4*i;
z0 = 50;

A = a*z0;
B = b*z0;

Zn = A + B*i;
Zn_check = zn*z0;
Zn_mag = sqrt(A^2 + B^2)
Zn_mag_check = abs(Zn)

Zn_angle_check = angle(Zn)*(180/pi)
Zn_angle = atand(B/A)

gamma = ((Zn - z0)/(Zn + z0))
gamma_mag = abs(gamma)
gamma_angle = angle(gamma)*(180/pi)

%% Zin

z0 = 50;
l = 0.3; %wavelengths
zl = 80 - 40*i;
beta = (2*pi);
beta_l = l*beta;
Z1 = z0;

Zin = Z1*((zl + i*Z1*tan(beta_l))/(Z1 + i*zl*tan(beta_l)))





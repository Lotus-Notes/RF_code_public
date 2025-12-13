%%% Anderson Smith Chart Basics

z0 = 50;
z = 80 - i*40;
%z_n = z/z0;

gamma0 = z2gamma(50);
gamma1 = z2gamma(z,z0);
s = smithplot(gamma1,'GridType',"Z")
hold on
s = smithplot(gamma0)
s.Marker = {'+','s'}
%hold off
gamma_circle = viscircles([0 0],abs(gamma1)) % constant |gamma| circle

%% Line Transform

Beta_l = (2*pi)*(0.5)
z1 = z0;
zl = z;
Zin = z1*((zl + i*z1*tan(Beta_l))/(z1 + i*zl*tan(Beta_l)));
gammaZin = z2gamma(Zin,z0);
s = smithplot(gammaZin)
%hold off
legend('|\Gamma|','1/4 \lambda','1/3 \lambda','1/2 \lambda')

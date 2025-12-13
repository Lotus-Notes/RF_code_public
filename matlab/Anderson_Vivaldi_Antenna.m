freq = 10e9;
freq_high = 12e9;
vp = physconst('lightspeed');
lambda = vp/freq;
lambda_high = vp/freq_high;
ucdx = 0.5*lambda;
ucdy = 0.5*lambda;
%ucdz = 5*lambda;


vi = vivaldi;
Vi = design(vi, freq)
Vi.Tilt = -90;
Vi.TiltAxis = [0 1 0];
figure(1)
pattern(Vi,freq)
figure(2)
pattern(Vi,10e9,0,1:1:360)

r = reflector;
r.Exciter = Vi;
r.Spacing = 2*lambda_high;
r.GroundPlaneLength = ucdx;
r.GroundPlaneWidth = ucdy;
figure(3)
show(r)
%%
infArray = infiniteArray;
infArray.Element = r;
infArrayFigure = figure;
show(infArray)
figure(19)
pattern(infArray,10e9,0,1:1:360)
figure(20)
pattern(infArray,freq)



%%
Z_distance = 0:0.01:1; %meters
Z_length = length(Z_distance);

for i = 1:Z_length
    [E(:,i) H(:,i)] = EHfields(infArray,10e9,[0 0 Z_distance(i)]');
end

Poynting_Vi = cross(E,H);
Mag_Poynting_Vi = abs(Poynting_Vi);

figure(5)
plot(Z_distance,Mag_Poynting_Vi(3,:))
title('Power Density Poynting Vector Magnitude for Vivaldi')
xlabel('Z Distance [m]')
ylabel('Power Density [W/m^2]')

figure(6)
E_mag = abs(E);
plot(Z_distance,E_mag(3,:)/1e-3)
title('E-Field Magnitude for Vivaldi')
xlabel('Z Distance [m]')
ylabel('E-Field [mV/m]')


%%
close all
freq = 8e9:0.1e9:12e9;
freq_length = length(freq);
RL_Vi = returnLoss(Vi,8e9:0.1e9:12e9);
ReturnLoss = 0-RL_Vi;

figure(7)
plot(freq/1e9,ReturnLoss)
title('Vivaldi Return Loss')
xlabel('Frequency [GHz.]')
ylabel('[dB]')
hold on
plot(FreqGHz,dBS11)
axis([8 12 -40 0])
yline(-10,'--','Minimum Specification')
hold off
legend('Ideal Vivaldi','HFSS 10GHz. Vivaldi','Location','southwest')
%%
close all
freq = 8e9:0.1e9:12e9;
freq_length = length(freq);
RL_Vi = returnLoss(Vi,8e9:0.1e9:12e9);
ReturnLoss = 0-RL_Vi;

figure(7)
plot(freq/1e9,ReturnLoss)
title('Vivaldi Return Loss')
xlabel('Frequency [GHz.]')
ylabel('[dB]')
hold on
plot(FreqGHz,dBS11)
axis([9.5 10.5 -40 0])
xticks([9.5 9.6 9.7 9.8 9.9 10 10.1 10.2 10.3 10.4 10.5])
yline(-10,'--','Minimum Specification')
xline(9.67,'--','fmin')
xline(10.255,'--','fmax')
hold off
legend('Ideal Vivaldi','HFSS 10GHz. Vivaldi','Location','southwest')

%%
RL_r = returnLoss(r,8e9:0.1e9:12e9);
ReturnLoss = 0-RL_Vi;

figure(7)
plot(freq/1e9,ReturnLoss)
title('Ideal Vivaldi Return Loss')
xlabel('Frequency [GHz.]')
ylabel('[dB]')

%%
%di = dipole;
%Di = design(di,10e9)
%Di.TiltAxis = [1 0 0; 0 1 0];
%Di.Tilt = [90 90]
%show(Di)
%figure(3)
%pattern(Di,10e9)
%figure(4)
%pattern(Di,10e9,0,1:1:360);
%beamwidth(Di,10e9,0,1:1:360)

%%


% freq = 8e9:0.1e9:12e9;
% freq_length = length(freq);
% 
% 
% RL = returnLoss(Di,8e9:0.1e9:12e9);
% ReturnLoss = 0-RL;
% plot(freq/1e9,ReturnLoss)
% title('Ideal Dipole Return Loss')
% xlabel('Frequency [GHz.]')
% ylabel('[dB]')



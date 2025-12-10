
lambda_mm = 1e-3; %mm
C = 2.998e8; %speed of light


%lambda = 0.001:0.001:0.3;

L_band = 1e9:5e8:2e9;
S_band = 2e9:5e8:4e9;
C_band = 4e9:5e8:8e9;
X_band = 8e9:5e8:12e9;
Ku_band = 12e9:5e8:18e9;
K_band = 18e9:5e8:26.5e9;
Ka_band = 26.5e9:5e8:40e9;

freq_GHz = 1e9:5e8:40e9;


%% Lambda

for i = 1:length(freq_GHz)
    lambda(i) = C./freq_GHz(i);
end
%% Freq
for n = 1:length(lambda)

    f(n) = C./lambda(n);
    f_GHz(n) = f(n)./(1e9);
end

%% Range Resolution

L_BW = 1e9;
S_BW = 2e9;
C_BW = 4e9;
X_BW = 4e9;
Ku_BW = 6e9;
K_BW = 8.5e9;
Ka_BW = 13.5e9;

BW = [L_BW, S_BW, C_BW, X_BW, Ku_BW, K_BW, Ka_BW];
bandwidth = ["L-band" "S-band" "C-band" "X-band" "Ku-band" "K-band" "Ka-band"];
%%

for k = 1:length(BW)
    deltaR(k) = C./(2.*BW(k));
end

DeltaR = [deltaR(1) deltaR(2) deltaR(3) deltaR(4) deltaR(5) deltaR(6) deltaR(7) ];
%%
figure(1)
plot(freq_GHz/1e9,lambda*1000)
xlabel('Frequency (GHz)')
ylabel('\lambda (mm)')
grid on
title('Wavelength vs. Frequency')

%%
figure(2)
b = bar(bandwidth, DeltaR,'Fontsize',12)
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 0];
b.CData(2,:) = [255/256 102/256 0];
b.CData(3,:) = [255/256 204/256 0];
b.CData(4,:) = [255/256 204/256 0];
b.CData(5,:) = [0 1 1];
b.CData(6,:) = [160/256 32/256 255/256];
b.CData(7,:) = [1 0 1];
grid on
ylabel('\DeltaR (m)','FontSize',12)
title('Range Resolution (\DeltaR) vs. Frequency Band')
ylim([0 0.16])
%b.Labels = b.YData;

b.Labels = compose('%.3f', b.YData);
ax = gca;
ax.FontSize = 12;
% text(xtips, ytips, labels, 'HorizontalAlignment','center','VerticalAlignment','bottom');
%MATLAB uses rgb/256

g = gcf;
exportgraphics(g, 'Anderson_RangeRes_plot.eps')

%% Radar Eqn
Pt_dBm = 63.01;
Pt = 10^(Pt_dBm/10)/1000;
Ga_dBi = 33.9;
Ga = 10^(Ga_dBi/10);
G = Ga^2;
sigma = 4;
Pr_dBm = -60;
Pr = 10^(Pr_dBm/10)/1000;

for x = 1:length(lambda)

    Rmax(x) = ((Pt*G*((lambda(x))^2)*sigma)/(((4*pi)^3)*Pr))^(1/4);

end
%%
L_Rmax = Rmax(1:3);
%%
figure(3)
plot(freq_GHz/1e9, Rmax)
ylabel('Max Range (m)')
xlabel('Frequency (GHz)')
grid on
title('Radar Range Equation vs. Frequency')
xline(max(L_band)/1e9, '--')
xline(max(S_band)/1e9, '--')
xline(max(C_band)/1e9, '--')
xline(max(X_band)/1e9, '--')
xline(max(Ku_band)/1e9, '--')
xline(max(K_band)/1e9, '--')
xline(max(Ka_band)/1e9, '--')

%%
L_Rmax = Rmax(1:3);
S_Rmax = Rmax(3:7);
C_Rmax = Rmax(7:15);
X_Rmax = Rmax(15:23);
Ku_Rmax = Rmax(23:35);
K_Rmax = Rmax(35:52);
Ka_Rmax = Rmax(52:79);
figure(7)
l = area(L_band/1e9, L_Rmax, 'FaceColor',[1 0 0])
hold on
s = area(S_band/1e9, S_Rmax, 'FaceColor',[255/256 102/256 0])
c = area(C_band/1e9, C_Rmax, 'FaceColor',[255/256 204/256 0])
x = area(X_band/1e9, X_Rmax, 'FaceColor',[255/256 204/256 0])
ku = area(Ku_band/1e9, Ku_Rmax, 'FaceColor',[0 1 1])
k = area(K_band/1e9, K_Rmax, 'FaceColor',[160/256 32/256 255/256])
ka = area(Ka_band/1e9, Ka_Rmax, 'FaceColor',[1 0 1])
hold off
legend({'L-band','S-band','C-band','X-band','Ku-band','K-band','Ka-band'})
grid on
xlabel('Frequency (GHz)')
ylabel('Max Range (m)')
title('Radar Range Equation vs. Frequency')
ax = gca;
ax.FontSize = 12;
g = gcf;
exportgraphics(g, 'Anderson_MaxRange_plot.eps')


%% Combined Plots

figure(5)
yyaxis left
b = bar(bandwidth, DeltaR)
b.FaceColor = 'flat';
b.CData(1,:) = [1 0 0];
b.CData(2,:) = [255/256 102/256 0];
b.CData(3,:) = [255/256 204/256 0];
b.CData(4,:) = [255/256 204/256 0];
b.CData(5,:) = [0 1 1];
b.CData(6,:) = [160/256 32/256 255/256];
b.CData(7,:) = [1 0 1];
grid on
ylabel('\DeltaR (m)')
%title('Range Resolution (\DeltaR) vs. Frequency Band')
ylim([0 0.16])
b.Labels = b.YData;
yyaxis right
plot(freq_GHz/1e9, Rmax)

%% dielectirc material losses uStrip
C = 2.998e8; %speed of light
freq_GHz = 1e8:1e8:50e9;
Z0 = 50;         %50Ohm System Impedance
thick = 30e-6;   %30um for Duroid example, 1.5um for BCB
b = 254e-6;      %254um for Duroid example, 10um or 5um for BCB
W = 350e-6;      %350um for Duroid example, 13um for SE BCB

epsilon_r = 2.2 %Duroid example = 2.2
tan_d = 0.0005;  %Duroid example = 0.0005

%velocity = C/sqrt(epsilon_r);

velocity = C;


%Impedance Check
CHECK = sqrt(epsilon_r)*Z0;


for i = 1:length(freq_GHz)
    Lambda(i) = velocity./freq_GHz(i);
end

figure(12)
plot(freq_GHz/1e9, Lambda*1000)
grid on
%axis([0 25 0 0.25])
ylabel('Wavelength (mm)')
xlabel('Frequency (GHz)')
axis([0 50 0 20])

Beta = 2*pi./Lambda;
l_e = Beta*100e-6;
figure(13)
plot(freq_GHz/1e9, Beta)
grid on
axis([0 25 0 900])
ylabel('Beta (rad/m)')
xlabel('Frequency (GHz)')

sigma = 5.8e7; %conductivity of Cu, 6e7 for example, 5.8e7 for BCB
u0 = 4*pi*1e-7; %permeability of free space
uR = 1;         %permeability of Cu
u = u0*uR;

%A = 1 + ((2*W)/(b-thick)) + (1/pi)*((b+thick)/(b-thick))*(log((2*b-thick)/(thick)));        %Stripline
%B = 1 + (b/(0.5*W + 0.7*thick))*(0.5+((0.414*thick)/W)+(1/(2*pi))*(log((4*pi*W)/thick)));   %Stripline



for i = 1:length(freq_GHz)
    R_sheet(i) = sqrt((pi*u*freq_GHz(i))/(sigma));
    %alphaC(i) = (((2.7e-3)*R_sheet(i)*epsilon_r*Z0)/(30*pi*(b-thick)))*A;                   %Stripline
    %alphaD(i) = (Beta(i)*tan_d)/2;                                                          %Stripline
    %lambda_g(i) = 
    alphaC(i) = (R_sheet(i)/(Z0*W));
    Q_conductor(i) = (Beta(i)/(2*alphaC(i)));
    %Q_c(i) = (8.686*pi)/(alphaC(i)*lambda_g(i));
end



figure(14)
plot(freq_GHz/1e9, R_sheet)
grid on
axis([0 25 0 0.045])
ylabel('Sheet Resistance (ohms/square)')
xlabel('Frequency (GHz)')

figure(15)
% plot(freq_GHz/1e9, alphaD)
% hold on
plot(freq_GHz/1e9, alphaC)
%hold off
grid on
ylabel('Attenuation Constants (Np/m)')
xlabel('Frequency (GHz)')

figure(16)
plot(freq_GHz/1e9, Q_conductor)
grid on
ylabel('Q-Factor')


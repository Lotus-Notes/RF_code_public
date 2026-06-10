%% QPA1019 Stability and Gain Circle Calculation
S = sparameters('TGA2575_6V2100mA.s2p') % S-parameters of device you wish to see plots for.
figure(1)
rfplot(S)
title("Qorvo TGA2575 Ka-band PA S-Parameters") 
legend('Location','southeast')
f = gcf;
exportgraphics(f,'Qorvo_TGA2575_Sparams.eps')


%%
figure(10)
smithplot(S,1,1)
hold on
smithplot(S,2,2)
g = gcf;
exportgraphics(g,'Qorvo_RL_Smith.eps')

%%
S = sparameters('TGA2575_6V2100mA.s2p')
figure(1)
subplot(1,2,1)
rfplot(S)
title("Qorvo TGA2575 Ka-band PA S-Parameters") 
legend('Location','southeast')



subplot(1,2,2)
smithplot(S,1,1)
hold on
smithplot(S,2,2)
hold off
%%
g = gcf;
exportgraphics(g,'Qorvo_RL_Smith.eps')







%%
s11=rfparam(S,1,1);
s11_mag = abs(s11);
s11_mag_dB = 20*log10(s11_mag);

s12=rfparam(S,1,2);
s12_mag = abs(s12);
s12_mag_dB = 20*log10(s12_mag);

s21=rfparam(S,2,1);
s21_mag = abs(s21);
s21_mag_dB = 20*log10(s21_mag);

s22=rfparam(S,2,2);
s22_mag = abs(s22);
s22_mag_dB = 20*log10(s22_mag);


freq = S.Frequencies/1e9;
%%
figure(2)
plot(freq,s11_mag_dB,'b')
%axis([26 45 -35 0])
grid on
xlabel('Frequency (GHz)')
ylabel('S11 (dB)')
title("Qorvo TGA2575 Ka-band PA Input Return Loss") 


figure(3)
plot(freq,s21_mag_dB,'r')
%axis([26 45 0 22])
grid on
xlabel('Frequency (GHz)')
ylabel('S21 (dB)')
title("Qorvo TGA2575 Ka-band PA Gain") 

figure(4)
plot(freq,s22_mag_dB,'m')
%axis([26 45 -35 0])
grid on
xlabel('Frequency (GHz)')
ylabel('S22 (dB)')
title("Qorvo TGA2575 Ka-band PA Output Return Loss") 

figure(5)
plot(freq,s12_mag_dB,'c')
%axis([26 45 0 22])
grid on
xlabel('Frequency (GHz)')
ylabel('S12 (dB)')
title("Qorvo TGA2575 Ka-band PA Reverse Isolation") 

figure(6)
smithplot(s11)

figure(7)
smithplot(s22)

%%

freq = S.Frequencies/1e9;
figure(7)
subplot(2,2,3)
plot(freq,s21_mag_dB,'r')
axis([5 45 -60 22])
grid on
xlabel('Frequency (GHz)')
ylabel('S21 (dB)')
title("S21 Gain") 

subplot(2,2,1)
plot(freq,s11_mag_dB,'b')
axis([5 45 -35 0])
grid on
xlabel('Frequency (GHz)')
ylabel('S11 (dB)')
title("S11 Input Return Loss") 

subplot(2,2,4)
plot(freq,s22_mag_dB,'m')
axis([5 45 -35 0])
grid on
xlabel('Frequency (GHz)')
ylabel('S22 (dB)')
title("S22 Output Return Loss")

subplot(2,2,2)
plot(freq,s12_mag_dB,'c')
axis([5 45 -85 -35])
grid on
xlabel('Frequency (GHz)')
ylabel('S12 (dB)')
title("S12 Reverse Isolation") 

f = gcf;
exportgraphics(f,'Qorvo_TGA2575_Sparams.eps')
%%
subplot(2,3,5)
plot(freq,s22_mag_dB,'m')
%axis([26 45 -35 0])
grid on
xlabel('Frequency (GHz)')
ylabel('S22 (dB)')
title("Qorvo TGA2575 Ka-band PA Output Return Loss") 

subplot(2,3,6)
smithplot(s22)
%%


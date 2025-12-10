%%% Russell Anderson GIEL Project TOI & P1dB Plots
%load('Anderson_GIEL_TOI_workspace.mat')
SS_gain_dB = 18;
OIP3_dBm = 36;
IIP3_dBm = 18;

OP1dB = 25.8;
IP1dB = 9;

%%
figure(1)
plot(Pin_dBm,Pout_dBm, 'LineWidth',2)
axis([-25 25 -10 40])
hold on
plot(slope1_x,slope1_y, 'r--')
plot(slope3_x,slope3_y, 'k')
text(-1,0,'3:1 slope')
plot(slope5_x,slope5_y, 'k')
text(11.5,0,'5:1 slope')
plot(IIP3_dBm,OIP3_dBm, 'r*')
xline(IIP3_dBm,'m--','IIP3','LabelOrientation','horizontal','LabelVerticalAlignment','bottom')
yline(OIP3_dBm,'m--','OIP3','LabelHorizontalAlignment','left')
hold off
grid on
xlabel('Pin (dBm)')
ylabel('Pout (dBm)')
title('LS Pout vs. Pin Curve, TOI')
f = gcf;
exportgraphics(f,'Anderson_CompressionCurve_TOI.eps')
%%
figure(2)
plot(Pin_dBm,Pout_dBm, 'LineWidth',2)
axis([-5 30 20 30])
grid on
hold on
plot(slope1_x,slope1_y, 'r--')

%plot(IIP3_dBm,OIP3_dBm, 'r*')
text(IIP3_dBm+0.7,OIP3_dBm,'TOI')
xline(IP1dB,'k--','Input P1dB','LabelOrientation','horizontal','LabelVerticalAlignment','bottom')
yline(OP1dB,'k--','Output P1dB','LabelHorizontalAlignment','left','LabelVerticalAlignment','bottom')

yline(IP1dB+SS_gain_dB,'k--','1dB Compression','LabelHorizontalAlignment','left')

hold off
xlabel('Pin (dBm)')
ylabel('Pout (dBm)')
title('LS Pout vs. Pin Curve, P1dB')
%legend('Amplifier Response','Theoretical Linear Response','','','')
g = gcf;
exportgraphics(g,'Anderson_CompressionCurve_P1dB.eps')

%%
figure(6)
subplot(1,2,1)
plot(Pin_dBm,Pout_dBm, 'LineWidth',2)
axis([-5 30 20 30])
grid on
hold on
plot(slope1_x,slope1_y, 'r--')

%plot(IIP3_dBm,OIP3_dBm, 'r*')
text(IIP3_dBm+0.7,OIP3_dBm,'TOI')
xline(IP1dB,'k--','Input P1dB','LabelOrientation','horizontal','LabelVerticalAlignment','bottom')
yline(OP1dB,'k--','Output P1dB','LabelHorizontalAlignment','left','LabelVerticalAlignment','bottom')

yline(IP1dB+SS_gain_dB,'k--','1dB Compression','LabelHorizontalAlignment','left')

hold off
xlabel('Pin (dBm)')
ylabel('Pout (dBm)')
title('LS Pout vs. Pin Curve, P1dB')

subplot(1,2,2)
plot(Pin_dBm,Pout_dBm, 'LineWidth',2)
axis([-25 25 -10 40])
hold on
plot(slope1_x,slope1_y, 'r--')
plot(slope3_x,slope3_y, 'k')
text(-1,0,'3:1 slope')
plot(slope5_x,slope5_y, 'k')
text(11.5,0,'5:1 slope')
plot(IIP3_dBm,OIP3_dBm, 'r*')
xline(IIP3_dBm,'m--','IIP3','LabelOrientation','horizontal','LabelVerticalAlignment','bottom')
yline(OIP3_dBm,'m--','OIP3','LabelHorizontalAlignment','left')
hold off
grid on
xlabel('Pin (dBm)')
ylabel('Pout (dBm)')
title('LS Pout vs. Pin Curve, TOI')
z = gcf;
exportgraphics(z, 'Anderson_P1dB_TOI_SubPlot.eps')

%%

figure(3)
plot(Pin_dBm, Gain_dB, 'b', 'LineWidth',2)
axis([-25 20 0 20])
grid on
xlabel('Pin (dBm)')
ylabel('LS Gain (dB)')
title('LS Gain vs. Pin')
k = gcf;
exportgraphics(k,'Anderson_LSgain.eps')

figure(4)
plot(Pin_dBm, abs(Comp_dB), 'r', 'LineWidth', 2)
grid on
xlabel('Pin (dBm)')
ylabel('Compression (dB)')
title('LS Compression vs. Pin')
u = gcf;
exportgraphics(u,'Anderson_Comp.eps')

%%
figure(5)
subplot(1,2,1)
plot(Pin_dBm, Gain_dB, 'b', 'LineWidth',2)
axis([-25 20 0 20])
grid on
xlabel('Pin (dBm)')
ylabel('LS Gain (dB)')
title('LS Gain vs. Pin')

subplot(1,2,2)
plot(Pin_dBm, abs(Comp_dB), 'r', 'LineWidth', 2)
grid on
axis([-25 20 0 12])
xlabel('Pin (dBm)')
ylabel('Compression (dB)')
title('LS Compression vs. Pin')

g=gcf;
exportgraphics(g, 'Anderson_GainCompSubPlot.eps')
%%% Russell Anderson Radar (Spider) Chart

%Data Points
D1 = [7 5 8 9 9 8 6 5 3 9 8 7 9 3]; %Initial
D2 = [7 7 8 9 9 10 7 7 7 10 8 8 10 5]; %Proposed Change
%S1 = [8 7 7 10 8 9 8 10 10 8 7 7 5 8]; %Phillip H. Smith
C1 = [8 8 8 8 8 8 8 5 6 9 8 8 7 8];%Manager
W1 = [6 7 7 7 8 8 8 6 8 8 9 8 8 8];%Peer
O5 = [7 7 9 7 5 7 6 5 5 8 1 1 1 1];%TR-0122
F1 = [7 7 8 9 9 9 7 7 7 9 8 8 8 8];%Final
weights = [1 2 2 0.5 1];
k1 = mean([D1(1) C1(1) W1(1) O5(1) F1(1)],weights=weights);
k2 = mean([D1(2) C1(2) W1(2) O5(2) F1(2)],weights=weights);
k3 = mean([D1(3) C1(3) W1(3) O5(3) F1(3)],weights=weights);
k4 = mean([D1(4) C1(4) W1(4) O5(4) F1(4)],weights=weights);
k5 = mean([D1(5) C1(5) W1(5) O5(5) F1(5)],weights=weights);
k6 = mean([D1(6) C1(6) W1(6) O5(6) F1(6)],weights=weights);
k7 = mean([D1(7) C1(7) W1(7) O5(7) F1(7)],weights=weights);
k8 = mean([D1(8) C1(8) W1(8) O5(8) F1(8)],weights=weights);
k9 = mean([D1(9) C1(9) W1(9) O5(9) F1(9)],weights=weights);
k10 = mean([D1(10) C1(10) W1(10) O5(10) F1(10)],weights=weights);
k11 = mean([D1(11) C1(11) W1(11) O5(11) F1(11)],weights=weights);
k12 = mean([D1(12) C1(12) W1(12) O5(12) F1(12)],weights=weights);
k13 = mean([D1(13) C1(13) W1(13) O5(13) F1(13)],weights=weights);
k14 = mean([D1(14) C1(14) W1(14) O5(14) F1(14)],weights=weights);
A1 = [k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 k13 k14];
% D6 = [8 2 1 4 6];
% D7 = [5 3 9 1 2];
% D8 = [5 8 7 2 9];
% D9 = [8 2 1 4 6];
% D10 = [5 3 9 1 2];

% P = [D1; D2; D3; D4; D5; D6; D7; D8; D9; D10];
P = [D1; D2; C1; W1; O5; F1; A1];
G = [D1; D2; O5; F1];
% Spider plot

spider_plot(G,'AxesLimits', [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1; 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10],...
    'AxesPrecision', [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],...
    'AxesLabels',{'Initiative','Decision Making','Responsibility and Urgency to Deliver','Resoucefulness','Ethical Actions and Integrity','Trust and Loyalty','Courage','Vision','Realizing the Vision','Inquiry','Interpersonal Skills','Communication and Advocacy','Connect - Across Disciplines, Skills, and Cultures','Negotiating and Compromise'},...
    'FillOption',{'on'},...
    'AxesFontSize',16,...
    'LabelFontSize',12,...
    'LineWidth', [2, 2, 2, 2.5],... %[2, 1.5, 1.5, 1.5, 1.5, 1.5, 3.5],...
    'Color', [1,0,0; 0,0,1; 1,0,1; 255/256, 153/256, 0/256],...    %160/256, 32/256, 255/256: deep purple
    'FillTransparency', [0.2, 0.05, 0.05, 0.05]); %[0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);
legend('Initial (Sept 2024)','Proposed Change','November 2024','May 2025','Peer','May 2025','Weighted Average','Location','southeastoutside','FontSize',12)
f = gcf;

exportgraphics(f, 'spyderchart.eps','Resolution','600')
exportgraphics(f, 'spyderchart_plot_test.pdf')
%%

spider_plot(G,'AxesLimits', [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10],...
    'AxesPrecision', [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],...
    'AxesLabels',{'Initiative','Decision Making','Responsibility and Urgency to Deliver','Resoucefulness','Ethical Actions and Integrity','Trust and Loyalty','Courage','Vision','Realizing the Vision','Inquiry','Interpersonal Skills','Communication and Advocacy','Connect - Across Disciplines, Skills, and Cultures','Negotiating and Compromise'},...
    'FillOption',{'off'},...
    'FillTransparency',[0.2]);

%% P.H.Smith (Leadership Stories)
figure(3)
spider_plot(S1,'AxesLimits', [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10],...
    'AxesPrecision', [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],...
    'AxesLabels',{'Initiative','Decision Making','Responsibility and Urgency to Deliver','Resoucefulness','Ethical Actions and Integrity','Trust and Loyalty','Courage','Vision','Realizing the Vision','Inquiry','Interpersonal Skills','Communication and Advocacy','Connect - Across Disciplines, Skills, and Cultures','Negotiating and Compromise'},...
    'FillOption',{'off'},...
    'FillTransparency',[0.2]);%,...
    %'AxesInterval',[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]);
    f=gcf;
    exportgraphics(f,'PSmith_spiderchart.eps')

%% Manager & Peer
spider_plot(A1,'AxesLimits', [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10],...
    'AxesPrecision', [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],...
    'AxesLabels',{'Initiative','Decision Making','Responsibility and Urgency to Deliver','Resoucefulness','Ethical Actions and Integrity','Trust and Loyalty','Courage','Vision','Realizing the Vision','Inquiry','Interpersonal Skills','Communication and Advocacy','Connect - Across Disciplines, Skills, and Cultures','Negotiating and Compromise'},...
    'FillOption',{'on'},...
    'FillTransparency',[0.2]);
legend('Initial','Manager','Peer','Location','southeastoutside')
%%
%Data Points
D1 = [7 5 8 9 9 8 6 5 3 9 8 7 9 3]; %Initial
D2 = [7 7 8 9 9 10 7 7 7 10 8 8 10 5]; %Proposed Change
%S1 = [8 7 7 10 8 9 8 10 10 8 7 7 5 8]; %Phillip H. Smith
C1 = [8 8 8 8 8 8 8 5 6 9 8 8 7 8];%Manager
W1 = [6 7 7 7 8 8 8 6 8 8 9 8 8 8];%Peer
O5 = [7 7 9 7 5 7 6 5 5 8 1 1 1 1];%TR-0122
F1 = [7 7 8 9 9 9 7 7 7 9 8 8 8 8];%Final
weights = [0.9 2 2 0.4 1];
k1 = mean([D1(1) C1(1) W1(1) O5(1) F1(1)],weights=weights);
k2 = mean([D1(2) C1(2) W1(2) O5(2) F1(2)],weights=weights);
k3 = mean([D1(3) C1(3) W1(3) O5(3) F1(3)],weights=weights);
k4 = mean([D1(4) C1(4) W1(4) O5(4) F1(4)],weights=weights);
k5 = mean([D1(5) C1(5) W1(5) O5(5) F1(5)],weights=weights);
k6 = mean([D1(6) C1(6) W1(6) O5(6) F1(6)],weights=weights);
k7 = mean([D1(7) C1(7) W1(7) O5(7) F1(7)],weights=weights);
k8 = mean([D1(8) C1(8) W1(8) O5(8) F1(8)],weights=weights);
k9 = mean([D1(9) C1(9) W1(9) O5(9) F1(9)],weights=weights);
k10 = mean([D1(10) C1(10) W1(10) O5(10) F1(10)],weights=weights);
k11 = mean([D1(11) C1(11) W1(11) O5(11) F1(11)],weights=weights);
k12 = mean([D1(12) C1(12) W1(12) O5(12) F1(12)],weights=weights);
k13 = mean([D1(13) C1(13) W1(13) O5(13) F1(13)],weights=weights);
k14 = mean([D1(14) C1(14) W1(14) O5(14) F1(14)],weights=weights);
A1 = [k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 k13 k14];
% D6 = [8 2 1 4 6];
% D7 = [5 3 9 1 2];
% D8 = [5 8 7 2 9];
% D9 = [8 2 1 4 6];
% D10 = [5 3 9 1 2];

% P = [D1; D2; D3; D4; D5; D6; D7; D8; D9; D10];
P = [D1; D2; C1; W1; O5; F1; A1];
G = [W1];
% Spider plot

spider_plot(G,'AxesLimits', [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1; 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10],...
    'AxesPrecision', [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],...
    'AxesLabels',{'Initiative','Decision Making','Responsibility and Urgency to Deliver','Resoucefulness','Ethical Actions and Integrity','Trust and Loyalty','Courage','Vision','Realizing the Vision','Inquiry','Interpersonal Skills','Communication and Advocacy','Connect - Across Disciplines, Skills, and Cultures','Negotiating and Compromise'},...
    'FillOption',{'on'},...
    'AxesFontSize',16,...
    'LabelFontSize',12,...
    'LineWidth', [2],... %[2, 1.5, 1.5, 1.5, 1.5, 1.5, 3.5],...
    'Color', [1,0,0],...    %160/256, 32/256, 255/256: deep purple | 
    'FillTransparency', [0.05]); %[0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);
legend('Peer','Manager','May 2025','Location','southeastoutside','FontSize',12)
f = gcf;

exportgraphics(f, 'spyderchart.eps','Resolution','600')
exportgraphics(f, 'spyderchart_plot_spring_1.pdf')

%%
%Data Points
D1 = [7 5 8 9 9 8 6 5 3 9 8 7 9 3]; %Initial
D2 = [7 7 8 9 9 10 7 7 7 10 8 8 10 5]; %Proposed Change
%S1 = [8 7 7 10 8 9 8 10 10 8 7 7 5 8]; %Phillip H. Smith
C1 = [8 8 8 8 8 8 8 5 6 9 8 8 7 8];%Manager
W1 = [6 7 7 7 8 8 8 6 8 8 9 8 8 8];%Peer
O5 = [7 7 9 7 5 7 6 5 5 8 1 1 1 1];%TR-0122
F1 = [7 7 8 9 9 9 7 7 7 9 8 8 8 8];%Final
weights = [0.9 2 2 0.4 1];
k1 = mean([D1(1) C1(1) W1(1) O5(1) F1(1)],weights=weights);
k2 = mean([D1(2) C1(2) W1(2) O5(2) F1(2)],weights=weights);
k3 = mean([D1(3) C1(3) W1(3) O5(3) F1(3)],weights=weights);
k4 = mean([D1(4) C1(4) W1(4) O5(4) F1(4)],weights=weights);
k5 = mean([D1(5) C1(5) W1(5) O5(5) F1(5)],weights=weights);
k6 = mean([D1(6) C1(6) W1(6) O5(6) F1(6)],weights=weights);
k7 = mean([D1(7) C1(7) W1(7) O5(7) F1(7)],weights=weights);
k8 = mean([D1(8) C1(8) W1(8) O5(8) F1(8)],weights=weights);
k9 = mean([D1(9) C1(9) W1(9) O5(9) F1(9)],weights=weights);
k10 = mean([D1(10) C1(10) W1(10) O5(10) F1(10)],weights=weights);
k11 = mean([D1(11) C1(11) W1(11) O5(11) F1(11)],weights=weights);
k12 = mean([D1(12) C1(12) W1(12) O5(12) F1(12)],weights=weights);
k13 = mean([D1(13) C1(13) W1(13) O5(13) F1(13)],weights=weights);
k14 = mean([D1(14) C1(14) W1(14) O5(14) F1(14)],weights=weights);
A1 = [k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 k13 k14];
% D6 = [8 2 1 4 6];
% D7 = [5 3 9 1 2];
% D8 = [5 8 7 2 9];
% D9 = [8 2 1 4 6];
% D10 = [5 3 9 1 2];

% P = [D1; D2; D3; D4; D5; D6; D7; D8; D9; D10];
P = [D1; D2; C1; W1; O5; F1; A1];
G = [A1];
% Spider plot

spider_plot(G,'AxesLimits', [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1; 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10],...
    'AxesPrecision', [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],...
    'AxesLabels',{'Initiative','Decision Making','Responsibility and Urgency to Deliver','Resoucefulness','Ethical Actions and Integrity','Trust and Loyalty','Courage','Vision','Realizing the Vision','Inquiry','Interpersonal Skills','Communication and Advocacy','Connect - Across Disciplines, Skills, and Cultures','Negotiating and Compromise'},...
    'FillOption',{'on'},...
    'AxesFontSize',16,...
    'LabelFontSize',12,...
    'LineWidth', [3.5],... %[2, 1.5, 1.5, 1.5, 1.5, 1.5, 3.5],...
    'Color', [0.6, 0, 0],...    %160/256, 32/256, 255/256: deep purple | 
    'FillTransparency', [0.2]); %[0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);
legend('Weighted Average','Location','southeastoutside','FontSize',12)
f = gcf;

exportgraphics(f, 'spyderchart.eps','Resolution','600')
exportgraphics(f, 'spyderchart_plot_avg.pdf')
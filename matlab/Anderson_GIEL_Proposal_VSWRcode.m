% MATLAB script to plot a 2:1 VSWR circle on a Smith chart

% Clear workspace
clc;
clear;
close all;

% Create a Smith Chart axes
figure;
smithplot([]); % Initialize the Smith chart

% Set the radius for the VSWR circle
VSWR = 2;  % 2:1 VSWR
rho_max = (VSWR - 1) / (VSWR + 1); % Maximum reflection coefficient for 2:1 VSWR

% Define the reflection coefficient values for the VSWR circle
theta = linspace(0, 2*pi, 1000); % Angle from 0 to 2pi (complete circle)
rho = rho_max * ones(size(theta)); % Constant reflection coefficient magnitude

% Parametric equation of the VSWR circle in polar coordinates (rho and theta)
Z = rho .* exp(1i*theta); % Calculate the impedance values on the circle

% Plot the VSWR circle on the Smith chart
hold on;
plot(real(Z), imag(Z), 'r', 'LineWidth', 2); % Red circle for 2:1 VSWR

% Customize plot (optional)
title('Smith Chart with 2:1 VSWR Circle');
legend('2:1 VSWR Circle, |\Gamma|=0.333');
hold off;
f = gcf;
exportgraphics(f,'VSWR_circle_smithplot.eps')
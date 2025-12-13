%%% Russell Anderson
%% Device S-parameters
%amp = read(rfckt.amplifier,'CG2H40010_100mA.s2p');
amp = read(rfckt.amplifier,'Wolfspeed_CG2H40010_SS_SeriesR.s2p');
S = sparameters(amp) % S-Param file goes here
figure(1)
rfplot(S)
title("Device S-Parameters")


%Freq = freq(1:160).*1e9;              
Freq = S.Frequencies;
freq_index = length(Freq);

%////   Use if loading column vector data from s2p in Excel ///////
% s11_dB = S11_dB;
% s11_deg = S11_deg;
% 
% s12_dB = S12_dB;
% s12_deg = S12_deg;
% 
% s21_dB = S21_dB;
% s21_deg = S21_deg;
% 
% s22_dB = S22_dB;
% s22_deg = S22_deg;

    s_complex11 = rfparam(S,1,1);
    s_complex12 = rfparam(S,1,2);
    s_complex21 = rfparam(S,2,1);
    s_complex22 = rfparam(S,2,2);

% Main Equation Loop
for w = 1:freq_index
    z0 = 50;
    %/////////////  Complex S-Parameters  /////////////////////////////////
    %S11(w) = [10^(s11_dB(w)/20) * exp(1j*(s11_deg(w)*(pi/180)))];
    %S12(w) = [10^(s12_dB(w)/20) * exp(1j*(s12_deg(w)*(pi/180)))];
    %S21(w) = [10^(s21_dB(w)/20) * exp(1j*(s21_deg(w)*(pi/180)))];
    %S22(w) = [10^(s22_dB(w)/20) * exp(1j*(s22_deg(w)*(pi/180)))];

    S11(w) = s_complex11(w);
    S12(w) = s_complex12(w);
    S21(w) = s_complex21(w);
    S22(w) = s_complex22(w);

    %S_complex(w) = [ S11(w) S12(w); S21(w) S22(w)];
    S_complex(1,1) = S11(w);
    S_complex(1,2) = S12(w);
    S_complex(2,1) = S21(w);
    S_complex(2,2) = S22(w);

    delta(w) = ((S11(w)*S22(w)) - (S12(w)*S21(w)));
    delta_mag(w) = abs(delta(w));

    S11_mag(w) = abs(S11(w));
    S12_mag(w) = abs(S12(w));
    S21_mag(w) = abs(S21(w));
    S22_mag(w) = abs(S22(w));

    %S_phasor(w) = [S11_mag(w) s11_deg(w) S12_mag(w) s12_deg(w) ; S21_mag(w) s21_deg(w) S22_mag(w) s22_deg(w) ];


    %/////////////  Stability Circles, Radius and Center  /////////////////
    CL(w) = ((S22(w) - (delta(w)*S11(w)'))' / ( (abs(S22(w))^2) - (abs(delta(w))^2)   )      );
    CS(w) = ((S11(w) - (delta(w)*S22(w)'))'/ ( (abs(S11(w))^2) - (abs(delta(w))^2)    )      );

    RL(w) = abs( (S12(w)*S21(w)) / ( (abs(S22(w))^2)-(abs(delta(w))^2) )  );
    RS(w) = abs( (S12(w)*S21(w)) / ( (abs(S11(w))^2)-(abs(delta(w))^2) )  );

    %Stability_Circle(w) = [CL(w) RL(w) ; CS(w) RS(w)]
    Stability_Circle(1,1) = CL(w);
    Stability_Circle(1,2) = RL(w);
    Stability_Circle(2,1) = CS(w);
    Stability_Circle(2,2) = RS(w);
    
    g1(w) = z2gamma(CL(w),z0);
    g2(w) = z2gamma(RL(w),z0);
    
    g3(w) = z2gamma(CS(w),z0);
    g4(w) = z2gamma(RS(w),z0);
  
    %//////////////////////  Stability Factors  ///////////////////////////  
    [K(w),b1(w),b2(w),delta_k(w)] = stabilityk([S_complex(1,1) S_complex(1,2) ; S_complex(2,1) S_complex(2,2)]); 

    [mu(w),muprime(w)] = stabilitymu([S_complex(1,1) S_complex(1,2) ; S_complex(2,1) S_complex(2,2)]);

    %Stability_factors(w) = [K(w) ; delta_mag(w) ; mu(w)] % K>1: unconditionally stable, K<1 unstable, delta<1, mu>1
    Stability_factors(1,1) = K(w);
    Stability_factors(2,1) = delta_mag(w);
    Stability_factors(3,1) = mu(w);
    
    %Stability Check with Boolean Check
    stability_index(w) = (K(w)>1)&(abs(delta_k(w))<1)&(mu(w)>1);
    is_stable(w) = all(stability_index(w));
    
    if is_stable(w)==1;                     %what frequencies are stable
        stable_freq(w) = Freq(w);
    end
    
  
    z0 = 50;
    %unconditionally stable: is_stable = 1 for all frequencies
    
    %/////////////////  Gain and Source/Load Gamma ////////////////////////
    G_transd_max(w) = ( ( S21_mag(w) ./ S12_mag(w)  ).*(K(w)-sqrt((K(w)).^2 - 1)));
    Gamma_Source(w) = S11(w)';
    Gamma_Load(w) = S22(w)';
    
    Gamma_in(w) = Gamma_Source(w)';
    Gamma_out(w) = Gamma_Load(w)';
    
    G_source_max(w) = (1/(1-(abs(S11(w)))^2)) ;
    G_load_max(w) = ( (1-(abs(conj(S22(w)))).^2) / ( 1-(abs(S22(w))).^2) );
    
   
    Gamma_L_dB(w) = abs(Gamma_Load(w));
    Gamma_L_deg(w) = (180/pi)*angle(Gamma_Load(w));

    Gamma_S_dB(w) = abs(Gamma_Source(w));
    Gamma_S_deg(w) = (180/pi)*angle(Gamma_Source(w));
    
    %////////////  [Source] Resistive Loads for Uncon. Stable /////////////
    lambda = 1;
    Source_R_shunt(w) = z0* ((   ( (abs(CS(w)+lambda).^2) - (RS(w)).^2 )/( ((RS(w)+1).^2) - (abs(CS(w))).^2 )   )^lambda);
    lambda = -1;
    Source_R_series(w) = z0* ((   ( (abs(CS(w)+lambda).^2) - (RS(w)).^2 )/( ((RS(w)+1).^2) - (abs(CS(w))).^2 )   )^lambda);

    %////////////  [Load] Resistive Loads for Uncon. Stable /////////////
    lambda = 1;
    Load_R_shunt(w) = z0* ((   ( (abs(CL(w)+lambda).^2) - (RL(w)).^2 )/( ((RL(w)+1).^2) - (abs(CL(w))).^2 )   )^lambda);
    lambda = -1;
    Load_R_series(w) = z0* ((   ( (abs(CL(w)+lambda).^2) - (RL(w)).^2 )/( ((RL(w)+1).^2) - (abs(CL(w))).^2 )   )^lambda);
    



end

% Gmax and K-factor Plots
figure(2)
gm = abs(G_transd_max);
dB_gm = 10*log10(gm);
yyaxis left
plot(Freq/1e9,dB_gm)
gm_stable = abs(S21/S12);
gm_stable = abs(S21./S12);
dB_gm_stable = 10*log10(gm_stable);
hold on
yyaxis left
plot(Freq/1e9, dB_gm_stable)
ylabel('Max Gain (dB)')
yyaxis right
plot(Freq/1e9, K)
ylabel('K-Factor')
yline(1)
hold off
legend({'$G_{tmax}$','$|\frac{S21}{S12}|$','K-Factor'},'Location','northwest','Interpreter','latex')
xlabel('Frequency (GHz)')
title(['Max Gain, K-factor vs. Frequency'])
grid on

% Source Resistor Values
figure(3)
plot(Freq/1e9, Source_R_series)
axis([0.5 6 0 100])   %Change these values for band of interest
% figure(4)
hold on
plot(Freq/1e9, Source_R_shunt)
axis([0.5 6 0 100])   %Change these values for band of interest
grid on
xlabel('Frequency (GHz)')
ylabel('R (\Omega)')
title('Source Stability Resistor Values')
legend('Series','Shunt')

% Load Resistor Values
figure(5)
plot(Freq/1e9, Load_R_series)
axis([0.5 6 0 60])   %Change these values for band of interest
hold on
%figure(6)
plot(Freq/1e9, Load_R_shunt)
axis([0.5 6 0 60])   %Change these values for band of interest
grid on
xlabel('Frequency (GHz)')
ylabel('R (\Omega)')
title('Load Stability Resistor Values')
legend('Series','Shunt')

%% Stability Circle Check
f = 20; %Select Frequency to check Stability circle at. 39 --> 10GHz

z0 = 50;
g1 = z2gamma(CL(f),z0);
g2 = z2gamma(RL(f),z0);
g3 = z2gamma(CS(f),z0);
g4 = z2gamma(RS(f),z0);
Gamma_matrix = [g1 g2;g3 g4];
figure(7)
s = smithplot(Gamma_matrix);
h = viscircles([real(CL(f)) imag(CL(f))],[abs(RL(f))],'Color','r');
g = viscircles([real(CS(f)) imag(CS(f))],[abs(RS(f))],'Color','b');
legend('Source','Load')
title('Stability Circles Smith Chart')

figure(8)
u = smithplot
circle(amp,Freq(f),'Stab','In','Stab','Out',u)
legend('Location','SouthEast')
%% Stability Circles

 S_phasor(w) = [S11_mag(w) s11_deg(w) S12_mag(w) s12_deg(w) ; S21_mag(w) s21_deg(w) S22_mag(w) s22_deg(w) ];

    CL(w) = ((S22(w) - (delta(w)*S11(w)'))' / ( (abs(S22(w))^2) - (abs(delta(w))^2)   )      );
    CS(w) = ((S11(w) - (delta(w)*S22(w)'))'/ ( S11_mag(w)^2) - (S22_mag(w)^2)        );

    RL(w) = abs( (S12(w)*S21(w)) / ( (abs(S22(w))^2)-(abs(delta(w))^2) )  );
    RS(w) = abs( (S12(w)*S21(w)) / ( (abs(S11(w))^2)-(abs(delta(w))^2) )  );

%Stability_Circle(w) = [CL(w) RL(w) ; CS(w) RS(w)]
    Stability_Circle(1,1) = CL(w);
    Stability_Circle(1,2) = RL(w);
    Stability_Circle(2,1) = CS(w);
    Stability_Circle(2,2) = RS(w);

stable_length = length(B);

for X = 19:stable_length
    
    P = smithplot(Gamma_matrix);
    Q = viscircles([real(CL(X)) imag(CL(X))],[abs(CL(X))],'Color','r');
    G = viscircles([real(CS(X)) imag(CS(X))],[abs(RS(X))],'Color','b');
    legend('Source','Load')
    title('Stability Circles Smith Chart')
    hold on
end
hold off
format short
    

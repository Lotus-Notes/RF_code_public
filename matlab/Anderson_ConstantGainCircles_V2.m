%% Problem 5



freq = 3e9:0.5e9:5e9;              %3-5 GHz. in 0.5 GHz. steps
freq_index = length(freq);


s11_dB = [-1.94 -2.22 -2.50 -2.74 -2.97];
s11_deg = [-90.0 -105.0 -120.0 -130.0 -140.0];

s12_dB = [-60.0 -60.0 -60.0 -60.0 -60.0];
s12_deg = [0 0 0 0 0];

s21_dB = [8.94 8.45 7.96 7.60 7.23];
s21_deg = [100.0 90.0 80.0 70.0 60.0];

s22_dB = [-3.61 -4.02 -4.44 -4.58 -4.73];
s22_deg = [-50.0 -60.0 -70.0 -77.50 -85.00];

for w = 1:freq_index
    
    S11(w) = [10^(s11_dB(w)/20) * exp(1j*(s11_deg(w)*(pi/180)))];
    S12(w) = [10^(s12_dB(w)/20) * exp(1j*(s12_deg(w)*(pi/180)))];
    S21(w) = [10^(s21_dB(w)/20) * exp(1j*(s21_deg(w)*(pi/180)))];
    S22(w) = [10^(s22_dB(w)/20) * exp(1j*(s22_deg(w)*(pi/180)))];

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
    
    [K(w),b1(w),b2(w),delta_k(w)] = stabilityk([S_complex(1,1) S_complex(1,2) ; S_complex(2,1) S_complex(2,2)]); 

    [mu(w),muprime(w)] = stabilitymu([S_complex(1,1) S_complex(1,2) ; S_complex(2,1) S_complex(2,2)]);

    %Stability_factors(w) = [K(w) ; delta_mag(w) ; mu(w)] % K>1: unconditionally stable, K<1 unstable, delta<1, mu>1
    Stability_factors(1,1) = K(w);
    Stability_factors(2,1) = delta_mag(w);
    Stability_factors(3,1) = mu(w);
    
    stability_index(w) = (K(w)>1)&(abs(delta_k(w))<1);
    is_stable(w) = all(stability_index(w));
    
    if is_stable(w)==1;                     %what frequencies are stable
        stable_freq(w) = freq(w);
    end
    
    z0 = 50;
    %unconditionally stable: is_stable = 1 for all frequencies, also S12 =0
    %for all freqs
    %//////////////////////////////////////////////////////////////////////////////////////////////
    G_transd_max(w) = (abs(S21(w))/abs(S12(w)))*(K(w)-sqrt((K(w)).^2 - 1));
    Gamma_Source(w) = S11(w);
    Gamma_Load(w) = S22(w);
    
    Gamma_in(w) = conj(Gamma_Source(w));
    Gamma_out(w) = conj(Gamma_Load(w));
   
    Gamma_L_dB(w) = abs(Gamma_Load(w));
    Gamma_L_deg(w) = (180/pi)*angle(Gamma_Load(w));

    Gamma_S_dB(w) = abs(Gamma_Source(w));
    Gamma_S_deg(w) = (180/pi)*angle(Gamma_Source(w));
    %/////////////////////////////////////////////////////////////////////////////////////////////////
    %Gamma_S = Gamma_Source
    %Gamma_L = Gamma_Load
    
    G_source_max(w) = (1/(1-(abs(S11(w))).^2)) ;
    G_load_max(w) = ((1-(abs(Gamma_out(w))).^2)/(1-(abs(S11(w))).^2));
    
    GS(w) = ( (1-(abs(Gamma_Source(w))).^2)/abs(1-(Gamma_in(w)*Gamma_Source(w)) ).^2 );
    GL(w) = ( ( 1-(abs(Gamma_Load(w)) ) .^2 ) / ( abs( 1-(S22(w)*Gamma_Load(w)) ) ).^2 );
    
    gS(w) = (GS(w)/G_source_max(w));
    %gL(w) = (GL(w)/G_load_max(w))
    
    %gS(w) = (1-abs(Gamma_Source(w)).^2 / abs(1-Gamma_in(w).*Gamma_Source(w)).^2)*(1-abs(S11(w)).^2)
    gL(w) = (1-abs(Gamma_Load(w)).^2 / abs(1-S22(w).*Gamma_Load(w)).^2)*(1-abs(S22(w)).^2)
    
    %//////////////////////////////////////////////////////////////////////////////////////////////////
    
    CS(w) = ((gS(w)*conj(S11(w)))/(1-(1-gS(w))*(abs(S11(w))).^2));
    RS(w) = ( ((1-(abs(S11(w))).^2)*(sqrt(1-gS(w)))) / (1-(1-gS(w))*abs(S11(w)).^2) );
    
    CL(w) = ( (gS(w)*conj(S22(w)))/(1-(1-gL(w))*(abs(S22(w))).^2) );
    RL(w) = ( ((1-(abs(S22(w))).^2)*(sqrt(1-gL(w)))) / (1-(1-gL(w))*(abs(S22(w))).^2) );
    
    g1(w) = z2gamma(CL(w),z0);
    g2(w) = z2gamma(RL(w),z0);
    g3(w) = z2gamma(CS(w),z0);
    g4(w) = z2gamma(RS(w),z0);
    
    s = smithplot(Gamma_Source(w));
    h = viscircles([real(CL(w)) imag(CL(w))],[abs(RL(w))],'Color','r');
    g = viscircles([real(CS(w)) imag(CS(w))],[abs(RS(w))],'Color','b');
    hold on
    legend('Source','Load')
end

%% Table of Values (Problem 5)
T3 = table(freq', CL', RL', CS', RS',G_source_max',G_load_max',gS',gL',GS',GL',K',delta_mag',mu',is_stable');
T3.Properties.VariableNames = {'Frequency [Hz.]','CL','RL','CS','RS','G_max Source','G_max Load','gS','gL','GL','GS','K-factor','Delta','mu','Stable Logic'}

%% Table of Reflection Coeff. in dB/deg

format short
T3A = table(freq',Gamma_L_dB',Gamma_L_deg',Gamma_S_dB',Gamma_S_deg');
T3A.Properties.VariableNames = {'Frequency [Hz.]','Gamma Load [dB]','Gamma Load [deg]','Gamma Source [dB]','Gamma Source [deg]'}

%% 4.0GHz.
    s = smithplot(Gamma_out(3));
    h = viscircles([real(CL(3)) imag(CL(3))],[abs(RL(3))],'Color','r');
    g = viscircles([real(CS(3)) imag(CS(3))],[abs(RS(3))],'Color','b')
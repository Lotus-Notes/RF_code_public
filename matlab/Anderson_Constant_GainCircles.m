%% Problem 3

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
    
    stability_index(w) = (K(w)>1)&(abs(delta_k(w))<1)&(mu(w)>1);
    is_stable(w) = all(stability_index(w));
    
    if is_stable(w)==1;                     %what frequencies are stable
        stable_freq(w) = freq(w);
    end
    
  
    z0 = 50;
    %unconditionally stable: is_stable = 1 for all frequencies
    
    
    G_transd_max(w) = (abs(S21(w))/abs(S12(w)))*(K(w)-sqrt((K(w))^2 - 1));
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
    
    
end
%%
Gs_dB = 10*log10(G_source_max(3));
Go = abs(S21).^2;
GTrans_dB = 10*log10(G_transd_max(3));
Go_dB = 10*log10(Go(3));
GL_dB_d = GTrans_dB - Gs_dB - Go_dB;
Gl = 10^(GL_dB_d/10);

GS_dB = [0 0.5 1 1.5 2 2.5 3];
GL_dB = [0 0.5 1 1.5];

GS_abs = 10.^(GS_dB./10);
GL_abs = 10.^(GL_dB./10);

GS_length = length(GS_dB);
GL_length = length(GL_dB);
  
    
for m = 1:GS_length    
    gS(m) = (GS_abs(m)/G_source_max(3));
    
    CS(m) = ((gS(m)*conj(S11(3)))/ (1-(1-gS(m))*(abs(S11(3))).^2));
    RS(m) = ( ((1-(abs(S11(3)))^2)*(sqrt(1-gS(m)))) / (1-(1-gS(m))*(abs(S11(3)).^2) ) );
    
    
    s = smithplot(G_source_max(3));
    h = viscircles([real(CS(m)) imag(CS(m))],[abs(RS(m))],'Color','r');
    hold on
    legend('Load','Source')
end

for n = 1:GL_length    
    gL(n) = (GL_abs(n)/Gl);
    
    CL(n) = ( (gL(n)*conj(S22(3)))/(1-(1-gL(n))*(abs(S22(3))).^2) );
    RL(n) = ( ((1-(abs(S22(3))).^2)*(sqrt(1-gL(n)))) / (1-(1-gL(n))*(abs(S22(3))).^2) );
    
    g = viscircles([real(CL(n)) imag(CL(n))],[abs(RL(n))],'Color','b');
    hold on
    legend('Load','Source')
end

hold off
%% Table for Gs, gS values
G_source_max(3); %Gs for 4 GHz.
Go(3); %Go for 4 GHz.
Gl; %Gl for 4 GHz.
G_transd_max(3); %Transducer Gain for 4 GHz.

Gain_table = table(G_source_max(3), Go(3), Gl, G_transd_max(3), Gs_dB, Go_dB, GL_dB_d, GTrans_dB);
Gain_table.Properties.VariableNames = {'Gs','Go','Gl','Gt','Gs [dB]','Go [dB]','Gl [dB]','Gt [dB]'}
%% Table for Gs, gS values
GS_table = table(GS_dB', gS',conj(CS)',RS');
GS_table.Properties.VariableNames = {'Gs [dB]','gS','CS','RS'}

%% Table for GL, gL values

GL_table = table(GL_dB', gL',conj(CL)',RL');
GL_table.Properties.VariableNames = {'GL [dB]','gL','CL','RL'}
%% Table for Stability Factors

Stable_table = table(freq',K',delta_mag',mu',is_stable');
Stable_table.Properties.VariableNames = {'Frequency [Hz.]','K-factor','|Delta|','mu','Stable Logic'}

%% Table for Source and Load complex conjugate matching Gamma
Gamma_load_match_mag = abs(conj(S22));
Gamma_load_match_angle = angle(conj(S22)).*(180/pi);

Gamma_source_match_mag = abs(conj(S11));
Gamma_source_match_angle = angle(conj(S11)).*(180/pi);

Conj_table = table(freq', Gamma_load_match_mag', Gamma_load_match_angle', Gamma_source_match_mag', Gamma_source_match_angle');
Conj_table.Properties.VariableNames = {'Frequency [Hz.]','Gamma Load (mag)','Gamma Load (deg)','Gamma Source (mag)','Gamma Source (deg)'}
%% 4.0GHz.
figure

    s4 = smithplot(z0);
   
    h0 = viscircles([real(CL(1)) imag(CL(1))],[abs(RL(1))],'Color','r');  %GL = 0dB
    txt = texlabel('G_L=0dB');   
    text(real(CL(3))+0.45,imag(CL(3))-0.18,txt,'Color','r')
    
    g0 = viscircles([real(CL(3)) imag(CL(3))],[abs(RL(3))],'Color','b');  %GL = 1dB
    txt = texlabel('G_L=1dB');   
    text(real(CL(1))-0.01,imag(CL(1)),txt,'Color','b')
    
    u0 = viscircles([real(CS(5)) imag(CS(5))],[abs(RS(5))],'Color','g');  %GS = 2dB
    txt = texlabel('G_S=2dB');   
    text(real(CS(5))-0.5,imag(CS(5))-0.3,txt,'Color','g')
    
    q0 = viscircles([real(CS(7)) imag(CS(7))],[abs(RS(7))],'Color','m');  %GS = 3dB
    txt = texlabel('G_S=3dB');   
    text(real(CS(7))-0.1,imag(CS(7)),txt,'Color','m')
    
   
%% Gl values from G_trans_max
Gs_dB = 10*log10(G_source_max(3));
Go = abs(S21).^2;
GTrans_dB = 10*log10(G_transd_max(3));
Go_dB = 10*log10(Go(3));
GL_dB_d = GTrans_dB - Gs_dB - Go_dB;
Gl = 10^(GL_dB_d/10);

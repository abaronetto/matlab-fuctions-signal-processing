%   Calcolo delle potenze relative nelle bande di interesse del segnale EEG
%   Calcolo delle bande
ind_delta = f>=0.5 & f<3.5;
ind_teta = f>=3.5 & f<7;
ind_alfa = f>=7 & f<14;
ind_beta1 = f>=14 & f<21;
ind_beta2= f>=21 & f<30;
  
%   Calcolo la potenza totale
Ptot=sum(Pxx);

%   Calcolo le potenze relative
P_delta=sum(Pxx(ind_delta));
P_delta=P_delta/Ptot;
    
P_teta=sum(Pxx(ind_teta));
P_teta=P_teta/Ptot;
    
P_alfa=sum(Pxx(ind_alfa));
P_alfa=P_alfa/Ptot;
    
P_beta1=sum(Pxx(ind_beta1));
P_beta1=P_beta1/Ptot;
    
P_beta2=sum(Pxx(ind_beta2));
P_beta2=P_beta2/Ptot;
 
%Stampo i risultati
fprintf('\n Potenze relative: ') 
fprintf('\n Pd = %f Pt = %f Pa = %f Pb1 = %f Pb2 = %f \n',P_delta,P_teta,P_alfa,P_beta1,P_beta2);

%   metodo con la funzione

banda=[[0.5 3.5 3.5 7 7 14 14 21 21 30];
P_rel=potenza_rel(Pxx,f,banda);     %   Pxx e f sono restituiti da pwelch
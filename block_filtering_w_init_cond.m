%   filtraggio a blocchi

ytm2=(zeros(1,5120));     % vettore di zeri in cui verrà inserito il segnale filtrato a blocchi, lungo quanto il segnale
zi= zeros(1,50);          % inizializzare a zero i coefficienti = ordine
for i=1:10 % i blocchi sono lunghi 512 campione, pari alla fsamp, perciò dobbiamo ripeterlo 10 volte
   [yy,zi]= filter(b,a,xtm(((i-1)*512+1):(i*512)),zi);  % filtrare qui il blocco di segnale utilizzando i coefficienti zi  
   ytm2(((i-1)*512+1):(i*512))=yy;
end

function fmeanv = fmean(x,fsamp,epoch_len)
% Funzione per il calcolo della frequenza media di un'epoca di segnale.
% Parametri di input:   x              epoca di segnale (vettore)
%                       fsamp          frequenza di campionamento
%                       epoch_len      lunghezza dell'epoca (in secondi)
% Parametri di output:  fmeanv         frequenza media 

% corpo della function

x = x-mean(x);
NFFT = epoch_len*fsamp;
w = rectwin(NFFT);
[P,f]=pwelch(x,w,0,NFFT,fsamp);

fmeanv = sum(f.*P)/sum(P);
plot(f,P);

end		% fine della procedura (da non togliere)
%   Routine per il calcolo dell'entropia di Reini

function reini_entropy=RE(x,fsamp);

%   Inizializzazioni
% P_xx=zeros(1,length(x));
% p_xx=zeros(1,length(x));

%   Calcolo densità spettrale di potenza col periodogramma semplice
w=rectwin(length(x));
NFFT=length(x);
[P_xx,f]=pwelch(x,w,0,NFFT,fsamp);

%   Calcolo la funzione densità di probabilità
p_xx=P_xx/sum(P_xx);

reini_entropy=-log10(sum(p_xx.^2));
end
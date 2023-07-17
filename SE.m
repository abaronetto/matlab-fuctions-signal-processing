%   Routine per il calcolo dell'entropia spettrale

function spectral_entropy=SE(x,fsamp);

%   Inizializzazioni
% P_xx=zeros(1,length(x));
% p_xx=zeros(1,length(x));

%   Calcolo densità spettrale di potenza col periodogramma semplice
w=rectwin(length(x));
NFFT=length(x);
[P_xx,f]=pwelch(x,w,0,NFFT,fsamp);

%   Calcolo la funzione densità di probabilità
p_xx=P_xx/sum(P_xx);

logar=log10(1/p_xx)';
spectral_entropy=sum(p_xx.*logar(logar~=-Inf));
end

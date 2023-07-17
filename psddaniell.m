function [Px,f] = psddaniell(x,N,fc,P)
% Periodogramma di Daniell
% x segnale
% N numero di punti su cui disegnare lo spettro
% fc frequenza di campionamento
% P punti adiacenti su cui effettuare la media

[Pxx f] = psd(x,N,fc);
for i=1:N/2+1
    if i<=P
        Px(i)=sum(Pxx(1:i+P))/(i+P);
    elseif i>P & i<=(N/2+1-P)
        Px(i)=sum(Pxx(i-P:i+P))/(2*P+1);
    else
        Px(i)=sum(Pxx(i-P:N/2+1))/(N/2+2+P-i);
    end
end

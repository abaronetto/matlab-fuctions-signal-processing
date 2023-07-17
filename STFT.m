% short time fourier transform
function [S,t,f] = STFT(x,NFFT,fc,l,w) %    segnale, NFFT, fsamp, lunghezza della finestra, finestra

%controllo se l è pari o dispari e calcolo il numero di zeri
%che devo aggiungere all'inizio e alla fine del segnale
if mod(l,2)~=0
     halb = round(l/2)-1;
else
   halb = l/2;
end

%controllo se NFFT è pari o dispari
if mod(NFFT,2)~=0
    row = round(NFFT/2);
else
    row = NFFT/2 +1;
end
x = x-mean(x);
zeri = zeros(1,halb);
signal=[zeri x zeri]';
S = zeros(row,length(x));

% % se il segnale è in forma analitica(privo della replica spettrale)
% funzione per avere il segnale analitico è hilbert(x)
% for i = 1:length(x)
%     prodotto = signal(i:(i+l-1)).*w;
%     S(:,i) = wrev(fft(prodotto,NFFT));
% end

%se il segnale è reale(ne devo dunque rimuovere la replica spettrale)
for i = 1:length(x)
    prodotto = signal(i:(i+l-1)).*w;
    trasf = fft(prodotto,NFFT);
    S(:,i) = trasf(1:row);
end

%calcolo degli assi t e f
t = 0:1/fc:(length(x)-1)/fc;
f = 0:fc/2;

end








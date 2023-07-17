%   correlogramma
function [XX, f]=correlogramma(x,ntlag,bias,NFFT,fc,ris)
if bias==1
    xacs = xcorr(x,ntlag,'biased'); %cambiare in 'biased' se necessario
else
    xacs = xcorr(x,ntlag,'unbiased'); %cambiare in 'biased' se necessario
end
                          
XX = fft(xacs,NFFT);                            %ottenere la FFT de segnale
XX = XX(1:(length(XX)/2+1));              %elimina la replica spettrale
f = ((0:(length(XX)-1))/length(XX))*(fc/2); %creazione dell'asse delle frequenze
figure,plot(f,abs(XX)/max(abs(XX)))               %plot dei risultati
xlabel('frequency (Hz)'),ylabel('FFT absolute value (a.u.)')
tit=sprintf('Metodo del correlogramma risoluzione %d Hz',ris);
title(tit)
end
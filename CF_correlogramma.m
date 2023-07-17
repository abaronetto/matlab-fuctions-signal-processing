%   funzione di coerenza utilizzando il correlogramma - per segnali WSS

function [coherence, square_coherence, log_coherence]=CF_correlogramma(x,y,ntlag, NFFT); %    si può usare mscohere

    x=x-mean(x);
    y=y-mean(y);
    
    xycorr=xcorr(x,y,ntlag,'biased'); 
    xxcorr=xcorr(x,ntlag,'biased');
    ycorr=xcorr(y,ntlag,'biased');
    
    Pxy=fft(xycorr,NFFT);   %   NFFT DEVE ESSERE POTENZA DI 2!!!!!
    Pxx=fft(xxcorr,NFFT);
    Pyy=fft(ycorr,NFFT);

    Pxy = Pxy(1:(length(Pxy)/2+1)); %  tolgo la replica spettrale, solo se il segnale non è analitico
    Pxx = Pxx(1:(length(Pxx)/2+1)); 
    Pyy = Pyy(1:(length(Pyy)/2+1)); 
   
    coherence=(abs(Pxy)./sqrt(abs(Pxx).*abs(Pyy)));
    square_coherence=coherence.^2;
    log_coherence=log((abs(Pxy).^2)./(abs(Pxx).*abs(Pyy)));

end
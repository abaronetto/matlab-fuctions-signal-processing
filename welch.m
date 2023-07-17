% periodogramma con Welch    
function [Pxx, f] = welch (x,w,overlap,NFFT,fc,ris)
    [Pxx,f]=pwelch(x-mean(x),w,overlap,NFFT,fc);
    figure
    plot(f,Pxx/max(Pxx),'r');
    tit=sprintf('Metodo di Welch con risoluzione %d Hz', ris);
    title(tit)
    xlabel('Frequenze')
end

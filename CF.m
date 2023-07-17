%   funzione di coerenza

function [coherence, square_coherence, log_coherence]=CF(x,y); %    si può usare mscohere

    x=x-mean(x);
    y=y-mean(y);
    
    Pxy=cpsd(x,y); 
    Pxx=pwelch(x);
    Pyy=pwelch(y);

    coherence=abs(Pxy)./sqrt(abs(Pxx).*abs(Pyy));
    square_coherence=coherence.^2;
    log_coherence=log((abs(Pxy).^2)./(abs(Pxx).*abs(Pyy)));

end
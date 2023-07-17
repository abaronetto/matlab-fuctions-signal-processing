%   funzione di coerenza tempo-frequenza
function [coherence, square_coherence, log_coherence]=CF_TF(x,y,ntlag,fc)

x=x-mean(x);
y=y-mean(y);

xycorr=corrist(x,y,ntlag);
xxcorr=acf(x,ntlag);
ycorr=acf(y,ntlag);

%   sto usando Wigner-Ville
[rowy,coly]=size(xycorr);
wxy=[];
wxy=1/(ntlag*2/fc)*(2/fc)*fft(xycorr);
wxy=wxy(1:rowy/2+1,:);

[rowy,coly]=size(xxcorr);
wxx=[];
wxx=1/(ntlag*2/fc)*(2/fc)*fft(xxcorr);
wxx=wxx(1:rowy/2+1,:);

[rowy,coly]=size(ycorr);
wyy=[];
wyy=1/(ntlag*2/fc)*(2/fc)*fft(ycorr);
wyy=wyy(1:rowy/2+1,:);

%   calcolo le coerenze
coherence=real(wxy)./sqrt(real(wxx).*real(wyy));
square_coherence=coherence.^2;
log_coherence=log((real(wxy).^2)./(real(wxx).*real(wyy)));
end
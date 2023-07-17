%   marginale in frequenza
function [marginale]=fmarginale(assef,distr)
marginale=sum(real(distr'));
figure
plot(assef,marginale)
title('Marginale in frequenza')
xlabel('Frequenze')
end

%   periodogramma semplice

% NFFT = 1024;
% w = rectwin(length(w_sec));
% [Pxx,f]=pwelch(sec,w,0,NFFT,fc);
% plot(f,Pxx/max(Pxx));
% title('Periodogramma classico (ris app 10 mHz) ')
% hold on
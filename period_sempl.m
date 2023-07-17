% periodogramma semplice

NFFT = 4097;
w = rectwin(4096); %length(x)
[Pxx,f]=pwelch(x(1:4096,1),w,0,NFFT,fc);
figure
plot(f,Pxx/max(Pxx));
title('Periodogramma classico (ris. 0.125 Hz, 8s di segnale)')
axis([0 50 0 1]);

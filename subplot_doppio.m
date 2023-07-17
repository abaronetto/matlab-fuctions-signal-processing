% subplot doppio

subplot(2,1,1) 
plot(xor(1:1000),'r')
grid on
title('Segnale ECG originale')
subplot(2,1,2)
plot(ytm(1:1000),'g')
title('Segnale filtrato (IIR 12 coeff anticausale)')
grid on

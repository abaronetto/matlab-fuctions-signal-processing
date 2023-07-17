[Pxx,f] = pwelch(xtm(1:200)-mean(xtm(1:200)),hanning(128),64,128,512); %signal, window, overlap, NFFT, Fs
plot(f,Pxx)
axis([0 256 0 max(abs(Pxx))])
title('Stima della PSD del rumore') 

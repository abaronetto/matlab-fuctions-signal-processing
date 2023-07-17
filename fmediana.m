function [fmed] = fmediana(x,fsamp,epoch_len)

x = x-mean(x);
NFFT = epoch_len*fsamp;
w = rectwin(NFFT);
[P,f]=pwelch(x,w,0,NFFT,fsamp);

A = sum(P)/2;
i = 1;
S = 0;

while S <= A
    S = S + P(i);
    i = i+1;
end
fmed = f(i);
end
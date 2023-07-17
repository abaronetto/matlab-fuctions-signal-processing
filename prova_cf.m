s1=randn(128,1);
s2=rand(128,1);
fc=128;
[n,Wn]=buttord([20/(fc/2) 50/(fc/2)],[10/(fc/2) 60/(fc/2)],0.5, 50);
[b,a]=butter(n, Wn);
freqz(b,a,fc,fc);
s1_filtered=filtfilt(b, a, s1);
alpha=0;
sf=alpha*s1_filtered+(1-alpha)*s2;
[c,s,l]=CF(s1,sf);
plot(s)

gh=mscohere(s1,sf);
hold on
plot(gh)
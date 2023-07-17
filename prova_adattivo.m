h=fopen('ecg50001.bin','r');
x=fread(h,inf,'float');
fclose(h);

f=0:1/fs:(10-1/fs);

x_filtered=adattivo(x,4,fs);

figure
subplot(2,1,1)
plot(f,x);
title('Originale');
subplot(2,1,2)
plot(f,x_filtered)
title('Filtrato?!');
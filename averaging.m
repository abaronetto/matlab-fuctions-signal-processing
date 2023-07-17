%   AVERAGING RAPIDO

%   prendere il segnale

close all
clear;
pack;
clc;

[file,path]=uigetfile('*.bin','Load');
filename=sprintf('%s%s',path,file);
h=fopen(filename,'r');
x=fread(h,inf,'float');
fclose(h);

%   apro il file di riferimento (modifica pot5100.bin) e lo plotto

h=fopen('pot5100.bin','r');
xor=fread(h,inf,'float');
fclose(h);

subplot(2,1,1)
plot(xor(1:300),'r'); %Plottare tre epoche del segnale originale, dal 1° al 300° campione
axis([0 300 -0.3 0.3]);
title('Segnale di riferimento')

%   definire i range di segnale per calcolare il rumore e l'ampezza del
%   segnale

range_pp = 1:30;
range_rumore = 50:100;
 
signal_pp=max(xor(range_pp))-min(xor(range_pp)); % a seconda del segnale
noise_stdev=std(x(range_rumore)); % a seconda del rumore

SNR = signal_pp/(4*noise_stdev);

%   plot del segnale corrotto

subplot(2,1,2)
plot(x(1:300),'g');
axis([0 300 -0.3 0.3]);
title(['Corrupted potential - SNR = ', num2str(SNR,'%4.1f')])

%   Determinare il numero di campioni di ogni epoca e il numero di epoche

N = 100; 
n_epoch = fix(length(x)/(N));      %   fix prende l'intero precedente (1.9-->1)

xav = zeros(N,1);   %   segnale mediato

subplot(1,1,1)
 
%  inizializzazione di 2 vettori x il confronto tra SNR teorico e
%  sperimentale
SNR_teor=zeros(1,FR);
SNR_sper=zeros(1,FR);


B=reshape(x,[N, FR]);   %   x è un vettore colonna, reshape ne prende i 
                        %   primi N elementi e li mette in una colonna, 
                        %   prende poi i secondi N e li mette in una seconda colonna 
B=B';
media=mean(B);
dev=std(media(range_rumore));
SNR_f=20*log10(signal_pp/(4*dev));  %   SNR sperimentale (molto simile a quello teorico)



% Elaborazione di Segnali Biomedici
% Ottavo laboratorio: trasformate tempo - frequenza

clear all
close all
pack
clc

%PUNTO 1.1---somma di due sinusoidi, Choi Williams

fc = 256;		% sampling rate
T = 1;		% window length
asset = 0:1/fc:1;	% x axis

%   definzione del segnale

f0=20;
f1=50;
t0=0:1/fc:0.4;
t1=0.6:1/fc:1;
zero=zeros(1, 51);
x = [sin(2*pi*f0*t0) zero sin(2*pi*f1*t1)];	% sine wave (not analytical)
x = hilbert(x);	% use Hilbert transform to obtain analytic signal

% definizione dei parametro per WV

ntlag = round(max(size(x))/2)-1;		% number of time lags
sig = 100;					% kernel parameter

%   CW

[w, tau, theta]=dcw(x,fc,ntlag,sig,T);% Time-Frequency transform (see functions dcw.m and wig.m)

%   AF

aa_1_cw=daf(x,ntlag,fc,T);
figure
contour(theta,tau,real(fftshift(aa_1_cw)),.1:.1:1);
title('Contour della AF con x = somma di 2 sinusoidi');

% Plot di CW

[roww, colw] = size(w);
upper = fc/4;	% upper frequency since non alias-free implementation
assef = (0:roww-1)/roww*upper;			% frequency axis

figure,mesh(asset,assef,real(w)),xlabel('time (s)'),ylabel('frequency (Hz)'),title('Mesh of real part of TFT of x as sum of 2 sins'),
axis([min(asset) max(asset) min(assef) max(assef) 2*min(min(real(w))) 2*max(max(real(w)))]);

figure,contour(asset,assef,real(w)/max(max(real(w))),.1:.1:1),xlabel('time (s)'),ylabel('frequency (Hz)'), title('Contour of real part of TFT of x as sum of 2 sins');

%PUNTO 1.1----somma di due sinusoidi con Wigner Ville

fc = 256;		% sampling rate
T = 1;		% window length
asset = 0:1/fc:1;	% x axis

%   definizione del segnale

f0=20;
f1=50;
t0=0:1/fc:0.4;
t1=0.6:1/fc:1;
zero=zeros(1, 51);
x = [sin(2*pi*f0*t0) zero sin(2*pi*f1*t1)];	% sine wave (not analytical)
x = hilbert(x);	% use Hilbert transform to obtain analytic signal

%   definizione dei parametri per la WV

ntlag = round(max(size(x))/2)-1;		% number of time lags
sig = 1;					% kernel parameter

%   Wigner Ville

[w]=wig(x,fc,ntlag);% Time-Frequency transform (see functions dcw.m and wig.m)


[roww, colw] = size(w);
upper = fc/4;	% upper frequency since non alias-free implementation
assef = (0:roww-1)/roww*upper;			% frequency axis

figure(1),mesh(asset,assef,real(w)),xlabel('time (s)'),ylabel('frequency (Hz)'),title(' real part '),
axis([min(asset) max(asset) min(assef) max(assef) 2*min(min(real(w))) 2*max(max(real(w)))]);

figure(2),contour(asset,assef,real(w)/max(max(real(w))),.1:.1:1),xlabel('time (s)'),ylabel('frequency (Hz)');


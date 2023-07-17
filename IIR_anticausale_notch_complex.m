%   filtro IIR anticausale, notch complesso
%   per ECG con interferenza di rete, passato con resample
function [y]=IIR_anticausale_notch_complex(x,ord,fc_new,fc_old)
x=resample(x,fc_new,fc_old,25); 
f=[0 40/(fc_new/2) 45/(fc_new/2) 55/(fc_new/2) 60/(fc_new/2) 1];
m=[1 1 0 0 1 1];
[b,a]=yulewalk(ord,f,m);
freqz(b,a,512,500);
y=filtfilt(b,a,x);
end

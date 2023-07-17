%   simple notch filter
function [y]=simple_notch(xx,fc)
b=[1 0 0 0 0 0 0 0 0 0 -1];
a=1;
freqz(b,a,512,fc);
y=filter(b,a,xx);
end

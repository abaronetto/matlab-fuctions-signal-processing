%   design of FIR filter

b=firpm(49, f, m);  %   ordine, maschera del filtro
a=1;
freqz(b,a,512,500);
y=filter(b,a,xx);


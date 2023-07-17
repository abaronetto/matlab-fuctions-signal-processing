%   resampling

xx=resample(x,500,512,25);  %   segnale,fs_new,fs,metà dell'ordine del
                                %   filtro antialiasing
xxor=resample(xor,500,512,25);

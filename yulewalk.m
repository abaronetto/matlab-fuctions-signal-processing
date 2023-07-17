%   passa basso

f=[0 ft/(fs/2) (ft+20)/(fs/2) 1]; % inserire qui il vettore delle frequenze che determina la maschera del filtro
m=[1 1 0 0];                      % inserire qui il vettore delle ampiezze che determina la maschera del filtro
[b,a]= yulewalk(11,f,m);                     % utilizzare la funzione 'yulewalk'
freqz(b,a,512,512)         % plot di modulo e fase del filtro progettato (b,a,n°punti,fsamp)

%   FIR a 51 coeff

b = fir1(50,ft/(fs/2));                    % ricavare i vettori coefficienti per un filtro FIR a 51 coefficienti. 
a = 1;
freqz(b,a,512,512)
ytm1=filter(b,a,xtm);                     % effettuare qui il filtraggio a singola passata

%   filtraggio a blocchi senza condizioni iniziali

ytm2=(zeros(1,5120));
for i=1:10
   [yy]= filter(b,a,xtm(((i-1)*512+1):(i*512)));     % filtrare qui il blocco di segnale
   ytm2(((i-1)*512+1):(i*512))=yy;
end

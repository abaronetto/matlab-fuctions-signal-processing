%--------------------------------------------------------------------------
% Metodo di Burg 
%--------------------------------------------------------------------------

% Calcolo della varianza asintotica per ordini del modello tra 2 e 50
eb=zeros(1,49);
for NN = 2:50
    [a,eb(NN-1)] = arburg(xm,NN); 
end
% NB: la varianza asintotica sarà l'ultimo valore del vettore contenente la
% varianza (quella ottenuta per ordine pari a 50)
figure
plot(eb)
title('eb')
% Calcolare il 5% della varianza asintotica e sommare alla varianza
% asintotica
asintb = eb(49)*0.05+eb(49);

% Trovare i valori di varianza che sono minori della varianza asintotica
% aumentata del 5%
[rb,c1b] = find(eb<asintb); 

% Scegliere l'ordine; 
% Si consiglia di considerare il secondo elemento perché il primo contiene 
% un valore inesatto
orderb = 31;

% Stima spettrale parametrica con metodo di Burg.
[Pbb, wb] = pburg(xm,orderb,NFFT);
f = wb/(2*pi)/(mean(XX(:,1))/1000); %normalizzazione delle frequenze

figure
plot(f, Pbb/max(Pbb))
title('PSD di Burg')
xlabel('frequenza (cicli/s)')
axis tight
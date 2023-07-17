%--------------------------------------------------------------------------
% Metodo di Burg 
%--------------------------------------------------------------------------

function [Pbb, f]=burg(x,ordine_varianza,NFFT,fc)

xm=x-mean(x);

% Calcolo della varianza asintotica per ordini del modello tra 2 e 50
eb=zeros(1,ordine_varianza-1);
for NN = 2:ordine_varianza
    [a,eb(NN-1)] = arburg(xm,NN); 
end
% NB: la varianza asintotica sarà l'ultimo valore del vettore contenente la
% varianza (quella ottenuta per ordine pari a 50)
figure
plot(eb)
title('eb')
% Calcolare il 5% della varianza asintotica e sommare alla varianza
% asintotica
asintb = eb(ordine_varianza-1)*0.05+eb(ordine_varianza-1);

% Trovare i valori di varianza che sono minori della varianza asintotica
% aumentata del 5%
[rb,c1b] = find(eb<asintb); 

display('Ordini per i quali la varianza è minore della varianza asintotica:');
disp(c1b);

% Scegliere l'ordine; 
% Si consiglia di considerare il secondo elemento perché il primo contiene 
% un valore inesatto
orderb = input('Inserisci ordine per la stima spettrale parametrica con il metodo di Burg\n (si consiglia di considerare il secondo elemento perchè più esatto): ');

% Stima spettrale parametrica con metodo di Burg.
[Pbb, f] = pburg(xm,orderb,NFFT,fc);

figure
plot(f, Pbb/max(Pbb))
title('PSD di Burg')
xlabel('frequenza (hz)') %  f = w_b/(2*pi)/(mean(x))/1000); per i cicli al secondo
axis tight
end
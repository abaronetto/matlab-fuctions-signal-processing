%--------------------------------------------------------------------------
% Metodo di Yule-Walker
%--------------------------------------------------------------------------
% Calcolo della varianza asintotica per ordini del modello tra 2 e 50
function [Pby, f]=yule_walker(x,ordine_varianza,NFFT,fc)

xm=x-mean(x);

for NN = 2:ordine_varianza
    [a,ey(NN-1)] = aryule(xm,NN); 
end
figure
plot(ey)
title('ey')
% Calcolare il 5% della varianza asintotica e sommare alla varianza
% asintotica
asinty = ey(ordine_varianza-1)*0.05+ey(ordine_varianza-1);
    
% Trovare i valori di varianza che sono minori della varianza asintotica
% aumentata del 5%
[ry,c1y] = find(ey<asinty); 

display('Ordini per i quali la varianza è minore della varianza asintotica:');
disp(c1y);

% Scegliere l'ordine; 
% Si consiglia di considerare il secondo elemento perché il primo contiene 
% un valore inesatto
ordery = input('Inserisci ordine per la stima spettrale parametrica con il metodo di Burg\n (si consiglia di considerare il secondo elemento perchè più esatto): ');
    
% Stima spettrale parametrica con metodo di Covarianza Modificata.
[Pby, f] = pyulear(xm,ordery,NFFT,fc);

% Normalizzare le frequenze - se voglio i cicli al secondo
%   f = wy/(2*pi)/(mean(x))/1000); 

% Rappresentare graficamente la densità spettrale di potenza della serie RR
% per l'ordine ottenuto con il metodo della covarianza modificata
figure
plot(f, Pby/max(Pby))
title('PSD di Yule-Walker')
xlabel('frequenza (hz)')
axis tight
end
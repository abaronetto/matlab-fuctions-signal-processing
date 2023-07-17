%--------------------------------------------------------------------------
% Metodo di Yule-Walker
%--------------------------------------------------------------------------
% Calcolo della varianza asintotica per ordini del modello tra 2 e 50
for NN = 2:50
    [a,ey(NN-1)] = aryule(xm,NN); 
end
figure
plot(ey)
title('ey')
% Calcolare il 5% della varianza asintotica e sommare alla varianza
% asintotica
asinty = ey(49)*0.05+ey(49);
    
% Trovare i valori di varianza che sono minori della varianza asintotica
% aumentata del 5%
[ry,c1y] = find(ey<asinty); 

% Scegliere l'ordine; 
% Si consiglia di considerare il secondo elemento perché il primo contiene 
% un valore inesatto
ordery = 30; %con 30 diventa simile a quello del metodo di Burg
    
% Stima spettrale parametrica con metodo di Covarianza Modificata.
[Pby, wy] = pyulear(xm,ordery,NFFT);

% Normalizzare le frequenze
f = wy/(2*pi)/(mean(XX(:,1))/1000); 

% Rappresentare graficamente la densità spettrale di potenza della serie RR
% per l'ordine ottenuto con il metodo della covarianza modificata
figure
plot(f, Pby/max(Pby))
title('PSD di Yule-Walker')
xlabel('frequenza (cicli/s)')
axis tight
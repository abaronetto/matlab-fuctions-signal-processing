%--------------------------------------------------------------------------
% Metodo della Covarianza Modificata 
%--------------------------------------------------------------------------

% Calcolo della varianza asintotica per ordini del modello tra 2 e 50
function [Pbcm, f]=covarianza_modificata(x,ordine_varianza,NFFT,fc)
xm=x-mean(x);
for NN = 2:ordine_varianza
    [a,ecm(NN-1)] = armcov(xm,NN); 
end
figure
plot(ecm)
title('ecm')
% Calcolare il 5% della varianza asintotica e sommare alla varianza
% asintotica
asintcm = ecm(ordine_varianza-1)*0.05+ecm(ordine_varianza-1);
    
% Trovare i valori di varianza che sono minori della varianza asintotica
% aumentata del 5%
[rcm,c1cm] = find(ecm<asintcm); 

display('Ordini per i quali la varianza è minore della varianza asintotica:');
disp(c1cm);

% Scegliere l'ordine; 
% Si consiglia di considerare il secondo elemento perché il primo contiene 
% un valore inesatto
ordercm = input('Inserisci ordine per la stima spettrale parametrica con il metodo di Burg\n (si consiglia di considerare il secondo elemento perchè più esatto): ');
    
% Stima spettrale parametrica con metodo di Covarianza Modificata.
[Pbcm, f] = pmcov(xm,ordercm,NFFT,fc);

% Normalizzare le frequenze
%f = wcm/(2*pi)/(mean(x)/1000); per avere i cicli al secondo. 1000 è per
%ottenerre i secondi

% Rappresentare graficamente la densità spettrale di potenza della serie RR
% per l'ordine ottenuto con il metodo della covarianza modificata
figure
plot(f, Pbcm/max(Pbcm))
title('PSD con il metodo della covarianza modificata')
xlabel('frequenza (hz)')
axis tight
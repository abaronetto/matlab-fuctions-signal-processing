function xacs = acs(x,ntlag,bias)
%Function xacs = acs(x,ntlag,bias);
%
% Funzione per la stima della sequenza di autocorrelazione (ACS)
% di una sequenza numerica di ingresso 'x'. La variabile 'ntlag'
% determina i ritardi temporali su cui stimare la ACS. La lunghezza
% della sequenza di uscita è pari a 2*ntlag+1.
% Il numero massimo di ritardi temporali possibili per la stima
% è pari alla lunghezza di 'x'.
%
% La funzione è in grado di effettuare la stima della ACS sia mediante
% lo stimatore polarizzato che mediante quello non polarizzato. La
% variabile logica 'bias' determina quale stimatore utilizzare.
%
% Ingressi:     x       vettore contenente la sequenza di cui stimare l'ACS
%               ntlag   numero di ritardi temporali per la stima
%               bias    variabile logica per la scelta dello stimatore
%                       se bias = 0 -> stimatore non polarizzato
%                       se bias = 1 -> stimatore polarizzato

% Author:   
% Date:     
% Comment:  Testing routine for the ESB course.

%ciclo principale che conta i ritardi
xacs=zeros(1,2*ntlag+1);
for i = 0:ntlag
    if i == 0
        %stima ACS per ritardo nullo
        xacs(i+1) = (sum(x.*conj(x)))/length(x);
    else
        %stima ACS per ritardi positivi
        %x(i)=0;
        x_shift=x';
        x_shift=circshift(x_shift,[i,0]);
        x_shift(1:i)=0;
        x_shift=x_shift';
        xacs(i+1) = sum(x_shift.*conj(x));

        %stima ACS per ritardi negativi
        xacs(2*ntlag-i+2) = conj(xacs(i+1));
        
        %normalizzazione della ACS stimata
        if bias == 0
            xacs(i+1) = xacs(i+1)/(length(x)-i);
            xacs(2*ntlag-i+2) = xacs(2*ntlag-i+2)/(length(x)-i);
        else
            xacs(i+1) = xacs(i+1)/length(x);
            xacs(2*ntlag-i+2) = xacs(2*ntlag-i+2)/length(x);  
        end
    end
end



%swap delle due metà del vettore per riportare
%la correlazione nulla al centro
%---------------------------------------------
xacs = fftshift(xacs);      %NON MODIFICARE QUESTA ISTRUZIONE!
end
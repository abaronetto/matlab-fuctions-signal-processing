% Mappa valore efficace
%----------------------
% Costruzione della matrice
Z=[std(eeg(:,1:5)); std(eeg(:,6:10)); std(eeg(:,11:15)); std(eeg(:,16:20)); std(eeg(:,21:25))]';

% Interpolazione
mappa(Z,'Mappa distribuzione valore efficace segnale EEG');
pause;

% Mappe potenze relative ritmi diversi
for i=1:5
    for j=1:5
        x2=eeg(:,j+(i-1)*5);
        [Zd(i,j),Zt(i,j),Za(i,j),Zb1(i,j),Zb2(i,j),Zu(i,j)]=rel_pot(x2);
    end
end

mappa(Zd,'Mappa ritmo delta');
pause;
mappa(Zt,'Mappa ritmo teta');
pause;
mappa(Za,'Mappa ritmo alfa');
pause;
mappa(Zb1,'Mappa ritmo beta 1');
pause;
mappa(Zb2,'Mappa ritmo beta 2');
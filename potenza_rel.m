function P_rel=potenza_rel(Pxx,f,banda);
%   Pxx = potenza del segnale, calcolata col periodogramma o correlogramma
%   f = asse delle frequenze dello spettro di potenza
%   banda = vettore le cui celle sono gli estremi delle bande di interesse
%   (es banda=[estremoinf_banda1 estremosup_banda1 estremoinf_banda2
%   estremosup_banda2...])

P_rel=zeros(1,length(banda)/2);
j=1;

for i=1:2:length(banda)
        index= f>=banda(i) & f<banda(i+1);
        Potenza_banda=sum(Pxx(index));
        P_tot=sum(Pxx);
        P_rel(j)=Potenza_banda/P_tot;
        j=j+1;
end


end
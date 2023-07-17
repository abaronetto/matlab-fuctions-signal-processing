%   Routine per il calcono dell'entropia approssimata

function [approximated_entropy, sample_entropy]=ASE(x, D, r); %  segnale, fsamp, campioni consecutivi, tolleranza

%   Inizializzazioni
N=length(x);
n_serie=N-D+1;
c=zeros(1,n_serie);
n_serie_1=N-D;
c_1=zeros(1,n_serie_1);

matrix=zeros(n_serie,D);

%   Calcolo serie temporali
for i=1:n_serie
    matrix(i,:)=x(i:(i+D-1));    
end

%   Calcolo la similitudine 
for i=1:n_serie
    for j=1:n_serie
       distanza = matrix(i,:)- matrix(j,:); 
       if max(abs(distanza)) < r
           c(1,i)=c(1,i)+1;
       end
    end
    c(1,i)=c(1,i)/n_serie;
end

%   Ripeto per D+1
%   Calcolo serie temporali
matrix_1=zeros(n_serie_1,D+1);
for i=1:n_serie_1
    matrix_1(i,:)=x(i:i+D);    
end

%   Calcolo la similitudine 
for i=1:n_serie_1
    for j=1:n_serie_1
       distanza = matrix_1(i,:)- matrix_1(j,:); 
       if max(abs(distanza)) < r
           c_1(1,i)=c_1(1,i)+1;
       end
    end
    c_1(1,i)=c_1(1,i)/n_serie_1;
end

%   Per calcolare media ponderata
count_c=histcounts(c,2);
c=sort(c);
valore_occorrenza=zeros(1,length(count_c));
for i=1:length(count_c)
    if i==1
        valore_occorrenza(1,i)=c(count_c(i));
    else
        valore_occorrenza(1,i)=c(count_c(i)+(i-1)*count_c(i-1)); 
    end
end

count_c_1=histcounts(c_1);
c_1=sort(c_1);
valore_occorrenza_1=zeros(1,length(count_c_1));
for i=1:length(count_c_1)
    if i==1
        valore_occorrenza_1(1,i)=c_1(count_c_1(i));
    else
        valore_occorrenza_1(1,i)=c_1(count_c_1(i)+(i-1)*count_c_1(i-1)); 
    end
end

C=sum(count_c.*valore_occorrenza)/n_serie;
C_1=sum(count_c_1.*valore_occorrenza_1)/n_serie_1;

approximated_entropy=log(C/C_1);

sample_entropy=(1/n_serie)*log(sum(valore_occorrenza./valore_occorrenza_1));
end
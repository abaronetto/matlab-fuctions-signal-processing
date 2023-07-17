function[xavW,SNRW]=woody(x,fc,rc,nrc,l1,l2)
% La funzione woody vuole in ingresso:
% x -> il segnale
% fc -> la frequenza di campionamento
% rc -> il ritardo massimo consentito
% nrc -> il numero massimo di rc consentito
% l1,l2 -> i limiti in campioni per il calcolo della deviazione standard
% In uscita restituisce:
% xavW -> il segnale mediato con compenso del jitter
% SNRW -> il rapporto segnale-rumore di xavW

[e c]=size(x);
xav=zeros(1,c);
for i=1:c
    xav(1,i)=mean(x(:,i));
end

limite=0;
ritardo=zeros(1,e);
traslazione=zeros(1,e);
xr=zeros(e,c);
for j=1:e
    a=xav;
    b=x(j,:);
    [ccs,lags]=xcorr(a',b');
    lags=lags/fc;
    ritardo(1,j)=lags(ccs==max(ccs));
    traslazione(1,j)=fix(ritardo(1,j)*fc);
    t=traslazione(1,j);
    if t==0
        xr(j,:)=x(j,:);
    else if t<0 % x in anticipo rispetto a xav
            t=abs(t);
            xr(j,1:c)=[zeros(1,t) x(j,1:c-t)];
        else    % x in ritardo rispetto a xav
            xr(j,1:c)=[x(j,t+1:c) zeros(1,t)];
        end
    end
    
    if abs(ritardo(1,j))>rc
        limite=limite+1;
        if limite>nrc
            fprintf('ATTENZIONE: numero di ritardi superiori a %.2f ms superato(%d)!\n\n',rc*1000,nrc);
            break
        end
    end
end

xavW=zeros(1,c);
for i=1:c
    xavW(1,i)=mean(xr(:,i));
end

App=max(xavW)-min(xavW);
if l2~=0 && l1~=0
    sigman1=std(xav(1:l1));
    sigman2=std(xav(l2:c));
    sigman=(sigman1+sigman2)/2;
else if l2==0
        sigman=std(xav(1:l1));
    else
        sigman=std(xav(l2:c));
    end
end
SNRW=20*log10(App/(4*sigman));

end
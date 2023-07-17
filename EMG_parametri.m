function [ondaM, RMS, MNF, MDF, w, cv, nsamp]=EMG_parametri(x, fc, fstim, epoch_len);
% x : è dato da 4 righe in cui nella prima c'è il singolo differenziale
% nella seconda c'è il doppio differenziale 1 e nella terza il doppio
% differenziale 2, nella quarta c'è la forza

n_epoch=fix(size(x,2)/fc);
nsamp=fix(fc/fstim);

ondaM=zeros(n_epoch,1);
MNF=zeros(n_epoch,1);
MDF=zeros(n_epoch,1);
RMS=zeros(n_epoch,1);
w=zeros(n_epoch,1);
cv=zeros(n_epoch,1);

for i=1:n_epoch
    XX=x(1,(i-1)*fc+1:i*fc);     
    
%      for j=1:fstim                PRENDENDO SOLO I CAMPIONI DELLO STIMOLO
%         xsd_m=xsd_m+xsd(((fsamp*(i-1))+(j-1)*nsamp+1):((fsamp*(i-1))+j*nsamp));
%         xsd_m=xsd_m/fstim;
%      end
    
    XX1=x(2,(i-1)*fc+1:i*fc);
    XX2=x(3,(i-1)*fc+1:i*fc);
    ondaM(i)=mean(XX);
    RMS(i)=sqrt(sum(XX.^2)*(fc/length(XX)));
    MNF(i)=fmean(XX,fc,epoch_len);
    MDF(i)=fmediana(XX,fc,epoch_len);
    w(i)=velcond(XX1,XX2,fc);   %   vengono tutte uguali
    %RIPETO CON DELAY
    start=10e-3/w(i);
    fft1r=real(fft(XX));
    fft1i=imag(fft(XX1));
    fft2r=real(fft(XX2));
    fft2i=imag(fft(XX2));
    tmp=delay(fft1r,fft1i,fft2r,fft2i,start);
    cv(i)=10e-3*fc/tmp;
end

 figure
 plot(ondaM), title('Onda M'), grid on
 
 figure
 plot(MNF./MNF(1)), hold on, plot(MDF./MDF(1)), hold on, plot(RMS./RMS(1)), hold on, plot(cv./cv(1))
 legend(sprintf('MNF %.2f',MNF(1)), sprintf('MDF %.2f', MNF(1)),sprintf('RMS %.2f',RMS(1)),sprintf('CV %.2f', cv(1)))
 grid on
 title('Fatigue Plot')
end

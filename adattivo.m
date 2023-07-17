function x_filtered=adattivo(x,c,fs)
f0=50;
wT=2*pi*f0/fs;
k=cos(wT);
en=zeros(length(x),1);
% en(1)=sin(wT);
i=1:length(x);
en(i)=sin(wT*i);
for i = 2:(length(x)-1)
    en(i+1)=2*k*en(i)-en(i-1);
    d=x(i+1)-en(i+1)-(x(i)-en(i));
    if d>0
        en(i+1)=en(1+i)+c;
    else 
        en(i+1)=en(i+1)-c;
    end
end
x_filtered=x-en;

end
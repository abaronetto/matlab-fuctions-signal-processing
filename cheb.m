[b,a]= cheby1(5,0.5,ft/(fs/2));    % ottenere qui i vettori a e b per un filtro di Chebyshev con ripple in banda passante
freqz(b,a,512,512)

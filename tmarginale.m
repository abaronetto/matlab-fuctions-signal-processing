function [marginale]=tmarginale(asset,distr)
marginale=sum(real(distr));
figure
plot(asset,marginale)
title('Marginale nel tempo')
xlabel('Tempo')
end
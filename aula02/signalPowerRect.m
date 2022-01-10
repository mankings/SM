function p = signalPowerRect(x, Ta, T)
%SIGNALPOWER(x, Ta, T)
%   x - expressão da onda
%   Ta - tempo de amostragem
%   T - período da onda
%   
%   Calcula a potência de um sinal utilizando aproximação retangular de
%   integrais, p = 1/T*(integral[0, T](x(t))*2)
x2 = x.^2;
area = x2*Ta;
integral = sum(area);
p = integral/T;
end
function [a, b] = fourier(Ta, T0, x, K)
%FOURIER
%   Calcula os coeficientes de Fourier de um sinal periódico x(n)
%   Ta - Período de amostragem, em segundos;
%   T0 - Período do sinal, em segundos;
%   x - Vetor (Nx1) com as amostras sucessivas do sinal a decompor (deverá ser passado
%       um número inteiro de períodos deste sinal, não devendo o último período ficar
%       truncado);
%   K - Número de harmónicas a considerar na decomposição.

    f0 = 1/T0;
    N = length(x);
    t = 0:Ta:(N-1)*Ta;
    a = zeros(1, K);
    b = zeros(1, K);
    for k = 1:K
        cos_k = cos(k*2*pi*f0*t);
        sin_k = sin(k*2*pi*f0*t);
        a(k) = 2*sum(x.*cos_k*Ta)/(N*Ta);
        b(k) = 2*sum(x.*sin_k*Ta)/(N*Ta);
    end
end
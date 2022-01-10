function [x, t] = invFourier(Ta, f0, Np, ak, bk)
%INVFOURIER Produz o sinal resultante da série de Fourier que é gerada a
%partir da seguinte informação
%   Ta - Período de amostragem, em segundos;
%   F0 - Frequência do sinal composto, em Hz;
%   Np - Número de períodos a considerar para o sinal resultante;
%   ak - Vetor (Kx1) com os valores de ak da série;
%   bk - Vetor (kx1) com os valores de bk da série;

    T0 = 1/f0;
    T = Np*T0;
    t = 0:Ta:T-Ta;
    w0 = 2*pi*f0;
    K = length(ak);
    
    x = zeros(1, length(t));
    for k = 1:K
        cos_k = ak(k)*cos(k*w0*t);
        sin_k = bk(k)*sin(k*w0*t);
        xk = cos_k + sin_k;
        x = x + xk;
    end
end
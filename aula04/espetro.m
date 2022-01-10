function [X, f] = espetro(x, Ta)
%ESPETRO Retorna e apresenta o espetro (amplitude apenas) de um sinal
%   x - vetor de amostras do sinal
%   Ta - período de amostragem
    N = length(x);
    fa = 1/Ta;
    
    k = 1:N;
    f = (k-1)*fa/N;
    f = ifftshift(f);
    f = f-f(1);
    f = fftshift(f);

    X = fft(x)/N;
    X = fftshift(X);

    figure;
    stem(f, abs(X));
    xlabel("Frequência");
    ylabel("Magnitude");
    title("Espetro");
end


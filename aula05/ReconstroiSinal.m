function [xi, ti] = ReconstroiSinal(x, Ta)
%RECONSTROISINAL Summary of this function goes here
%   Detailed explanation goes here
    N = length(x); %número de amostras
    T = N*Ta; %tempo final
    t = (0:N-1)*Ta; %vetor tempo
    Tai = Ta/100;
    ti = 0:Tai:T-Tai;
    Ni = length(ti);
    xi = zeros(1, Ni);
    
    for n = 1:N
        sincN = sinc(ti/Ta - t(n)/Ta);
        xi = xi + x(n)*sincN;
    end
end


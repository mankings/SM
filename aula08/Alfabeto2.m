function [simbolos, freq, contagem] = Alfabeto2(str)
%ALFABETO2
    n = length(str);
    simbolos = str(1);
    contagem(length(simbolos)) = 1;
    for i = 2:n
        char = str(i);
        if ~contains(simbolos, char)
            simbolos = [simbolos, char];
            contagem(length(simbolos)) = 1;
        else
            index = find(simbolos == char);
            contagem(index) = contagem(index) + 1;
        end
    end
    total = sum(contagem);
    freq = contagem/total * 100;
end

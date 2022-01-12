function simbolos = Alfabeto1(str)
%ALFABETO1
    n = length(str);
    simbolos = str(1);
    for i = 2:n
        char = str(i);
        if ~contains(simbolos, char)
            simbolos = [simbolos, char];
        end
    end
end

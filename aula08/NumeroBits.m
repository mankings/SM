function nbits = NumeroBits(texto)
%NUMEROBITS Número de bits usando algoritmo de codificação tal que:
% i) os símbolos são ordenados por ordem decrescente da sua frequência de ocorrência; 
% ii) o símbolo de índice 𝑘 é composto por 𝑘 bits todos iguais a 1, exceto o último que é sempre 0.

    [simbolos, freq, contagem] = Alfabeto2(texto);

    % sort the vectors
    [freq, ordem] = sort(freq, 'descend');
    simbolos = simbolos(ordem);
    contagem = contagem(ordem);

    nbits = 0;
    for i = 1:length(simbolos)
        nbits = nbits + i*contagem(i);
    end
end


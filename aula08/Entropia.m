function H = Entropia(texto)
%ENTROPIA Entropia de uma mensagem
    [simbolos, freq] = Alfabeto2(texto);

    % sort the vectors
    [freq, ordem] = sort(freq, 'descend');
    simbolos = simbolos(ordem);

    H = 0;
    for i = 1:length(simbolos)
        pk = freq(i)/100;
        H = H + pk*-log2(pk);
    end
end
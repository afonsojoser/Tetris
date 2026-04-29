function [] = desenhaTabuleiro(tabuleiroPecas, n, h)
for i = 1:n
    for j = 1:n
        for k = 1:h
            % Se houver uma peça nesta posição (i,j,k)
            if tabuleiroPecas(i,j,k) == 1
                % Calcular as coordenadas (x,y,z) baseadas nos índices
                formas(i-1,j-1,k-1,7)
            end
        end
    end
end
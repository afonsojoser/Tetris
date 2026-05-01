function [] = desenhaTabuleiro(tabuleiroPecas, n, h)
    for i = 1:n
        for j = 1:n
            for k = 1:h
                % Se houver uma peça nesta posição (i,j,k)
                if tabuleiroPecas(i,j,k) ~=0
                    % Calcular as coordenadas (x,y,z) baseadas nos índices
                    cubo(i-1,j-1,k-1,tabuleiroPecas(i,j,k))
                end
            end
        end
    end
end
function [tabuleiroPecas, pts,numLinhasEliminadas] = eliminarLinhas(tabuleiroPecas, n, nivel, pts)
    
iz1 = find(all(all(tabuleiroPecas == 1, 1), 2));
    iz1 = sort(iz1, 'descend');

    numLinhasEliminadas = length(iz1);
    if ~isempty(iz1)
        for g = 1:length(iz1)
            for i = 1:n
                for j = 1:n
                    tabuleiroPecas(i, j, iz1(g):end-1) = tabuleiroPecas(i, j, iz1(g)+1:end);
                    tabuleiroPecas(i, j, end) = 0;
                end
            end
        end
    end
        
       pts = pts + length(iz1)*nivel*(n*n);
    if length(iz1) == 3
        pts = pts + 200;
    end
end
function [tabuleiroPecas, pts,numLinhasEliminadas] = eliminarLinhas(tabuleiroPecas, n, nivel, pts,h)


iz1 = find(all(all(tabuleiroPecas ~=0, 1), 2));
iz1 = sort(iz1, 'descend');


numLinhasEliminadas = length(iz1);

if ~isempty(iz1)
    [xf, fs] = audioread("partir2.mp3");
    soundsc(xf, fs);
    m = zeros(n, n, length(iz1));

    m(:, :, :) = tabuleiroPecas(:, :, iz1);

    tabuleiroPecas(1:n, 1:n, iz1(1:end)) = 9;
    desenhaTabuleiro(tabuleiroPecas, n, h);
    pause(0.5);
    tabuleiroPecas(1:n, 1:n, iz1(1:end)) = m(1:n, 1:n, 1:end);
    desenhaTabuleiro(tabuleiroPecas, n, h);
    pause(0.5);
    tabuleiroPecas(1:n, 1:n, iz1(1:end)) = 9;
    desenhaTabuleiro(tabuleiroPecas, n, h);
    pause(0.5);

    for g = 1:length(iz1)
        for i = 1:n
            for j = 1:n
                tabuleiroPecas(i, j, iz1(g):end-1) = tabuleiroPecas(i, j, iz1(g)+1:end);
                tabuleiroPecas(i, j, end) = 0;
            end
        end
    end
    desenhaTabuleiro(tabuleiroPecas, n, h);

end

pts = pts + length(iz1)*nivel*(n*n);
if length(iz1) == 3
    pts = pts + 200;
end
end
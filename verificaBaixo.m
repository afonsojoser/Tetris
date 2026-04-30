function [tabuleiroPecas, bateu] = verificaBaixo(tabuleiroPecas, x, y, z, qualforma)
%  área que a peça ocupa na base
        switch qualforma
            case 1, xR = x; yR = y;
            case 2, xR = x:x+1; yR = y:y+1;
            case 3, xR = x; yR = y:y+1;
            case 4, xR = x; yR = y;
            case 5, xR = x; yR = y:y+2;
            case 6, xR = x; yR = y;
        end
   
        bateu = false;
    
        if z > 0 && ~bateu
            % Na camada abaixo, algum dos blocos debaixo da peça?
            fatia_abaixo = tabuleiroPecas(xR+1, yR+1, z);
            
            if any(fatia_abaixo == 1, 'all') || z == 0
                bateu = true; % Encontrou um obstáculo ou o chão
            end
        end

end



function [tabuleiroPecas, pts] = baixarPeca(tabuleiroPecas, x, y, h, qualforma, nivel, pts)
    %  área que a peça ocupa na base
        switch qualforma
            case 1, xR = x; yR = y;
            case 2, xR = x:x+1; yR = y:y+1;
            case 3, xR = x; yR = y:y+1;
            case 4, xR = x; yR = y;
            case 5, xR = x; yR = y:y+2;
            case 6, xR = x; yR = y;
        end
    
        % h_base correto, peça "descer" passo a passo
        h_base = h - 1;
        bateu = false;
    
        while h_base > 0 && ~bateu
            % Na camada abaixo, algum dos blocos debaixo da peça?
            fatia_abaixo = tabuleiroPecas(xR+1, yR+1, h_base);
            
            if any(fatia_abaixo == 1, 'all') || h_base == 0
                bateu = true; % Encontrou um obstáculo ou o chão
            else
                h_base = h_base - 1; % Continua a descer
            end
        end
        
        % h_base nível imediatamente abaixo da peça
        h_colocacao = h_base + 1;
       
        % 3. Guardar no tabuleiro conforme a peça
        switch qualforma
            case 1 % Cubo 1x1x1
                tabuleiroPecas(x+1, y+1, h_colocacao) = 1;
                pts = pts+ nivel*1;
            case 2 % Cubo 2x2x2
                tabuleiroPecas(x+1:x+2, y+1:y+2, h_colocacao:h_colocacao+1) = 1;
                pts = pts+nivel*8;
            case 3 % Prisma 2 deitado
                tabuleiroPecas(x+1, y+1:y+2, h_colocacao) = 1;
                pts = pts+nivel*2;
            case 4 % Prisma 2 em pé
                tabuleiroPecas(x+1, y+1, h_colocacao:h_colocacao+1) = 1;
                pts = pts+nivel*2;
            case 5 % Prisma 3 deitado
                tabuleiroPecas(x+1, y+1:y+3, h_colocacao) = 1;
                pts = pts+nivel*3;
            case 6 % Prisma 3 em pé
                tabuleiroPecas(x+1, y+1, h_colocacao:h_colocacao+2) = 1;
                pts = pts+nivel*3;
        end
        
end
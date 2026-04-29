function [x, y] = moverPeca(x, y, qualforma, n, tecla)
    % limites mínimos
    yLimitMin = 0;
    xLimitMin = 0;

    % define limites conforme a forma da peça
    switch qualforma 
        case 1 % bloco unitario  
            yLimitMax=n-1;
            xLimitMax=n-1;
        case 2 %cubo 2x2x2
            yLimitMax=n-2;
            xLimitMax=n-2;
        case 3 % prisma quadrangular comprimento 2 deitado
            yLimitMax=n-2;
            xLimitMax=n-1;
        case 4 % prisma quadrangular comprimento 2 em pé
            yLimitMax=n-1;
            xLimitMax=n-1;
        case 5 % prisma quadrangular comprimento 3 deitado
            yLimitMax=n-3;
            xLimitMax=n-1;
        case 6 % prisma quadrangular comprimento 3 em pé
            yLimitMax=n-1;
            xLimitMax=n-1;
    end
    
    % andar com as setas para mover o bloco
    if (strcmp(tecla,'uparrow'))%mov para +y
                if y<yLimitMax
                    y=y+1;
                end
    elseif (strcmp(tecla,'downarrow'))%mov para -y
        if  yLimitMin<y
            y=y-1;
        end
    elseif (strcmp(tecla,'rightarrow'))%mov para +x
        if x<xLimitMax
            x=x+1;
        end 
    elseif (strcmp(tecla,'leftarrow'))%mov para -x
        if x>xLimitMin
            x=x-1;
        end
    end
end
function [x, y] = moverPeca(x, y, qualforma, n, tecla)

    % limites mínimos
    yLimitMin = 0;
    xLimitMin = 0;
    
    xDescontos=[1 2 1 1 1 1 2 3];
    yDescontos=[1 2 2 1 3 1 1 1];
    yLimitMax=n-yDescontos(qualforma);
    xLimitMax=n-xDescontos(qualforma);
    
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
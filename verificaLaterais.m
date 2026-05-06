function semPeca=verificaLaterais(x,y,z,qualforma,M)

        %  volume que a peça ocupa
        switch qualforma
            case 1, xR = x; yR = y; zR=z;%cubo unitário
            case 2, xR = x:x+1; yR = y:y+1; zR=z:z+1;% cubo 2x2x2
            case 3, xR = x; yR = y:y+1; zR=z;% prisma quadrangular comprimento 2 deitado direção y 
            case 4, xR = x; yR = y; zR=z:z+1; % prisma quadrangular comprimento 2 em pé
            case 5, xR = x; yR = y:y+2; zR=z; % prisma quadrangular comprimento 3 deitado direção y
            case 6, xR = x; yR = y; zR=z:z+2; % prisma quadrangular comprimento 3 em pé
            case 7, xR = x:x+1; yR = y; zR=z; % prisma quadrangular comprimento 2 deitado direção z 
            case 8, xR = x:x+2; yR = y; zR=z; % prisma quadrangular comprimento 3 deitado direção y
        end
   
        semPeca = true;
    
        if z >= 0 && semPeca
            %verifica futuros pontos a ocupar, excluindo pontos fora
            %tabuleiro
            z_indices = zR + 1;
            z_indices=z_indices(z_indices <= size(M, 3));

            x_indices = xR + 1;
            x_indices=x_indices(x_indices <= size(M, 1));

            y_indices = yR + 1;
            y_indices=y_indices(y_indices <= size(M, 2));

            futuraPos = M(x_indices, y_indices, z_indices);
            
            if any(futuraPos ~= 0, 'all') || z == 0
                semPeca = false; % Encontrou um obstáculo ou o chão
            end
        end

end
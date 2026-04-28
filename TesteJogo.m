%% ------------------------------------------------------------------------------------------------------------------ 
clc;clear;

%---------------------parametros entrada--------------------------------
n = 5; 
h = 10;
fig=figure;

%----------------------------funçao----------------------------------

% desenho tabuleiro
xTabuleiro=0;
yxTabuleiro=0;
zxTabuleiro=0;
plot3(xTabuleiro,yxTabuleiro,zxTabuleiro);hold on;
grid on;          % Adiciona a grelha para referência
xlabel('X'); ylabel('Y'); zlabel('Z');
view(3);          % Ativa a vista 3D
shg;

% tabuleiro que indica as peças
tabuleiroPecas=zeros(n,n,h);
axis([0,n,0,n,0,h])


% 1º peça e desenho dela
qualforma=3; % qualforma=randi(6);
x=1;
y=1;
z=h-1;
desenhaeProjeta(tabuleiroPecas,x,y,z,qualforma);

% reset da tecla inicial
set(fig, 'UserData', 'nada');

% a colocar no interior da definiçaos dos limites
yLimitMin=0;
xLimitMin=0;

while all(tabuleiroPecas(:,:,10)~=1)
    waitforbuttonpress;% lê o que foi pressionado no teclado
    tecla = get(fig, 'CurrentKey');

    % define limites conforme a forma da peça
    switch qualforma 
        case 1 % bloco unitario  
            yLimitMax=n-1;
            xLimitMax=n-1;
            % yLimitMin=0;
            % xLimitMin=0;
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
            
    if (strcmp(tecla,'space')) % baixa a peça      
        
        %  área que a peça ocupa na base
        switch qualforma
            case 1, xR = x; yR = y;
            case 2, xR = x-1:x; yR = y-1:y;
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
            case 2 % Cubo 2x2x2
                tabuleiroPecas(x:x+1, y:y+1, h_colocacao:h_colocacao+1) = 1;
            case 3 % Prisma 2 deitado
                tabuleiroPecas(x+1, y+1:y+2, h_colocacao) = 1;
            case 4 % Prisma 2 em pé
                tabuleiroPecas(x+1, y+1, h_colocacao:h_colocacao+1) = 1;
            case 5 % Prisma 3 deitado
                tabuleiroPecas(x+1, y+1:y+3, h_colocacao) = 1;
            case 6 % Prisma 3 em pé
                tabuleiroPecas(x+1, y+1, h_colocacao:h_colocacao+2) = 1;
        end
        
        % 4. Reset para a próxima peça
        x = 2; % Índice seguro (evita o erro do 0)
        y = 2; % Índice seguro (evita o erro do 0)
        % qualforma = randi(6); TIRAR COMENT NO FINAL!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        cla;
        desenhaeProjeta(tabuleiroPecas, x, y, (h-1), qualforma);
    end
   
    cla;% apaga o grafico e desenha o bloco a cair na posição desejada 
    desenhaeProjeta(tabuleiroPecas,x,y,(h-1),qualforma);
    axis([0,n,0,n,0,h]);
    grid on;

    % desenho das peças já colocadas no tabuleiro
    for i = 1:n
        for j = 1:n
            for k = 1:h
                % Se houver uma peça nesta posição (i,j,k)
                if tabuleiroPecas(i,j,k) == 1
                    % Calcular as coordenadas (x,y,z) baseadas nos índices
                    formas(i-1,j-1,k-1,1)
                end
            end
        end
    end
    
    % if(all(tabuleiroPecas(:,:,k=1:n)==1))
        % tabuleiroPecas(:,:,k)=0;
    % end
end

close all;
disp('Game Over ma friends')


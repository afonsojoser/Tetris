function [] = TesteJogoMedio(n, h,fig) 
clc;

%---------------------parametros entrada--------------------------------
nivel = 2;
%----------------------------funçao----------------------------------
clf;%limpa ecrã
% reset da tecla inicial
set(fig, 'UserData', 'nada');
% pede o nome do utilizador
nome=pedeNome(fig);

% Pontuação
pts = 0;
pts_antigo = -1; % controlar atualizaçao pontos

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
axis equal;
axis([0,n,0,n,0,h])

% 1º peça e desenho dela
qualforma=randi(8);
x=0;
y=0;
z=h-1;
desenhaeProjeta(tabuleiroPecas,x,y,z,qualforma);

% reset da tecla inicial
set(fig, 'UserData', 'nada');
set(fig, 'KeyPressFcn', @(src, event) set(src, 'UserData', event.Key));%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

% amostragem dos pontos na lateral esq do tabuleiro
s=sprintf('Pontos:\n %d',pts);
mostraPontos = annotation('textbox', [0.125, 0.5, 1, 0.05],'String', s,'FontSize', 20,'Color', 'white','EdgeColor', 'none');

% Liga o cronómetro inicial e define tempo que demoara a baixar um nivel
tic;
tempoBaixa=1;

while all(tabuleiroPecas(:,:,h)~=1)
    % flag para saber se redesenha ou não
    atualizaEcra = false;     

    % flag de pausa entre peças
    precisaNovaPeca = false;

    % atualiza numero de pontos
    if pts ~= pts_antigo
        set(mostraPontos, 'String', ['Pontos: ', num2str(pts)]);
        pts_antigo=pts;
    end
    % lê tecla pressionada
    tecla = get(fig, 'UserData');
    set(fig, 'UserData', 'nada');

    if ~isempty(tecla) && ~strcmp(tecla, 'nada')
        % esc vai para pausa
        if (strcmp(tecla,'escape' ))
            e=pausaMenu(fig);
            if e==1
                break;
            end
        end

        % Movimento da peça (Setas)
        x_antigo = x; y_antigo = y;
        [x, y] = moverPeca(x, y, qualforma, n, tecla);
        if x ~= x_antigo || y ~= y_antigo
            atualizaEcra = true; % A peça moveu-se, desenha!
        end

        % baixa a peça  
        if (strcmp(tecla,'space'))     
            [tabuleiroPecas, pts] = baixarPeca(tabuleiroPecas, x, y, h, qualforma, nivel, pts);

            % 4. Reset para a próxima peça
            x = 0;
            y = 0;
            z=h-1;
            qualforma = randi(8); 
            precisaNovaPeca = true;
            atualizaEcra = true;
            tic;
        end
    end
    
    %---------------------------------------------Introduzido-------------------------------------------------------------
    if toc>=tempoBaixa
        z=z-1;
        [tabuleiroPecas, bateu] = verificaBaixo(tabuleiroPecas, x, y, z, qualforma);
        
        if z==0 || bateu% se já esta no ponto minimo
            % fixa a peça no tabuleiro
            [tabuleiroPecas, pts] = baixarPeca(tabuleiroPecas, x, y, h, qualforma, nivel, pts);
    
            % 4. Reset para a próxima peça
            x = 0;
            y = 0;
            z=h-1;
            qualforma = randi(6);
            precisaNovaPeca = true;
        end
        tic;
        atualizaEcra = true; % A gravidade atuou, desenha!
    end
    
    %_____________________________________________________________________________________________________________---
    

    % Elimina todas as camadas preenchidas
    [tabuleiroPecas, pts,numLinhasEliminadas] = eliminarLinhas(tabuleiroPecas, n, nivel, pts);
    if numLinhasEliminadas > 0
        atualizaEcra = true; % O tabuleiro mudou, desenha!
        if tempoBaixa>0.5
            tempoBaixa=tempoBaixa-numLinhasEliminadas*0.1*tempoBaixa;
        end
    end

    % --- 2. DESENHO (Apenas UMA vez no final do ciclo!) ---
    if atualizaEcra
        cla; % Apaga todos os gráficos antigos de uma vez
        desenhaeProjeta(tabuleiroPecas, x, y, z, qualforma); % Desenha a peça atual
        desenhaTabuleiro(tabuleiroPecas, n, h); % Desenha as peças no fundo
        axis([0,n,0,n,0,h]);
        grid on;
        drawnow limitrate
    else
        pause(0.01);
    end

    if precisaNovaPeca == true
        esperaEspaco(fig);
    end

end

% perdeu o jogo ou desistiu logo sai do jogo
janelaPopup = annotation('textbox', [0.3, 0.3, 0.4, 0.4], ...
    'String', sprintf('GAME OVER %s\n\nPontos Finais: %d\n\nPrime qualquer botão...',nome, pts), ...
    'BackgroundColor', [1 0 0], ... % Fundo quase preto
    'EdgeColor', [1 1 0], ...            % Borda amarela para destaque
    'LineWidth', 3, ...                  % Borda grossa
    'Color', 'white', ...                % Cor do texto
    'FontSize', 20, ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'middle');
escreveficheiros( nome, pts, nivel)
waitforbuttonpress;
delete(janelaPopup);
set(fig, 'UserData', 'nada');
return
end
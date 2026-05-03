function [] = TesteJogoFacil(n, h,fig) 
clc;

%---------------------parametros entrada--------------------------------
nivel = 1;
%----------------------------funçao----------------------------------

clf;%limpa ecrã
% reset da tecla inicial
set(fig, 'UserData', 'nada');
% pede o nome do jogador
nome=pedeNome(fig);

pts = 0;

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
qualforma=randi(6);
x=0;
y=0;
z=h-1;
desenhaeProjeta(tabuleiroPecas,x,y,z,qualforma);

% amostragem dos pontos na lateral esq do tabuleiro
s=sprintf('Pontos:\n %d',pts);
mostraPontos = annotation('textbox', [0.125, 0.5, 1, 0.05],'String', s,'FontSize', 20,'Color', 'white','EdgeColor', 'none');

while all(tabuleiroPecas(:,:,h)~=1)
    % atualiza numero de pontos
    set(mostraPontos, 'String', ['Pontos: ', num2str(pts)]);

    waitforbuttonpress;% lê o que foi pressionado no teclado
    tecla = get(fig, 'CurrentKey');
         
    % esc vai para pausa
    if (strcmp(tecla,'escape' ))
        e=pausaMenu(fig);
        if e==1
            break;
        end
    end

    % Movimento da peça (Setas)
    [x, y] = moverPeca(x, y, qualforma, n, tecla);

    % baixa a peça  
    if (strcmp(tecla,'space'))     
        [tabuleiroPecas, pts] = baixarPeca(tabuleiroPecas, x, y, h, qualforma, nivel, pts);

        % 4. Reset para a próxima peça
        x = 0;
        y = 0;
        qualforma = randi(8); 
        
        cla;
        desenhaeProjeta(tabuleiroPecas, x, y, z, qualforma);
    end

    % desenho das peças já colocadas no tabuleiro
    desenhaTabuleiro(tabuleiroPecas,n ,h );

    % Elimina todas as camadas preenchidas
    [tabuleiroPecas, pts] = eliminarLinhas(tabuleiroPecas, n, nivel, pts);

    % --- 2. DESENHO (Apenas UMA vez no final do ciclo!) ---
    cla; % Apaga todos os gráficos antigos de uma vez
    desenhaeProjeta(tabuleiroPecas, x, y, z, qualforma); % Desenha a peça atual
    desenhaTabuleiro(tabuleiroPecas, n, h); % Desenha as peças no fundo
    axis([0,n,0,n,0,h]);
    grid on;
    
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
function [] = TesteJogoDificil(n, h,fig) 
clc;

%---------------------parametros entrada--------------------------------
nivel = 3;

%----------------------------funçao----------------------------------
clf;%limpa ecrã

% reset da tecla inicial
set(fig, 'UserData', 'nada');
% pede o nome do utilizador
nome=pedeNome(fig);

% Pontuação
pts = 0;
pts_antigo = -1; % controlar atualizaçao pontos
axJogo = axes('Parent', fig); % Cria e guarda o gráfico do jogo
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
proximaForma= randi(8);

x=0;
y=0;
z=h-1;
desenhaeProjeta(tabuleiroPecas,x,y,z,qualforma);

% reset da tecla inicial
set(fig, 'UserData', 'nada');
set(fig, 'KeyPressFcn', @(src, event) set(src, 'UserData', event.Key));%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


% amostragem dos pontos na lateral esq do tabuleiro
s=sprintf('Pontos:\n %d',pts);
mostraPontos = annotation('textbox', [0.01, 0.8, 1, 0.05],'String', s,'FontSize', 20,'Color', 'red','EdgeColor', 'none','FontWeight','bold');

% mostra opções de visualização
OpcoesView = {
            '\color{blue}\bfModos de visualização:'
            '\color{yellow}1-Visão 3D \color{yellow}(padrão)'
            '\color{yellow}2-Lateral XZ'
            '\color{yellow}3-Lateral YZ'
            '\color{yellow}4-Topo XY'
            '\color{yellow}WASD-Modo livre'
            };
% CAIXa PARA a METER TEXTO
annotation('textbox', [0.01, 0.1, 0.2, 0.2], ...
            'String', OpcoesView, ...
            'Interpreter', 'tex', ...
            'FontSize', 20, ...
            'EdgeColor', 'k', ...
            'BackgroundColor','r', ...
            'FitBoxToText', 'on');



% Liga o cronómetro inicial e define tempo que demoara a baixar um nivel
tic;
tempoBaixa=1;

imagens(proximaForma, fig);
axes(axJogo);

while true
    % flag para saber se redesenha ou não
    atualizaEcra = false;     

    % atualiza numero de pontos
    if pts ~= pts_antigo
        set(mostraPontos, 'String', ['Pontos: ', num2str(pts)]);
        pts_antigo=pts;
    end
    % lê tecla pressionada
    tecla = get(fig, 'UserData');
    set(fig, 'UserData', 'nada');

    moveEcra(tecla);

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
        [x, y] = moverPeca(x, y, z,qualforma, n, tecla, tabuleiroPecas);
        if x ~= x_antigo || y ~= y_antigo
            atualizaEcra = true; % A peça moveu-se, desenha!
        end

        % baixa a peça  
        if (strcmp(tecla,'space') || strcmp(tecla,'return') )
            [tabuleiroPecas, pts] = baixarPeca(tabuleiroPecas, x, y, z, qualforma, nivel, pts);

            % 4. Reset para a próxima peça
            x = 0;
            y = 0;
            z=h-1;
            qualforma = proximaForma;
            proximaForma = randi(8);
            imagens(proximaForma, fig);
            axes(axJogo);

            atualizaEcra = true;
            tic;
        end
    end
    
    %---------------------------------------------Introduzido-------------------------------------------------------------
    if toc>=tempoBaixa
        z=z-1;
        tic;
        atualizaEcra = true; % A gravidade atuou, desenha!
    end
        [tabuleiroPecas, bateu] = verificaBaixo(tabuleiroPecas, x, y, z, qualforma);
        
    if z==0 || bateu% se já esta no ponto minimo
            % fixa a peça no tabuleiro
            [tabuleiroPecas, pts] = baixarPeca(tabuleiroPecas, x, y, z+1, qualforma, nivel, pts);
    
            % 4. Reset para a próxima peça
            x = 0;
            y = 0;
            z=h-1;
            qualforma = proximaForma;
            proximaForma = randi(8);
            imagens(proximaForma, fig);
            axes(axJogo);
            atualizaEcra = true; % A gravidade atuou, desenha!
    end
    
    %_____________________________________________________________________________________________________________---
    

    % Elimina todas as camadas preenchidas
    [tabuleiroPecas, pts,numLinhasEliminadas] = eliminarLinhas(tabuleiroPecas, n, nivel, pts, h);
    if numLinhasEliminadas > 0
        atualizaEcra = true; % O tabuleiro mudou, desenha!
        if tempoBaixa>0.2
            tempoBaixa=tempoBaixa-numLinhasEliminadas*0.1*tempoBaixa;
        end
    end

    % --- 2. DESENHO (Apenas UMA vez no final do ciclo!) ---
    if atualizaEcra
        cla; % Apaga todos os gráficos antigos de uma vez
        desenhaTabuleiro(tabuleiroPecas, n, h); % Desenha as peças no fundo

        % fim do jogo se na ultima cama tiver algo numa camada já extra
        if size(tabuleiroPecas, 3) > h || any(tabuleiroPecas(:,:,h)~=0, 'all')
            break;
        end


        desenhaeProjeta(tabuleiroPecas, x, y, z, qualforma); % Desenha a peça atual

        axis([0,n,0,n,0,h]);
        grid on;
        
        drawnow limitrate
    else
        pause(0.01);
    end
end

% som derrota
[xf, fs] = audioread("derrota.mp3");
soundsc(xf, fs);
pause(2.7); % o pause é de proposito para nao crashar 


% perdeu o jogo ou desistiu logo sai do jogo
janelaPopup = annotation('textbox', [0.3, 0.3, 0.4, 0.4], ...
    'String', sprintf('GAME OVER %s\n\nPontos Finais: %d\n\nPrime qualquer botão para reiniciar',nome, pts), ...
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
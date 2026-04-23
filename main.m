% menu feito
clear, clc, format compact,close all;
% abre o ecrã do jogo
fig = figure('Name', 'Tetris 3D','color',[0.21 0.62 0.89],'NumberTitle', 'off','WindowState', 'maximized');

posicaoMenu=1;
saida=0;

%seleção do que se deseja fazer
while saida==0
    clf;
    axis off; %retira grafico
    menuAtual(posicaoMenu); %print do menu atual

    waitforbuttonpress;% lê o que foi pressionado no teclado
    tecla = get(fig, 'CurrentKey');

    if (strcmp(tecla,'uparrow')) || (strcmp(tecla,'leftarrow'))% caso se ande para cima
        if posicaoMenu<=1 % passa para baixo se estiver no topo
            posicaoMenu=4;
        else
            posicaoMenu=posicaoMenu-1;
        end

    elseif (strcmp(tecla,'downarrow')) || (strcmp(tecla,'rightarrow'))% caso se ande para baixo
        if posicaoMenu>=4 % passa para cima se estiver no fundo
            posicaoMenu=1;
        else
            posicaoMenu=posicaoMenu+1;
        end
    elseif strcmp(tecla,'return') % opção desejada selecionada FALTA COISAS !!!!!!!!!!!!!!!!!!!!!!
        close all;
        disp('nice');
        break;
             
    end
end


% print do menu dependendo da posição do cursor
function menuAtual(posicaoMenu)
    switch posicaoMenu
        case 1
            %titulo
            txt = text(0.5, 1,' ', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
            set(txt, 'String', 'TETRIS 3D: O JOGO');
            %opções (selecionada opçao 1)
            txt = text(0.5, 0.75, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', '> 1) Novo Jogo <');
            txt = text(0.5, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '2) Estatísticas');
            txt = text(0.5, 0.25, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
            set(txt, 'String', '3) Definições');
            txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
            set(txt, 'String', '4) Sair');
        case 2
            %titulo
            txt = text(0.5, 1, '', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
            set(txt, 'String', 'TETRIS 3D: O JOGO');
            %opções (selecionada opçao 2)
            txt = text(0.5, 0.75, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', '1) Novo Jogo');
            txt = text(0.5, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '> 2) Estatísticas <');
            txt = text(0.5, 0.25, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
            set(txt, 'String', '3) Definições');
            txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
            set(txt, 'String', '4) Sair');
        case 3
            %titulo
            txt = text(0.5, 1, '', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
            set(txt, 'String', 'TETRIS 3D: O JOGO');
            %opções (selecionada opçao 3)
            txt = text(0.5, 0.75, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', '1) Novo Jogo');
            txt = text(0.5, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '2) Estatísticas');
            txt = text(0.5, 0.25, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
            set(txt, 'String', '> 3) Definições <');
            txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
            set(txt, 'String', '4) Sair');

        case 4
            %titulo
            txt = text(0.5, 1, '', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
            set(txt, 'String', 'TETRIS 3D: O JOGO');
            %opções (selecionada opçao 4)
            txt = text(0.5, 0.75, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', '1) Novo Jogo');
            txt = text(0.5, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '2) Estatísticas');
            txt = text(0.5, 0.25, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
            set(txt, 'String', '3) Definições');
            txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
            set(txt, 'String', '> 4) Sair <');
    end

end



%%

clear, clc, format compact;


% --- Configuração do Menu de Seleção ---
fig = figure('Name', 'Setup Tetris 3D', 'NumberTitle', 'off');
n = 10;
h = 10;
fase = 1; % 1 para base, 2 para altura
confirmado = false;

% Texto inicial no ecrã
txt = text(0.5, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center');
axis off;

% --- Ciclo de Seleção Interativo ---
while ~confirmado && ishandle(fig)
    if fase == 1
        set(txt, 'String', ['Defina n (Base): ', num2str(n)]);
    else
        set(txt, 'String', ['Defina h (Altura): ', num2str(h)]);
    end
    
    % Aguarda interação do utilizador
    waitforbuttonpress;
    tecla = get(fig, 'CurrentKey');
    
    % Lógica das setas e confirmação
    if strcmp(tecla, 'rightarrow') || strcmp(tecla, 'uparrow')
        if fase == 1
            n = min(10,n + 1)
        else
            h = min(10,h + 1)
        end
    elseif strcmp(tecla, 'leftarrow') || strcmp(tecla, 'downarrow')
        if fase == 1
            n = max(5, n - 1)
        else
            h = max(5, h - 1)
        end
    elseif strcmp(tecla, 'return')
        if fase == 1
            fase = 2;
        else
            confirmado = true;
        end
    end
end


if ishandle(fig)
    delete(txt); % Limpa o texto de seleção
    clf;         % Limpa a figura
    
    % Define os eixos nxnxh
    axis([0 n 0 n 0 h]);
    grid on;
    view(3);        % Ativa a vista 3D
    axis equal;     % Garante que os cubos não fiquem deformados
    
    % Legendas e Título
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title(['Espaço de Jogo: ', num2str(n), 'x', num2str(n), 'x', num2str(h)]);
    
    disp('Gráfico 3D configurado com sucesso.');

    espaco = zeros(n,n,h);
end
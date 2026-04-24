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
function leFicheiros(n, fig)
    clc;
    
    % escolhe o ficheiro
    switch n
        case 1
            fich = 'top_10_jogadores_l1.csv';
        case 2
            fich = 'top_10_jogadores_l2.csv';
        case 3
            fich = 'top_10_jogadores_l3.csv';
        case 4
            fich = 'ultimos_10_jogadores.csv';
        otherwise
            disp('Opção inválida');
            return;
    end
    
    % Lê os dados
    if exist(fich, 'file')
        dados = readtable(fich);
    else
        fprintf('Erro: O ficheiro %s não foi encontrado.\n', fich);
        return;
    end
    
    clf(fig);
    axes('Parent', fig, 'Position', [0 0 1 1]); 
    axis off; 
    hold on;  
    
    % screve o Título
    if n==4
        text(0.5, 0.90, 'TETRIS 3D: Últimos 10 Jogos ', 'FontSize', 24, 'HorizontalAlignment', 'center', 'Color', 'b', 'FontWeight', 'bold');
    else
        titulo = sprintf('TETRIS 3D: Top 10 Nível %d', n);
        text(0.5, 0.90, titulo, 'FontSize', 24, 'HorizontalAlignment', 'center', 'Color', 'b', 'FontWeight', 'bold');
    end
        
    % Escreve o Cabeçalho (Nomes das Colunas)
    y_pos = 0.75; % Altura inicial no gráfico 
    text(0.2, y_pos, 'NOME', 'FontSize', 14, 'FontWeight', 'bold');
    text(0.5, y_pos, 'PONTUAÇÃO', 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
    text(0.8, y_pos, 'NÍVEL', 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
    
    % Desenha a linha horizontal para separar o cabeçalho dos dados
    plot([0.15 0.85], [0.70 0.70], 'k-', 'LineWidth', 2);
    
    % Escreve os dados linha a linha
    num_linhas = height(dados);
    y_pos = 0.6; % Começa um pouco abaixo da linha desenhada
    espacamento = 0.1; % Espaço vertical entre cada jogador
    
    for i = 1:num_linhas
        nome = string(dados{i, 1});
        pontuacao = string(dados{i, 2});
        nivel = string(dados{i, 3});
        
        % Imprimir nas posições X correspondentes ao cabeçalho
        text(0.2, y_pos, nome, 'FontSize', 12);
        text(0.5, y_pos, pontuacao, 'FontSize', 12, 'HorizontalAlignment', 'center');
        text(0.8, y_pos, nivel, 'FontSize', 12, 'HorizontalAlignment', 'center');
        
        % Descer para a próxima linha
        y_pos = y_pos - espacamento;
    end
    
    % instrução para sair
    text(0.5, 0.05, 'Pressione ENTER para voltar', 'FontSize', 10,'HorizontalAlignment', 'center', 'Color', [0.5 0.5 0.5]);
    
    while true
        waitforbuttonpress;
        tecla = get(fig, 'CurrentKey');
        
        if strcmp(tecla, 'return')
            break; % Sai do loop e termina a função
        end
    end
end
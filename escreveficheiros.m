function [] = escreveficheiros(nome, pontuacao, nivel)

ficheiroUltimos = 'ultimos_10_jogadores.csv';
ficheiroTop = 'top_10_jogadores.csv';

novaEntrada = table(string(nome), pontuacao, nivel,'VariableNames', {'Nome', 'Pontuacao', 'Nivel'});


if isfile(ficheiroUltimos)
    tabelaUltimos = readtable(ficheiroUltimos, 'TextType', 'string');

    % Juntar a nova entrada no fim
    tabelaUltimos = [novaEntrada; tabelaUltimos ];

    % Se houver mais de 10 registos, manter apenas os últimos 10
    if height(tabelaUltimos) > 10
        tabelaUltimos = tabelaUltimos(1:10, :);
    end
else
    % Se o ficheiro não existir (primeiro jogo), a tabela é só a nova entrada
    tabelaUltimos = novaEntrada;
end

% Guardar no ficheiro
writetable(tabelaUltimos, ficheiroUltimos);


% --- Atualizar o Top 10 ---
    if isfile(ficheiroTop)
        % Se o ficheiro já existir, ler os dados
        tabelaTop = readtable(ficheiroTop, 'TextType', 'string');
        
        % Juntar a nova entrada
        tabelaTop = [tabelaTop; novaEntrada]; 
    else
        tabelaTop = novaEntrada;
    end

    % Ordenar a tabela pela coluna 'Pontuacao' por ordem decrescente (do maior para o menor)
    tabelaTop = sortrows(tabelaTop, 'Pontuacao', 'descend');

    % Se houver mais de 10 registos, cortar para manter apenas os 10 melhores
    if height(tabelaTop) > 10
        tabelaTop = tabelaTop(1:10, :);
    end

    % Guardar no ficheiro
    writetable(tabelaTop, ficheiroTop);
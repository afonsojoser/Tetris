function [] = cubo(x,y,z, n)

if nargin < 5
        c = 1;
end

% Configurações iniciais
hold on;


% Vértices e faces padrão de um cubo unitário
v_base = [0 0 0; 1 0 0; 1 1 0; 0 1 0; 0 0 1; 1 0 1; 1 1 1; 0 1 1];
f = [1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8];
posicoes = [x,y,z];
switch n
    case 1 %cubo unitário
        cor = [0.6, 0.2, 0.8];
    case 2 % cubo 2x2x2
        cor = [1, 0.5, 0];
    case 3 % prisma quadrangular comprimento 2 deitado
        cor = [1, 1, 0];
    case 4 % prisma quadrangular comprimento 2 em pé
        cor =  [0, 1, 1];
    case 5 % prisma quadrangular comprimento 3 deitado
        cor = [0, 1, 0];
    case 6 % prisma quadrangular comprimento 3 em pé
        cor = [0, 0, 1];
    case 7
        cor = [1, 0, 0];
end


for i = 1:size(posicoes, 1)
    % Desloca os vértices para a nova posição
    v_atual = v_base + posicoes(i, :);
    
    % Desenha o cubo na posição i
    patch('Vertices', v_atual, 'Faces', f,'FaceColor', cor, 'EdgeColor', 'black', 'FaceAlpha', 0.8);
end

hold off;
end
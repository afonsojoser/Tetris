function [] = formas(x,y,z, n, c)

if nargin < 5
        c = 1;
end

% Configurações iniciais
hold on;
view(3); grid on; axis equal;

% Vértices e faces padrão de um cubo unitário
v_base = [0 0 0; 1 0 0; 1 1 0; 0 1 0; 0 0 1; 1 0 1; 1 1 1; 0 1 1];
f = [1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8];

switch n
    case 1 %cubo unitário
        posicoes = [x,y,z];
        cor = [1, 0, 0];
    case 2 % cubo 2x2x2
        posicoes = [x,y,z; x,y-1,z; x-1,y-1,z; x-1,y,z; x,y,z+1; x,y-1,z+1; x-1,y-1,z+1; x-1,y,z+1];
        cor = [1, 0.5, 0];
    case 3 % prisma quadrangular comprimento 2 deitado
        posicoes = [x,y,z; x,y+1,z];
        cor = [1, 1, 0];
    case 4 % prisma quadrangular comprimento 2 em pé
        posicoes = [x,y,z; x,y,z+1];
        cor =  [1, 1, 0];
    case 5 % prisma quadrangular comprimento 3 deitado
        posicoes = [x,y,z; x,y+1,z; x,y+2,z ];
        cor = [0, 1, 0];
    case 6 % prisma quadrangular comprimento 3 em pé
        posicoes = [x,y,z; x,y,z+1; x,y,z+2];
        cor = [0, 1, 0];
end

if c==2 
    cor=[0.5, 0.5, 0.5];
end

for i = 1:size(posicoes, 1)
    % Desloca os vértices para a nova posição
    v_atual = v_base + posicoes(i, :);
    
    % Desenha o cubo na posição i
    patch('Vertices', v_atual, 'Faces', f,'FaceColor', cor, 'EdgeColor', 'black', 'FaceAlpha', 0.8);
end

title('Forma 3D composta por múltiplos cubos');
hold off;
end
function [] = imagens(n, fig)

switch n
    case 1
        [img, ~, alpha] = imread("cubo.png");
    case 2
        [img, ~, alpha] = imread("cubo2.png");
    case 3
        [img, ~, alpha] = imread("2deitadoy.png");
    case 4
        [img, ~, alpha] = imread("2pe.png");
    case 5
        [img, ~, alpha] = imread("3deitadoy.png");
    case 6
        [img, ~, alpha] = imread("3pe.png");
    case 7
        [img, ~, alpha] = imread("2deitadox.png");
    case 8
        [img, ~, alpha] = imread("3deitadox.png");
end

ax = findobj(fig, 'Tag', 'eixo_preview');
    
    if isempty(ax)
        % Se não encontrar nada, cria os eixos pela primeira vez
        % ax = axes('Parent', fig, 'Position', [0.7, 0.7, 0.2, 0.2]);
        ax = axes('Parent', fig, 'Position', [0.75, 0.75, 0.2, 0.2], 'Tag', 'eixo_preview');
    else
        % Se já existir, limpa o conteúdo (a imagem antiga) antes de meter a nova
        cla(ax);
    end


    hImg = imshow(img, 'Parent', ax);
    
    % 4. APLICAR A TRANSPARÊNCIA
    % Isto diz ao MATLAB quais os pixéis que devem ser transparentes
    set(hImg, 'AlphaData', alpha);

    % Limpeza visual
    axis(ax, 'off');
    % Garante que o fundo do quadrado dos eixos também é transparente
    set(ax, 'Color', 'none');

end


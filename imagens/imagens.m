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

    % Procura e apaga eixo antigo
    ax_antigo = findobj(fig, 'Tag', 'eixo_preview');
    if ~isempty(ax_antigo)
        delete(ax_antigo);
    end

    % Cria o eixo novo
    ax = axes('Parent', fig, 'Position', [0.75, 0.70, 0.2, 0.2], 'Tag', 'eixo_preview','Visible', 'off');

    % Mostra a imagem sem deixar o imshow mexer no eixo
    hImg = image(img, 'Parent', ax);
    set(hImg, 'AlphaData', alpha);
    title(ax, 'Próxima Peça', 'FontSize', 15, 'Color', 'r');

    axis(ax, 'image', 'off');
    set(ax, 'Tag', 'eixo_preview'); % repõe a Tag (o imshow pode apagá-la)
end
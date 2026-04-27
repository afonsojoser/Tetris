function [n, h] = definicoes(n, h,fig)
clc;
ndefs = 3;
posicaoDef = 1;
saida=0;
%seleção do que se deseja fazer
while saida==0
    clf;
    axis off; %retira grafico

    defAtual(posicaoDef, n, h) %print das definicoes atuais

    waitforbuttonpress;% lê o que foi pressionado no teclado
    tecla = get(fig, 'CurrentKey');

    if (strcmp(tecla,'uparrow'))% caso se ande para cima
        if posicaoDef<=1 % passa para baixo se estiver no topo
            posicaoDef=ndefs;
        else
            posicaoDef=posicaoDef-1;
        end

    elseif (strcmp(tecla,'downarrow'))% caso se ande para baixo
        if posicaoDef>=ndefs % passa para cima se estiver no fundo
            posicaoDef=1;
        else
            posicaoDef=posicaoDef+1;
        end
    elseif strcmp(tecla,'return') % volta ao menu principal
        if(posicaoDef == 3)
            return;
        end
    end
    if (strcmp(tecla,'leftarrow'))% caso se ande para cima
        if(posicaoDef == 1)
            n = max(4, n-1);
        elseif posicaoDef == 2
            h = max(4, h-1);
        end
    elseif (strcmp(tecla,'rightarrow'))% caso se ande para baixo
        if(posicaoDef == 1)
            n = min(10, n+1);
        elseif posicaoDef == 2
            h = min(10, h+1);
        end
        
    end
end

    function defAtual(posicaoDef, n, h)
        cla; % Limpa o axis para desenhar o menu atualizado sem sobrepor o anterior

        % Titulo (Y = 0.9)
        text(0.5, 0.9, 'TETRIS 3D: Definições', 'FontSize', 40, 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'Color', 'b');

        switch posicaoDef
            case 1
                % Opção 1 Selecionada
                text(0.5, 0.7, '> 1) Largura da base <', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'y');
                text(0.5, 0.6, sprintf('Largura atual(n): %d', n), 'FontSize', 20, 'HorizontalAlignment', 'center', 'Color', 'w');

                text(0.5, 0.5, '2) Altura', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'm');
                text(0.5, 0.4, sprintf('Altura atual(h): %d', h), 'FontSize', 20, 'HorizontalAlignment', 'center', 'Color', 'w');

                text(0.5, 0.2, '3) Sair', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'r');

            case 2
                % Opção 2 Selecionada
                text(0.5, 0.7, '1) Largura da base', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'y');
                text(0.5, 0.6, sprintf('Largura atual(n): %d', n), 'FontSize', 20, 'HorizontalAlignment', 'center', 'Color', 'w');

                text(0.5, 0.5, '> 2) Altura <', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'm');
                text(0.5, 0.4, sprintf('Altura atual(h): %d', h), 'FontSize', 20, 'HorizontalAlignment', 'center', 'Color', 'w');

                text(0.5, 0.2, '3) Sair', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'r');
            case 3
                % Opção 2 Selecionada
                text(0.5, 0.7, '1) Largura da base', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'y');
                text(0.5, 0.6, sprintf('Largura atual(n): %d', n), 'FontSize', 20, 'HorizontalAlignment', 'center', 'Color', 'w');

                text(0.5, 0.5, '2) Altura', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'm');
                text(0.5, 0.4, sprintf('Altura atual(h): %d', h), 'FontSize', 20, 'HorizontalAlignment', 'center', 'Color', 'w');

                text(0.5, 0.2, '> 3) Sair <', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'r');
        end
    end

end
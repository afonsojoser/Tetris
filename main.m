% menu feito
clear, clc, format compact,close all;

n = 5;
h = 10;

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
    elseif strcmp(tecla,'return') % opção desejada selecionada FALTA COISAS !!!!!!!!!!!!!!!!!!!!!!!
       
        switch posicaoMenu
            case 1 % caso novo jogo
                disp('JOGOOOOOOOOOOOOOOOO');
            case 2 % caso estatisticas
                disp('Estatisticaaaaaaaaa');
                stats();
            case 3 % caso definições
                [n, h] = definicoes(n, h,fig);
            case 4 % caso saida
                saida=saidaMesmo(fig);
                if saida==1
                    close all;
                end
        end
             
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

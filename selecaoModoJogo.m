function selecaoModoJogo(n, h,fig)

ModoJogo=1;
saida=0;
%seleção do que se deseja fazer
while saida==0
    clf;
    axis off; %retira grafico
    JogoAtual(ModoJogo); %print do menu atual

    waitforbuttonpress;% lê o que foi pressionado no teclado
    tecla = get(fig, 'CurrentKey');

    if (strcmp(tecla,'uparrow')) || (strcmp(tecla,'leftarrow'))% caso se ande para cima
        if ModoJogo<=1 % passa para baixo se estiver no topo
            ModoJogo=4;
        else
            ModoJogo=ModoJogo-1;
        end

    elseif (strcmp(tecla,'downarrow')) || (strcmp(tecla,'rightarrow'))% caso se ande para baixo
        if ModoJogo>=4 % passa para cima se estiver no fundo
            ModoJogo=1;
        else
            ModoJogo=ModoJogo+1;
        end
    elseif strcmp(tecla,'return') % opção desejada selecionada

       tutorial(ModoJogo,fig);
        switch ModoJogo
            case 1 % Modo jogo facil
                TesteJogoFacil(n, h,fig);
                return;
            case 2 % Modo jogo medio
                TesteJogoMedio(n, h,fig);
                return;
            case 3 % Modo jogo dificil
                TesteJogoDificil(n, h,fig);
                return;
            case 4 % voltar menu
                return;
        end
             
    end
end


% print do modo de jogo dependendo da posição do cursor
function JogoAtual(posicaoMenu)
    switch posicaoMenu
        case 1
            %titulo
            txt = text(0.5, 1,' ', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
            set(txt, 'String', 'Modo de jogo:');
            %opções (selecionada opçao 1)
            txt = text(0.5, 0.75, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', '> 1) Fácil <');
            txt = text(0.5, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '2) Médio');
            txt = text(0.5, 0.25, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
            set(txt, 'String', '3) Difícil');
            txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
            set(txt, 'String', '4) Voltar menu principal');
        case 2
            %titulo
            txt = text(0.5, 1,' ', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
            set(txt, 'String', 'Modo de jogo:');
            %opções (selecionada opçao 2)
            txt = text(0.5, 0.75, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', ' 1) Fácil ');
            txt = text(0.5, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '> 2) Médio <');
            txt = text(0.5, 0.25, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
            set(txt, 'String', '3) Difícil');
            txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
            set(txt, 'String', '4) Voltar menu principal');
        case 3
            %titulo
            txt = text(0.5, 1,' ', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
            set(txt, 'String', 'Modo de jogo:');
            %opções (selecionada opçao 3)
            txt = text(0.5, 0.75, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', '1) Fácil');
            txt = text(0.5, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '2) Médio');
            txt = text(0.5, 0.25, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
            set(txt, 'String', '> 3) Difícil <');
            txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
            set(txt, 'String', '4) Voltar menu principal');

        case 4
            %titulo
            txt = text(0.5, 1,' ', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
            set(txt, 'String', 'Modo de jogo:');
            %opções (selecionada opçao 4)
            txt = text(0.5, 0.75, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', '1) Fácil');
            txt = text(0.5, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '2) Médio');
            txt = text(0.5, 0.25, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
            set(txt, 'String', '3) Difícil');
            txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
            set(txt, 'String', '> 4) Voltar menu principal <');
    end

end

end
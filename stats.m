function [] = stats(fig)
clc;
nstats = 5;
posicaoS = 1;
saida=0;
%seleção do que se deseja fazer
while saida==0
    clf;
    axis off; %retira grafico

    statAtual(posicaoS) %print das definicoes atuais

    waitforbuttonpress;% lê o que foi pressionado no teclado
    tecla = get(fig, 'CurrentKey');

    if (strcmp(tecla,'uparrow'))% caso se ande para cima
        if posicaoS<=1 % passa para baixo se estiver no topo
            posicaoS=nstats;
        else
            posicaoS=posicaoS-1;
        end

    elseif (strcmp(tecla,'downarrow'))% caso se ande para baixo
        if posicaoS>=nstats % passa para cima se estiver no fundo
            posicaoS=1;
        else
            posicaoS=posicaoS+1;
        end
    elseif strcmp(tecla,'return') % volta ao menu principal
        if posicaoS==5
            return;
        else
            leFicheiros(posicaoS, fig);
        end
    end
end

    function statAtual(posicaoS)
        cla; % Limpa o axis para desenhar o menu atualizado sem sobrepor o anterior

        
        switch posicaoS
            case 1
                %titulo
                txt = text(0.5, 1,' ', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
                set(txt, 'String', 'TETRIS 3D: Estatísticas');
                %opções (selecionada opçao 1)
                txt = text(0.5, 0.8, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
                set(txt, 'String', '> 1) Top 10 Nível 1 <');
                txt = text(0.5, 0.6, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
                set(txt, 'String', '2) Top 10 Nível 2');
                txt = text(0.5, 0.4, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
                set(txt, 'String', '3) Top 10 Nível 3');
                txt = text(0.5, 0.2, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','w');%posição de escrita
                set(txt, 'String', '3) Últimos 10 Jogos');
                txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
                set(txt, 'String', '4) Sair');
            case 2
                %titulo
                txt = text(0.5, 1, '', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
                set(txt, 'String', 'TETRIS 3D: Estatísticas');
                %opções (selecionada opçao 2)
                txt = text(0.5, 0.8, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
                set(txt, 'String', '1) Top 10 Nível 1');
                txt = text(0.5, 0.6, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
                set(txt, 'String', '> 2) Top 10 Nível 2 <');
                txt = text(0.5, 0.4, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
                set(txt, 'String', '3) Top 10 Nível 3');
                txt = text(0.5, 0.2, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','w');%posição de escrita
                set(txt, 'String', '3) Últimos 10 Jogos');
                txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
                set(txt, 'String', '4) Sair');
            case 3
                %titulo
                txt = text(0.5, 1, '', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
                set(txt, 'String', 'TETRIS 3D: Estatísticas');
                %opções (selecionada opçao 3)
                txt = text(0.5, 0.8, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
                set(txt, 'String', '1) Top 10 Nível 1');
                txt = text(0.5, 0.6, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
                set(txt, 'String', '2) Top 10 Nível 2');
                txt = text(0.5, 0.4, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
                set(txt, 'String', '> 3) Top 10 Nível 3 <');
                txt = text(0.5, 0.2, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','w');%posição de escrita
                set(txt, 'String', '3) Últimos 10 Jogos');
                txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
                set(txt, 'String', '4) Sair');
             case 4
                %titulo
                txt = text(0.5, 1, '', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
                set(txt, 'String', 'TETRIS 3D: Estatísticas');
                %opções (selecionada opçao 4)
                txt = text(0.5, 0.8, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
                set(txt, 'String', '1) Top 10 Nível 1');
                txt = text(0.5, 0.6, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
                set(txt, 'String', '2) Top 10 Nível 2');
                txt = text(0.5, 0.4, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
                set(txt, 'String', '3) Top 10 Nível 3');
                txt = text(0.5, 0.2, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','w');%posição de escrita
                set(txt, 'String', '> 3) Últimos 10 Jogos <');
                txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
                set(txt, 'String', '4) Sair');

            case 5
                %titulo
                txt = text(0.5, 1, '', 'FontSize', 30, 'HorizontalAlignment', 'center','FontWeight','bold','Color','b');%posição de escrita
                set(txt, 'String', 'TETRIS 3D: Estatísticas');
                %opções (selecionada opçao 4)
                txt = text(0.5, 0.8, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
                set(txt, 'String', '1) Top 10 Nível 1');
                txt = text(0.5, 0.6, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
                set(txt, 'String', '2) Top 10 Nível 2');
                txt = text(0.5, 0.4, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','g');%posição de escrita
                set(txt, 'String', '3) Top 10 Nível 3');
                txt = text(0.5, 0.2, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','w');%posição de escrita
                set(txt, 'String', '3) Últimos 10 Jogos');
                txt = text(0.5, 0, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%posição de escrita
                set(txt, 'String', '> 4) Sair <');
        end
    end

end
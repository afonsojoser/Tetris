 % função confirmação de saida
function e=saidaMesmo(fig)
    e=100000;
    posSaida=1;
    while e~=0 && e~=1
        clf;
        clear tecla;
        axis off; %retira grafico
        saidaAtual(posSaida);
    
        waitforbuttonpress;% lê o que foi pressionado no teclado
        tecla = get(fig, 'CurrentKey');
    
        if (strcmp(tecla,'uparrow')) || (strcmp(tecla,'leftarrow'))% caso se ande para esquerda (opção não)
            if posSaida<=1 % passa para baixo se estiver no topo
                posSaida=2;
            else
                posSaida=posSaida-1;
            end
    
        elseif (strcmp(tecla,'downarrow')) || (strcmp(tecla,'rightarrow'))% caso se ande para baixo
            if posSaida>=2 % passa para cima se estiver no fundo
                posSaida=1;
            else
                posSaida=posSaida+1;
            end
        elseif strcmp(tecla,'return') % opção desejada selecionada FALTA COISAS !!!!!!!!!!!!!!!!!!!!!!!
            if posSaida==1
                e=0;
            elseif posSaida==2
                e=1;
            end
           
        end
    end
end

%funcao mostra opçoes saida
function saidaAtual(posSaida)

    switch posSaida
        case 1
            txt = text(0.5, 1,' ', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%pergunta
            set(txt, 'String', 'Deseja mesmo sair?');
            %opções (selecionada opçao 1)
            txt = text(0.25, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', '> 1) Não <');
            txt = text(0.75, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '2) Sim');
        case 2
            txt = text(0.5, 1,' ', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','r');%pergunta
            set(txt, 'String', 'Deseja mesmo sair?');
            %opções (selecionada opçao 1)
            txt = text(0.25, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','y');%posição de escrita
            set(txt, 'String', '1) Não');
            txt = text(0.75, 0.5, '', 'FontSize', 30, 'HorizontalAlignment', 'center','Color','m');%posição de escrita
            set(txt, 'String', '> 2) Sim <');
    end

end

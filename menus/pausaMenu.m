function e=pausaMenu(fig)
    % desenho do popup de pausa
    s=sprintf('PAUSA\n\nSair?\n\n> Sim <\n\n  Não  ');
    janelaPausa = annotation('textbox', [0.3, 0.3, 0.4, 0.4], ...
        'String', s, ...
        'BackgroundColor', [1 0 0], ... % Fundo quase preto
        'EdgeColor', [1 1 0], ...            % Borda amarela para destaque
        'LineWidth', 3, ...                  % Borda grossa
        'Color', 'white', ...                % Cor do texto
        'FontSize', 20, ...
        'FontWeight', 'bold', ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle');
    
    menuOpcao=1;
    % reset da tecla inicial
    set(fig, 'UserData', 'nada');
    saida=0;
    while saida==0
        %print da opção do menu
        switch menuOpcao
            case 1
                set(janelaPausa, 'String', sprintf('PAUSA\n\nSair?\n\n> Sim <\n\n  Não  '));
                e=1;
            case 2
                set(janelaPausa, 'String', sprintf('PAUSA\n\nSair?\n\n  Sim  \n\n> Não <'));
                e=0;
        end
    
        waitforbuttonpress;% lê o que foi pressionado no teclado
        tecla = get(fig, 'CurrentKey');
    
        if (strcmp(tecla,'uparrow') || (strcmp(tecla,'leftarrow')))% caso se ande para cima
            if menuOpcao<=1 % passa para baixo se estiver no topo
                menuOpcao=2;
            else
                menuOpcao=menuOpcao-1;
            end
    
        elseif (strcmp(tecla,'downarrow') || (strcmp(tecla,'rightarrow')))% caso se ande para baixo
            if menuOpcao>=2 % passa para cima se estiver no fundo
                menuOpcao=1;
            else
                menuOpcao=menuOpcao+1;
            end
        elseif strcmp(tecla,'return') % volta ao menu principal
            delete(janelaPausa);
            return;
            
        end
             
    end
end



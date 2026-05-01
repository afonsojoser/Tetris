function esperaEspaco(fig)
    % Limpa tecla antes
    set(fig, 'UserData', ''); 
    
    % loop até detetar espaço
    while ishandle(fig)
        tecla = get(fig, 'UserData'); % retira tecla
        
        if strcmp(tecla, 'space') % foi detetado espaço
            set(fig, 'UserData', ''); %limpa a peça
            break; % Sai do loop e o jogo continua
        end
        
        %pausa para ler teclado
        pause(0.01); 
    end
end
function [] = tutorial(ModoJogo,fig) 
clf;%limpa ecrã
% reset da tecla inicial
set(fig, 'UserData', 'nada');
axis off; %retira grafico

% apresentação tutorial dependendo do jogo
switch ModoJogo
    case 1 % modo facil
        texto_tutorial = {
            '\color{blue}\bfTUTORIAL: Modo Fácil' % \bf coloca em negrito
            ' '
            ' '
            '\color{red}OBJETIVO:'
            '\color{yellow}Encaixa blocos 3D para preencher fatias do tabuleiro.'
            '\color{yellow}Fatias cheias dão pontos! Se a torre bater no teto, é GAME OVER!'
            ' ' 
            '\color{red}Como Jogar:'
            '\color{yellow}Não há gravidade neste modo. Pensa com calma!'
            '\color{yellow}A peça flutua no topo à espera da tua jogada.'
            ' ' 
            '\color{red}Controlos:'
            '\color{yellow}Setas: Movem a peça no ar (eixos X e Y).'
            '\color{yellow}Espaço: Confirma a jogada e atira a peça para o fundo.'
            '\color{yellow}ESC: Abre o menu de Pausa.'
            '\color{yellow}Números 1-4: Muda visualização.'
            ' '
            ' '
            '\color{red}Pressione qualquer tecla para continuar...'
        };
        % CRIA CAIXA TEXTO PARAA METER TEXTO
        annotation('textbox', [0.05, 0.05, 0.90, 0.90], ...
            'String', texto_tutorial, ...
            'Interpreter', 'tex', ...
            'FontSize', 21, ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', ...
            'EdgeColor', 'none');
        
        waitforbuttonpress;
    case 2 % modo medio
        texto_tutorial = {
            '\color{blue}\bfTUTORIAL: Modo Médio' % \bf coloca em negrito
            ' '
            ' '
            '\color{red}OBJETIVO:'
            '\color{yellow}Encaixa blocos 3D para preencher fatias do tabuleiro.'
            '\color{yellow}Fatias cheias dão pontos a DOBRAR! Se a torre bater no teto, é GAME OVER!'
            ' ' 
            '\color{red}Como Jogar:'
            '\color{yellow}Neste modo, as peças caem sozinhas ao longo do tempo!'
            '\color{yellow}Quantas mais fatias eliminares, mais RÁPIDO o jogo fica.'
            '\color{yellow}Entre cada peça, o jogo pausa para respirares.'
            ' ' 
            '\color{red}Controlos:'
            '\color{yellow}Setas: Movem a peça no ar (eixos X e Y).'
            '\color{yellow}Espaço: Inicia a próxima peça OU atira a peça atual para o fundo.'
            '\color{yellow}ESC: Abre o menu de Pausa.'
            '\color{yellow}Números 1-4: Muda visualização.'
            ' '
            ' '
            '\color{red}Pressione qualquer tecla para continuar...'
        };
        % CRIA CAIXA TEXTO PARAA METER TEXTO
        annotation('textbox', [0.05, 0.05, 0.90, 0.90], ...
            'String', texto_tutorial, ...
            'Interpreter', 'tex', ...
            'FontSize', 21, ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', ...
            'EdgeColor', 'none');
        
        waitforbuttonpress;
           
    case 3 % modo dificil
        texto_tutorial = {
            '\color{blue}\bfTUTORIAL: Modo Difícil' % \bf coloca em negrito
            ' '
            ' '
            '\color{red}OBJETIVO:'
            '\color{yellow}Encaixa blocos 3D para preencher fatias do tabuleiro.'
            '\color{yellow}Neste nível ganhas o TRIPLO dos pontos! Bater no teto é GAME OVER!'
            ' ' 
            '\color{red}Como Jogar:'
            '\color{yellow}A gravidade não perdoa e o jogo NÃO ESPERA por ti!'
            '\color{yellow}Mal uma peça toca no fundo, a próxima começa a cair imediatamente.'
            '\color{yellow}Atenção: Destruir fatias faz o jogo ficar cada vez mais RÁPIDO.'
            ' ' 
            '\color{red}Controlos:'
            '\color{yellow}Setas: Movem a peça no ar (eixos X e Y).'
            '\color{yellow}Espaço: Atira a peça para o fundo instantaneamente.'
            '\color{yellow}ESC: Abre o menu de Pausa.'
            '\color{yellow}Números 1-4: Muda visualização.'
            ' '
            ' '
            '\color{red}Pressione qualquer tecla para continuar...'
        };
        % CRIA CAIXA TEXTO PARAA METER TEXTO
        annotation('textbox', [0.05, 0.05, 0.90, 0.90], ...
            'String', texto_tutorial, ...
            'Interpreter', 'tex', ...
            'FontSize', 21, ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', ...
            'EdgeColor', 'none');
        
        waitforbuttonpress;
        
    otherwise
        return;
end

end
function nome=pedeNome(fig)
% Texto descritivo
hTexto = uicontrol('Style', 'text', ...
    'String', 'Escreve o teu Nome de jogador:', ...
    'Position', [400, 200, 750, 250], ... % Ajusta o [X, Y, Largura, Altura]
    'FontSize', 30, ...
    'HorizontalAlignment', 'center', ...
    'BackgroundColor', get(fig, 'Color')); % Fica da cor do fundo da janela

%caixa de texto onde escreve
hEdit = uicontrol('Style', 'edit', ...
    'String', '', ... % Começa vazia
    'Position', [400, 250, 750, 100], ...
    'FontSize', 30, ...
    'Callback', @(src, event) uiresume(fig)); %Quando der Enter, avança!

uicontrol(hEdit);% cursor a piscar
uiwait(fig);% codigo parado até inserir o nome

nome = get(hEdit, 'String');% retira o nome que o utilizador introduziu

% Nome por defeito
if isempty(nome)
    nome = 'Nabo Anónimo'; 
end

% 6. Apaga o texto e a caixa
delete(hTexto);
delete(hEdit);

end
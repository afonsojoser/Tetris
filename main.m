% menu feito
clear, clc, format compact,close all;

n = 5;
h = 10;
%adiciona as pastas
caminhobase = 'C:\Users\Utilizador\Documents\Afonso\0 Universidade\2ºAno\2ºSemestre\MCEE\Projeto\Tetris';
%caminhobase=fileparts(mfilename('fullpath'));
addpath(fullfile(caminhobase,'ficheiros'));
addpath(fullfile(caminhobase,'imagens'));
addpath(fullfile(caminhobase,'jogos'));
addpath(fullfile(caminhobase,'menus'));
% abre o ecrã do jogo
menu(n, h)

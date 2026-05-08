% menu feito
clear, clc, format compact,close all;

n = 5;
h = 10;
%adiciona as pastas
caminhobase=fileparts(mfilename('fullpath'));
addpath(fullfile(caminhobase,'ficheiros'));
addpath(fullfile(caminhobase,'imagens'));
addpath(fullfile(caminhobase,'jogos'));
addpath(fullfile(caminhobase,'menus'));
% abre o ecrã do jogo
menu(n, h)

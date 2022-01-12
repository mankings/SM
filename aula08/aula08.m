clear;
clc;
close all;

struct = load('Mensagem.mat');
mensagem = struct.Mensagem;

%% ex1
simbolos = Alfabeto1(mensagem);

%% ex2
[simbolos, freq, contagem] = Alfabeto2(mensagem);
sum(contagem)*4; % 1216 bits

%% ex3
nbits = NumeroBits(mensagem); % 901 bits

%% ex4
H = Entropia(mensagem)
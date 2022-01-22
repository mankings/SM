clear;
clc;
close all;

%% ex1
% a)
H = 0.14 * log2(1/0.14) + 0.64 * log2(1/0.64) + 0.05 * log2(1/0.05) + 0.10 * log2(1/0.10) + 0.07 * log2(1/0.07)

% b)
% A 00
% B 1
% C 0110
% D 010
% E 0111

% c)
nBitsHuffman = [2, 1, 4, 3, 4];
frequencias = [0.14, 0.64, 0.05, 0.1, 0.07];
nMedioBits = sum(frequencias.*nBitsHuffman)

%% ex2
[a, b] = GeraMensagem(frequencias, 1000, nBitsHuffman)
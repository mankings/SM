%f = 0; T = 1/f;
T = 1; f = 1/T; A = 1; valMedio = 0; % periodo, freq e amplitude da sinusoide
N = 100; % n de amostras num periodo
Np = 5; % n de periodos
Ta = T/N;
ti = [0:0.001:1.5-0.001]; 
xi = sin(4*pi*ti);
plot(ti,xi);
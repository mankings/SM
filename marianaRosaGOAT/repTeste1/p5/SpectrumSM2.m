


function SpectrumSM2 (Q,step)
  
  [M,N] = size(Q);
  
  Qfreq = fftshift(fft2(Q))/M/N;
  QMag = abs(Qfreq);
  
  T1 = step * N;
  T2 = step * M;
  
  f1 = [0:(N-1)]' * (1/T1) - 1/(2*step);
  f2 = [0:(M-1)]' * (1/T2) - 1/(2*step);

  mesh(f1,f2,QMag);
  axis equal;
  
endfunction
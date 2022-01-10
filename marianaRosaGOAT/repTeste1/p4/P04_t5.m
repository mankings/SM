function x = P04_t5(X)
  X = fftshift(X);
  x = real(ifft(X));
end

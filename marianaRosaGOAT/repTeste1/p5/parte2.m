Ta = 0.01;
x = [0:Ta:5-Ta];
y = x;
z = zeros(length(x),length(y));
for ix = 1 : length(x)
   for iy = 1 : length(y)
       z(ix,iy) = cos(2*pi*(x(ix)-2*y(iy)));
   end
end
figure(87);
mesh(x,y,z);
Z = fft2(z);
imagesc(abs(fftshift(Z)));

%%

Ta = 0.01;
x = [-5:Ta:5-Ta];
y = x;
z = zeros(length(x),length(y));
for ix = 1 : length(x)
   for iy = 1 : length(y)
       z(ix,iy) = cos(2*pi*sqrt(x(ix)^2 + y(iy)^2));
   end
end
figure(88);
mesh(x,y,z);
figure(89);
imagesc(abs(fftshift(fft(z))));
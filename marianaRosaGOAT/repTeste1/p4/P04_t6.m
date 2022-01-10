clear all
x=(-5:0.1:5)
y=(-5:0.1:5);
z=zeros(length(x),length(y));
for ix=1:length(x)
  for iy=1:length(y)
    z(ix,iy)=sin(2*pi*(2*x(ix)+y(iy)));
  end
end
Z=fft2(z);
figure;mesh(x,y,z)
figure;plot(z(:,1))
figure;plot(z(1,:))
figure;mesh(abs(Z))
figure;mesh(abs(fftshift(Z)))

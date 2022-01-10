%% Espetro bidemensional a)
Ta=0.1;
x=[-5:Ta:5];
y=[-5:Ta:5];
z=zeros (length(x),length(y));

for ix=1:length(x)
    for iy=1:length(y)
       
        z(ix,iy)=sin(2*pi*(2*x(ix)+y(iy)));
    end
end

figure(1)
mesh(x,y,z);
Z= fft2(z);
figure(2)
mesh(abs(Z));

%% b)
x=[-5:0.1:5];
y=[-5:0.1:5];
w=zeros(length(x),length(y));

for ix=1:length(x)
    for iy=1:length(y)
        w(ix,iy)=sin(2*pi*(x(ix)^2+y(iy)^2)^(1/2));
    end
end
figure(4);
mesh(x,y,w);
W=fft2(w);
figure(3)
mesh(abs(W));

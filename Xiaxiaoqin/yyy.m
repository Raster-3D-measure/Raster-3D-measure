%绘制球面一块
v = -0.5:0.05:0.5;
[x, y] = meshgrid(v);
z = sqrt(1.0 - x.^2 - y.^2);
subplot(142),mesh(x,y,z);title('球面一块');
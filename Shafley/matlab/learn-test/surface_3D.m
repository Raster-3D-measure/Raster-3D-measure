%绘制典型三维曲面
z=peaks(25);  %由25x25矩阵创建三维曲面
figure(2),surfl(z);  %在2号窗口画带光照三维曲面图
shading interp  %以色彩浓淡模式插值
colormap(jet);  %蓝头红尾饱和色
grid;  %去网格
colorbar;  %加标尺
title('典型三维曲面');
xlabel('x');  %x轴标签
ylabel('y');
zlabel('z');
f=getframe(2);  %捕获2号窗体的图形数据
%imwrite(f.cdata,'fff.jpg');  %作为一副JPG图像输出

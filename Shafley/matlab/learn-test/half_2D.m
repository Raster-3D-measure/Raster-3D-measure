%伪色彩二维半图
[X,Y,Z]=peaks(40);n=4;  %40x40矩阵创建图形，给定等高线分级数n
subplot(121),pcolor(X,Y,Z);  %伪色彩图
colormap('jet'),shading interp; %采用蓝头红尾饱和色，浓淡插值
hold on,C=contourf(X,Y,Z,n,'k:');  %在图上用黑虚线画出等位线
clabel(C);  %以+引导水平放置标识C
colorbar;  %显示垂直标尺
hold off,subplot(122);
[C,h,CF]=contourf(X,Y,Z,n,'k:');  %用黑虚线填充等位线
clabel(C,h);  %沿线布置标识C

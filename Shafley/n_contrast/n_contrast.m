I=imread('img/psu.jpg');
I1=im2double(I);   %图像灰度值双精度化
subplot(331),imshow(I1);
I2=2*I1;
subplot(332),imshow(I2);
I3=3*I1;
subplot(333),imshow(I3);
I4=immultiply(I1,4);  %利用图像乘法函数把灰度值扩大4倍
subplot(334),imshow(I4);
I5=immultiply(I1,5);
subplot(335),imshow(I5);
I6=immultiply(I1,6);
subplot(336),imshow(I6);
I=imread('img/psu.jpg');
I7=rgb2gray(I);  %彩色图转成灰度图
[I8,T]=histeq(I7);   %将灰度值扩展到整个灰度范围
subplot(337),imshow(I8);title('直方图均衡化');
subplot(338),imhist(I8);title('直方图');   %显示直方图
subplot(339),plot((0:255)/255,T);title('变换曲线');
figure,imhist(I7);   %显示I1的直方图

%线性灰度变换
I=imread('img/psu.jpg');
I9=rgb2gray(I);
subplot(141),imshow(I9);title('原图的灰度图');
I10=im2double(I9);
subplot(143),imhist(I10);title('双精度化的直方图');
I11=imadjust(I10,[0 1],[0 0.3]); %缩小灰度值范围
subplot(144),imhist(I11);title('缩小灰度值的直方图');
subplot(142),imshow(I11);title('缩小灰度值的图像');
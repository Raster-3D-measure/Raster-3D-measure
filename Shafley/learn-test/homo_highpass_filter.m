I=imread('psu.jpg');
subplot(141),imshow(I);title('原图');
I1=double(I);  %不支持无符号整型计算
[M,N]=size(I1);  %计算图像的高和宽

%绘制球面一块
v = -0.5:0.05:0.5;
[x, y] = meshgrid(v);
z = sqrt(1.0 - x.^2 - y.^2);
subplot(144),mesh(x,y,z);title('球面一块');

%产生高斯型高通滤波器
m=round(M/2);  %四舍五入取整
n=round(N/2);
hh=1.035;hl=0.7;c=3;  %初始化高斯滤波器
for i=1;M;
    for j=1;N;
        d(i,j)=sqrt((i-m)^2+(j-n)^2);
    end
end
d0=median(median(d));  %取中值
for i=1;M;
    for j=1;N;
        h(i,j)=(hh-hl)*(1-exp(-c*(d(i,j)/d0)^2))+hl; %构建高斯滤波器
    end
end
% [i,j]=meshgrid(1:M,1:N);   %把由向量所指定的范围转化成数组
% subplot(143),mesh(j,i,h);title('高斯高通滤波器');  %绘制三维网线图

%同态滤波
I2=log(I1+1);  %对数变换
I3=fft(I2);  %傅里叶变换
I3=fftshift(I3);  %频谱中心化
I4=I3.*h;   %滤波
I4=ifftshift(I4);   %频谱反中心化
I4=ifft(I4);   %傅里叶反变换
I5=exp(I4-1);   %指数变换
I6=real(I5);   %取幅值
I7=mat2gray(I6);   %恢复变换后的数值范围
subplot(142),imshow(I7);title('同态滤波结果');









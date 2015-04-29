%用Roberts算子，Prewitt算子，Sobel算子，LoG算子，Canny算子进行边缘检测

I=imread('eight.tif');
%I=imread('psu.jpg');I=rgb2gray(I);
I=imread('deer.jpg');I=rgb2gray(I);
subplot(231),imshow(I);title('原图');
B1=edge(I,'roberts',0.04);    %用Roberts算子，梯度阀值为0.04
B2=edge(I,'prewitt',0.04);    %用Prewitt算子，梯度阀值为0.04
B3=edge(I,'sobel',0.04);      %用Sobel算子，梯度阀值为0.04
B4=edge(I,'log',0.003);       %用LoG算子，高斯滤波器器宽度参数Sigma=2
B5=edge(I,'canny',0.04);      %用Canny算子，Sigma=2
subplot(232),imshow(B1);title('Roberts算子');
subplot(233),imshow(B2);title('Prewitt算子');
subplot(234),imshow(B3);title('Sobel算子');
subplot(235),imshow(B4);title('LoG算子');
subplot(236),imshow(B5);title('Canny算子');
figure,imhist(I);


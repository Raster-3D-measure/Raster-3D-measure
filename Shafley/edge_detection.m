%��Roberts���ӣ�Prewitt���ӣ�Sobel���ӣ�LoG���ӣ�Canny���ӽ��б�Ե���

I=imread('eight.tif');
%I=imread('psu.jpg');I=rgb2gray(I);
I=imread('deer.jpg');I=rgb2gray(I);
subplot(231),imshow(I);title('ԭͼ');
B1=edge(I,'roberts',0.04);    %��Roberts���ӣ��ݶȷ�ֵΪ0.04
B2=edge(I,'prewitt',0.04);    %��Prewitt���ӣ��ݶȷ�ֵΪ0.04
B3=edge(I,'sobel',0.04);      %��Sobel���ӣ��ݶȷ�ֵΪ0.04
B4=edge(I,'log',0.003);       %��LoG���ӣ���˹�˲�������Ȳ���Sigma=2
B5=edge(I,'canny',0.04);      %��Canny���ӣ�Sigma=2
subplot(232),imshow(B1);title('Roberts����');
subplot(233),imshow(B2);title('Prewitt����');
subplot(234),imshow(B3);title('Sobel����');
subplot(235),imshow(B4);title('LoG����');
subplot(236),imshow(B5);title('Canny����');
figure,imhist(I);


I=imread('img/psu.jpg');
I1=im2double(I);   %ͼ��Ҷ�ֵ˫���Ȼ�
subplot(331),imshow(I1);
I2=2*I1;
subplot(332),imshow(I2);
I3=3*I1;
subplot(333),imshow(I3);
I4=immultiply(I1,4);  %����ͼ��˷������ѻҶ�ֵ����4��
subplot(334),imshow(I4);
I5=immultiply(I1,5);
subplot(335),imshow(I5);
I6=immultiply(I1,6);
subplot(336),imshow(I6);
I=imread('img/psu.jpg');
I7=rgb2gray(I);  %��ɫͼת�ɻҶ�ͼ
[I8,T]=histeq(I7);   %���Ҷ�ֵ��չ�������Ҷȷ�Χ
subplot(337),imshow(I8);title('ֱ��ͼ���⻯');
subplot(338),imhist(I8);title('ֱ��ͼ');   %��ʾֱ��ͼ
subplot(339),plot((0:255)/255,T);title('�任����');
figure,imhist(I7);   %��ʾI1��ֱ��ͼ

%���ԻҶȱ任
I=imread('img/psu.jpg');
I9=rgb2gray(I);
subplot(141),imshow(I9);title('ԭͼ�ĻҶ�ͼ');
I10=im2double(I9);
subplot(143),imhist(I10);title('˫���Ȼ���ֱ��ͼ');
I11=imadjust(I10,[0 1],[0 0.3]); %��С�Ҷ�ֵ��Χ
subplot(144),imhist(I11);title('��С�Ҷ�ֵ��ֱ��ͼ');
subplot(142),imshow(I11);title('��С�Ҷ�ֵ��ͼ��');
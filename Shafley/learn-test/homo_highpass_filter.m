I=imread('psu.jpg');
subplot(141),imshow(I);title('ԭͼ');
I1=double(I);  %��֧���޷������ͼ���
[M,N]=size(I1);  %����ͼ��ĸߺͿ�

%��������һ��
v = -0.5:0.05:0.5;
[x, y] = meshgrid(v);
z = sqrt(1.0 - x.^2 - y.^2);
subplot(144),mesh(x,y,z);title('����һ��');

%������˹�͸�ͨ�˲���
m=round(M/2);  %��������ȡ��
n=round(N/2);
hh=1.035;hl=0.7;c=3;  %��ʼ����˹�˲���
for i=1;M;
    for j=1;N;
        d(i,j)=sqrt((i-m)^2+(j-n)^2);
    end
end
d0=median(median(d));  %ȡ��ֵ
for i=1;M;
    for j=1;N;
        h(i,j)=(hh-hl)*(1-exp(-c*(d(i,j)/d0)^2))+hl; %������˹�˲���
    end
end
% [i,j]=meshgrid(1:M,1:N);   %����������ָ���ķ�Χת��������
% subplot(143),mesh(j,i,h);title('��˹��ͨ�˲���');  %������ά����ͼ

%̬ͬ�˲�
I2=log(I1+1);  %�����任
I3=fft(I2);  %����Ҷ�任
I3=fftshift(I3);  %Ƶ�����Ļ�
I4=I3.*h;   %�˲�
I4=ifftshift(I4);   %Ƶ�׷����Ļ�
I4=ifft(I4);   %����Ҷ���任
I5=exp(I4-1);   %ָ���任
I6=real(I5);   %ȡ��ֵ
I7=mat2gray(I6);   %�ָ��任�����ֵ��Χ
subplot(142),imshow(I7);title('̬ͬ�˲����');









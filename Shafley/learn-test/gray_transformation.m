%�Ҷȱ任��αɫ����ǿ
I=imread('psu.jpg');
I=double(I);
[M,N]=size(I);
I1=zeros(M,N);  %����һ����С��ԭʼͼ����ͬ����ֵ��Ϊ0�Ĳ�ɫͼ���ʽ����
L=256;          %�趨�Ҷȼ�Lλ256
for i=1:M
    for j=1:N
        if I(i,j)< L/4
            R(i,j)=0;G(i,j)=4*I(i,j);B(i,j)=L;   %�趨L/4��Χ��RGBֵ
            else if I(i,j)<L/2
                R(i,j)=0;G(i,j)=L;B(i,j)=-4*I(i,j)+2*L;   %�趨L/4--L/2��Χ��RGBֵ
                else if I(i,j)<=3*L/4
                        R(i,j)=4*I(i,j)-2*L;G(i,j)=L;B(i,j)=0;    %�趨L/2--3L/4��Χ��RGBֵ
                    else
                        R(i,j)=L;G(i,j)=-4*I(i,j)+4*L;B(i,j)=0;    %�趨3L/4--L��Χ��RGBֵ
                end
            end
        end
        I1(i,j,1)=R(i,j);    %�Ѻ�ɫ�����������I1��
        I1(i,j,2)=G(i,j);    %����ɫ�����������I1��
        I1(i,j,3)=B(i,j);    %����ɫ�����������I1��
    end
end
I1=I1/256;  %��һ��
figure,imshow(I1);
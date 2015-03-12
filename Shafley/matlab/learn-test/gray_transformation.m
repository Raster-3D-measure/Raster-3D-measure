%灰度变换法伪色彩增强
I=imread('psu.jpg');
I=double(I);
[M,N]=size(I);
I1=zeros(M,N);  %创建一个大小与原始图像相同、数值皆为0的彩色图像格式矩阵
L=256;          %设定灰度级L位256
for i=1:M
    for j=1:N
        if I(i,j)< L/4
            R(i,j)=0;G(i,j)=4*I(i,j);B(i,j)=L;   %设定L/4范围的RGB值
            else if I(i,j)<L/2
                R(i,j)=0;G(i,j)=L;B(i,j)=-4*I(i,j)+2*L;   %设定L/4--L/2范围的RGB值
                else if I(i,j)<=3*L/4
                        R(i,j)=4*I(i,j)-2*L;G(i,j)=L;B(i,j)=0;    %设定L/2--3L/4范围的RGB值
                    else
                        R(i,j)=L;G(i,j)=-4*I(i,j)+4*L;B(i,j)=0;    %设定3L/4--L范围的RGB值
                end
            end
        end
        I1(i,j,1)=R(i,j);    %把红色分量归入变量I1中
        I1(i,j,2)=G(i,j);    %把绿色分量归入变量I1中
        I1(i,j,3)=B(i,j);    %把蓝色分量归入变量I1中
    end
end
I1=I1/256;  %归一化
figure,imshow(I1);
%���Ƶ�����ά����
z=peaks(25);  %��25x25���󴴽���ά����
figure(2),surfl(z);  %��2�Ŵ��ڻ���������ά����ͼ
shading interp  %��ɫ��Ũ��ģʽ��ֵ
colormap(jet);  %��ͷ��β����ɫ
grid;  %ȥ����
colorbar;  %�ӱ��
title('������ά����');
xlabel('x');  %x���ǩ
ylabel('y');
zlabel('z');
f=getframe(2);  %����2�Ŵ����ͼ������
%imwrite(f.cdata,'fff.jpg');  %��Ϊһ��JPGͼ�����

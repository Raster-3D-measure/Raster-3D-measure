%αɫ�ʶ�ά��ͼ
[X,Y,Z]=peaks(40);n=4;  %40x40���󴴽�ͼ�Σ������ȸ��߷ּ���n
subplot(121),pcolor(X,Y,Z);  %αɫ��ͼ
colormap('jet'),shading interp; %������ͷ��β����ɫ��Ũ����ֵ
hold on,C=contourf(X,Y,Z,n,'k:');  %��ͼ���ú����߻�����λ��
clabel(C);  %��+����ˮƽ���ñ�ʶC
colorbar;  %��ʾ��ֱ���
hold off,subplot(122);
[C,h,CF]=contourf(X,Y,Z,n,'k:');  %�ú���������λ��
clabel(C,h);  %���߲��ñ�ʶC

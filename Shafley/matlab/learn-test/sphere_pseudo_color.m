 %��ͬαɫ����ǿЧ������
 subplot(131);sphere(16);  %��ʾ����
 axis square;  %������1:1
 shading flat;  %���÷ֲ���������
 grid;title('Flat Shading');  %ȥ�������Ա���
 subplot(132);sphere(16);
 axis square;  %������1:1
 shading faceted;  %����С������������
 grid;title('Faceted Shading');
 subplot(133);sphere(16);
 axis square;  %������1:1
 shading interp;  %���ò岹��������
 grid;title('Interpolated Shading');

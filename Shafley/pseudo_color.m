%�Ҷȷֲ㷨αɫ��ͼ��
I=imread('psu.jpg');
subplot(331),imshow(I);title('ԭͼ');
for m=8:8:64
    X=grayslice(I,m);   %���Ҷ�ֵ�ֳ�m��
    subplot(3,3,m/8+1),imshow(X,hot(m));   %�ں�׻�Ũ��ɫ��αɫ��
    switch m
        case 8
            title('8ɫαɫ��ͼ��');
        case 16
            title('16ɫαɫ��ͼ��');
        case 48
            title('48ɫαɫ��ͼ��');
        case 56
            title('56ɫαɫ��ͼ��');
        case 64
            title('64ɫαɫ��ͼ��');
        otherwise
            title('�����ֲ�');
    end
end
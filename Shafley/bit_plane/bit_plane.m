%λ���ʾ
I=imread('img/psu.jpg');
subplot(331),imshow(I);title('ԭͼ');
for k=8:-1:1
    I1=255*bitget(I,k);    %��ȡ������I��λ��k����λֵ
    subplot(3,3,10-k),imshow(I1);title(['λ��',num2str(k-1)]);
end


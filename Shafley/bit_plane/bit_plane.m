%位面表示
I=imread('img/psu.jpg');
subplot(331),imshow(I);title('原图');
for k=8:-1:1
    I1=255*bitget(I,k);    %获取操作数I的位置k处的位值
    subplot(3,3,10-k),imshow(I1);title(['位面',num2str(k-1)]);
end


%灰度分层法伪色彩图像
I=imread('psu.jpg');
subplot(331),imshow(I);title('原图');
for m=8:8:64
    X=grayslice(I,m);   %将灰度值分成m层
    subplot(3,3,m/8+1),imshow(X,hot(m));   %黑红白黄浓淡色的伪色彩
    switch m
        case 8
            title('8色伪色彩图像');
        case 16
            title('16色伪色彩图像');
        case 48
            title('48色伪色彩图像');
        case 56
            title('56色伪色彩图像');
        case 64
            title('64色伪色彩图像');
        otherwise
            title('其他分层');
    end
end
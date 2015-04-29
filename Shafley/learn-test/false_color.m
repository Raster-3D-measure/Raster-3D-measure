%假色彩增强处理
rgb=imread('psu.jpg');
subplot(121);imshow(rgb);   %显示该真彩图
f_rgb(:,:,1)=rgb(:,:,3);    %将蓝色分量变为红色分量
f_rgb(:,:,2)=rgb(:,:,1);    %将红色分量变为绿色分量
f_rgb(:,:,3)=rgb(:,:,2);    %将绿色分量变为蓝色分量
subplot(122);imshow(f_rgb);   %显示假色彩处理后的图
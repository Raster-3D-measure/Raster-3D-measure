space = 16;
I1 = zeros(1024,1024);
I2 = I1;
I3 = I1;
I4 = I1;
for i=1:1024
  for j=1:1024
    I1(i,j) = 127.5+127.5*cos(j/space*2*pi);
    I2(i,j) = 127.5+127.5*cos(j/space*2*pi+pi/2);
    I3(i,j) = 127.5+127.5*cos(j/space*2*pi+pi);
    I4(i,j) = 127.5+127.5*cos(j/space*2*pi+3*pi/2);
  end  
end

I1 = mat2gray(I1);
% I1 = im2uint8(mat2gray(I1));
% s=I1(45,45);
% d=I2(45,45);
I2 = mat2gray(I2);
% f=I2(45,45);
I3 = mat2gray(I3);
I4 = mat2gray(I4);
% subplot(141),imshow(I1); 
% subplot(142),imshow(I2); 
% subplot(143),imshow(I3); 
% subplot(144),imshow(I4); 
figure(1), imshow(I1);
figure(2), imshow(I2);
figure(3), imshow(I3);
figure(4), imshow(I4);

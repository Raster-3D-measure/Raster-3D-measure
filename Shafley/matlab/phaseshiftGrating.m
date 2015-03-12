function grayGrating()
    clear all;
    %光栅频率   
    space = 32;
    width = 1024;
    height = 512;
    
    %创建4个空矩阵
    I1 = zeros(height,width);
    I2 = I1;
    I3 = I1;
    I4 = I1;
    
    %生成正弦光栅
    for i=1:height
      for j=1:width
        I1(i,j) = 127.5+127.5*cos(j/space*2*pi);
        I2(i,j) = 127.5+127.5*cos(j/space*2*pi+pi/2);
        I3(i,j) = 127.5+127.5*cos(j/space*2*pi+pi);
        I4(i,j) = 127.5+127.5*cos(j/space*2*pi+3*pi/2);
      end  
    end
    
    I1 = mat2gray(I1);
    I2 = mat2gray(I2);
    I3 = mat2gray(I3);
    I4 = mat2gray(I4);
    % I1 = im2uint8(mat2gray(I1));
    figure(1), imshow(I1);
    figure(2), imshow(I2);
    figure(3), imshow(I3);
    figure(4), imshow(I4);
end

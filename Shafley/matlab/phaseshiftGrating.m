function grayGrating()
    clear all;
    %光栅频率   
    space = 64;
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
    
    scrsz = get(0,'ScreenSize');
    
    figure('NumberTitle', 'off', 'Name', '请按任意键继续...');
    imshow(I1),title(['光栅频率: ', num2str(space), '        ', '相移0°']);
    set(gcf,'Position',scrsz);
    disp('请按任意键继续...');
    pause;
    
    %figure('NumberTitle', 'off', 'Name', '相移90°');
    imshow(I2),title(['光栅频率: ', num2str(space), '        ', '相移90°']);
    set(gcf,'Position',scrsz);
    disp('请按任意键继续...');
    pause;
    
    %figure('NumberTitle', 'off', 'Name', '相移180°');
    imshow(I3),title(['光栅频率: ', num2str(space), '        ', '相移180°']);
    set(gcf,'Position',scrsz);
    disp('请按任意键继续...');
    pause;
    
    %figure('NumberTitle', 'off', 'Name', '相移270°');
    imshow(I4),title(['光栅频率: ', num2str(space), '        ', '相移270°']);
    set(gcf,'Position',scrsz);
    disp('请按任意键继续...');
end


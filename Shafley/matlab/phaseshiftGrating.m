function grayGrating()
    clear all;
    %��դƵ��   
    space = 64;
    width = 1024;
    height = 512;
    
    %����4���վ���
    I1 = zeros(height,width);
    I2 = I1;
    I3 = I1;
    I4 = I1;
    
    %�������ҹ�դ
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
    
    figure('NumberTitle', 'off', 'Name', '�밴���������...');
    imshow(I1),title(['��դƵ��: ', num2str(space), '        ', '����0��']);
    set(gcf,'Position',scrsz);
    disp('�밴���������...');
    pause;
    
    %figure('NumberTitle', 'off', 'Name', '����90��');
    imshow(I2),title(['��դƵ��: ', num2str(space), '        ', '����90��']);
    set(gcf,'Position',scrsz);
    disp('�밴���������...');
    pause;
    
    %figure('NumberTitle', 'off', 'Name', '����180��');
    imshow(I3),title(['��դƵ��: ', num2str(space), '        ', '����180��']);
    set(gcf,'Position',scrsz);
    disp('�밴���������...');
    pause;
    
    %figure('NumberTitle', 'off', 'Name', '����270��');
    imshow(I4),title(['��դƵ��: ', num2str(space), '        ', '����270��']);
    set(gcf,'Position',scrsz);
    disp('�밴���������...');
end


function project()
    clear all;
    
    %�����������ҹ�դ
    %phaseshiftGrating();
    
    %���Ʊ궨
    [X, Y, O] = phaseshiftCalibration();
    
    %�����
    BG1 = unwrapping(X);
    figure('NumberTitle', 'off', 'Name', '������λͼ');
    subplot(131),imshow(BG1, []);title('BG1');
    
    BG2 = unwrapping(Y);
    subplot(132),imshow(BG2, []);title('BG2');
    
    PIC = BG1 - BG2;
    subplot(133),imshow(PIC, []);title('BG1 - BG2');
        
    OP = unwrapping(O);
    figure('NumberTitle', 'off', 'Name', '������λͼ');
    subplot(121),imshow(OP, []);title('OP');
    
    OBJ = BG1 - OP;
    subplot(122),imshow(OBJ, []);title('BG1 - OP');
       
    E=OBJ;
    %E=2.54*OBJ./PIC;
    
    figure('NumberTitle', 'off', 'Name', '��ԭͼ');
    imshow(E, []),title('��ԭͼ');
    
    [m,n]=size(E);
    figure('NumberTitle', 'off', 'Name', '��άͼ');
    mesh(E),title('��άͼ');
end

%�����������ҹ�դ
function phaseshiftGrating()

    %��դƵ��   
    space = 32;
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
    pause;
end

%���Ʊ궨  
% XΪbg1��λ��YΪbg2��λ��OΪ�������λ
function [X, Y, O] = phaseshiftCalibration()
    B1=im2double(imread('1.bmp'));
    B2=im2double(imread('2.bmp'));
    B3=im2double(imread('3.bmp'));
    B4=im2double(imread('4.bmp'));
    A1=im2double(imread('5.bmp'));
    A2=im2double(imread('6.bmp'));
    A3=im2double(imread('7.bmp'));
    A4=im2double(imread('8.bmp'));
    C1=im2double(imread('O1.bmp'));
    C2=im2double(imread('O2.bmp'));
    C3=im2double(imread('O3.bmp'));
    C4=im2double(imread('O4.bmp'));
    
    fig=figure ('Name','��ȡ����Ȥ����','NumberTitle','off');
    imshow(C1,[]);
    
    h=msgbox('��ȷ�Ϻ�������ȡ��������','��ʾ','help');
    waitfor(h);
    
    rect=getrect(fig);
    w = round(rect(3));
    h= round(rect(4));
    rectangle('Position',[rect(1),rect(2),w,h],'Curvature',[0,0],'edgecolor','red');
    
    C1=C1(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    C2=C2(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    C3=C3(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    C4=C4(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    
    A1=A1(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    A2=A2(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    A3=A3(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    A4=A4(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    
    B1=B1(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    B2=B2(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    B3=B3(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    B4=B4(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
       
    I1=B4-B2;
    I2=B1-B3;
    J1=A4-A2;
    J2=A1-A3;
    O1=C4-C2;
    O2=C1-C3;
    
    %����λ
    [X,M,N] = untiePhase( I1, I2 );
    [Y,M,N] = untiePhase( J1, J2 );
    [O,M,N] = untiePhase( O1, O2 );
    
end

%����λ
function [R,M,N] = untiePhase( A, B )

    [M,N]=size(A);
    for i=1:M
        for j=1:N
            if A(i,j)>=0 && B(i,j)==0
                R(i,j)=pi./2;                             % atan == pi
            elseif A(i,j)<0 && B(i,j)==0                  
                R(i,j)=3*pi./2;                           % atan == 3*pi./2 
            elseif A(i,j)>=0 && B(i,j)>0                  % ��һ����
                R(i,j)=atan( A(i,j)./B(i,j) );            % atan > 0  
            elseif A(i,j)>=0 && B(i,j)<0                  % �ڶ�����
                R(i,j)=atan( A(i,j)./B(i,j) )+pi;         % atan < 0 
            elseif A(i,j)<0 && B(i,j)<0                   % ��������
                R(i,j)=atan( A(i,j)./B(i,j) )+pi;         % atan > 0 
            else                                          % ��������
                R(i,j)=atan( A(i,j)./B(i,j) )+2*pi;       % atan < 0 
            end
        end
    end
end

%�����
function PD = unwrapping( PD )
    PD = ( PD-min(PD(:)) ) *2*pi./ ( max(PD(:)) - min(PD(:)) );
    [M,N] = size(PD);
    PT = zeros(M,N);
    PL = zeros(2,M*N);
    length = 1;
    PL(1,1) = round(M/2);
    PL(2,1) = round(N/2);
    PT(PL(1,1),PL(2,1)) = 1;
    while length
        if ( PL(1,1) > 1 ) && ( PT(PL(1,1)-1,PL(2,1)) == 0 )
            length = length + 1;
            PL(1,length) = PL(1,1) - 1;
            PL(2,length) = PL(2,1);
            PT(PL(1,length),PL(2,length)) = 1;
            while abs( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) > pi
                if ( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) < -pi
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length)) + 2*pi;
                elseif ( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) > pi
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length)) - 2*pi;
                else
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length));
                end
            end
        end
        if ( PL(2,1) > 1 ) && ( PT(PL(1,1),PL(2,1)-1) == 0 )
            length = length + 1;
            PL(1,length) = PL(1,1);
            PL(2,length) = PL(2,1) - 1;
            PT(PL(1,length),PL(2,length)) = 1;
            while abs( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) > pi
                if ( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) < -pi
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length)) + 2*pi;
                elseif ( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) > pi
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length)) - 2*pi;
                else
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length));
                end
            end
        end
        if ( PL(1,1) < M ) && ( PT(PL(1,1)+1,PL(2,1)) == 0 )
            length = length + 1;
            PL(1,length) = PL(1,1) + 1;
            PL(2,length) = PL(2,1);
            PT(PL(1,length),PL(2,length)) = 1;
            while abs( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) > pi
                if ( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) < -pi
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length)) + 2*pi;
                elseif ( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) > pi
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length)) - 2*pi;
                else
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length));
                end
            end
        end
        if ( PL(2,1) < N ) && ( PT(PL(1,1),PL(2,1)+1) == 0 )
            length = length + 1;
            PL(1,length) = PL(1,1);
            PL(2,length) = PL(2,1) + 1;
            PT(PL(1,length),PL(2,length)) = 1;
            while abs( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) > pi
                if ( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) < -pi
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length)) + 2*pi;
                elseif ( PD(PL(1,length),PL(2,length)) - PD(PL(1,1),PL(2,1)) ) > pi
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length)) - 2*pi;
                else
                    PD(PL(1,length),PL(2,length)) = PD(PL(1,length),PL(2,length));
                end
            end
        end
        if length > 1
            PL = PL(:,2:length);
        end
        length = length - 1;
    end
    %disp(PD);
    %PD = uint8( ( PD-min(PD(:)) ) *255./ ( max(PD(:)) - min(PD(:)) ) );
    %figure(6);imshow(PD, []);
end
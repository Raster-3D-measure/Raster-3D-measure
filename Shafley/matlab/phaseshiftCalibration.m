function phaseshiftCalibration()
    b1=imread('1.bmp');
    b2=imread('2.bmp');
    b3=imread('3.bmp');
    b4=imread('4.bmp');
    a1=imread('5.bmp');
    a2=imread('6.bmp');
    a3=imread('7.bmp');
    a4=imread('8.bmp');
    B1=im2double(b1);
    B2=im2double(b2);
    B3=im2double(b3);
    B4=im2double(b4);
    A1=im2double(a1);
    A2=im2double(a2);
    A3=im2double(a3);
    A4=im2double(a4);
    I1=B4-B2;
    I2=B1-B3;
    J1=A4-A2;
    J2=A1-A3;
    [M,N]=size(I1);
    
    %解相位
    X = untiePhase( I1, I2 );
    Y = untiePhase( J1, J2 );
    
    %将相位差值转换成正值
    for i=1:M
        for j=1:N
          if X(i,j)<Y(i,j)
              V(i,j)=X(i,j)-Y(i,j)+2*pi;
          else
             V(i,j)=X(i,j)-Y(i,j);
          end
        end
    end
    figure(1);imshow(V,[]);
end

%解相位
function R = untiePhase( A, B )

    [M,N]=size(A);
    for i=1:M
        for j=1:N
            if A(i,j)>=0 && B(i,j)==0
                R(i,j)=pi./2;                             % atan == pi
            elseif A(i,j)<0 && B(i,j)==0                  
                R(i,j)=3*pi./2;                           % atan == 3*pi./2 
            elseif A(i,j)>=0 && B(i,j)>0                  % 第一象限
                R(i,j)=atan( A(i,j)./B(i,j) );            % atan > 0  
            elseif A(i,j)>=0 && B(i,j)<0                  % 第二象限
                R(i,j)=atan( A(i,j)./B(i,j) )+pi;         % atan < 0 
            elseif A(i,j)<0 && B(i,j)<0                   % 第三象限
                R(i,j)=atan( A(i,j)./B(i,j) )+pi;         % atan > 0 
            else                                          % 第四象限
                R(i,j)=atan( A(i,j)./B(i,j) )+2*pi;       % atan < 0 
            end
        end
    end
end

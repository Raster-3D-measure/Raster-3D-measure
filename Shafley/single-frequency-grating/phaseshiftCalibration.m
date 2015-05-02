function phaseshiftCalibration()
    
    a1=imread('1.bmp');
    a2=imread('2.bmp');
    a3=imread('3.bmp');
    a4=imread('4.bmp');
    B1=im2double(imread('O1.bmp'));
    B2=im2double(imread('O2.bmp'));
    B3=im2double(imread('O3.bmp'));
    B4=im2double(imread('O4.bmp'));
    A1=im2double(a1);
    A2=im2double(a2);
    A3=im2double(a3);
    A4=im2double(a4);

    fig=figure ('Name','截取感兴趣区域','NumberTitle','off');
    imshow(B1,[]);
    
    h=msgbox('请确认后用鼠标点取所需区域','提示','help');
    waitfor(h);
    
    rect=getrect(fig);
    w = round(rect(3));
    h= round(rect(4));
    rectangle('Position',[rect(1),rect(2),w,h],'Curvature',[0,0],'edgecolor','red');
    
    B1=B1(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    B2=B2(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    B3=B3(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    B4=B4(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    
    A1=A1(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    A2=A2(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    A3=A3(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);
    A4=A4(round(rect(2)):round(rect(2))+h,round(rect(1)):round(rect(1))+w);

    I1=B4-B2;
    I2=B1-B3;
    J1=A4-A2;
    J2=A1-A3;
%     [M,N]=size(I1);
    
    %解相位
    X = untiePhase( I1, I2 );
    Y = untiePhase( J1, J2 );
    
    BG = unwrapping(Y);
    OP = unwrapping( X );
    
    OBJ=BG-OP;
    
    figure('NumberTitle', 'off', 'Name', '还原图');
    imshow(OBJ, []);
    
    [m,n]=size(OBJ);
    figure('NumberTitle', 'off', 'Name', '三维图');
    mesh(OBJ);
    
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

I1=imread('1.bmp');
I2=imread('2.bmp');
I3=imread('3.bmp');
I4=imread('4.bmp');
D=(I4-I2)/(I3-I1);
% s=size(D);
% for i=1:s(1)
%   for j=1:s(2)
%     P(i,j) = atan(D(i,j));
%   end  
% end

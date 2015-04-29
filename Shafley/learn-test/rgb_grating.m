space=32;
I1 = zeros(512,512);
I2 = I1;
I3 = I1;
J = zeros(512, 512, 3);
for i=1:512
  for j=1:512
    I1(i,j) = 127.5+127.5*cos(j/space*2*pi);
    I2(i,j) = 127.5+127.5*cos(j/space*2*pi+pi/4);
    I3(i,j) = 127.5+127.5*cos(j/space*2*pi+2*pi/4);
  end  
end
J(:,:,1) = I1;
J(:,:,2) = I2;
J(:,:,3) = I3;
J = uint8(J);
figure, imshow(J);

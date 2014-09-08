clear all;
X=imread('forest.tif');
f0=0;g0=0;
f1=50;g1=50;
f2=220;g2=250;
f3=255;g3=255;
figure;plot([f0,f1,f2,f3],[g0,g1,g2,g3]);
axis tight
r1=(g1-g0)/(f1-f0);
b1=g0-r1*f0;
r2=(g2-g1)/(f2-f1);
b2=g1-r2*f1;
r3=(g3-g2)/(f3-f2);
b3=g2-r3*f2;
[m,n]=size(X);
X1=double(X);
for i=1:m
for j=1:n
f=X1(i,j);
g(i,j)=0;
if(f>=f1)&(f<=f2)
g(i,j)=r1*f+b2;
else if(f>=f2)&(f<=f3)
g(i,j)=r3*f+b3;
end
end
end
figure;imshow(mat2gray(g))
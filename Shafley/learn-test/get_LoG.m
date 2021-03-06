%获取LoG算子的图形
x=-2:0.05:2;   %创建行向量
y=-2:0.05:2;   %创建行向量
[X,Y]=meshgrid(x,y);    %把行向量转换成数组
sigma=0.5;   %令σ为0.5
r=1/(2*pi*sigma^4)*((X.^2+Y.^2)/(sigma^2)-2).*exp(-(X.^2+Y.^2)/(2*sigma^2));    %计算LoG算子
mesh(X,Y,r);    %显示LoG算子
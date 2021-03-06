%四叉树分解的子块表示
I = imread('liftingbody.png');
S = qtdecomp(I,.27);      %四叉树分解
J=full(S);                %将四叉树结构数据转换成完整矩阵
figure,imshow(J);title('111111111');
blocks = repmat(uint8(0),size(S));   %创建与输入图像尺寸相同的8位无符号整数0数组

for dim = [512 256 128 64 32 16 8 4 2 1];    %当子块的元素个数分别是512，····2,1时
  numblocks = length(find(S==dim));          %确定子块数量
  if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);      %创建numblocks个dim*dim8位无符号整数1的数组
    values(2:dim,2:dim,:) = 0;                      %设定数组中从2到dim的元素的数值为0
    blocks = qtsetblk(blocks,S,dim,values);         %按照S、dim及数组values,循环调整四叉树分解后的子块值
  end
end

% blocks(end,1:end) = 1;
% blocks(1:end,end) = 1;

subplot(121),imshow(I);
subplot(122),imshow(blocks,[])
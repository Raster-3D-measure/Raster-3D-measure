%�Ĳ����ֽ���ӿ��ʾ
I = imread('liftingbody.png');
S = qtdecomp(I,.27);      %�Ĳ����ֽ�
J=full(S);                %���Ĳ����ṹ����ת������������
figure,imshow(J);title('111111111');
blocks = repmat(uint8(0),size(S));   %����������ͼ��ߴ���ͬ��8λ�޷�������0����

for dim = [512 256 128 64 32 16 8 4 2 1];    %���ӿ��Ԫ�ظ����ֱ���512����������2,1ʱ
  numblocks = length(find(S==dim));          %ȷ���ӿ�����
  if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);      %����numblocks��dim*dim8λ�޷�������1������
    values(2:dim,2:dim,:) = 0;                      %�趨�����д�2��dim��Ԫ�ص���ֵΪ0
    blocks = qtsetblk(blocks,S,dim,values);         %����S��dim������values,ѭ�������Ĳ����ֽ����ӿ�ֵ
  end
end

% blocks(end,1:end) = 1;
% blocks(1:end,end) = 1;

subplot(121),imshow(I);
subplot(122),imshow(blocks,[])
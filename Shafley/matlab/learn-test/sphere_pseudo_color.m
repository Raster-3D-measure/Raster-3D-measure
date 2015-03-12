 %不同伪色彩增强效果球体
 subplot(131);sphere(16);  %显示球体
 axis square;  %横纵轴1:1
 shading flat;  %采用分层明暗处理
 grid;title('Flat Shading');  %去除网格，显标题
 subplot(132);sphere(16);
 axis square;  %横纵轴1:1
 shading faceted;  %采用小方块明暗处理
 grid;title('Faceted Shading');
 subplot(133);sphere(16);
 axis square;  %横纵轴1:1
 shading interp;  %采用插补明暗处理
 grid;title('Interpolated Shading');

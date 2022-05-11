%[row,column]=size(p);

for i=1:100
    [Sx,Sy,Sz]=bezier_func(p{i,1},p{i,2},p{i,3},20,20);  %先计算插值点
    
    control_pointslook(p{i,1},p{i,2},p{i,3});  %画控制点的图
    mesh(Sx,Sy,Sz);  %画插值点的图
    
    % 标注是第几个面片
    xzhou=sum(sum(p{i,1}))/numel(p{i,1});
    yzhou=sum(sum(p{i,2}))/numel(p{i,2});
    zzhou=max(max(p{i,3}))+sum(sum(p{i,3}))/numel(p{i,3});
    neirong = num2str(i);
    
    text(xzhou,yzhou,zzhou,neirong,'FontSize',10)
    xlabel("x");  ylabel("y");  zlabel("z");
    
    axis equal;
end
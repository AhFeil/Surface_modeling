% 不带控制点的

%[row,column]=size(p);

for i=1:100
    [Sx,Sy,Sz]=bezier_func(p{i,1},p{i,2},p{i,3},20,20);  %先计算插值点
    
    
    %control_pointslook1(p{i,1},p{i,2},p{i,3});  %画控制点的图
    mesh(Sx,Sy,Sz);  %画插值点的图
    
    xlabel("x");  ylabel("y");  zlabel("z");
    
    hold on;
end

axis equal;
%axis([-120,120,-120,120,-30,30]);
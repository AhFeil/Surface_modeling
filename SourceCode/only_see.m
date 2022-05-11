function song=only_see(i)
%i是第几个面片
    global p;
    
    [Sx,Sy,Sz]=bezier_func(p{i,1},p{i,2},p{i,3},20,20);  %先计算插值点
    
    control_pointslook(p{i,1},p{i,2},p{i,3});  %画控制点的图
    mesh(Sx,Sy,Sz);  %画插值点的图
    
    
    text(xzhou,yzhou,zzhou,neirong,'FontSize',10);
    xlabel("x");  ylabel("y");  zlabel("z");
    axis equal; 
    
end
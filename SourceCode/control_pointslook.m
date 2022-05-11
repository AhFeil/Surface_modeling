function song = control_pointslook(Px,Py,Pz,k)   %k控制颜色
%------控制点框架可视化---------
    if(~exist('k','var'))
    k = 'b';  % 如果未出现该变量，则对其进行赋值
    end

    plot3(Px,Py,Pz,'bs','markerfacecolor',k);   %描点
    hold on;mesh(Px,Py,Pz,'edgecolor','k','facealpha',0);   %连线
    
    hold on;  %保持
end
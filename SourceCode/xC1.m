function [Qx,Qy,Qz]=xC1(Px,Py,Pz,Xx,Xy,Xz,direction)
% 只修改相关联的边

    Qx=Xx; Qy=Xy;  Qz=Xz;

    alpha=1; % 默认C1连续
    Px=rot90(Px,direction);   Py=rot90(Py,direction);   Pz=rot90(Pz,direction);  %将要处理的边都对着胸
    Qx=rot90(Qx,direction);   Qy=rot90(Qy,direction);   Qz=rot90(Qz,direction);
    
    Qz(1,:)=Pz(4,:);   Qy(1,:)=Py(4,:);   Qx(1,:)=Px(4,:);  %同一条边上的点一样
    Qz(2,:)=(Pz(4,:)-Pz(3,:))*alpha+Qz(1,:);  %再后一条边-同边=……
    Qy(2,:)=(Py(4,:)-Py(3,:))*alpha+Qy(1,:);
    Qx(2,:)=(Px(4,:)-Px(3,:))*alpha+Qx(1,:);
    
    Qx=rot90(Qx,-direction);  Qy=rot90(Qy,-direction);  Qz=rot90(Qz,-direction);  %似乎不必要，矩阵中点的坐标都是对的，只是位置相对坐标轴不一样

end
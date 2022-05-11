function [Qx,Qy,Qz]=C1(Px,Py,Pz,direction)
% 根据输入的三坐标矩阵，和方向，返回满足C1的三坐标矩阵，多余的为0
% 先统一视角
    Qx=ones(4); Qy=Qx;  Qz=Qx;

    alpha=1; % 默认C1连续
    Px=rot90(Px,direction);   Py=rot90(Py,direction);   Pz=rot90(Pz,direction);  %将要处理的边都对着胸
    
    Qz(1,:)=Pz(4,:);   Qy(1,:)=Py(4,:);   Qx(1,:)=Px(4,:);  %同一条边上的点一样
    Qz(2,:)=(Pz(4,:)-Pz(3,:))*alpha+Qz(1,:);  %再后一条边-同边=……
    Qy(2,:)=(Py(4,:)-Py(3,:))*alpha+Qy(1,:);
    Qx(2,:)=(Px(4,:)-Px(3,:))*alpha+Qx(1,:);
    
    
    if rem(direction,2) == 0
        Qx(3,:)=Qx(2,:);  Qy(3,:)=Qy(2,:)+Qy(2,:)-Qy(1,:);  Qz(3,:)=(Qz(2,:)+Qz(1,:))/2;  %自动生成另外两行数据，方便查看.x继承第二行的
        Qx(4,:)=Qx(2,:);  Qy(4,:)=Qy(3,:)+Qy(2,:)-Qy(1,:);  Qz(4,:)=(Qz(3,:)+Qz(2,:))/2;   %y以前两行插值作为步长，继续下去；   z以前两行平均值
    end
    
    if rem(direction,2) == 1
        Qy(3,:)=Qy(2,:);  Qx(3,:)=Qx(2,:)+Qx(2,:)-Qx(1,:);  Qz(3,:)=(Qz(2,:)+Qz(1,:))/2;  %左边和右边的，因为旋转后，x、y轴互换，所以也要换
        Qy(4,:)=Qy(2,:);  Qx(4,:)=Qx(3,:)+Qx(2,:)-Qx(1,:);  Qz(4,:)=(Qz(3,:)+Qz(2,:))/2;  
    end
    Qx=rot90(Qx,-direction);  Qy=rot90(Qy,-direction);  Qz=rot90(Qz,-direction);  %似乎不必要，矩阵中点的坐标都是对的，只是位置相对坐标轴不一样

end
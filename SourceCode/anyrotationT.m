function [Wx,Wy,Wz]=anyrotationT(Vx,Vy,Vz,axis,angle,x,y,z)  %z是逆时针旋转的角度，若是顺时针，取负
% 三维旋转变换,输入的是三坐标分开矩阵的形式，，x、y、z是真转轴和对应坐标轴的距离,用真转轴 - 对应坐标轴
    Wx = Vx;      %保持输入输出形式相同
    Wy = Vy;
    Wz = Vz;
    
    angle = angle * pi / 180;   %变换角度为pi的数值
    if axis == 1
    T1 = [1 0 0 0;0 1 0 0;0 0 1 0;-x -y -z 1];   %先平移，再旋转，再回去
    T0 = [1 0 0 0;0 cos(angle) sin(angle) 0;0 -sin(angle) cos(angle) 0; 0 0 0 1];   %变换矩阵
    T11 = [1 0 0 0;0 1 0 0;0 0 1 0;x y z 1];
    
    T = T1*T0*T11;
    
    V = Transformation3to1(Vx,Vy,Vz);
    W = V*T;
    [Wx,Wy,Wz]=Transformation1to3(W);
    end
    
    if axis == 2
    T1 = [1 0 0 0;0 1 0 0;0 0 1 0;-x -y -z 1];
    T0 = [cos(angle) 0 -sin(angle) 0;0 1 0 0; sin(angle) 0 cos(angle) 0; 0 0 0 1];   %变换矩阵
    T11 = [1 0 0 0;0 1 0 0;0 0 1 0;x y z 1];
    
    T = T1*T0*T11;   %总变换矩阵
    
    V = Transformation3to1(Vx,Vy,Vz);   %三坐标分离式数据转化为齐次坐标数据
    W = V*T;  %计算结果
    [Wx,Wy,Wz]=Transformation1to3(W);   %相反
    
    if axis == 3         %%%%%%%%%不起作用，
    T1 = [1 0 0 0;0 1 0 0;0 0 1 0;-x -y -z 1];
    T0 = [cos(angle) sin(angle) 0 0;-sin(angle) cos(angle) 0 0;0 0 1 0; 0 0 0 1];   %变换矩阵
    T11 = [1 0 0 0;0 1 0 0;0 0 1 0;x y z 1];
    
    T = T1*T0*T11;
    
    V = Transformation3to1(Vx,Vy,Vz);
    W = V*T;
    [Wx,Wy,Wz]=Transformation1to3(W);
    end
end
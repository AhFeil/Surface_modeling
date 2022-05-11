function [Wx,Wy,Wz]=equal_scaleT(Vx,Vy,Vz,s)  %s是全图的比例因子,小于1是放大
% 三维比例变换,输入的是三坐标分开矩阵的形式
    Wx = Vx;   
    Wy = Vy;
    Wz = Vz;
       
    T = [1 0 0 0;0 1 0 0; 0 0 1 0;0 0 0 s];   %变换矩阵
    
    V = Transformation3to1(Vx,Vy,Vz);
    W = V*T;
    [Wx,Wy,Wz]=Transformation1to3(W);
    
end
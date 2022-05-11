function [Wx,Wy,Wz]=rotationT(Vx,Vy,Vz,z)  %z是逆时针旋转的角度，若是顺时针，取负
% 三维旋转变换,输入的是三坐标分开矩阵的形式，这个只放了绕z轴的
    Wx = Vx;   
    Wy = Vy;
    Wz = Vz;
       
    z = z * pi / 180;
    
    T = [cos(z) sin(z) 0 0;-sin(z) cos(z) 0 0;0 0 1 0; 0 0 0 1];   %变换矩阵
    
    V = Transformation3to1(Vx,Vy,Vz);
    W = V*T;
    [Wx,Wy,Wz]=Transformation1to3(W);
    
end
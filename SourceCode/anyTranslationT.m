function [Wx,Wy,Wz]=anyTranslationT(Vx,Vy,Vz,x,y,z)  
% 三维平移变换
    Wx = Vx;   
    Wy = Vy;
    Wz = Vz;
       
    T = [1 0 0 0;0 1 0 0;0 0 1 0;x y z 1];  %变换矩阵
    
    V = Transformation3to1(Vx,Vy,Vz);
    W = V*T;
    [Wx,Wy,Wz]=Transformation1to3(W);
    
end
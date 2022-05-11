function [Wx,Wy,Wz]=scaleT(Vx,Vy,Vz,a,e,i)  %a,e,j 分别是x,y,z方向的比例因子
% 三维比例变换,输入的是三坐标分开矩阵的形式
    Wx = Vx;   
    Wy = Vy;
    Wz = Vz;
       
    T = [a 0 0 0;0 e 0 0; 0 0 i 0;0 0 0 1];   %变换矩阵
    
    V = Transformation3to1(Vx,Vy,Vz);
    
    W = V*T;
  
    [Wx,Wy,Wz]=Transformation1to3(W);
    
end


% [p{i,1},p{i,2},p{i,3}]=scaleT(p{i,1},p{i,2},p{i,3},a,e,i);
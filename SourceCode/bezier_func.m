function [Sx,Sy,Sz] = bezier_func(Px,Py,Pz,un,wn)
% Px,Py,Pz是16个控制点的三坐标值
% un,wn分别是x，y坐标轴上取多少个计算点-1
% [Sx,Sy,Sz]返回所有计算点的三坐标值

    Mz=[-1 3 -3 1;3 -6 3 0;-3 3 0 0;1 0 0 0];
    
    Sx = zeros(un+1,wn+1);  %解释在循环里
    Sy = zeros(un+1,wn+1);
    Sz = zeros(un+1,wn+1);
    
    for i=0:un
        for j=0:wn
            
            U = [(i/un)^3 (i/un)^2 (i/un) 1];  % 计算系数矩阵
            W = [(j/wn)^3 (j/wn)^2 (j/wn) 1];
            W = W';
            
            Sx(i+1,j+1)=U * Mz * Px * Mz * W;  %为了方便存储每个计算点的三坐标
            Sy(i+1,j+1)=U * Mz * Py * Mz * W;   %使用矩阵存储，这不是坐标，而是
            Sz(i+1,j+1)=U * Mz * Pz * Mz * W;   %在两方向上分别数第几个的点对应的值
        
        end
    end
     
end
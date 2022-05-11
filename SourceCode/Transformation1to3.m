function [T3x,T3y,T3z]=Transformation1to3(One1)
    %将齐次坐标形式  变为  三坐标分开矩阵的形式
    T3x = zeros(4,4);   %%%%%%%%%%有局限
    T3y = zeros(4,4);
    T3z = zeros(4,4);
    
    for j=1:16
        T3x(j)=One1(j,1)/One1(j,4);   %将T3x的数从上往下，从左往右依次赋予One1
        T3y(j)=One1(j,2)/One1(j,4);
        T3z(j)=One1(j,3)/One1(j,4);
    end
end
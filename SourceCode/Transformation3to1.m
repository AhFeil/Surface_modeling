function One1=Transformation3to1(T3x,T3y,T3z)
    %将三坐标分开矩阵的形式  变为  齐次坐标形式
    One1 = ones(16,4);   %%%%%%%%%%有局限
    for j=1:16
        One1(j,1)=T3x(j);   %将T3x的数从上往下，从左往右依次赋予One1
        One1(j,2)=T3y(j);
        One1(j,3)=T3z(j);
    end
end
function l=guiji(wing,s)
%根据一段运动，自动生成返回原来位置和对称的运动，可根据参数s调整对称运动幅度的大小。
    if(~exist('s','var'))
    s = 1;  % 如果未出现该变量，则对其进行赋值
    end
    
    l = [wing fliplr(wing)];   %原路返回
    l = [l (-wing+2*wing(1)).*s];   %关于初始位置对称的运动控制点坐标
    l = [l fliplr(-wing+2*wing(1)).*s];   %上一行的返回
       
end
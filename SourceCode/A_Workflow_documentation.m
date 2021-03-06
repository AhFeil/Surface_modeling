%改进方向：不同边的控制点不同颜色...观察函数绝不能改变数据

% 先将要建模的物体划分面片，并标记编号。

% 创建新的模型时，请先修改下方变量（有----------的），运行一次后，再根据下面流程进行面片修改。

% 填写第一张面片控制点：
% p{1,1}=[;;;]; 
% p{1,2}=[;;;];
% p{1,3}=[;;;];

% 创建新面片（默认C1连续），在命令行运行：ns(j,i,direction)，还有改进的地方
% j是贴着的面片矩阵，i是创建第几张面片，direction方向，对着胸的 填0 ，逆时针依次 加1 。
% xns
% 
% 如果是"米"中 点 的位置，使用C190函数。
% 

% 调整控制点剩下两行的坐标值
% p{i,1}(,) = ;   第i个面片，x坐标，选择点

% 查看效果：see_bezier   关于yz平面对称：see_bezierd     only_see(i)
% 不满意继续调整

% 保存数据（非常重要，否则数据会很容易丢失）
% save afb.mat p
% 而后创建新的面片

% 如果出错，返回上一步工作环境：load('first.mat')

clear;

global p;

num = 100;  %面片数量-----------------------

p=cell(num,3);   %生成所有面片所需要的控制点矩阵，一行三个矩阵x,y,z，分别是三坐标的，总共num行
for i=1:num
    for j=1:3
        p{i,j}=ones(4);
    end
end

un = 20;  %x方向插值数量--------------------
wn = 20;  %y方向插值数量----------------------
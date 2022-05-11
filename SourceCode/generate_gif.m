% 不知原因，需要先有gif文件，才能写入，因此运行一次，出错暂停，再执行一次imwrite(I, map, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.3);，就可以了

clc;clear all;
load('afb.mat');   %加载控制点数据
filename = 'cfzj.gif';  % 保存文件名

%set(gcf, 'visible', 'off');           % 不显示窗口

%调整控制点
s = 0.8;
wingz1 = linspace(8,45,100);   wingz1 = guiji(wingz1,s);
wingz2 = linspace(4.5,30,100);   wingz2 = guiji(wingz2,s);
wingz3 = linspace(-1.28734077588658,20,100);   wingz3 = guiji(wingz3,s);
wingz4 = linspace(-3.46457607500707,15,100);   wingz4 = guiji(wingz4,s);
wingz5 = linspace(0,30,100);   wingz5 = guiji(wingz5,s);
wingz6 = linspace(-3.5,20,100);   wingz6 = guiji(wingz6,s);

wingx1 = linspace(-70,-65,100);   wingx1 = guiji(wingx1,s);
wingx2 = linspace(-75,-45,100);   wingx2 = guiji(wingx2,s);
wingx3 = linspace(-55,-40,100);   wingx3 = guiji(wingx3,s);
wingx4 = linspace(-40,-30,100);   wingx4 = guiji(wingx4,s);
wingx5 = linspace(-35,-25,100);   wingx5 = guiji(wingx5,s);
wingx6 = linspace(-26.8972568484771,-20,100);   wingx6 = guiji(wingx6,s);


armz1 = linspace(1.77178654752536,35,100);   armz1 = guiji(armz1,0.65);
armz2 = linspace(1.77178654752536,35,100);   armz2 = guiji(armz2,0.65);
armz3 = linspace(-1.83380306553770,31.5,100);   armz3 = guiji(armz3,0.65);
armz4 = linspace(-1.83380306553770,31.5,100);   armz4 = guiji(armz4,0.65);


angle = 0;   %旋转角度


for i=1:10:400   %有问题，是以翅膀的扇动来划分的，还有身体移动
    
    figure(i);
    set(gcf,'position',[0,0,1600,900],'color','w');   %确定框的大小

    % 翅膀运动部分
    p{10,3}(1,1)=wingz1(i);
    p{10,3}(2,1)=wingz2(i);
    p{10,3}(3,1)=wingz3(i);
    p{10,3}(4,1)=wingz4(i);
    p{10,3}(1,2)=wingz5(i);
    p{10,3}(2,2)=wingz6(i);
    
    p{10,1}(1,1)=wingx1(i);
    p{10,1}(2,1)=wingx2(i);
    p{10,1}(3,1)=wingx3(i);
    p{10,1}(4,1)=wingx4(i);
    p{10,1}(1,2)=wingx5(i);
    p{10,1}(2,2)=wingx6(i);
    
    p{9,3}(2,2)=armz1(i);
    p{9,3}(2,3)=armz2(i);
    p{9,3}(3,2)=armz3(i);
    p{9,3}(3,3)=armz4(i);
    
    q = p;   %复制形态数据
    yzduichen;  %计算对称点
    
    angle = angle + 1 ;
    %身体运动
    for nana = 1:100
        
        [p{nana,1},p{nana,2},p{nana,3}]=anyTranslationT(p{nana,1},p{nana,2},p{nana,3},80,0,0);
        [p{nana,1},p{nana,2},p{nana,3}]=rotationT(p{nana,1},p{nana,2},p{nana,3},angle);
        
    end
    
    
    see_fbezier;
    view(-150,20);
    %view(3);
    grid on;axis equal;%axis([-150,150,-80,300])
    
    frame = getframe(gcf);   %得到一帧，gcf获得当前视窗句柄
    im = frame2im(frame);      %转化为图片 制作gif文件，图像必须是index索引图像
        
    [I, map] = rgb2ind(im, 256);   %rgb变成ind
     if i == 1
         imwrite(I, map, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.1);
     else
         imwrite(I, map, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
     end
       
     %pause();
    close all;        %close(gcf);
    
    p = q;
end


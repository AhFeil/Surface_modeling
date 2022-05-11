function song=xns(j,i,direction)
% % 只修改相关联的边,有缺陷，当两个面都倒转了，就不行了
% new sheet，slice  新的面片
    global p;

    [p{i,1},p{i,2},p{i,3}]=xC1(p{j,1},p{j,2},p{j,3},p{i,1},p{i,2},p{i,3},direction);

end
function song=ns(j,i,direction)
% new sheet，slice  新的面片
    global p;

    [p{i,1},p{i,2},p{i,3}]=C1(p{j,1},p{j,2},p{j,3},direction);

end
function sue_loc_matrix = sueLocationMatrix()
[pos_sue_x1,pos_sue_x2,pos_sue_x3] = deal(zeros(1,9));
for i = 1:9
    pos_sue_x1(i) = pos_sue_x1(i) + 111*(i-1) + rand*20;
    pos_sue_x2(i) = pos_sue_x2(i) + 111*(i-1) + 1000 + rand*20;
    pos_sue_x3(i) = pos_sue_x3(i) + 111*(i-1) + 2000 + rand*20;
end
pos_sue_y1 = [rand(1,9)*20 111+rand(1,9)*20 222+rand(1,9)*20 333+rand(1,9)*20 444+rand(1,9)*20 555+rand(1,9)*20 666+rand(1,9)*20 777+rand(1,9)*20 888+rand(1,9)*20];
pos_sue_y2 = [rand(1,9)*20 111+rand(1,9)*20 222+rand(1,9)*20 333+rand(1,9)*20 444+rand(1,9)*20 555+rand(1,9)*20 666+rand(1,9)*20 777+rand(1,9)*20 888+rand(1,9)*20];
pos_sue_y3 = [rand(1,9)*20 111+rand(1,9)*20 222+rand(1,9)*20 333+rand(1,9)*20 444+rand(1,9)*20 555+rand(1,9)*20 666+rand(1,9)*20 777+rand(1,9)*20 888+rand(1,9)*20];
SUE_loc_Cell1 = [repmat(pos_sue_x1,1,9);pos_sue_y1];
SUE_loc_Cell2 = [repmat(pos_sue_x2,1,9);pos_sue_y2];
SUE_loc_Cell3 = [repmat(pos_sue_x3,1,9);pos_sue_y3];
pos_sue_y4 = [1000+rand(1,9)*20 1111+rand(1,9)*20 1222+rand(1,9)*20 1333+rand(1,9)*20 1444+rand(1,9)*20 1555+rand(1,9)*20 1666+rand(1,9)*20 1777+rand(1,9)*20 1888+rand(1,9)*20];
pos_sue_y5 = [1000+rand(1,9)*20 1111+rand(1,9)*20 1222+rand(1,9)*20 1333+rand(1,9)*20 1444+rand(1,9)*20 1555+rand(1,9)*20 1666+rand(1,9)*20 1777+rand(1,9)*20 1888+rand(1,9)*20];
pos_sue_y6 = [1000+rand(1,9)*20 1111+rand(1,9)*20 1222+rand(1,9)*20 1333+rand(1,9)*20 1444+rand(1,9)*20 1555+rand(1,9)*20 1666+rand(1,9)*20 1777+rand(1,9)*20 1888+rand(1,9)*20];
SUE_loc_Cell4 = [repmat(pos_sue_x1,1,9);pos_sue_y4];
SUE_loc_Cell5 = [repmat(pos_sue_x2,1,9);pos_sue_y5];
SUE_loc_Cell6 = [repmat(pos_sue_x3,1,9);pos_sue_y6];
pos_sue_y7 = [2000+rand(1,9)*20 2111+rand(1,9)*20 2222+rand(1,9)*20 2333+rand(1,9)*20 2444+rand(1,9)*20 2555+rand(1,9)*20 2666+rand(1,9)*20 2777+rand(1,9)*20 2888+rand(1,9)*20];
pos_sue_y8 = [2000+rand(1,9)*20 2111+rand(1,9)*20 2222+rand(1,9)*20 2333+rand(1,9)*20 2444+rand(1,9)*20 2555+rand(1,9)*20 2666+rand(1,9)*20 2777+rand(1,9)*20 2888+rand(1,9)*20];
pos_sue_y9 = [2000+rand(1,9)*20 2111+rand(1,9)*20 2222+rand(1,9)*20 2333+rand(1,9)*20 2444+rand(1,9)*20 2555+rand(1,9)*20 2666+rand(1,9)*20 2777+rand(1,9)*20 2888+rand(1,9)*20];
SUE_loc_Cell7 = [repmat(pos_sue_x1,1,9);pos_sue_y7];
SUE_loc_Cell8 = [repmat(pos_sue_x2,1,9);pos_sue_y8];
SUE_loc_Cell9 = [repmat(pos_sue_x3,1,9);pos_sue_y9];

sue_loc_matrix = [SUE_loc_Cell1 SUE_loc_Cell2 SUE_loc_Cell3 SUE_loc_Cell4 SUE_loc_Cell5 SUE_loc_Cell6 SUE_loc_Cell7 SUE_loc_Cell8 SUE_loc_Cell9];
%save('sue_loc_matrix.mat','SUE_loc_matrix');
end
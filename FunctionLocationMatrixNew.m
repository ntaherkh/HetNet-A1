function locationMatrix = FunctionLocationMatrixNew()
locationMatrix.bsLocationMatrix = @bsLocationMatrix;
locationMatrix.scLocationMatrix = @scLocationMatrix;
locationMatrix.sueLocationMatrix = @sueLocationMatrix;
locationMatrix.mueLocationMatrix = @mueLocationMatrix;
end

function y = bsLocationMatrix()
[pos_bs_x,pos_bs_y] = deal(zeros(1,3));
bs_loc_matrix  = zeros(2,9);
for i = 1:3
    pos_bs_x(i) = pos_bs_x(i) + 500*(2*i - 1);
    pos_bs_y(i) = pos_bs_y(i) + 500*(2*i - 1);
end
pos_bs_x_temp = [pos_bs_x(1) pos_bs_x(2) pos_bs_x(3)];
pos_bs_xx = repmat(pos_bs_x_temp,1,3);
pos_bs_yy = [repmat(pos_bs_y(1),1,3) repmat(pos_bs_y(2),1,3) repmat(pos_bs_y(3),1,3)];

for i = 1:9
    bs_loc_matrix(:,i) = [pos_bs_xx(i),pos_bs_yy(i)];
end
y = bs_loc_matrix;
end

function SC_loc_matrix = scLocationMatrix()
[pos_sc_x1,pos_sc_x2,pos_sc_x3] = deal(zeros(1,9));
for i = 1:9
    pos_sc_x1(i) = pos_sc_x1(i) + 111*(i-1);
    pos_sc_x2(i) = pos_sc_x2(i) + 111*(i-1) + 1000;
    pos_sc_x3(i) = pos_sc_x3(i) + 111*(i-1) + 2000;
end
B = ones(1,9);
SC_loc_Cell1 = [repmat(pos_sc_x1,1,9);kron(pos_sc_x1,B)];
SC_loc_Cell2 = [repmat(pos_sc_x2,1,9);kron(pos_sc_x1,B)];
SC_loc_Cell3 = [repmat(pos_sc_x3,1,9);kron(pos_sc_x1,B)];
SC_loc_Cell4 = [repmat(pos_sc_x1,1,9);kron(pos_sc_x2,B)];
SC_loc_Cell5 = [repmat(pos_sc_x2,1,9);kron(pos_sc_x2,B)];
SC_loc_Cell6 = [repmat(pos_sc_x3,1,9);kron(pos_sc_x2,B)];
SC_loc_Cell7 = [repmat(pos_sc_x1,1,9);kron(pos_sc_x3,B)];
SC_loc_Cell8 = [repmat(pos_sc_x2,1,9);kron(pos_sc_x3,B)];
SC_loc_Cell9 = [repmat(pos_sc_x3,1,9);kron(pos_sc_x3,B)];

SC_loc_matrix = [SC_loc_Cell1 SC_loc_Cell2 SC_loc_Cell3 SC_loc_Cell4 SC_loc_Cell5 SC_loc_Cell6 SC_loc_Cell7 SC_loc_Cell8 SC_loc_Cell9];
end

function MUE_loc_matrix = mueLocationMatrix()
N = 100000;
size = 1000;
num_MUE = 20;
[pos_MUE_x1,pos_MUE_y1] = deal(size*rand(1,N));
[pos_MUE_x2,pos_MUE_y2] = deal((size+1000)*rand(1,N));
[pos_MUE_x3,pos_MUE_y3] = deal((size+2000)*rand(1,N));

ind_MUE_1=find((sqrt(pos_MUE_x1.^2+pos_MUE_y1.^2)<size)&((500-(sqrt(pos_MUE_x1.^2+pos_MUE_y1.^2)))>35));
pos_MUE_x1=pos_MUE_x1(:,ind_MUE_1(1:num_MUE));
pos_MUE_y1=pos_MUE_y1(:,ind_MUE_1(1:num_MUE));

ind_MUE_2=find((sqrt(pos_MUE_x2.^2+pos_MUE_y2.^2)<(size+1000))&((1500-(sqrt(pos_MUE_x2.^2+pos_MUE_y2.^2)))>35));
pos_MUE_x2=pos_MUE_x2(:,ind_MUE_2(1:num_MUE));
pos_MUE_y2=pos_MUE_y2(:,ind_MUE_2(1:num_MUE));

ind_MUE_3=find((sqrt(pos_MUE_x3.^2+pos_MUE_y3.^2)<(size+2000))&((2500-(sqrt(pos_MUE_x3.^2+pos_MUE_y3.^2)))>35));
pos_MUE_x3=pos_MUE_x3(:,ind_MUE_3(1:num_MUE));
pos_MUE_y3=pos_MUE_y3(:,ind_MUE_3(1:num_MUE));

pos_MUE_x = [pos_MUE_x1 pos_MUE_x2 pos_MUE_x3];
MUE_loc_matrix=[repmat(pos_MUE_x,1,3);repmat(pos_MUE_y1,1,3) repmat(pos_MUE_y2,1,3) repmat(pos_MUE_y3,1,3)];
end

function SUE_loc_matrix = sueLocationMatrix()
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

SUE_loc_matrix = [SUE_loc_Cell1 SUE_loc_Cell2 SUE_loc_Cell3 SUE_loc_Cell4 SUE_loc_Cell5 SUE_loc_Cell6 SUE_loc_Cell7 SUE_loc_Cell8 SUE_loc_Cell9];
end
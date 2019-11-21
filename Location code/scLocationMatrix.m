function sc_loc_matrix = scLocationMatrix()
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

sc_loc_matrix = [SC_loc_Cell1 SC_loc_Cell2 SC_loc_Cell3 SC_loc_Cell4 SC_loc_Cell5 SC_loc_Cell6 SC_loc_Cell7 SC_loc_Cell8 SC_loc_Cell9];
%save('sc_loc_matrix.mat','SC_loc_matrix');
end
function sue_sc_dis = scSUEDistance(sc_loc_matrix,sue_loc_matrix)
num_SUE = 81;
num_SC = 81;
num_Cell=9;
%load('sc_loc_matrix.mat');
%{--Start-- Base Station to MUE distance Calculation}%
SC_loc_matrix = repmat(sc_loc_matrix,1,num_SUE*num_Cell);
%load('sue_loc_matrix.mat');
SUE_loc_matrix = repelem(sue_loc_matrix,1,num_SC*num_Cell);
sue_sc_dis=zeros(1,length(SC_loc_matrix));
sc_sue_loc_matrix_coord = zeros(2,length(SUE_loc_matrix));
%bs_mue_loc_matrixy = zeros(1,length(MUE_loc_matrix));
for j = 1:length(SC_loc_matrix)
    sc_sue_loc_matrix_coord(1,j) = SC_loc_matrix(1,j) - SUE_loc_matrix(1,j);
    sc_sue_loc_matrix_coord(2,j) = SC_loc_matrix(2,j) - SUE_loc_matrix(2,j);
    sue_sc_dis(j) = sqrt(sc_sue_loc_matrix_coord(1,j).^2 + sc_sue_loc_matrix_coord(2,j).^2);
end
%save('sue_sc_dis.mat','sue_sc_dis');
end
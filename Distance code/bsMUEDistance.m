function mue_bs_dis = bsMUEDistance(bs_loc_matrix,mue_loc_matrix)
num_MUE = 20;
num_BS = 9;
num_Cell=9;
%load('bs_loc_matrix.mat');
%{--Start-- Base Station to MUE distance Calculation}%
BS_loc_matrix = repmat(bs_loc_matrix,1,num_MUE*num_Cell);
%load('mue_loc_matrix.mat');
MUE_loc_matrix = repelem(mue_loc_matrix,1,num_BS);
mue_bs_dis=zeros(1,length(BS_loc_matrix));
bs_mue_loc_matrix_coord = zeros(2,length(MUE_loc_matrix));
%bs_mue_loc_matrixy = zeros(1,length(MUE_loc_matrix));
for j = 1:length(BS_loc_matrix)
    bs_mue_loc_matrix_coord(1,j) = BS_loc_matrix(1,j) - MUE_loc_matrix(1,j);
    bs_mue_loc_matrix_coord(2,j) = BS_loc_matrix(2,j) - MUE_loc_matrix(2,j);
    mue_bs_dis(j) = sqrt(bs_mue_loc_matrix_coord(1,j).^2 + bs_mue_loc_matrix_coord(2,j).^2);
end
%save('mue_bs_dis.mat','mue_bs_dis');
end
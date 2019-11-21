function bs_loc_matrix = bsLocationMatrix()
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
%save('bs_loc_matrix.mat','bs_loc_matrix');
end
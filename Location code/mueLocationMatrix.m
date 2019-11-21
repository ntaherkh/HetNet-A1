function mue_loc_matrix = mueLocationMatrix()
N = 100000;
size = 1000;
num_MUE = 20;
pos_MUE_x11 = size*rand(1,N);
pos_MUE_y11 = size*rand(1,N);
pos_MUE_x21 = (size+1000)*rand(1,N);
pos_MUE_y21 = (size+1000)*rand(1,N);
pos_MUE_x31 = (size+2000)*rand(1,N);
pos_MUE_y31 = (size+2000)*rand(1,N);

ind_MUE_1=find((sqrt(pos_MUE_x11.^2+pos_MUE_y11.^2)<size)&((500-(sqrt(pos_MUE_x11.^2+pos_MUE_y11.^2)))>35));
pos_MUE_x11=pos_MUE_x11(:,ind_MUE_1(1:num_MUE));
pos_MUE_y11=pos_MUE_y11(:,ind_MUE_1(1:num_MUE));

ind_MUE_2=find((sqrt(pos_MUE_x21.^2+pos_MUE_y21.^2)<(size+1000))&((1500-(sqrt(pos_MUE_x21.^2+pos_MUE_y21.^2)))>35));
pos_MUE_x21=pos_MUE_x21(:,ind_MUE_2(1:num_MUE));
pos_MUE_y21=pos_MUE_y21(:,ind_MUE_2(1:num_MUE));

ind_MUE_3=find((sqrt(pos_MUE_x31.^2+pos_MUE_y31.^2)<(size+2000))&((2500-(sqrt(pos_MUE_x31.^2+pos_MUE_y31.^2)))>35));
pos_MUE_x31=pos_MUE_x31(:,ind_MUE_3(1:num_MUE));
pos_MUE_y31=pos_MUE_y31(:,ind_MUE_3(1:num_MUE));

pos_MUE_x12 = size*rand(1,N);
pos_MUE_y12 = size*rand(1,N);
pos_MUE_x22 = (size+1000)*rand(1,N);
pos_MUE_y22 = (size+1000)*rand(1,N);
pos_MUE_x32 = (size+2000)*rand(1,N);
pos_MUE_y32 = (size+2000)*rand(1,N);

ind_MUE_1=find((sqrt(pos_MUE_x12.^2+pos_MUE_y12.^2)<size)&((500-(sqrt(pos_MUE_x12.^2+pos_MUE_y12.^2)))>35));
pos_MUE_x12=pos_MUE_x12(:,ind_MUE_1(1:num_MUE));
pos_MUE_y12=pos_MUE_y12(:,ind_MUE_1(1:num_MUE));

ind_MUE_2=find((sqrt(pos_MUE_x22.^2+pos_MUE_y22.^2)<(size+1000))&((1500-(sqrt(pos_MUE_x22.^2+pos_MUE_y22.^2)))>35));
pos_MUE_x22=pos_MUE_x22(:,ind_MUE_2(1:num_MUE));
pos_MUE_y22=pos_MUE_y22(:,ind_MUE_2(1:num_MUE));

ind_MUE_3=find((sqrt(pos_MUE_x32.^2+pos_MUE_y32.^2)<(size+2000))&((2500-(sqrt(pos_MUE_x32.^2+pos_MUE_y32.^2)))>35));
pos_MUE_x32=pos_MUE_x32(:,ind_MUE_3(1:num_MUE));
pos_MUE_y32=pos_MUE_y32(:,ind_MUE_3(1:num_MUE));

pos_MUE_x13 = size*rand(1,N);
pos_MUE_y13 = size*rand(1,N);
pos_MUE_x23 = (size+1000)*rand(1,N);
pos_MUE_y23 = (size+1000)*rand(1,N);
pos_MUE_x33 = (size+2000)*rand(1,N);
pos_MUE_y33 = (size+2000)*rand(1,N);

ind_MUE_1=find((sqrt(pos_MUE_x13.^2+pos_MUE_y13.^2)<size)&((500-(sqrt(pos_MUE_x13.^2+pos_MUE_y13.^2)))>35));
pos_MUE_x13=pos_MUE_x13(:,ind_MUE_1(1:num_MUE));
pos_MUE_y13=pos_MUE_y13(:,ind_MUE_1(1:num_MUE));

ind_MUE_2=find((sqrt(pos_MUE_x23.^2+pos_MUE_y23.^2)<(size+1000))&((1500-(sqrt(pos_MUE_x23.^2+pos_MUE_y23.^2)))>35));
pos_MUE_x23=pos_MUE_x23(:,ind_MUE_2(1:num_MUE));
pos_MUE_y23=pos_MUE_y23(:,ind_MUE_2(1:num_MUE));

ind_MUE_3=find((sqrt(pos_MUE_x33.^2+pos_MUE_y33.^2)<(size+2000))&((2500-(sqrt(pos_MUE_x33.^2+pos_MUE_y33.^2)))>35));
pos_MUE_x33=pos_MUE_x33(:,ind_MUE_3(1:num_MUE));
pos_MUE_y33=pos_MUE_y33(:,ind_MUE_3(1:num_MUE));

pos_MUE_x = [pos_MUE_x11 pos_MUE_x21 pos_MUE_x31 pos_MUE_x12 pos_MUE_x22 pos_MUE_x32 pos_MUE_x13 pos_MUE_x23 pos_MUE_x33];
mue_loc_matrix=[pos_MUE_x;pos_MUE_y11 pos_MUE_y12 pos_MUE_y13 pos_MUE_y21 pos_MUE_y22 pos_MUE_y23 pos_MUE_y31 pos_MUE_y32 pos_MUE_y33];
%save('mue_loc_matrix.mat','mue_loc_matrix');
end
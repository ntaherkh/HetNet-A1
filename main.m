close all;
iter=1;
Rate_MUE_iter=0;
Rate_SUE_iter=0;
for i = 1:iter
    disp('iteration number : ');
    i
    bs_loc_matrix = bsLocationMatrix();
    mue_loc_matrix = mueLocationMatrix();
    sc_loc_matrix = scLocationMatrix();
    sue_loc_matrix = sueLocationMatrix();
    
    mue_bs_dis = bsMUEDistance(bs_loc_matrix,mue_loc_matrix);
    sue_sc_dis = scSUEDistance(sc_loc_matrix,sue_loc_matrix);
    
    channel_mue_bs = Channel_MUE(mue_bs_dis);
    channel_sue_sc = Channel_SUE(sue_sc_dis);
    
    Rate_MUE_iter = Rate_MUE_iter+Rate_MUE(channel_mue_bs);
    Rate_SUE_iter = Rate_SUE_iter+Rate_SUE(channel_sue_sc);
end
B=20*10^6;
B_User=B/(180+729);
BMacro=B_User*180;
BMicro=B_User*729;
A=9;
Rate_MUE_iter=Rate_MUE_iter(1:length(Rate_MUE_iter));
Rate_SUE_iter=Rate_SUE_iter(1:length(Rate_SUE_iter));
Rate_MUE = Rate_MUE_iter/(B/100);
Rate_SUE = fliplr(Rate_SUE_iter)/(B/100);

plot(Rate_MUE,Rate_SUE)
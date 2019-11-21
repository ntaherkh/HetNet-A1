function channel_sue_sc = Channel_SUE(sue_sc_dis)

%% Small Scale Fading
    num_rx_ant_sc   = 1;          % number of receive antenna at BS
    sigma_shad_sc_los = 3;  %Large-scale fading parameters for BS
    sigma_shad_sc_nlos = 4;
    %load('sue_sc_dis.mat');
    col_SC=531441;
    pr_sc_sue_los = 0.5-min(0.5,5*exp(-156./(sue_sc_dis./1000)))+min(0.5,5*exp(-(sue_sc_dis./1000)./30));
    pr_sc_sue_nlos = 1-pr_sc_sue_los;
    shad_fad_sc_los = normrnd(0,sigma_shad_sc_los,[1,col_SC]);
    shad_fad_sc_nlos = normrnd(0,sigma_shad_sc_nlos,[1,col_SC]);
    sue_sc_dis=log10(sue_sc_dis./1000);
    pl_los = 41.1 + 20.9*sue_sc_dis;
    pl_nlos = 32.9 + 37.5*sue_sc_dis;
    small_scale_dB=pl_los.*pr_sc_sue_los+pl_nlos.*pr_sc_sue_nlos+shad_fad_sc_los.*pr_sc_sue_los+shad_fad_sc_nlos.*pr_sc_sue_nlos;
    small_scale_linear = 10.^(small_scale_dB/10);    
%% Channel
    slow_fad_sc = 1/sqrt(2*col_SC)*(randn(num_rx_ant_sc,col_SC)+1i*randn(num_rx_ant_sc,col_SC));
    
    % for each block we generate a rayleigh fading MIMO channel which is fixed over a block
    channel_sue_sc=sqrt(small_scale_linear).*slow_fad_sc;
    %save('channel_sue_sc.mat','channel_sue_sc');
end
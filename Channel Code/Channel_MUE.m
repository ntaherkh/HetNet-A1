function channel_mue_bs = Channel_MUE(mue_bs_dis)

%% Small Scale Fading
    num_rx_ant_bs   = 20;          % number of receive antenna at BS
    sigma_shad_bs = 6;  %Large-scale fading parameters for BS
    %load('mue_bs_dis.mat');
    col_BS=1620;
    pr_bs_mue_los = min(18./(mue_bs_dis./1000),1).*(1-exp(-(mue_bs_dis./1000)./63))+exp(-(mue_bs_dis./1000)./63);
    pr_bs_mue_nlos = 1-pr_bs_mue_los;
    shad_fad_bs = normrnd(0,sigma_shad_bs,[1,col_BS]);
    mue_bs_dis=log10(mue_bs_dis./1000);
    pl_los = 30.8 + 24.2*mue_bs_dis;
    pl_nlos = 2.7 + 42.8*mue_bs_dis;
    small_scale_dB=pl_los.*pr_bs_mue_los+pl_nlos.*pr_bs_mue_nlos+shad_fad_bs;
    small_scale_linear = 10.^(small_scale_dB/10);    
%% Channel
    slow_fad_bs = 1/sqrt(2*col_BS)*(randn(num_rx_ant_bs,col_BS)+1i*randn(num_rx_ant_bs,col_BS));
    
    % for each block we generate a rayleigh fading MIMO channel which is fixed over a block
    channel_mue_bs=sqrt(small_scale_linear).*slow_fad_bs;
    %save('channel_mue_bs.mat','channel_mue_bs');
end
function Rate_MUE_Vec = Rate_MUE(channel_mue_bs)
power_mue = 10^2.3;
%load('channel_mue_bs.mat');
cov_BS=zeros(20,20);
for i=1:180
    cov_BS=cov_BS+power_mue*(channel_mue_bs(:,5+9*(i-1))*channel_mue_bs(:,5+9*(i-1))');
end
B=20*10^6;
power_noise = (10^-17.4)*B; %Total noise power (B*sigma2 in W)

frac=1;
Rate_MUE=0;
SINR=zeros(20,20);
Rate=zeros(1,20);
Rate_MUE_Vec=[];

for j=0:0.01:1
    for i=1:180
        %SINR(i)=(abs(power_mue*channel_mue_bs(:,725+9*(i-1))').^2)*inv((cov_BS-power_mue*channel_mue_bs(:,725+9*(i-1))*channel_mue_bs(:,725+9*(i-1))')+power_noise*(1-j))*abs(channel_mue_bs(:,725+9*(i-1))).^2;
        SINR(i)=(abs(power_mue*channel_mue_bs(:,720+i)').^2)*inv((cov_BS-power_mue*channel_mue_bs(:,725+i)*channel_mue_bs(:,725+i)')+power_noise*(1-j))*abs(channel_mue_bs(:,725+i)).^2;
        Rate(i)=frac*log2(1+SINR(i));
        Rate_MUE=Rate_MUE+Rate(i);
    end
    Rate_MUE_Vec=[Rate_MUE_Vec,Rate_MUE];
end
end
function Rate_SUE_Vec = Rate_SUE(channel_sue_sc)
power_mue = 10^2.3;
%load('channel_sue_sc.mat');
cov_SC5=zeros(1,1);
cov_SC=zeros(1,729);
for j=1:81
    for k=1:729
        cov_SC5=cov_SC5+power_mue*(channel_sue_sc(:,324+j+729*(k-1))*channel_sue_sc(:,324+j+729*(k-1))');
    end
    cov_SC(j)=cov_SC5;
end
B=20*10^6;
power_noise = (10^-17.4)*B; %Total noise power (B*sigma2 in W)
frac=1;
Rate_SUE=0;
SINR=zeros(1,(729*81));
Rate=zeros(1,(729*81));
Rate_SUE_Vec=[];

for j=0:0.01:1
    for i=1:81
        for j=1:729
            %SINR(i)=(abs(power_mue*channel_sue_sc(:,236520+i+729*(i-1))').^2)*inv(norm(cov_SC(324+i)-power_mue*channel_sue_sc(:,236520+i+729*(i-1))*channel_sue_sc(:,236520+i+729*(i-1))')+power_noise*j)*abs(channel_sue_sc(:,236520+i+729*(i-1))).^2;
            SINR(i*j)=(abs(power_mue*channel_sue_sc(:,236196+i*j)').^2)*inv(norm(cov_SC(i)-power_mue*channel_sue_sc(:,236196+i*j)*channel_sue_sc(:,236196+i*j)')+power_noise*j)*abs(channel_sue_sc(:,236196+i*j)).^2;
            Rate(i*j)=frac*log2(1+SINR(i*j));
            Rate_SUE=Rate_SUE+Rate(i*j);
        end
    end
    Rate_SUE_Vec=[Rate_SUE_Vec,Rate_SUE];
end
end
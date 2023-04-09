clear,clc
load ./data/main_Dual_TCC
% load ./data/main_ad2_sim2_data_de

% data_ad_TCC
avg_cost_TCC = zeros(iter, 1);
for ptx = 1:iter
    b1=data_ad_TCC(1:dc,ptx);              %ai
    b2=data_ad_TCC(dc+1:2*dc,ptx);     %bi
    b3=data_ad_TCC(2*dc+1:3*dc,ptx);  %Di
    b4=data_ad_TCC(3*dc+1:4*dc,ptx);  %ri
    
    %% ----------------average cost-------------------
    p=repmat(alpha,1,tmax).*b2;
    G=p.*repmat(PUE,1,tmax)+b3-b4;
    water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
    elec=sum(c(:,1:tmax).*G);
    carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
    avg_cost=elec+water+carbon;
    
    avg_cost_TCC(ptx) = avg_cost;
end


% 
figure(200)
subplot(221)
plot(data_flag_r)
subplot(222)
plot(data_flag_s)
% % subplot(223)
% % plot(data_eps_pri)
% % subplot(224)
% % plot(data_eps_dual)
% 
figure(100)
plot(avg_cost_TCC)



clear, clc

load ./data/main_lya_data_1
% data_lya = data_ga;

b1=data_lya(1:dc,:);              %ai
b2=data_lya(dc+1:2*dc,:);     %bi
b3=data_lya(2*dc+1:3*dc,:); %Di
b4=data_lya(3*dc+1:4*dc,:); %ri

p=repmat(alpha,1,tmax).*b2;
G=p.*repmat(PUE,1,tmax)+b3-b4;
water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
elec=sum(c(:,1:tmax).*G);
carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
avg_cost=elec+water+carbon
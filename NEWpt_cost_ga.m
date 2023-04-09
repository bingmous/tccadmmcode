clear,clc
pt_ga= zeros(2, 2784);
load ./data/main_ga_data_100_50_pt

b1=data_ga(1:dc,:);              %ai
b2=data_ga(dc+1:2*dc,:);     %bi
b3=data_ga(2*dc+1:3*dc,:); %Di
b4=data_ga(3*dc+1:4*dc,:); %ri
%% --------------average delay/ -- length-----------------
avg_delay=sum(data_Q);
for t=1:tmax-1
    avg_delay(t+1)=avg_delay(t+1)+avg_delay(t);
end
avg_delay=avg_delay*0.25./[1:tmax];
figure(30)
plot(avg_delay)
hold on
    
pt_ga(1, :) = avg_delay;
%% ----------------average cost-------------------
p=repmat(alpha,1,tmax).*b2;
G=p.*repmat(PUE,1,tmax)+b3-b4;
water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
elec=sum(c(:,1:tmax).*G);
carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
avg_cost=elec+water+carbon;
for t=1:tmax-1
    avg_cost(t+1)=avg_cost(t+1)+avg_cost(t);
end
avg_cost=avg_cost./[1:tmax];

figure(31)
plot(avg_cost)
hold on
pt_ga(2, :) = avg_cost;
save ./data/pt_ga pt_ga
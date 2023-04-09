clear,clc
load ./data/main_lya_data100d2
battery_cost_temp = zeros(4, tmax);

b1=data_lya(1:dc,:);              %ai
b2=data_lya(dc+1:2*dc,:);     %bi
b3=data_lya(2*dc+1:3*dc,:); %Di
b4=data_lya(3*dc+1:4*dc,:); %ri
% -------------battery cost--------
for d = 1:dc
    for t = 1:tmax
        battery_cost_temp(d,t) = NEWindicator_f(b3(d,t),Cb);
    end
end
total_battery_cost = sum(battery_cost_temp);

% --------------total cost--------------------------
p=repmat(alpha,1,tmax).*b2;
G=p.*repmat(PUE,1,tmax)+b3-b4;
water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
elec=sum(c(:,1:tmax).*G);
carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
total_cost = elec+water+carbon;
for t = 2:tmax
    total_cost(t) = total_cost(t)+total_cost(t-1);
    total_battery_cost(t) = total_battery_cost(t)+total_battery_cost(t-1);
end


figure(100)
plot(total_cost)
hold on

figure(101)
plot(total_battery_cost)
hold on

figure(102)
plot(total_cost+total_battery_cost)
hold on

figure(103)
plot((total_cost+total_battery_cost)./[1:tmax])
hold on





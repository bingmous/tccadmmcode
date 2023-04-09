clear,clc
load ./data/main_gre_data_r1000
b1=data_gre(1:dc,:);              %ai=bi
b2=data_gre(dc+1:2*dc,:);     %Di
b3=data_gre(2*dc+1:3*dc,:); %ri
%% battery
bat_lya=[E0,b2];
for t=1:tmax
    bat_lya(:,t+1)=bat_lya(:,t+1)+bat_lya(:,t);
end
for d=1:dc
    figure(1)
    subplot(2,2,d)
    plot(bat_lya(d,:))
    title('battery')
%     axis([0 tmax 0 Emax(d)])
hold on
end

%% workload distribution
% a
for d=1:dc
    figure(2)
    subplot(2,2,d)
    plot(b1(d,:))
    title('a')
%     axis([1 tmax 0 bmax(1)])
     hold on
end


%% renewable
for d=1:dc
    figure(3)
    subplot(2,2,d)
    plot(b3(d,:))
    title('r')
 %  axis([1 tmax 0 rmax(1)])
end

%% cost
p=repmat(alpha,1,tmax).*b1;
G=p.*repmat(PUE,1,tmax)+b2-b3;
%water
figure(7)
subplot(2,2,1)
water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
avg_cost=water;
for t=1:tmax-1
    avg_cost(t+1)=avg_cost(t+1)+avg_cost(t);
end
avg_cost=avg_cost./[1:tmax];
plot(avg_cost)
title('water-slot')
hold on

%electricity bill
subplot(2,2,2)
elec=sum(c(:,1:tmax).*G);
avg_cost=elec;
for t=1:tmax-1
    avg_cost(t+1)=avg_cost(t+1)+avg_cost(t);
end
avg_cost=avg_cost./[1:tmax];
plot(avg_cost)
title('electricity bill')
hold on

%carbon emission
subplot(2,2,3)
carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b3);
avg_cost=carbon;
for t=1:tmax-1
    avg_cost(t+1)=avg_cost(t+1)+avg_cost(t);
end
avg_cost=avg_cost./[1:tmax];
plot(avg_cost)
title('carbon emission')
hold on

%total cost
subplot(2,2,4)
avg_cost=elec+water+carbon;
for t=1:tmax-1
    avg_cost(t+1)=avg_cost(t+1)+avg_cost(t);
end
avg_cost=avg_cost./[1:tmax];
plot(avg_cost)
title('total')
hold on






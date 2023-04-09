clear,clc
load ./data/main_lya_data

b1=data_lya(1:dc,:);              %ai
b2=data_lya(dc+1:2*dc,:);     %bi
b3=data_lya(2*dc+1:3*dc,:); %Di
b4=data_lya(3*dc+1:4*dc,:); %ri
%% battery
bat_lya=[E0,b3];
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

% b
for d=1:dc
    figure(2)
    subplot(2,2,d)
    plot(b2(d,:))
    title('b')
    legend('a','b')
%     axis([1 tmax 0 bmax(1)])
end

%% renewable
for d=1:dc
    figure(3)
    subplot(2,2,d)
    plot(b4(d,:))
    title('r')
    
 %  axis([1 tmax 0 rmax(1)])
end


%% Q
% data_Qq=[zeros(dc,1) data_Q];
for d=1:dc
    figure(4)
    subplot(2,2,d)
    plot(data_Q(d,:))
    hold on
    plot(b1(d,:))
    hold on
    plot(b2(d,:),'color','k')
    hold on
%     plot(data_Q2(d,:))
    title('Q,a,b')
    legend('Q','a','b')
%     axis([0 tmax 0 inf])
%     figure(5)
%     subplot(2,2,d)
%     plot(data_Q2(d,:))
%     title('Q-b')
end
hold on



%% delay
delay_lya=sum(data_Q);
A_all=A(1:tmax);
for t=1:tmax-1
    delay_lya(t+1)=delay_lya(t+1)+delay_lya(t);
    A_all(t+1)=A_all(t+1)+A_all(t);
end
figure(6)
plot(delay_lya*0.25./A_all)
title('average delay')
hold on

%%
%% cost
p=repmat(alpha,1,tmax).*b2;
G=p.*repmat(PUE,1,tmax)+b3-b4;
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
carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
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

% %% average cost
% avg_cost=total;
% for t=1:tmax-1
%     avg_cost(t+1)=avg_cost(t+1)+avg_cost(t);
% end
% avg_cost=avg_cost./[1:tmax];
% figure(8)
% plot(avg_cost)
% title('average cost')
% hold on





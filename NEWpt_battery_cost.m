%% -------------including all algorithm---------------
clear,clc
load ./data/run_pt_temp Cb_num tmax
% tmax = 100;
tmax = 2784;
Cb_num=11;
cb_cost = zeros(Cb_num, tmax);
battery_cost_temp = zeros(4, tmax);
battery_cost = zeros(Cb_num, tmax);
avg_total_cost = zeros(Cb_num, tmax);
total_cost_withb = zeros(Cb_num, tmax);
% save data for plotting
pt_battery_cost_total_cost = zeros(Cb_num,2); % battery costs, total cost for different Cb
for pt=0:Cb_num % 
    %% algotirhm lya with battery cost
%     load(strcat('./data/main_lya_minor_data_bc',num2str(pt),'000'))
%     load(strcat('./data/main_lya_minor_data_bc',num2str(pt),'000_test'))
    load(strcat('./data/main_lya_minor_data_bc',num2str(pt),'000_used'))
% -------------------------------------------------not use anymore
%     load(strcat('./data/main_lya_minor_data_r0_bc',num2str(pt),'000'))
%     load(strcat('./data/main_lya_minor_data_f3_bc',num2str(pt),'000')) % cannot be used
    b1=data_lya(1:dc,:);              %ai
    b2=data_lya(dc+1:2*dc,:);     %bi 4*2784
    b3=data_lya(2*dc+1:3*dc,:); %Di
    b4=data_lya(3*dc+1:4*dc,:); %ri
    % -------------battery cost--------
%     tmax = 100;
%     tmax = 2784;
    b1 = b1(:,1:tmax);
    b2 = b2(:,1:tmax);
    b3 = b3(:,1:tmax);
    b4 = b4(:,1:tmax);
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
        total_cost(t) = total_cost(t)+total_cost(t-1); %-------this one without battery cost
        total_battery_cost(t) = total_battery_cost(t)+total_battery_cost(t-1); % and this one
    end
    avg_total_cost_temp = total_cost + total_battery_cost;
    avg_total_cost(pt+1,:) = avg_total_cost_temp./[1:tmax];
    total_cost_withb(pt+1,:) = avg_total_cost_temp;
    cb_cost(pt+1,:)=total_cost;
    battery_cost(pt+1,:) = total_battery_cost;
    
    % save data for plotting
    pt_battery_cost_total_cost(pt+1,1) = total_battery_cost(end);
    pt_battery_cost_total_cost(pt+1,2) = total_cost(end);
end
% ------------adjust----------------------
p = pt_battery_cost_total_cost;
pt_battery_cost_total_cost = [p(1,:);p(end, :);p(2:end - 1, :)];

figure(1000)
plot(cb_cost')
legend('1','2','3','4','5')
title('total cost without battery cost')

figure(1001)
plot(battery_cost')
legend('1','2','3','4','5')
title('battery cost')

figure(1002)
plot(avg_total_cost')
legend('1','2','3','4','5')
title('average total cost')

figure(1004)
plot(total_cost_withb')
legend('1','2','3','4','5')
title('total cost')


save ./data/pt_battery_cost pt_battery_cost_total_cost



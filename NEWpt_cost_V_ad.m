clear,clc
pn=11;
cost_delay_V_ad=zeros(pn,3); % V,cost,delay
for pt=1:pn
    load(strcat('./data/main_ad2_sim2_data_Vmax_E',num2str(pt-1),'00'))
    b1=data_ad(1:dc,:);              %ai
    b2=data_ad(dc+1:2*dc,:);     %bi
    b3=data_ad(2*dc+1:3*dc,:);  %Di
    b4=data_ad(3*dc+1:4*dc,:);  %ri
    %% --------------average delay-----------------
    avg_delay=sum(data_Q);
    A_all=A(1:tmax);
    for t=1:tmax-1
        avg_delay(t+1)=avg_delay(t+1)+avg_delay(t);
        A_all(t+1)=A_all(t+1)+A_all(t);
    end
    avg_delay=avg_delay*0.25./A_all;
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

    cost_delay_V_ad(pt,1)=V;
    cost_delay_V_ad(pt,2)=avg_cost(end);
    cost_delay_V_ad(pt,3)=avg_delay(end);
end
%% ========patch=============
% pn=8;
cost_delay_V_ad_p=zeros(5,3); % V,cost,delay
for pt=0:2:8
    load(strcat('./data/main_ad2_sim2_data_Vmax_E',num2str(pt),'0patch'))
    b1=data_ad(1:dc,:);              %ai
    b2=data_ad(dc+1:2*dc,:);     %bi
    b3=data_ad(2*dc+1:3*dc,:);  %Di
    b4=data_ad(3*dc+1:4*dc,:);  %ri
    %% --------------average delay-----------------
    avg_delay=sum(data_Q);
    A_all=A(1:tmax);
    for t=1:tmax-1
        avg_delay(t+1)=avg_delay(t+1)+avg_delay(t);
        A_all(t+1)=A_all(t+1)+A_all(t);
    end
    avg_delay=avg_delay*0.25./A_all;
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

    cost_delay_V_ad_p(pt/2+1,1)=V;
    cost_delay_V_ad_p(pt/2+1,2)=avg_cost(end);
    cost_delay_V_ad_p(pt/2+1,3)=avg_delay(end);
end
cost_delay_V_ad = [cost_delay_V_ad(1,:);cost_delay_V_ad_p(2:end,:);cost_delay_V_ad(2:end,:)];
%% cost _delay_V
figure(1)
subplot(121)
plot(cost_delay_V_ad(:,1),cost_delay_V_ad(:,2), 'r-o')
hold on
% axis([0 inf 114 170])

subplot(122)
plot(cost_delay_V_ad(:,1),cost_delay_V_ad(:,3),'r-o')
hold on
% axis([0 inf 0 6])

% save ./data/pt_cost_V_ad_patch cost_delay_V_ad


clear,clc
load ./data/main_ad2_sim2_data_TCC_convergence1

% data_ad_TCC
avg_cost_TCC = zeros(iter, 1);
tmax = 1;
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
    avg_cost_TCC(ptx) = avg_cost + X'*b3 + Q'*(b1-b2);
end

figure(100)
MS=14;
LW=3;
cc2=[64 224 205]/255;
cc3=[34 139 34]/255;
yyaxis left
plot(avg_cost_TCC,'-r','MarkerSize',MS,'LineWidth',LW)
hold on

%% optimal
load ./data/main_ad2_sim2_data_de
% tmax = 1;
b1=data_ad(1:dc,tmax);              %ai
b2=data_ad(dc+1:2*dc,tmax);     %bi
b3=data_ad(2*dc+1:3*dc,tmax);  %Di
b4=data_ad(3*dc+1:4*dc,tmax);  %ri

%% ----------------average cost-------------------
tmax = 1;
p=repmat(alpha,1,tmax).*b2;
G=p.*repmat(PUE,1,tmax)+b3-b4;
water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
elec=sum(c(:,1:tmax).*G);
carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
avg_cost=elec+water+carbon;
avg_cost_TCC = avg_cost + X'*b3 + Q'*(b1-b2);
    
figure(100)
plot(repmat(avg_cost_TCC, 20,1),'--','Color','k', 'MarkerSize',MS,'LineWidth',LW)
ax = gca;
ax.XLim = [1 16];
ax.XTick = [0:4:16];
ax.YLim = [-4 -2.8]*1e4;
ax.YTick = [-4 : 0.4 : -2.8]*1e4;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
ax.FontSize = 15;
% xlabel('Number of iterations','FontSize',19)
xlabel('k (Number of iterations)','FontSize',19)
% ylabel('Objective Value','FontSize',19)
ylabel('Value of Objective Function','FontSize',19)
yyaxis right
plot(data_flag_r,':','Color',cc2, 'MarkerSize',MS,'LineWidth',LW)
% hold on
% plot(data_flag_s)
ax = gca;
ax.YLim = [-20 140];
ax.YTick = [-20 : 40:140];
% axy = ax.YAxis;
% axy(2).Exponent = 1;

ylabel('Primal Residual of ADMM','FontSize',19)
legend({'ADMM-DACM','Optimal Value', 'Primal Residual'},'FontSize',17,'Location','east')


set(gcf,'position',[5 300 650 430]) 
% saveas(gcf,'H:\Com\Ctex\A-TCC-revision\new-TCC-major\pt12convergence','epsc')



% load ./data/main_ad2_sim2_data_TCC_convergence2
% figure(101)
% plot(data_iter_TCC)

% figure(200)
% subplot(221)
% plot(data_flag_r)
% subplot(222)
% plot(data_flag_s)
% subplot(223)
% plot(data_eps_pri)
% subplot(224)
% plot(data_eps_dual)

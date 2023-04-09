%% --------including all algorithm-------------
clear,clc
load ./data/pt_cost_V_lya cost_delay_V_gre % pn*1
load ./data/pt_cost_V_ad_patch cost_delay_V_ad  % pn*3:V,cost,delay
load ./data/pt_cost_V_sta_patch cost_delay_V_sta  % pn*3:V,cost,delay
x=cost_delay_V_ad(:,1);
y1_patch = cost_delay_V_gre(1);
y1=repmat(y1_patch, 15,1);
y2=cost_delay_V_sta;
y3=cost_delay_V_ad;
% cost
figure(10)
plot(x,y2(:,2),'-o','color','b','MarkerSize',8, 'linewidth',1.5)
hold on
plot(x,y1,'--','color',[160 32 240]/255,'MarkerSize',8,'linewidth',1.5)
hold on 
plot(x,y3(:,2),'-*','color','r','MarkerSize',8,'linewidth',1.5)
set(gca,'FontSize', 13, 'XTick', [1:2:9]*1000)
legend({'Static','Greedy','ADMM'},'FontSize',17)
xlabel('$V(V_{max})$','Interpreter','latex','FontSize',17)
ylabel('Average cost ($)','FontSize',17)
axis([0 inf 90 150])
ax=gca;
ax.XAxis.Exponent = 3;
set(gcf,'position',[5 300 600 390]) % left bottem width height
% saveas(gcf,'E:\Com\Ctex\new\pt10_cost_V_1','epsc')
%saveas(gcf,'F:\shun\Com\Ctex\new\pt10_cost_V_1','epsc')

% delay
figure(9)
subplot(122)
plot(x,y2(:,3),'-o','color','b','MarkerSize',8,'linewidth',1.5)
hold on
plot(x,y3(:,3),'-*','color','r','MarkerSize',8,'linewidth',1.5)
set(gca,'FontSize',13,'XTick',[1:2:9]*1000)
legend({'Static','ADMM'},'Location','northwest','FontSize',17)
xlabel('$V(V_{max})$','Interpreter','latex','FontSize',17)
ylabel('Average delay (Hour)','FontSize',17)
axis([0 10000 0 35])
ax=gca;
ax.XAxis.Exponent = 3;
% set(gca,'position',[0.5700 0.1400 0.3600 0.7850]) % 0.1300 0.1100 0.7750 0.8150
set(gcf,'position',[5 300 600 380]) 
% saveas(gcf,'E:\Com\Ctex\new\pt10_cost_V_2','epsc')
%saveas(gcf,'F:\shun\Com\Ctex\new\pt10_cost_V_2','epsc')

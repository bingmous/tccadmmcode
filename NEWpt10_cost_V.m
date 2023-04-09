%% --------including all algorithm-------------
clear,clc
load ./data/pt_cost_V_lya_patch cost_delay_V_gre  % pn*1
load ./data/pt_cost_V_lya_patch cost_delay_V_lya
load ./data/pt_cost_V_ad_patch cost_delay_V_ad  % pn*3:V,cost,delay
load ./data/pt_cost_V_sta_patch cost_delay_V_sta  % pn*3:V,cost,delay
load ./data/pt_cost_V_lya_PA_patch cost_delay_V_lya_PA 
load ./data/pt_cost_V_lya_PA_wb_patch cost_delay_V_lya_PA_wb 

% load ./data/pt_cost_V_lya_ALWAYS_patch cost_delay_V_lya_ALWAYS
load ./data/pt_cost_V_lya_DA_wb_patch cost_delay_V_lya_DA_wb 
load ./data/pt_cost_V_greedy_patch cost_delay_V_greedy_wb 
x=cost_delay_V_ad(:,1);
y1 = cost_delay_V_gre;
y2=cost_delay_V_sta;
y3=cost_delay_V_ad;
y4 = cost_delay_V_lya;
y5 = cost_delay_V_lya_PA_wb;
y6 = cost_delay_V_lya_DA_wb;
y7 = cost_delay_V_greedy_wb;

% cost
figure(10)
c1 = [26,150,65]/255;
c2 = [253,174,97]/255;
c3 = [215,25,28]/255;
cc1=[255 255 0]/255;
cc2=[64 224 205]/255;
cc3=[34 139 34]/255;
cc4=[244 164 95]/255;
% subplot(121)
lw= 1;
ms = 5;
plot(x,y2(:,2),'-^','color',cc2,'MarkerSize',ms, 'linewidth',lw)
hold on
% % ------ PA wb -------------
% plot(x,y5(:,2)+1,'-^','color','b','MarkerSize',ms, 'linewidth',lw)
% hold on
% % % ------ DA wb -------------
% plot(x,y6(:,2)+1,'-^','color','g','MarkerSize',ms, 'linewidth',lw)
% hold on
% % ------ greedy wb -------------
plot(x,y7(:,2)+1,'-s','color','b','MarkerSize',ms, 'linewidth',lw)
hold on


% plot(x,y1,'--','color','k','MarkerSize',ms,'linewidth',lw)
% hold on
plot(x,y4(:,2),'-o','color',cc3,'MarkerSize',ms,'linewidth',lw)
hold on 
plot(x,y3(:,2),'-+','color','r','MarkerSize',ms,'linewidth',lw)
set(gca,'FontSize', 13, 'XTick', [1:2:9]*1000)
legend({'Static Alg.','Greedy Alg.','LYA-OACM','ADMM-DACM'},'FontSize',14)
xlabel('$V$','Interpreter','latex','FontSize',17)
ylabel('Average Cost ($)','FontSize',17)
axis([0 inf 90 130])
ax=gca;
ax.XAxis.Exponent = 3;
ax.YAxis.Exponent = 2;
set(gcf,'position',[5 300 600 360]) % left bottem width height
%saveas(gcf,'F:\shun\Com\Ctex\new\pt10_cost_V_1','epsc')
% saveas(gcf,'H:\Com\Ctex\A-TCC-revision\new-TCC-major\pt10_cost_V_1','epsc')

% delay
figure(11)

% subplot(122)
plot(x,y2(:,3),'-^','color',cc2,'MarkerSize',ms,'linewidth',lw)
hold on
% % -----------PA -wb --------------------
% plot(x,y5(:,3),'-^','color','b','MarkerSize',ms,'linewidth',lw)
% hold on

% % ------ greedy wb -------------
plot(x,y7(:,3)+1,'-s','color','b','MarkerSize',ms, 'linewidth',lw)
hold on
plot(x,y4(:,3),'-o','color',cc3,'MarkerSize',ms,'linewidth',lw)
hold on
plot(x,y3(:,3),'-+','color','r','MarkerSize',ms,'linewidth',lw)
set(gca,'FontSize',13,'XTick',[1:2:9]*1000)
legend({'Static Alg.','Greedy Alg.','LYA-OACM','ADMM-DACM'},'Location','northwest','FontSize',14)
xlabel('$V$','Interpreter','latex','FontSize',17)
ylabel('Average Delay (Hour)','FontSize',17)
axis([0 10000 0 40])
ax=gca;
ax.XAxis.Exponent = 3;

% set(gca,'position',[0.5700 0.1400 0.3600 0.7850]) % 0.1300 0.1100 0.7750 0.8150
set(gcf,'position',[5 300 600 360]) 
% saveas(gcf,'H:\Com\Ctex\new\pt10_cost_V_2','epsc')
% saveas(gcf,'H:\Com\Ctex\A-TCC-revision\new-TCC-major\pt10_cost_V_2','epsc')

% %%%%%%%%%%%%%combine1%%%%%%%%%%%%%%%%%%
% figure(1000)
% ms = 6;
% lw = 1;
% subplot(122)
% plot(x,y2(:,3),'-^','color',cc2,'MarkerSize',ms,'linewidth',lw)
% hold on
% plot(x,y4(:,3),'-+','color',cc3,'MarkerSize',ms,'linewidth',lw)
% hold on
% plot(x,y3(:,3),'-o','color','r','MarkerSize',ms,'linewidth',lw)
% set(gca,'FontSize',13,'XTick',[1:2:9]*1000)
% l = legend({'Static Alg.','LYA-OACM','ADMM-DACM'},'Location','northwest','FontSize',12);
% l.Position = [0.61 0.78 0.2 0.1];
% xlabel('$V$','Interpreter','latex','FontSize',17)
% ylabel('Average Delay (Hour)','FontSize',17)
% axis([0 10000 0 40])
% ax=gca;
% ax.XAxis.Exponent = 3;
% 
% % set(gca,'position',[0.5700 0.1400 0.3600 0.7850]) % 0.1300 0.1100 0.7750 0.8150
% set(gcf,'position',[5 300 600 360]) 
% saveas(gcf,'H:\Com\Ctex\A-TCC-revision\new-TCC-major\pt10_cost_V_combine1','epsc')
% 
% %%%%%%%%%%%%%%combine2%%%%%%%%%%%%%%%%%%
% figure(1001)
% ms = 6;
% lw = 1;
% subplot(121)
% 
% plot(x,y2(:,2),'-^','color',cc2,'MarkerSize',ms, 'linewidth',lw)
% hold on
% plot(x,y1,'--','color','k','MarkerSize',ms,'linewidth',lw)
% hold on
% plot(x,y4(:,2),'-+','color',cc3,'MarkerSize',ms,'linewidth',lw)
% hold on 
% plot(x,y3(:,2),'-o','color','r','MarkerSize',ms,'linewidth',lw)
% set(gca,'FontSize', 13, 'XTick', [1:2:9]*1000)
% l=legend({'Static Alg.','Greedy Alg.','LYA-OACM','ADMM-DACM'},'FontSize',12);
% l.Position = [0.235 0.745 0.2 0.1];
% xlabel('$V$','Interpreter','latex','FontSize',17)
% ylabel('Average Cost ($)','FontSize',17)
% axis([0 inf 90 150])
% ax=gca;
% ax.XAxis.Exponent = 3;
% ax.YAxis.Exponent = 2;
% set(gcf,'position',[5 300 600 360]) % left bottem width height
% 
% subplot(122)
% plot(x,y2(:,3),'-^','color',cc2,'MarkerSize',ms,'linewidth',lw)
% hold on
% plot(x,y4(:,3),'-+','color',cc3,'MarkerSize',ms,'linewidth',lw)
% hold on
% plot(x,y3(:,3),'-o','color','r','MarkerSize',ms,'linewidth',lw)
% set(gca,'FontSize',13,'XTick',[1:2:9]*1000)
% l = legend({'Static Alg.','LYA-OACM','ADMM-DACM'},'Location','northwest','FontSize',12);
% l.Position = [0.61 0.78 0.2 0.1];
% xlabel('$V$','Interpreter','latex','FontSize',17)
% ylabel('Average Delay (Hour)','FontSize',17)
% axis([0 10000 0 40])
% ax=gca;
% ax.XAxis.Exponent = 3;
% 
% % set(gca,'position',[0.5700 0.1400 0.3600 0.7850]) % 0.1300 0.1100 0.7750 0.8150
% set(gcf,'position',[5 300 600 360]) 
% saveas(gcf,'H:\Com\Ctex\A-TCC-revision\new-TCC-major\pt10_cost_V_combine2','epsc')



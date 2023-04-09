%% ----------including all algorithms---------------
% consider all algorithms //bar()
clc,clear
tsn=48;
figure(8)
% 
% % -----------static--------
% load ./data/main_sta_data_Vmax_E300
% b1=data_sta(1:dc,:)'*1000;
% subplot(311)
% bar(b1(1:tsn,:),1,'stacked');
% hold on
% plot(A(1:tsn)*1000,'r','linewidth',1.2)
% axis([0 inf 0 300000])
% ylabel('静态调度算法','FontSize',10)
% grid on
% grid minor
% legend({'DC1','DC2','DC3','DC4','负载A(t)'},'location','northwest','Orientation','horizontal','fontsize',8)
% 
% % ---------greedy---------
% subplot(312)
% load ./data/main_gre_data_r1000_v2
% b1=data_gre(1:dc,:)'*1000;
% bar(b1(1:tsn,:),1,'stacked');
% hold on
% plot(A(1:tsn)*1000,'r','linewidth',1.2)
% axis([0 inf 0 300000])
% ylabel(['\fontsize{12}延迟可容忍负载（请求/15分钟）',sprintf('\n'),'\fontsize{10}贪婪算法'],'FontSize',10)
% % ylabel('延迟可容忍负载（请求/15分钟）','FontSize',12)
% grid on
% grid minor
% % legend({'DC1','DC2','DC3','DC4','负载A(t)'},'location','northwest','Orientation','horizontal','fontsize',6)

% --------admm-------
load ./data/main_ad2_sim2_data_Vmax_E300
b1=data_ad(1:dc,:)'*1000;              %ai
% subplot(313)
b=bar(b1(1:tsn,:),1,'stacked');
b(4).FaceColor=[255 255 0]/255;
b(3).FaceColor=[64 224 205]/255;
b(2).FaceColor=[34 139 34]/255;
b(1).FaceColor=[244 164 95]/255;
hold on
plot(A(1:tsn)*1000,'r','linewidth',1.5)
axis([0 inf 0 300000])
set(gca,'FontSize',13)
set(gca, 'xtick', [0:6:48])
xlabel('Time Slot','FontSize',15)
ylabel({'Workload distribution';' (requests)'},'FontSize',15)
% grid on
% grid minor
% set(gca,'GridLineStyle',':','GridAlpha',1);
legend({'DC1','DC2','DC3','DC4','Total workloads A(t)'},'location','northwest','Orientation','horizontal','fontsize',10)
set(gcf,'position',[100 300 700 280]) 
% saveas(gcf,'E:\Com\Ctex\new\pt8_workload_distribution','epsc')


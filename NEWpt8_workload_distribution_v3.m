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
c1 = [26,150,65]/255;
c2 = [253,174,97]/255;
c3 = [215,25,28]/255;
cc1=[255 255 0]/255;
cc2=[64 224 205]/255;
cc3=[34 139 34]/255;
cc4=[244 164 95]/255;
co1 = [202,0,32]/255;
co2 = [244,165,130]/255;
co3 = [5,113,176]/255;
co4 = [146,197,222]/255;

b=bar(b1(1:tsn,:),1,'stacked');
b(4).FaceColor=[255 255 0]/255;
b(3).FaceColor=[64 224 205]/255;
b(2).FaceColor=[34 139 34]/255;
b(1).FaceColor=[244 164 95]/255;
% b(4).FaceColor=co4;
% b(3).FaceColor=co3;
% b(2).FaceColor=co2;
% b(1).FaceColor=co1;
hold on
plot(A(1:tsn)*1000,'color',c3,'linewidth',1.7)
axis([0 inf 0 300000])
set(gca,'FontSize',13)
set(gca, 'xtick', [0:6:48])
xlabel('Time Slot','FontSize',17)
ylabel({'Workload Distribution (requests)'},'FontSize',17)
% grid on
% grid minor
% set(gca,'GridLineStyle',':','GridAlpha',1);
legend({'DC1','DC2','DC3','DC4','A(t)'},'location','northwest','Orientation','horizontal','fontsize',17)
set(gcf,'position',[100 300 600 360]) 
% saveas(gcf,'H:\Com\Ctex\new\pt8_workload_distribution','epsc')


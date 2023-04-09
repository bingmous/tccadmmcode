%% ----------including all algorithms---------------
% consider all algorithms //bar()
clc,clear
tsn=48;
figure(8)

% -----------static--------
load ./data/main_sta_data_Vmax_E300
b1=data_sta(1:dc,:)'*1000;
subplot(311)
bar(b1(1:tsn,:),1,'stacked');
hold on
plot(A(1:tsn)*1000,'r','linewidth',1.2)
axis([0 inf 0 300000])
ylabel('静态调度算法','FontSize',10)
grid on
grid minor
legend({'DC1','DC2','DC3','DC4','负载A(t)'},'location','northwest','Orientation','horizontal','fontsize',8)

% ---------greedy---------
subplot(312)
load ./data/main_gre_data_r1000_v2
b1=data_gre(1:dc,:)'*1000;
bar(b1(1:tsn,:),1,'stacked');
hold on
plot(A(1:tsn)*1000,'r','linewidth',1.2)
axis([0 inf 0 300000])
ylabel(['\fontsize{12}延迟可容忍负载（请求/15分钟）',sprintf('\n'),'\fontsize{10}贪婪算法'],'FontSize',10)
% ylabel('延迟可容忍负载（请求/15分钟）','FontSize',12)
grid on
grid minor
% legend({'DC1','DC2','DC3','DC4','负载A(t)'},'location','northwest','Orientation','horizontal','fontsize',6)

% --------admm-------
load ./data/main_ad2_sim2_data_Vmax_E300
b1=data_ad(1:dc,:)'*1000;              %ai
subplot(313)
bar(b1(1:tsn,:),1,'stacked')
hold on
plot(A(1:tsn)*1000,'r','linewidth',1.2)
axis([0 inf 0 300000])
xlabel('时间（15分钟）','FontSize',10)
ylabel('分布式算法','FontSize',10)
grid on
grid minor
% legend({'DC1','DC2','DC3','DC4','负载A(t)'},'location','northwest','Orientation','horizontal','fontsize',6)

set(gcf,'position',[100 100 600 480]) 



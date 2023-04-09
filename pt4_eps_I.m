clear,clc
load ./data/data_eps_I eps_I
eps_I=eps_I';
figure(4)
subplot(2,2,1)
plot(eps_I(:,1),'b')
axis([0 inf 13 30])
grid on
grid minor
set(gca,'xtick',[0:500:3000])
legend({['DC1']},'FontSize',8)
xlabel('Time (15-min)','FontSize',10)
ylabel({'Water consumption rate';'( L/kWh )'},'FontSize',10)

subplot(2,2,2)
plot(eps_I(:,2),'b')
axis([0 inf 13 35])
grid on
grid minor
set(gca,'xtick',[0:500:3000])
legend({['DC2']},'FontSize',8)
xlabel('Time (15-min)','FontSize',10)
ylabel({'Water consumption rate';'( L/kWh )'},'FontSize',10)

subplot(2,2,3)
plot(eps_I(:,3),'b')
axis([0 inf 9 20])
grid on
grid minor
set(gca,'xtick',[0:500:3000])
legend({['DC3']},'FontSize',8)
xlabel('Time (15-min)','FontSize',10)
ylabel({'Water consumption rate';'( L/kWh )'},'FontSize',10)

subplot(2,2,4)
plot(eps_I(:,4),'b')
axis([0 inf 7 20])
grid on
grid minor
set(gca,'xtick',[0:500:3000])
legend({['DC4']},'FontSize',8)
xlabel('Time (15-min)','FontSize',10)
ylabel({'Water consumption rate';'( L/kWh )'},'FontSize',10)

set(gcf,'position',[100 300 600 400])
% for d=1:4
%     subplot(2,2,d)
%     plot(eps_I(:,d),'color','k','linewidth',1)
%     axis([0 inf 7 40])
%     xlabel('时间（15分钟）','FontSize',10)
%     ylabel('水的消耗速率（L/kWh）','FontSize',10)
%     set(gca,'xtick',[0:500:3000])
% %     set(gca,'ytick',[0:10:40])
%     set(gcf,'position',[100 300 600 400])
%     legend({['DC',num2str(d)]},'FontSize',8)
% end

clear,clc
load ./data/data_phi_G phi_G

phi_G=phi_G';
figure(5)
subplot(2,2,1)
plot(phi_G(:,1),'b')
axis([0 inf 200 600])
grid on
grid minor
set(gca,'xtick',[0:500:3000])
legend({['DC1']},'FontSize',8)
xlabel('Time (15-min)','FontSize',10)
ylabel({'Carbon emission rate';'( g/kWh )'},'FontSize',10)

subplot(2,2,2)
plot(phi_G(:,2),'b')
axis([0 inf 200 600])
grid on
grid minor
set(gca,'xtick',[0:500:3000])
legend({['DC2']},'FontSize',8)
xlabel('Time (15-min)','FontSize',10)
ylabel({'Carbon emission rate';'( g/kWh )'},'FontSize',10)

subplot(2,2,3)
plot(phi_G(:,3),'b')
axis([0 inf 300 650])
grid on
grid minor
set(gca,'xtick',[0:500:3000])
legend({['DC3']},'FontSize',8)
xlabel('Time (15-min)','FontSize',10)
ylabel({'Carbon emission rate';'( g/kWh )'},'FontSize',10)

subplot(2,2,4)
plot(phi_G(:,4),'b')
axis([0 inf 180 700])
grid on
grid minor
set(gca,'xtick',[0:500:3000])
legend({['DC4']},'FontSize',8)
xlabel('Time (15-min)','FontSize',10)
ylabel({'Carbon emission rate';'( g/kWh )'},'FontSize',10)

set(gcf,'position',[100 300 600 400])


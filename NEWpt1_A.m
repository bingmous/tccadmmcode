clear,clc
load ./data/data_A A
A=A*1000;
figure(1)

c1 = [26,150,65]/255;
c2 = [253,174,97]/255;
c3 = [215,25,28]/255;
cc1=[255 255 0]/255;
cc2=[64 224 205]/255;
cc3=[34 139 34]/255;
cc4=[244 164 95]/255;
plot(A,'color',cc3)
axis([0 inf 50000 800000])
% grid on
% grid minor
% set(gca,'GridLineStyle',':','GridAlpha',1);
set(gca, 'FontSize', 13)
xlabel('Time Slot','FontSize',17)
ylabel({'Workloads (requests)'},'FontSize',17)
legend({'Delay tolerant workloads'},'FontSize',17)
set(gca ,'xtick',[0:500:3000])
ax = gca;
% ax.XAxis.Exponent = 3;
ax.YTick=[0:2:8]*100000;
%set(gcf,'position',[50 300 550 330]) 
% set(gcf,'position',[100 300 400 240]) 
set(gcf,'position',[100 300 600 360]) 
% saveas(gcf,'E:\Com\Ctex\new\pt1_A','epsc')
% saveas(gcf,'H:\Com\Ctex\new\pt1_A','epsc')
% saveas(gcf,'H:\Com\Ctex\new-TCC\pt1_A','epsc')

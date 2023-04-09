%% ------------workload queue--------------
clc,clear
load ./data/main_ad2_sim2_data_Vmax_E300
pt_Q = data_Q;

c1 = [120,198,121]/255;
c2 = [194,230,153]/255;
c3 = [252,141,89]/255;
c4 = [254,217,142]/255;
cc1=[255 255 0]/255;
cc2=[64 224 205]/255;
cc3=[34 139 34]/255;
cc4=[244 164 95]/255;

co1 = [202,0,32]/255;
co2 = [244,165,130]/255;
co3 = [5,113,176]/255;
co4 = [146,197,222]/255;
figure(73)
h = area(pt_Q','LineStyle','none');
% h(1).FaceColor = co1;
% h(2).FaceColor = co2;
% h(3).FaceColor = co3;
% h(4).FaceColor = co4;
h(1).FaceColor = cc4;
h(2).FaceColor = cc3;
h(3).FaceColor = cc2;
h(4).FaceColor = cc1;
set(gca,'FontSize',13)
xlabel('Time Slot','FontSize',17)
ylabel({'Workload Queue (requests)'},'FontSize',17)
axis([0 inf 0 13000])
% set(gca,'xtick',[0:600:tmax])
ax=gca;
ax.YAxis.Exponent = 3;
legend({'DC1', 'DC2', 'DC3', 'DC4'},...
    'location','northeast','FontSize',17,...
    'Orientation', 'horizontal')
% set(gcf,'position',[50 300 400 240]) 
set(gcf,'position',[50 300 600 360]) 
% saveas(gcf,'E:\Com\Ctex\new\pt7_Q','epsc')
% saveas(gcf,'H:\Com\Ctex\new\pt7_Q','epsc')

clear,clc

load ./data/pt_battery_cost pt_battery_cost_total_cost
% [withoutb Cb=0, 0.1, 1, 3, 5, 7, 10]
b_cost = pt_battery_cost_total_cost(:, 1);
o_cost = pt_battery_cost_total_cost(:, 2);
% b_cost = b_cost(1:end);
% o_cost = o_cost(1:end);
bo_cost = b_cost+o_cost;
b_ratio = b_cost./(b_cost+o_cost);
% x = [0, 0.1, 0.2, 0.3, 0.4, 0.5];
x = [0, 0.05, 0.1:0.1:1];


figure(3000)
[Ax, H1, H2]=plotyy(x,b_cost,x,b_ratio);
hold on
ax = gca;
% ax.FontSize = 13;
set(Ax(1),'FontSize',15)
set(Ax(2),'FontSize',15)
ylabel(Ax(1),'Battery Cost ($)','FontSize',19)
ylabel(Ax(2),'Battery Cost Ratio (%)','FontSize',19)
xlabel(Ax(1),'$C_{b}$ (\$)','Interpreter','latex','FontSize',20)
l = legend(Ax(1),{'Battery Cost','Battery Cost Ratio'},'FontSize',15);
% % legend(Ax(2),{'Static','Greegy','ADMM'},'Location','southwest')
% l.Position = [0.68 0.77 0.1 0.1];
Ax(1).YTick=0:200:1000;
Ax(1).YLim=[0 1000];
Ax(1).YAxis.Exponent = 2;
Ax(2).YTick=0:0.002:0.01;
Ax(2).YLim = [0 0.01];
Ax(2).YAxis.Exponent = -3;
Ax(1).XTick=0:0.2:1;
% Ax(1).XTickLabel=[1 2 4 6 8 10];
set(Ax(:),'YColor','k')
MS=8;
LW=2;
% set(H1(1),'Color',cc2,'Marker','^','MarkerSize',MS,'LineWidth',LW,'LineStyle','-')
% set(H1(2),'Color','b','Marker','s','LineWidth',LW,'LineStyle','-')
% set(H1(3),'Color',cc3,'Marker','o','MarkerSize',MS,'LineWidth',LW)
set(H1,'Color','r','Marker','+','MarkerSize',MS+1,'LineWidth',LW)
% 
% set(H2(1),'Color',cc2,'Marker','^','MarkerSize',MS,'LineWidth',LW,'LineStyle','-')
% set(H2(2),'Color','b','LineWidth',LW,'LineStyle','-')
% set(H2(3),'Color',cc3,'Marker','o','MarkerSize',MS,'LineWidth',LW)
set(H2,'Color','b','Marker','o','MarkerSize',MS,'LineWidth',LW)
% 
% annotation('ellipse',[0.33 0.44 .015 .10])
annotation('textarrow',[0.55 0.47], [.33 .23],'String','Less than 0.4%',...
    'FontSize', 15)
% annotation('ellipse',[0.495 0.65 .014 .16])
% annotation('textarrow',[0.49 0.5], [.54 .64],'String','Utilization',...
%     'FontSize', 15)

% set(gcf,'position',[5 300 600 360]) 
set(gcf,'position',[5 300 650 430]) 
set(gca,'position',[0.11 0.16 0.775 0.76])
% set(gca,'position',[0.11 0.16 0.775 0.810])

% saveas(gcf,'H:\Com\Ctex\A-TCC-revision\new-TCC-minor2\pt14_battery_cost','epsc')

% -------------------------------------------------
figure(2000)
subplot(211)
plot(x, b_cost)
title('battery cost')
subplot(212)
plot(x, o_cost)
title('other cost')
figure(2001)
plot(x, b_ratio)
title('battery cost ratio')

figure(2002)
plot(x, bo_cost)
title('total cost')

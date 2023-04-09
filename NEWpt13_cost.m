clear,clc
load ./data/pt_lya pt_lya
load ./data/pt_ad pt_ad
load ./data/pt_sta pt_sta
load ./data/pt_gra pt_gra
load ./data/pt_pso pt_pso
load ./data/pt_ga pt_ga

cc2=[64 224 205]/255;
cc3=[34 139 34]/255;
cc4=[244 164 95]/255;
fs = 15;
lw = 1.2;
figure(100)
% plot(pt_lya(2, :), 'Color', cc3, 'LineWidth', lw)
% hold on

plot(pt_ad(2, :), 'r-o', 'MarkerIndices',[100 :300 :2784], 'LineWidth', lw)
hold on
plot(pt_sta(2, :),'-v', 'Color', cc2, 'MarkerIndices',[100 :300 :2784], 'LineWidth', lw)
hold on
plot(pt_gra(2, :), '--','Color','k', 'MarkerIndices',[100 :300 :2784], 'LineWidth', lw)
hold on
plot(pt_ga(2, :), '-s','Color',cc4, 'MarkerIndices',[100 :300 :2784], 'LineWidth', lw)
hold on
plot(pt_pso(2, :), '-*','Color','b', 'MarkerIndices',[100 :300 :2784], 'LineWidth', lw)
hold on

ax=gca;
ax.FontSize = 13;
ax.XLim = [0 2784];
ax.YLim = [0 160];
set(gca ,'xtick',[0:500:3000])
xlabel('Time Slot','FontSize',fs)
ylabel('Average Cost ($)','FontSize',fs)
% l = legend({'LYA-OACM', 'ADMM-DACM', 'Static Alg.', 'Greedy Alg.', 'pso'}, 'FontSize', fs, 'Location', 'southeast');
l = legend({ 'ADMM-DACM', 'Static Alg.', 'Greedy Alg.','GA', 'PSO'}, 'FontSize', fs, 'Location', 'southeast');



set(gcf,'position',[5 300 600 360]) 

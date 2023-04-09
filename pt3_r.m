clear,clc
load ./data/data_r rmax
rmax=rmax';
figure(3)
for d=1:4
    subplot(2,2,d)
    plot(rmax(:,d),'color','b')
    axis([0 inf 0 300])
    grid on
    grid minor
    xlabel('Time (15-min)','FontSize',10)
    ylabel({'Renewable energy';'( kWh )'},'FontSize',10)
    set(gca,'xtick',[0:500:3000])
    set(gca,'ytick',[0:100:300])
    set(gcf,'position',[100 300 600 400])
    legend({['DC',num2str(d)]},'FontSize',8)
end


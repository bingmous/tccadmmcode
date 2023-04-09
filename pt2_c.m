clear,clc
load ./data/data_c c
c=c'*1000;
figure(2)
for d=1:4
    subplot(2,2,d)
    plot(c(:,d),'color','b')
    axis([0 inf 0 100])
    grid on
    grid minor
    xlabel('Time (15-min)','FontSize',10)
    ylabel({'Electricity price';'( $/MWh )'},'FontSize',10)
    set(gca,'xtick',[0:500:3000])
    set(gca,'ytick',[0:20:100])
    set(gcf,'position',[100 300 600 400]) 
    legend({['DC',num2str(d)]},'FontSize',8)

end




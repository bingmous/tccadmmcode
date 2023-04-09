%% ------------workload queue--------------
clc,clear
load ./data/main_ad2_sim2_data_Vmax_E300
figure(7)
for d=1:1
%     subplot(1,2,2)
    plot(data_Q(d,:),'color','r')
    set(gca,'FontSize',10)
    xlabel('Time Slot','FontSize',13)
    ylabel({'Workload queue',' (requests)'},'FontSize',13)
    axis([0 inf 0 3000])
    set(gca,'xtick',[0:600:tmax])
    ax=gca;
    ax.YAxis.Exponent = 3;
    legend({['DC',num2str(d)]},'location','southeast','FontSize',13)
end
set(gcf,'position',[50 300 400 240]) 
% saveas(gcf,'E:\Com\Ctex\new\pt7_Q','epsc')


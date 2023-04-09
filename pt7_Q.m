%% ------------workload queue--------------
clc,clear
load ./data/main_ad2_sim2_data_Vmax_E300
figure(7)
for d=1:dc
    subplot(2,2,d)
    plot(data_Q(d,:),'color','r')
    xlabel('Time (15-min)','FontSize',11)
    ylabel({'Job queue ( requests )'},'FontSize',11)
    axis([0 inf 0 3000])
%     grid on
%     grid minor
    set(gca,'GridLineStyle',':','GridAlpha',1);
    set(gca,'xtick',[0:500:tmax])
    legend({['DC',num2str(d)]},'location','southeast','FontSize',9)
end
set(gcf,'position',[100 300 600 400]) 

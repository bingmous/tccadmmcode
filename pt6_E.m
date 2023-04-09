%% ------------battery state--------------
clc,clear
load ./data/main_ad2_sim2_data_Vmax_E300
b1=data_ad(1:dc,:);              %ai
b2=data_ad(dc+1:2*dc,:);     %bi
b3=data_ad(2*dc+1:3*dc,:); %Di
b4=data_ad(3*dc+1:4*dc,:); %ri
% battery
bat_lya=[zeros(dc,1),b3];
for t=1:tmax
    bat_lya(:,t+1)=bat_lya(:,t+1)+bat_lya(:,t);
end
figure(6)
for d=1:dc
    subplot(2,2,d)
    plot(bat_lya(d,:),'color','r')
    xlabel('Time (15-min)','FontSize',11)
    ylabel({'Battery energy level';'( kWh )'},'FontSize',11)
    axis([0 tmax 0 400])
%     grid on
%     grid minor
    set(gca,'GridLineStyle',':','GridAlpha',1);
    set(gca,'xtick',[0:500:tmax])
    legend({['DC',num2str(d)]},'FontSize',9)
end
set(gcf,'position',[100 300 600 400]) 

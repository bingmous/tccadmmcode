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
for d=1:1
    %subplot(1,2,1)
    plot(bat_lya(d,:),'color','r')
%     area(bat_lya(d,:))
    hold on
    set(gca,'FontSize',10)
    xlabel('Time Slot','FontSize',13)
    ylabel({'Battery level (kWh)'},'FontSize',13)
%    axis([0 300 0 400])
    set(gca,'xtick',[0:600:tmax])
    ax=gca;
    ax.YAxis.Exponent = 2;
    legend({['DC',num2str(d)]},'FontSize',13)
end
set(gcf,'position',[50 300 400 240]) 
% set(gcf,'position',[100 300 600 220]) 
%saveas(gcf,'E:\Com\Ctex\new\pt6_E','epsc')


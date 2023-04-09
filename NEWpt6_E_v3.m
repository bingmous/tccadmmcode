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
figure(6)
for d=1:1
    %subplot(1,2,1)

    plot(bat_lya(d,:),'color',cc4)
    hold on
    plot(repmat(300,[tmax 1]),'--k','LineWidth',1.5)
    hold on
    axis([0 tmax 0 400])
    set(gca,'FontSize',13,'xtick',[0:500:tmax])
    ax=gca;
    ax.YAxis.Exponent = 2;
    xlabel('Time Slot','FontSize',17)
    ylabel({'Battery Level (kWh)'},'FontSize',17)
%     legend({'DC1'},'FontSize',12,'Orientation','horizontal')
    legend({'DC1','Upper Bound'},'FontSize',17,'Orientation','horizontal')
end
% set(gcf,'position',[50 300 400 240]) 
set(gcf,'position',[50 300 600 360]) 
% set(gcf,'position',[100 300 600 220]) 
% saveas(gcf,'E:\Com\Ctex\new\pt6_E','epsc')
% saveas(gcf,'H:\Com\Ctex\new\pt6_E','epsc')

% -----------------------------------------------------


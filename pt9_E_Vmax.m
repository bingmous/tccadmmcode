%% --------battery relate to Vmax----------
clear,clc
load ./data/data_factor
% Ex=0:10000;
% Ey=max(Wmax-Wmin)*10/8*Ex;
Ey=0:100:1000;
% Ex=8/10/max(Wmax-Wmin)*Ey; %Ex: Vmax; Ey: Emax
WW = max(Wmax - Wmin);
Ex = (Ey - 30 * 2)/WW;

Ex_0 = 0;
Ey_0 = Ex_0 * WW + 60;
Ex(1) = 0;
Ey(1) = Ey_0;

figure(9)
subplot(1,2,1)
plot(Ex,Ey,'-*','color','r','MarkerSize',8,'linewidth',1.5)
hold on
axis([0 10000 0 1030])
set(gca,'FontSize',13)
ax=gca;
ax.YAxis.Exponent = 2;
ax.XAxis.Exponent = 3;
ax.XTick=[1:2:9]*1000;
xlabel('$V(V_{max})$','Interpreter','latex','FontSize',17)
ylabel('Required battery capacity (kWh)','FontSize',17)
legend({'ADMM'},'Location','northwest','FontSize',17)
set(gcf,'position',[5 300 600 400]) 
% set(gcf,'position',[5 300 600 400]) % left bottem width height
% saveas(gcf,'E:\Com\Ctex\new\pt9_E_Vmax','epsc')









% %% --------battery relate to Vmax----------
% clear,clc
% load ./data/data_factor
% % Ex=0:10000;
% % Ey=max(Wmax-Wmin)*10/8*Ex;
% Ey=0:100:1000;
% Ex=8/10/max(Wmax-Wmin)*Ey; %Ex: Vmax; Ey: Emax
% 
% figure(9)
% subplot(1,2,1)
% plot(Ex,Ey,'-*','color','r','MarkerSize',8,'linewidth',1.5)
% hold on
% axis([0 10000 0 1030])
% set(gca,'FontSize',13)
% ax=gca;
% ax.YAxis.Exponent = 2;
% ax.XAxis.Exponent = 3;
% ax.XTick=[1:2:9]*1000;
% xlabel('$V(V_{max})$','Interpreter','latex','FontSize',17)
% ylabel('Required battery capacity (kWh)','FontSize',17)
% legend({'ADMM'},'Location','northwest','FontSize',17)
% set(gcf,'position',[5 300 600 400]) 
% % set(gcf,'position',[5 300 600 400]) % left bottem width height
% % saveas(gcf,'E:\Com\Ctex\new\pt9_E_Vmax','epsc')




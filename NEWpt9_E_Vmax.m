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
c1 = [26,150,65]/255;
c2 = [253,174,97]/255;
c3 = [215,25,28]/255;
cc1=[255 255 0]/255;
cc2=[64 224 205]/255;
cc3=[34 139 34]/255;
cc4=[244 164 95]/255;
% subplot(1,2,1)
ms = 6;
lw = 1;
plot(Ex,Ey,'-o','color',cc3,'MarkerSize',ms,'linewidth',lw)
hold on
plot(Ex,Ey,'-+','color','r','MarkerSize',ms,'linewidth',lw)
hold on
axis([0 10000 0 1030])
set(gca,'FontSize',13)
ax=gca;
ax.YAxis.Exponent = 2;
ax.XAxis.Exponent = 3;
ax.XTick=[1:2:9]*1000;
ax.YTick=[0:2:10]*100;
xlabel('$V$','Interpreter','latex','FontSize',17)
ylabel('Required Battery Capacity (kWh)','FontSize',17)
legend({'LYA-OACM','ADMM-DACM'},'Location','northwest','FontSize',12)
set(gcf,'position',[5 300 600 360]) 
% set(gcf,'position',[5 300 600 400]) % left bottem width height
% saveas(gcf,'H:\Com\Ctex\new\pt9_E_Vmax','epsc')
% saveas(gcf,'H:\Com\Ctex\new-TCC\pt9_E_Vmax','epsc')
saveas(gcf,'H:\Com\Ctex\A-TCC-revision\new-TCC-major\pt9_E_Vmax','epsc')


% %%%%%%%%%%%%combine%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(1000)
% subplot(1,2,1)
% ms = 6;
% lw = 1;
% plot(Ex,Ey,'-+','color',cc3,'MarkerSize',ms,'linewidth',lw)
% hold on
% plot(Ex,Ey,'-o','color','r','MarkerSize',ms,'linewidth',lw)
% hold on
% axis([0 10000 0 1030])
% set(gca,'FontSize',13)
% ax=gca;
% ax.YAxis.Exponent = 2;
% ax.XAxis.Exponent = 3;
% ax.XTick=[1:2:9]*1000;
% ax.YTick=[0:2:10]*100;
% xlabel('$V$','Interpreter','latex','FontSize',17)
% ylabel('Required Battery Capacity (kWh)','FontSize',17)
% l=legend({'LYA-OACM','ADMM-DACM'},'Location','northwest','FontSize',12);
% l.Position = [0.17 0.8 0.2 0.1];
% set(gcf,'position',[5 300 600 360]) 




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




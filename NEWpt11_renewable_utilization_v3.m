%% -------------including all algorithm---------------
clear,clc
rmax_num=6;
ren_uti2=zeros(rmax_num,4);
ren_delay=zeros(rmax_num,4);
ren_cost=zeros(rmax_num,4);
for pt=1:rmax_num % 250 1000 2000 3000
    
    %% algotirhm lya
    ren_it=1;
    load(strcat('./data/main_lya_data_Vmax_E300_r',num2str(pt),'000_v2'))
    b4=data_lya(3*dc+1:4*dc,:); %ri
    ren_uti2(pt,ren_it)=sum(sum(b4))/sum(sum(rmax));
%     ren_delay(pt,1)=sum(sum(data_Q))*0.25/(sum(A));
    b1=data_lya(1:dc,:);              %ai
    b2=data_lya(dc+1:2*dc,:);     %bi
    b3=data_lya(2*dc+1:3*dc,:); %Di
    b4=data_lya(3*dc+1:4*dc,:); %ri
    % ----------------average cost lya-------------------
    p=repmat(alpha,1,tmax).*b2;
    G=p.*repmat(PUE,1,tmax)+b3-b4;
    water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
    elec=sum(c(:,1:tmax).*G);
    carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
    ren_cost(pt,ren_it)=sum(elec+water+carbon)/tmax;
    
    %% algorithm ad2
    ren_it=ren_it+1;
    load(strcat('./data/main_ad2_sim2_data_Vmax_E300_r',num2str(pt),'000_v2'))
    b4=data_ad(3*dc+1:4*dc,:); %ri
    ren_uti2(pt,ren_it)=sum(sum(b4))/sum(sum(rmax));
%     ren_delay(pt,ren_it)=sum(sum(data_Q))*0.25/(sum(A));
    b1=data_ad(1:dc,:);              %ai
    b2=data_ad(dc+1:2*dc,:);     %bi
    b3=data_ad(2*dc+1:3*dc,:); %Di
    b4=data_ad(3*dc+1:4*dc,:); %ri
    % ----------------average cost ad-------------------
    p=repmat(alpha,1,tmax).*b2;
    G=p.*repmat(PUE,1,tmax)+b3-b4;
    water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
    elec=sum(c(:,1:tmax).*G);
    carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
    ren_cost(pt,ren_it)=sum(elec+water+carbon)/tmax;
    
%% algorithm gre
    ren_it=ren_it+1;
%     load(strcat('./data/main_gre_data_r',num2str(pt),'000_v2'))  % not related to Vmax
    load(strcat('./data/main_gre_data_r',num2str(pt),'000_v2_TCC'))  % not related to Vmax
%     b4=data_gre(2*dc+1:3*dc,:); %ri
%     ren_uti2(pt,ren_it)=sum(sum(b4))/sum(sum(rmax));
%     b2=data_gre(1:dc,:);              %ai=bi
%     b3=data_gre(dc+1:2*dc,:);     %Di
%     b4=data_gre(3*dc+1:4*dc,:); %ri

    b4=data_lya(3*dc+1:4*dc,:); %ri
    ren_uti2(pt,ren_it)=sum(sum(b4))/sum(sum(rmax));
%     ren_delay(pt,1)=sum(sum(data_Q))*0.25/(sum(A));
    b1=data_lya(1:dc,:);              %ai
    b2=data_lya(dc+1:2*dc,:);     %bi
    b3=data_lya(2*dc+1:3*dc,:); %Di
    b4=data_lya(3*dc+1:4*dc,:); %ri
    % ----------------average cost gre-------------------
    p=repmat(alpha,1,tmax).*b2;
    G=p.*repmat(PUE,1,tmax)+b3-b4;
    water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
    elec=sum(c(:,1:tmax).*G);
    carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
    ren_cost(pt,ren_it)=sum(elec+water+carbon)/tmax;
    
    %% algorithm sta
    ren_it=ren_it+1;
    load(strcat('./data/main_sta_data_Vmax_E300_r',num2str(pt),'000_v2'))
    b4=data_sta(3*dc+1:4*dc,:); % ri
    ren_uti2(pt,ren_it)=sum(sum(b4))/sum(sum(rmax));
%     ren_delay(pt,2)=sum(sum(data_Q))*0.25/(sum(A));
    b1=data_sta(1:dc,:);              %ai
    b2=data_sta(dc+1:2*dc,:);     %bi
    b3=data_sta(2*dc+1:3*dc,:); %Di
    b4=data_sta(3*dc+1:4*dc,:); %ri
    % ----------------average cost sta-------------------
    p=repmat(alpha,1,tmax).*b2;
    G=p.*repmat(PUE,1,tmax)+b3-b4;
    water=hw*sum(repmat(eps_D,1,tmax).*p+eps_I(:,1:tmax).*G);
    elec=sum(c(:,1:tmax).*G);
    carbon=hu*sum(phi_G(:,1:tmax).*G+repmat(phi_r,1,tmax).*b4);
    ren_cost(pt,ren_it)=sum(elec+water+carbon)/tmax;
    
end
ren_uti2=[ren_uti2(:,4) ren_uti2(:,3) ren_uti2(:,1) ren_uti2(:,2)]*100;
ren_cost=[ren_cost(:, 4) ren_cost(:,3) ren_cost(:,1) ren_cost(:,2)];
% sta--gre--lya--admm
figure(12)
c1 = [26,150,65]/255;
c2 = [253,174,97]/255;
c3 = [215,25,28]/255;
cc1=[255 255 0]/255;
cc2=[64 224 205]/255;
cc3=[34 139 34]/255;
cc4=[244 164 95]/255;
x=[1:6]';
[Ax, H1, H2]=plotyy(x,ren_cost,x,ren_uti2);
ax = gca;
% ax.FontSize = 13;
set(Ax(1),'FontSize',15)
set(Ax(2),'FontSize',15)
ylabel(Ax(1),'Average Cost ($)','FontSize',19)
ylabel(Ax(2),'Renewable Utilization (%)','FontSize',19)
xlabel(Ax(1),'$r_{i,max}$ (MW)','Interpreter','latex','FontSize',20)
l = legend(Ax(1),{'Static Alg.','Greedy Alg.','LYA-OACM','ADMM-DACM'},'FontSize',15);
% legend(Ax(2),{'Static','Greegy','ADMM'},'Location','southwest')
l.Position = [0.68 0.77 0.1 0.1];
Ax(1).YTick=0:20:140;
set(Ax(1),'Ylim',[0 140]);
Ax(2).YTick=40:10:110;
set(Ax(2),'Ylim',[40 110])
Ax(1).XTick=1:6;
Ax(1).XTickLabel=[1 2 4 6 8 10];
MS=8;
LW=1.5;
set(H1(1),'Color',cc2,'Marker','^','MarkerSize',MS,'LineWidth',LW,'LineStyle','-')
set(H1(2),'Color','b','Marker','s','LineWidth',LW,'LineStyle','-')
set(H1(3),'Color',cc3,'Marker','o','MarkerSize',MS,'LineWidth',LW)
set(H1(4),'Color','r','Marker','+','MarkerSize',MS,'LineWidth',LW)

set(H2(1),'Color',cc2,'Marker','^','MarkerSize',MS,'LineWidth',LW,'LineStyle','-')
set(H2(2),'Color','b','LineWidth',LW,'LineStyle','-')
set(H2(3),'Color',cc3,'Marker','o','MarkerSize',MS,'LineWidth',LW)
set(H2(4),'Color','r','Marker','+','MarkerSize',MS,'LineWidth',LW)

annotation('ellipse',[0.33 0.44 .014 .16])
annotation('textarrow',[0.3 0.33], [.34 .43],'String','Average Cost',...
    'FontSize', 15)
annotation('ellipse',[0.495 0.65 .014 .16])
annotation('textarrow',[0.49 0.5], [.54 .64],'String','Utilization',...
    'FontSize', 15)


set(gcf,'position',[5 300 650 430]) 
set(gca,'position',[0.11 0.16 0.775 0.810])
% saveas(gcf,'H:\Com\Ctex\new\pt11_renewable_utilization','epsc')
% saveas(gcf,'H:\Com\Ctex\A-TCC-revision\new-TCC-major\pt11_renewable_utilization','epsc')

% set(gcf,'position',[100 300 600 400]) 
% b=bar(ren_uti2);
% b(1).FaceColor='b';
% b(2).FaceColor='g';
% b(3).FaceColor='r';
% yyaxis right
% u1=plot(ren_uti2(:,1),'--o','linewidth',1);
% hold on
% u2=plot(ren_uti2(:,2),'--s','linewidth',1);
% hold on
% u3=plot(ren_uti2(:,3),'--d','linewidth',1);
% set(gca,'XTick',1:1:6)
% set(gca,'FontSize',12)
% set(gca,'YTick',0:10:100)
% ylabel('Utilization (%)','FontSize',14)
% 
% yyaxis left
% ylabel('Average cost ($)','FontSize',14)
% 
% yyaxis right
% axes('position',get(gca,'position'),'visible','off');
% legend([u1,u2,u3],{'SSA','GA','DA'},'FontSize',10,'Location','northeast');
% xlabel('r_{i,max} (MW)','FontSize',14)
% set(gca,'xticklabel',{[1 2 4 6 8 10]})
% set(gcf,'position',[100 500 300 200])
% grid on
% grid minor
% saveas(gcf,'E:\Com\Ctex\newv4\pt11_renewable_utilization_1','epsc')

% figure(13)
% b=bar(ren_cost);
% b(1).FaceColor='b';
% b(2).FaceColor='g';
% b(3).FaceColor='r';
% set(gca,'FontSize',11)

% yyaxis left
% c1=plot(ren_cost(:,1),'-o','linewidth',1);
% hold on
% c2=plot(ren_cost(:,2),'-s','linewidth',1);
% hold on
% c3=plot(ren_cost(:,3),'-d','linewidth',1);

% set(gca,'XTick',1:1:6)
% ylabel('Average cost ($)','FontSize',11)
% axes('position',get(gca,'position'),'visible','off');
% legend([c1,c2,c3],{'SSA','GA','DA'},'FontSize',10,'Location','southwest')
% legend({'SSA','GA','DA'},'FontSize',10,'Location','southwest')
% xlabel('r_{i,max} (MW)','FontSize',11)
% set(gca,'xticklabel',{[1 2 4 6 8 10]})
% set(gcf,'position',[100 100 600 280]) 
% grid on
% grid minor
% saveas(gcf,'E:\Com\Ctex\new\pt11_renewable_utilization','epsc')


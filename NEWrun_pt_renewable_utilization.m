clear,clc
% rmax_num=4;
% ren_uti=zeros(rmax_num,4);
it=1;
for pt=1:6 % 250 1000 2000 3000
    load ./data/data_factor
    if pt==2
        rmax=rmax*2;
    end
    if pt==3
        rmax=rmax*4;
    end
    if pt==4
        rmax=rmax*6;
    end
    if pt==5
        rmax=rmax*8;
    end
    if pt==6
        rmax=rmax*10;
    end
%     eval main_lya
%     save(strcat('./data/main_lya_data_Vmax_E300_r',num2str(pt),'000_v2'))
%     b4=data_lya(3*dc+1:4*dc,:); %ri
%     ren_uti(it,1)=sum(sum(b4))/sum(sum(rmax));
    
%     eval main_admm2
%     save(strcat('./data/main_ad2_data_Vmax_E300_r',num2str(pt),'000_v2'))
%     b4=data_lya(3*dc+1:4*dc,:); %ri
%     ren_uti(it,2)=sum(sum(b4))/sum(sum(rmax));

%     eval main_admm2_simple2
%     save(strcat('./data/main_ad2_sim2_data_Vmax_E300_r',num2str(pt),'000_v2'))
% %     b4=data_lya(3*dc+1:4*dc,:); %ri
% %     ren_uti(it,2)=sum(sum(b4))/sum(sum(rmax));

%     eval NEWmain_greedy
%     save(strcat('./data/main_gre_data_r',num2str(pt),'000_v2'))
    eval NEWmain_greedy_TCC
    save(strcat('./data/main_gre_data_r',num2str(pt),'000_v2_TCC'))
%     b4=data_lya(2*dc+1:3*dc,:); %ri
%     ren_uti(it,2)=sum(sum(b4))/sum(sum(rmax));

%     eval main_static
%     save(strcat('./data/main_sta_data_Vmax_E300_r',num2str(pt),'000_v2'))
% %     b4=data_lya(3*dc+1:4*dc,:); % ri
% %     ren_uti(it,3)=sum(sum(b4))/sum(sum(rmax));
    
    it=it+1;
end
% figure(1)
% bar(ren_uti)


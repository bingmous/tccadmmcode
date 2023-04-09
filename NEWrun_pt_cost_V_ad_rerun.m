% ----------------ADMM-simple_version--------------------
clear,clc
load ./data/data_factor
for te=0:10
    Emax=[300 300 300 300]'*te/3;
    Dmax=[30 30 30 30]'*te/3;
    Dmin=-Dmax;
    Vmax=min((Emax+Dmin-Dmax)./(Wmax-Wmin));
    V=Vmax;
    X=E0+Dmin-V*Wmax; 
    eval NEWmain_admm2_simple2
    save(strcat('./data/main_ad2_sim2_data_Vmax_E',num2str(te),'00_rerun'))
    clear,clc
    load ./data/data_factor
end

% ----------------ADMM-simple_version patch--------------------
clear,clc
load ./data/data_factor
for te=0:20:80
    Emax=[300 300 300 300]'*te/300;
    Dmax=[30 30 30 30]'*te/300;
    Dmin=-Dmax;
    Vmax=min((Emax+Dmin-Dmax)./(Wmax-Wmin));
    V=Vmax;
    X=E0+Dmin-V*Wmax; 
    eval NEWmain_admm2_simple2
    save(strcat('./data/main_ad2_sim2_data_Vmax_E',num2str(te),'patch_rerun'))
    clear,clc
    load ./data/data_factor
end



%% ----------------ADMM--------------------
% clear,clc
% load ./data/data_factor
% for te=0:10
%     Emax=[300 300 300 300]'*te/3;
%     Dmax=[30 30 30 30]'*te/3;
%     Dmin=-Dmax;
%     Vmax=min((Emax+Dmin-Dmax)./(Wmax-Wmin));
%     V=Vmax
%     X=E0+Dmin-V*Wmax; 
%     eval main_admm2
%     save(strcat('./data/main_ad2_data_Vmax_E',num2str(te),'00_debug'))
%     clear,clc
%     load ./data/data_factor
% end
%% ----------------ADMM-simple_version--------------------
% clear,clc
% load ./data/data_factor
% for te=0:20:80
%     Emax=[300 300 300 300]'*te/300;
%     Dmax=[30 30 30 30]'*te/300;
%     Dmin=-Dmax;
%     Vmax=min((Emax+Dmin-Dmax)./(Wmax-Wmin));
%     V=Vmax;
%     X=E0+Dmin-V*Wmax; 
%     eval main_admm2_simple2
%     save(strcat('./data/main_ad2_sim2_data_Vmax_E',num2str(te),'patch'))
%     clear,clc
%     load ./data/data_factor
% end

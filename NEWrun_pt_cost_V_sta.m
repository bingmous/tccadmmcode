%% ---------------sta-----------
clear,clc
load ./data/data_factor
for te=0:10
    Emax=[300 300 300 300]'*te/3;
    Dmax=[30 30 30 30]'*te/3;
    Dmin=-Dmax;
    Vmax=min((Emax+Dmin-Dmax)./(Wmax-Wmin));
    te
    V=Vmax
    X0=E0+Dmin-V*Wmax; 
    eval NEWmain_static_test
    save(strcat('./data/main_sta_data_Vmax_E',num2str(te),'00_test'))
    clear,clc
    load ./data/data_factor
end
%% ---------------sta-----------
clear,clc
load ./data/data_factor
for te=0:20:80
    Emax=[300 300 300 300]'*te/300;
    Dmax=[30 30 30 30]'*te/300;
    Dmin=-Dmax;
    Vmax=min((Emax+Dmin-Dmax)./(Wmax-Wmin));
    te
    V=Vmax
    X0=E0+Dmin-V*Wmax; 
    eval NEWmain_static_test
    save(strcat('./data/main_sta_data_Vmax_E',num2str(te),'patch_test'))
    clear,clc
    load ./data/data_factor
end




clear,clc
% in minor revision this is for different batter cost Cb
Cb_num=11;

for pt=11:Cb_num % 0.1 1 10 100
    load ./data/data_factor 
%     tmax = 100;
    if pt==1
        Cb=0.1
    end
    if pt==2
        Cb=0.2
    end
    if pt==3
        Cb=0.3
    end
    if pt==4
        Cb=0.4
    end
    if pt==5
        Cb=0.5
    end
    if pt==6
        Cb=0.6
    end
    if pt==7
        Cb=0.7
    end
    if pt==8
        Cb=0.8
    end
    if pt==9
        Cb=0.9
    end
    if pt==10
        Cb=1
    end
    
    % -------------additioinal -----------------
    if pt==11
        Cb=0.05
    end
    
    eval NEWmain_lya_minor
    % battery cost
%     save(strcat('./data/main_lya_minor_data_bc',num2str(pt),'000'))
%     save(strcat('./data/main_lya_minor_data_bc',num2str(pt),'000_test'))
    save(strcat('./data/main_lya_minor_data_bc',num2str(pt),'000_used'))
% -------------------------------------------------------------------not use anymore
%     save(strcat('./data/main_lya_minor_data_r0_bc',num2str(pt),'000'))
%     save(strcat('./data/main_lya_minor_data_f3_bc',num2str(pt),'000'))
end

save ./data/run_pt_temp


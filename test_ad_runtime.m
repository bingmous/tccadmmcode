% time lapse for admm2, simple2
clear,clc
% E00-E1000
pn=11;
time_lapse=zeros(pn,2);  % #admm #simple2
for pt=1:pn
    load(strcat('./data/main_ad2_data_Vmax_E',num2str(pt-1),'00'),'ts_main_ad');
    time_lapse(pt,1)=ts_main_ad/60;
    load(strcat('./data/main_ad2_sim2_data_Vmax_E',num2str(pt-1),'00'),'ts_main_ad');
    time_lapse(pt,2)=ts_main_ad/60;
end

figure(20)
subplot(211)
plot(time_lapse)
subplot(212)
time_diff=time_lapse(:,1)-time_lapse(:,2);
plot(time_diff)
clear,clc
load ./data/data_source/price_c c
c=c(1:2784,:);
figure(12)
for d=1:4
    subplot(2,2,d)
    plot(c(:,d))
    axis([0 inf 0 100])
end



c=c'/1000;
save ./data/data_c c
% save ./data/data_source/price_c c

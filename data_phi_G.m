clear,clc
load ./data/data_source/carbon_phi_G phi_G
% interpolate
xq=1:0.25:744;
phi_G=interp1(phi_G,xq);
phi_G=phi_G(1:2784,:);

figure(14)
% for d=1:4
%     subplot(2,2,d)
%     plot(phi_G(:,d))
%     axis([0 inf 0 inf])
% end
subplot(2,2,1)
plot(phi_G(:,1))
axis([0 inf 200 inf])

subplot(2,2,2)
plot(phi_G(:,2))
axis([0 inf 200 inf])

subplot(2,2,3)
plot(phi_G(:,3))
axis([0 inf 300 600])

subplot(2,2,4)
plot(phi_G(:,4))
axis([0 inf 150 600])



phi_G=phi_G';
save ./data/data_phi_G phi_G
